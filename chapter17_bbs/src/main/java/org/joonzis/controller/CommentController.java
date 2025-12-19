package org.joonzis.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.net.Inet4Address;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.joonzis.model.FileDownload;
import org.joonzis.service.BBSService;
import org.joonzis.service.BBSServiceImpl;
import org.joonzis.service.CommentService;
import org.joonzis.service.CommentServiceImpl;
import org.joonzis.vo.BVO;
import org.joonzis.vo.CVO;
import org.json.simple.JSONObject;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

@WebServlet("/CommentController")
public class CommentController extends HttpServlet {
	private static final long serialVersionUID = 1L;
    public CommentController() {
        super();
    }
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");
		
		// 분기 판단 cmd
		String cmd = request.getParameter("cmd");
		
		// 비동기 처리를 위한 객체들 
		// JSON ↔ Java 객체 사이를 변환(매핑)해주는 역할 (java.lang.Object 최상위 클래스와 직접적인 관련은 없음)
		ObjectMapper objectMapper = null; // POJO, Plain Old Java Object를 뜻
		String jsonString = null;	//JSON으로 직렬화 된 데이터를 담는 용도
		PrintWriter out = response.getWriter();	// 응답 객체 (출력)
		JSONObject obj = new JSONObject(); // 응답으로 보내줄 객체
		
		// DB 데이터를 다루기 위한 객체들
		CVO cvo = null;
		CommentService cservice = new CommentServiceImpl();
		
		switch (cmd) {
		case "insertComment" :
			cvo = new CVO();
			cvo.setWriter(request.getParameter("writer"));
			cvo.setPw(request.getParameter("pw"));
			cvo.setContent(request.getParameter("content"));
			cvo.setB_idx(Integer.parseInt(request.getParameter("b_idx")));
			// cvo.setIp(request.getRemoteAddr());
			cvo.setIp(Inet4Address.getLocalHost().getHostAddress());
			cservice.insertComment(cvo);
			obj.put("result", "success");
			break;
			
		case "commList":
			int b_idx = Integer.parseInt(request.getParameter("b_idx"));
			List<CVO> cList = cservice.getCommList(b_idx); // 메소드 호출
			objectMapper = new ObjectMapper(); // JSON ↔ Java 객체 사이를 변환(매핑)해주는 역할
			jsonString = objectMapper.writeValueAsString(cList); // json형식의 문자열로 변환
			obj.put("result", "success");
			obj.put("cList", jsonString);
			break;
			
		case "removeComm":
			int c_idx = Integer.parseInt(request.getParameter("c_idx"));
			cservice.removeComm(c_idx);
			obj.put("result", "success");
			break;
		}
		
		out.print(obj);
		
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}
}
