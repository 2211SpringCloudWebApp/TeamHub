package com.kh.teamhub.board.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.kh.teamhub.board.domain.Free;
import com.kh.teamhub.board.domain.FreeFile;
import com.kh.teamhub.board.domain.Notice;
import com.kh.teamhub.board.domain.NoticePlus;
import com.kh.teamhub.board.domain.PageInfo;
import com.kh.teamhub.board.domain.Search;
import com.kh.teamhub.board.service.NoticeService;
import com.kh.teamhub.common.LoginUtil;
import com.kh.teamhub.common.file.FileUtil;

@Controller
public class NoticeController {

	@Autowired
	private NoticeService nService;

	@Autowired
	private LoginUtil loginUtil;
	
	@Autowired
	@Qualifier("fileUtil")
	private FileUtil fileUtil;

	// 공지사항 목록 보기
		@RequestMapping(value="/notice/list", method=RequestMethod.GET)
		public String noticeListView(
				Model model
				, @RequestParam(value="page", required=false, defaultValue="1") Integer page)
		{
			int totalCount = nService.getListCount();
			PageInfo pi = this.getPageInfo(page, totalCount);
			List<NoticePlus> nList = nService.selectNoticeList(page);
			model.addAttribute("pi", pi);
			model.addAttribute("nList", nList);
			return "/board/notice/list";
		}
		//공지사항 검색
		@RequestMapping(value="/notice/search" , method=RequestMethod.GET)
		public String noticeSearchView(
				@ModelAttribute Search search
				, @RequestParam(value="page", required=false, defaultValue="1") Integer currentPage
				,Model model) {
			try {
				
				
				int totalCount = nService.getListCount(search);
				PageInfo pi = this.getPageInfo(currentPage, totalCount);
				List<Notice> searchList = nService.selectListByKeyword(pi, search);
				if(!searchList.isEmpty()) {
					model.addAttribute("search", search);
					model.addAttribute("pi", pi);
					model.addAttribute("sList", searchList);
					return "board/notice/search";
				}else {
					model.addAttribute("msg", "조회에 실패하였습니다.");
					return "common/error";
				}
			} catch (Exception e) {
				model.addAttribute("msg", e.getMessage());
				return "common/error";
			}
		}

		// navigator start, end값 설정 method()
		private PageInfo getPageInfo(int currentPage, int totalCount) {
			PageInfo pi = null;
			int boardLimit = 15;
			int naviLimit = 5;
			int maxPage;
			int startNavi;
			int endNavi;
			
			maxPage = (int)((double)totalCount/boardLimit+0.9);
			//Math.ceil((double)totalCount/boardLimit);
			startNavi = (((int)((double)currentPage/naviLimit+0.9))-1)*naviLimit+1;
			endNavi = startNavi + naviLimit - 1;
			if(endNavi > maxPage) {
				endNavi = maxPage;
			}
			pi = new PageInfo(currentPage, boardLimit, naviLimit, startNavi, endNavi, totalCount, maxPage);
			return pi;
		}
		
		// 공지사항 등록화면
		@RequestMapping(value = "/notice/writeView", method = RequestMethod.GET)
		public String writeView() {
			
			return "board/notice/write";
		}

		// 공지사항 등록
		@RequestMapping(value = "/notice/write", method = RequestMethod.POST)
		public String freeRegister(ModelAndView mv,
				@RequestParam(value = "uploadFile", required = false) MultipartFile multi, HttpServletRequest request,
				@ModelAttribute Notice notice, Model model) {
			Map<String, String> fileInfo = null;
			try {
				int result = nService.insertNotice(notice);
				// Free Free = fService.selectOneFree();
				FreeFile freefile = new FreeFile();
				fileInfo = fileUtil.saveFile(multi, request);
				freefile.setNoticeNo(notice.getNoticeNo());
				freefile.setFileName(fileInfo.get("original"));
				freefile.setFileReName(fileInfo.get("rename"));
				freefile.setFilePath(fileInfo.get("renameFilePath"));
				System.out.println(freefile);
				result += nService.insertNoticeFiles(freefile);
				return "redirect:/notice/list";
			} catch (Exception e) {
				e.printStackTrace();
				model.addAttribute("msg", e.getMessage());
				return "common/error";
			}
		}

		// 공지사항 수정화면
		@RequestMapping(value="/notice/modifyView", method=RequestMethod.GET)
		public String freeModifyView(@RequestParam("noticeNo") Integer noticeNo
				, Model model) {
			try {
				Notice notice = nService.selectOneById(noticeNo);
				List<FreeFile> nList = nService.selectFileList(noticeNo);
				if(notice != null) {
					model.addAttribute("notice", notice);
					model.addAttribute("freefile", nList);
					return "board/notice/modify";
				}else {
					model.addAttribute("msg","데이터 조회에 실패하였습니다");
					return "common/error";
				}
			} catch (Exception e) {
				e.printStackTrace();
				model.addAttribute("msg", e.getMessage());
				return "common/error";
			}
		}
		
		//공지사항 수정
		@RequestMapping(value="/notice/modify", method=RequestMethod.POST)
		public String noticeModify(
				@RequestParam(value = "reloadFile", required = false) MultipartFile multi
				, HttpServletRequest request
				, @ModelAttribute Notice notice
				, @RequestParam(value="reloadFile", required=false) MultipartFile reloadFile
				, Model model) {
			Map<String, String> fileInfo = null;
			try {
				// DB에서 공지사항 수정(UPDATE)
				int result = nService.updatenotice(notice);
				if(result > 0) {
				FreeFile freeFile = new FreeFile();
					if(multi.getSize() != 0 && !multi.getOriginalFilename().equals("")) {
						fileInfo = fileUtil.saveFile(multi, request);
						freeFile.setNoticeNo(notice.getNoticeNo());
						freeFile.setFileName(fileInfo.get("original"));
						freeFile.setFileReName(fileInfo.get("rename"));
						freeFile.setFilePath(fileInfo.get("renameFilePath"));
						result += nService.updateFreeFiles(freeFile);
					}
					return "redirect:/notice/detail?noticeNo="+notice.getNoticeNo();
				}else {
					model.addAttribute("msg", "공지사항 수정이 실패하였습니다!");
					return "common/error";
				}
			} catch (Exception e) {
				e.printStackTrace();
				model.addAttribute("msg", e.getMessage());
				return "common/error";
			}
		}
		
		// 공지사항 상세
		@RequestMapping(value="/notice/detail", method=RequestMethod.GET)
		public String noticeDetailView(@RequestParam("noticeNo") int noticeNo, Model model) {
			try {
				Notice notice = nService.selectOneById(noticeNo);
				List<FreeFile> fileList = nService.selectFileList(noticeNo);
				model.addAttribute("notice", notice);
				model.addAttribute("fileList", fileList);
				return "/board/notice/detail";
			} catch (Exception e) {
				e.printStackTrace();
				model.addAttribute("msg", e.getMessage());
				return "common/error";
			}
		}
		
		// 공지사항 삭제
		@RequestMapping(value="/notice/remove",method=RequestMethod.GET)
		public String noticeRemove(@RequestParam("noticeNo") int noticeNo, Model model) {
			try {
				// login check!
				int result = nService.deleteNotice(noticeNo);
				if(result > 0) {
					return "redirect:/notice/list";
				}else {
					model.addAttribute("msg","삭제가 완료되지 않았습니다");
					return "common/error";
				}
			} catch (Exception e) {
				model.addAttribute("msg", e.getMessage());
				return "common/error";
			}
		}
}
