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
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.kh.teamhub.board.domain.Free;
import com.kh.teamhub.board.domain.FreeFile;
import com.kh.teamhub.board.domain.FreePlus;
import com.kh.teamhub.board.domain.PageInfo;
import com.kh.teamhub.board.domain.Reply;
import com.kh.teamhub.board.domain.Report;
import com.kh.teamhub.board.domain.Search;
import com.kh.teamhub.board.service.FreeService;
import com.kh.teamhub.common.file.FileUtil;

@Controller
public class FreeController {
	
	@Autowired
	private FreeService fService;
	
	@Autowired
	@Qualifier("fileUtil")
	private FileUtil fileUtil;
	
	//자유게시판 등록화면
	@RequestMapping(value="/free/writeView", method=RequestMethod.GET)
	public String writeView() {
		return "/board/free/write";
	}
	
	//자유게시판 등록
		@RequestMapping(value="/free/write", method=RequestMethod.POST)
		public String freeRegister(ModelAndView mv
				, @RequestParam(value = "uploadFile", required = false) MultipartFile multi
				, HttpServletRequest request
				,@ModelAttribute Free free
				,Model model
				) {
			Map<String, String> fileInfo = null;
			try {
				int result = fService.insertFree(free);
	//			Free Free = fService.selectOneFree();
				FreeFile freefile= new FreeFile();
				fileInfo = fileUtil.saveFile(multi, request);
				freefile.setFreeNo(free.getFreeNo());
				freefile.setFileName(fileInfo.get("original"));
				freefile.setFileReName(fileInfo.get("rename"));
				freefile.setFilePath(fileInfo.get("renameFilePath"));
				System.out.println(freefile);
				result += fService.insertFreeFiles(freefile);
				return "redirect:/free/list";
			}catch (Exception e) {
				e.printStackTrace();
				model.addAttribute("msg", e.getMessage());
				return "/board/free/write";
			}
		}
		
		// 자유게시판 목록 보기
		@RequestMapping(value="/free/list", method=RequestMethod.GET)
		public String freeListView(
				Model model
				, @RequestParam(value="page", required=false, defaultValue="1") Integer page) {
			int totalCount = fService.getListCount();
			PageInfo pi = this.getPageInfo(page, totalCount);
			List<FreePlus> fList = fService.selectFreeList(page);
			//fList.get(0).getFreeNo();
			model.addAttribute("pi", pi);
			model.addAttribute("fList", fList);
			return "/board/free/list";
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
		
		// 자유게시판 수정화면
	@RequestMapping(value="/free/modifyView", method=RequestMethod.GET)
	public String freeModifyView(@RequestParam("freeNo") Integer freeNo
			, Model model) {
		try {
			Free free = fService.selectOneById(freeNo);
			List<FreeFile> fList = fService.selectFileList(freeNo);
			if(free != null) {
				model.addAttribute("free", free);
				model.addAttribute("freefile", fList);
				return "board/free/modify";
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

	//자유게시판 수정
	@RequestMapping(value="/free/modify", method=RequestMethod.POST)
	public String freeModify(
			@RequestParam(value = "reloadFile", required = false) MultipartFile multi
			, HttpServletRequest request
			, @ModelAttribute Free free
			, @RequestParam(value="reloadFile", required=false) MultipartFile reloadFile
			, Model model) {
		Map<String, String> fileInfo = null;
		try {
			// DB에서 공지사항 수정(UPDATE)
			int result = fService.updateFree(free);
			if(result > 0) {
			FreeFile freeFile = new FreeFile();
				if(multi.getSize() != 0 && !multi.getOriginalFilename().equals("")) {
					fileInfo = fileUtil.saveFile(multi, request);
					freeFile.setFreeNo(free.getFreeNo());
					freeFile.setFileName(fileInfo.get("original"));
					freeFile.setFileReName(fileInfo.get("rename"));
					freeFile.setFilePath(fileInfo.get("renameFilePath"));
					result += fService.updateFreeFiles(freeFile);
				}
				return "redirect:/free/detail?freeNo="+free.getFreeNo();
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
	
	//자유게시판 검색
	@RequestMapping(value="/free/search" , method=RequestMethod.GET)
	public String freeSearchView(
			@ModelAttribute Search search
			, @RequestParam(value="page", required=false, defaultValue="1") Integer currentPage
			,Model model) {
		try {
			int totalCount = fService.getListCount(search);
			PageInfo pi = this.getPageInfo(currentPage, totalCount);
			List<Free> searchList = fService.selectListByKeyword(pi, search);
			if(!searchList.isEmpty()) {
				model.addAttribute("search", search);
				model.addAttribute("pi", pi);
				model.addAttribute("sList", searchList);
				return "board/free/search";
			}else {
				model.addAttribute("msg", "조회에 실패하였습니다.");
				return "common/error";
			}
		} catch (Exception e) {
			model.addAttribute("msg", e.getMessage());
			return "common/error";
		}
	}

	// 자유게시판 삭제
	@RequestMapping(value="/free/remove",method=RequestMethod.GET)
	public String freeRemove(@RequestParam("freeNo") int freeNo, Model model) {
		try {
			// login check!
			int result = fService.deleteFree(freeNo);
			if(result > 0) {
				return "redirect:/free/list";
			}else {
				model.addAttribute("msg","삭제가 완료되지 않았습니다");
				return "common/error";
			}
		} catch (Exception e) {
			model.addAttribute("msg", e.getMessage());
			return "common/error";
		}
	}

	//자유게시판 상세
	@RequestMapping(value="/free/detail", method=RequestMethod.GET)
	public String freeDetailView(@RequestParam("freeNo") int freeNo, Model model) {
		try {
			Free free = fService.selectOneById(freeNo);
			List<FreeFile> fileList = fService.selectFileList(freeNo);
			model.addAttribute("free", free);
			model.addAttribute("fileList", fileList);
			return "/board/free/detail";
		} catch (Exception e) {
			e.printStackTrace();
			model.addAttribute("msg", e.getMessage());
			return "common/error";
		}
	}

	
	//댓글 달기
	@ResponseBody
	@RequestMapping(value="/reply/register", method=RequestMethod.POST)
	public String doReplyInsert(@ModelAttribute Reply reply) {
		try {
			int result = fService.insertReply(reply);
			if(result > 0) {
				return "1";
			}else {
				return "0";
			}
		} catch (Exception e) {
			return e.getMessage();
		}
	}
	// 댓글 리스트
	@ResponseBody
	@RequestMapping(value="/reply/list", method=RequestMethod.GET, produces="application/json;charset=utf-8")
	public String viewReplyList(Integer freeNo) {
		List<Reply> rList = fService.selectAllReply(freeNo);
		Gson gson = new GsonBuilder().setDateFormat("yyyy-MM-dd").create();
		return gson.toJson(rList);
	}
	
	// 댓글 수정
	@ResponseBody
	@RequestMapping(value="/reply/modify", method=RequestMethod.POST)
	public String doReplyUpdate(@ModelAttribute Reply reply) {
		try {
			int result = fService.updateReply(reply);
			if(result > 0) {
				return "1";
			}else {
				return "0"; 
			}
		} catch (Exception e) {
			return e.getMessage();
		} 
			
	
	}
	//댓글 삭제
	@ResponseBody
	@RequestMapping(value="/reply/delete", method=RequestMethod.GET)
	public String doReplyDelete(Integer replyNo) {
		try {
			int result = fService.deleteReply(replyNo);
			if(result > 0) {
				return "1";
			}else {
				return "0";
			}
		} catch (Exception e) {
			// TODO: handle exception
			return e.getMessage();
		}
	}
	//대댓글 작성
	@ResponseBody
	@RequestMapping(value="/rereply/register", method=RequestMethod.POST)
	public String doRereplyInsert(@ModelAttribute Reply reply) {
		try {
			reply.setReplyDepth(1);
			int result = fService.insertRereply(reply);
			if(result > 0) {
				return "1";
			}else {
				return "0";
			}
		} catch (Exception e) {
			return e.getMessage();
		}
	}
	// 사용자권한 제한
	@ResponseBody
	@RequestMapping(value="/free/limit", method=RequestMethod.POST)
	public String doFreeLimit(String userId) {
		try {
			int result = fService.limitUser(userId);
			return "";
		} catch (Exception e) {
			return e.getMessage();
		}
	}
	
	
}
