package org.joonzis.model;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class FileDownload {
	public void doDownload(
			HttpServletRequest request,
			HttpServletResponse response) throws UnsupportedEncodingException {
		
		request.setCharacterEncoding("utf-8");
		String filename = request.getParameter("filename");
		
		// 다운로드 받을 파일의 실제 경로 구하기
		String realPath = 
				request.getServletContext().getRealPath("/upload");
		
		// 다운로드 받을 수 있는 문서 타입으로 설정하기
		response.setContentType("application/x-msdownload");
		
		// 파일 클래스(파일 스트림)를 통해 다운로드 할 파일 연결하기
		File file = new File(realPath + "/" + filename);	// new File(경로+파일명)
		
		// 파일 이름에 공백이 있을 경우 "+"로 출력되는 부분 수정
		filename = URLEncoder.encode(filename, "utf-8");
		filename = filename.replaceAll("\\+", "%20");
		
		// 클라이언트의 헤더 정보에 첨부파일이 있음을 처리
		response.setHeader("Content-Disposition", "attachment; filename=" + filename + ";");
		response.setHeader("Content-Length", file.length() + "");
		
		
		// 실제 다운로드 하기
		FileInputStream fis = null;
		BufferedInputStream bis = null;
		BufferedOutputStream bos = null;
		
		try{
			fis = new FileInputStream(file);
			bis = new BufferedInputStream(fis);
			bos = new BufferedOutputStream(response.getOutputStream());
			
			 byte[] buffer = new byte[(int)file.length()];	// 파일의 크기와 같은 크기의 버퍼 준비
			 bis.read(buffer, 0, buffer.length);	// 버퍼 전체 읽기
			 bos.write(buffer);
			 
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			try{
				if(bos != null) bos.close();
				if(bis != null) bis.close();
				if(fis != null) fis.close();
			}catch(Exception e){
				
			}
		}
		
		
		
	}
}
