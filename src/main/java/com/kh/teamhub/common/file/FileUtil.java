package com.kh.teamhub.common.file;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Component;
import org.springframework.web.multipart.MultipartFile;

@Component
public class FileUtil {
	
	public Map<String, String> saveFile(
			MultipartFile multi
			, HttpServletRequest request) throws Exception {
		Map<String, String> result = null;
		String renameFilePath = null;
		String renameFileName = null;  // 리네임이유는 이름이 같은 파일을 올릴 수가 있기 때문에 대안으로
		                               // 파일이름을 년월일시분초로 변경해줌.
		
		if(multi != null && !multi.equals("")) {
			result = new HashMap<String, String>();
			
			String originalFilename = multi.getOriginalFilename();
			// file을 server에 특정위치에 저장
			// 경로를 가져와서 폴더의 경로 지정
			String wasRoot = request.getSession().getServletContext().getRealPath("resources");
			String savePath = wasRoot + "\\" + "fileUploads";
			
			// 저장할 폴더가 안만들어져 있다면 만들어줘야함.
			File folder = new File(savePath);
			if(!folder.exists()) {
				folder.mkdirs();
			}
			SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");
			renameFileName = sdf.format(new Date(System.currentTimeMillis())) + "."
					+ originalFilename.substring(originalFilename.lastIndexOf(".")+1); // 이 부분은 원본파일 .뒤에 확장자 

			renameFilePath = savePath + "\\" + renameFileName;
			
			multi.transferTo(new File(renameFilePath));	// 파일 저장
			result.put("original", originalFilename);
			result.put("rename", renameFileName);
			result.put("renameFilePath", renameFilePath);
		}
		return result;
	}

}