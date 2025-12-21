package org.joonzis.controller;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.joonzis.service.MemberService;
import org.joonzis.service.MemberServiceImpl;
import org.joonzis.vo.MemberVO;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;

import com.fasterxml.jackson.databind.ObjectMapper;

//비동기 (서버에 요청을 보내지만 페이지 전환 없이 필요한 데이터만 받아와서 화면 일부만 갱신)
//forward / redirect 없음 → JSON 또는 문자열로 응답 (브라우저 화면은 그대로 있고, JS가 받아서 화면 일부만 변경)
// 즉, 서버가 JSON만 응답하고 화면은 그대로일 때 = 비동기 방식
// 역할: AJAX 요청 처리 (JSON 데이터만 응답, 화면 이동 없음)
@WebServlet("/MemberAsyncController")
public class MemberAsyncController extends HttpServlet {
	private static final long serialVersionUID = 1L;
    public MemberAsyncController() {
        super();
    }
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");
		
		// 쿼리스트링으로 넘어오는 데이터를 파라미터로 받을 수 있지만,
		// json 데이터는 그렇지 못하기 때문에
		// 두 방식에 따라서 처리하는 방식이 바뀌게된다.
		
		// 쿼리 스트링으로 들어오는 cmd를 저장하기 위한 방식
		String cmd = request.getParameter("cmd");
		
		// 비동기를 처리하기 위한 내용들
		// json과 java객체들을 변환할 때 사용
		ObjectMapper objectMapper = null;
		// json으로 직렬화 된 데이터를 담는 용도
		String jsonString = null;
		// 응답을 문자열로 직접 출력하는 객체
		PrintWriter out = response.getWriter();
		// 응답 객체에 보내줄 객체 (클라이언트에게 전송하기 위해 사용 또한 브라우저가 바로 파싱 가능한 JSON을 보내기 위함)
		JSONObject obj = new JSONObject();
		// json 데이터를 저장하기 위한 객체
		StringBuilder sb = new StringBuilder();
		// json데이터가 들어온 객체
		BufferedReader reader = request.getReader();
		String line;
		
		// 1. json 데이터를 StringBuilder에 저장
		while((line = reader.readLine()) != null) {
			sb.append(line);
		}
		// 데이터는 sb에 담겨진 상태이기 때문에 검증은
		// sb.toString()으로 문자열 출력
		
		// 2. json데이터 자바 객체로 저장
		if(!sb.toString().isEmpty()) {
			try {
				obj = (JSONObject)new JSONParser().parse(sb.toString());
			} catch (ParseException e) {
				e.printStackTrace();
			}
		}
		
		if(cmd == null) {
			// json으로 들어오는 cmd를 저장하기 위한 방식
			cmd = (String)obj.get("cmd");
		}
		
		MemberService mservice = new MemberServiceImpl();
		MemberVO mvo = null;
		
		HttpSession session = request.getSession();
		
		switch (cmd) {
			case "validateId":
				String mId = request.getParameter("mId");
				obj.put("result", mservice.validateId(mId));
				break;
			
			// 비동기 처리 이유 : 더 부드러움
			case "join":
				// 아이디, 비밀번호 ,이름, 이메일
				// vo에 담아서 mapper까지 전달
				mvo = new MemberVO();
				mvo.setmId((String)obj.get("mId")); 
				mvo.setmPw((String)obj.get("mPw")); 
				mvo.setmName((String)obj.get("mName")); 
				mvo.setmEmail((String)obj.get("mEmail"));
				
				obj.clear(); 
				obj.put("result", mservice.insertMember(mvo));
				break;
				
			case "login":
				mvo = new MemberVO();
				mvo.setmId((String)obj.get("mId"));
				mvo.setmPw((String)obj.get("mPw"));
				
				MemberVO returnVO = mservice.doLogin(mvo);
				
				obj.clear();
				
				if(returnVO != null) {
					session.setAttribute("member", returnVO);
					obj.put("result", "success");
				}else {
					obj.put("result", "fail");
				}
				
				break;
		}
		
		// 실제로 JSON 결과를 브라우저(클라이언트)에게 보내는 행위 (AJAX에서는 JSP로 forward 하지 않기 때문)
		// js에서는 fetch then에서 데이터로 받음
		out.print(obj);             // 내부적으로 obj.toString() → JSON 문자열
		// out.print(obj.toString());  // JSON 문자열
		// out.print(obj.toJSONString()); // JSON 문자열 (의도가 명확하므로 더 권장)
		
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}
}
