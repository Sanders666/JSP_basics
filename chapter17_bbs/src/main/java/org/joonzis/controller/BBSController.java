package org.joonzis.controller;

import java.io.File;
import java.io.IOException;
import java.net.Inet4Address;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.joonzis.model.Criteria;
import org.joonzis.model.FileDownload;
import org.joonzis.model.PageDTO;
import org.joonzis.service.BBSService;
import org.joonzis.service.BBSServiceImpl;
import org.joonzis.vo.BVO;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

@WebServlet("/BBSController")
public class BBSController extends HttpServlet {
	private static final long serialVersionUID = 1L;
    public BBSController() {
        super();
    }
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");
		
		// 파일 업로드
		String realPath = request.getServletContext().getRealPath("/upload");	// 업로드 경로
		MultipartRequest mr = null;
		
		// 분기 판단 cmd
		String cmd = request.getParameter("cmd");
		if(cmd == null) {
			// enctype="multipart/form-data"
			// 파일 업로드 시 일반 request에서 받아올 수 없기 때문에 
			// mr 객체 생성해서 파라미터를 받는다.
			mr = new MultipartRequest(
					request,
					realPath,
					1024 * 1024* 10,
					"utf-8",
					new DefaultFileRenamePolicy()
				);
			cmd = mr.getParameter("cmd");
		}
		
		boolean isForward = true;
		String path = "";
		BBSService bservice = new BBSServiceImpl();
		List<BVO> list = null;
		BVO bvo = null; // 데이터 오염(DIRTY DATA) 문제 발생 가능으로 인해 용도별 객체 따로 생성
		HttpSession session = request.getSession();
		String open = null;	// 세션 정보 저장 (게시글 열었을 때)
		int b_idx; // 게시판 테이블에서 특정 글을 식별하는 고유 번호
		
		// 페이징을 위한 cri 파라미터 변수
		String pageNum = "";
		String amount = "";
		int parsePageNum = 0;
		int parseAmount = 0;
		
		switch (cmd) {
		// 목록 전체 보기
		case "allList":
			// 조회수 증가 관련 코드
			open = (String)session.getAttribute("open");
			if(open != null) {
				session.removeAttribute("open");
			}
			
			// 사용자가 URL로 넘긴 값이 있는지 확인
			pageNum = request.getParameter("pageNum");
			amount = request.getParameter("amount");

			// request에 값이 없으면 세션에서 꺼내옴
			// -----------------------------------------------------------------
			// ★ 세션에 저장된 페이지 정보 우선 적용
			if(pageNum == null) {
				pageNum = (String)session.getAttribute("pageNum"); // ★ 추가
			}
			if(amount == null) {
				amount = (String)session.getAttribute("amount"); // ★ 추가
			}
			// -----------------------------------------------------------------
			
			// 이제 현재 페이지 번호와 글 개수를 확정
			if(pageNum != null && amount != null) { // 파라미터를 잘 전달 받으면 적용
				parsePageNum = Integer.parseInt(pageNum); // 페이징 계산 로직 때문에 int로 변환
				parseAmount = Integer.parseInt(amount);
			} else { // 파라미터를 전달 받지 못하면 기본 값으로 초기화
				parsePageNum = 1;
				parseAmount = 5;
			}
			
			// 최종 확정된 값을 세션에 기록해둠 (마지막으로 본 페이지를 기억)
			// -----------------------------------------------------------------
			// ★ 현재 페이지를 세션에 저장 (목록으로 돌아오기 유지)
			// 문자열이면 바로 연결 가능, 숫자일 경우 + 연산 시 의도치 않은 덧셈이 발생할 수 있음
			session.setAttribute("pageNum", String.valueOf(parsePageNum));
			session.setAttribute("amount", String.valueOf(parseAmount));
			// -----------------------------------------------------------------
			
			Criteria cri = new Criteria(parsePageNum, parseAmount);
			
			// 페이징 게시글 가져오기
			// list = bservice.getList();
			list = bservice.getListWithPaging(cri);
			
			// 전체 게시글 수 가져오기
			int total = bservice.getTotalRecordCount();
			
			// pageDTO 객체 생성
			PageDTO pdto = new PageDTO(cri, total);
			
			// 게시글 및 페이징 객체 request객체로 전달
			request.setAttribute("list", list);
			request.setAttribute("pageMaker", pdto);
			
			path = "bbs/allList.jsp";
			break;
			
		// 게시글 작성 페이지 이동
		case "insertBBSPage":
			path = "bbs/insert_page.jsp";
			break;
			
		// 게시글 작성
		case "insertBBS" : // 게시글 새롭게 삽입 후 첫 목록으로 이동
			bvo = new BVO();
			bvo.setWriter(mr.getParameter("writer"));
			bvo.setTitle(mr.getParameter("title"));
			bvo.setPw(mr.getParameter("pw"));
			bvo.setContent(mr.getParameter("content"));
			// bvo.setIp(request.getRemoteAddr()); // IPv6
			bvo.setIp(
				Inet4Address.getLocalHost().getHostAddress()
			); // IPv4
			
			// 첨부 파일 유무에 따라서 filename 값을 결정
			if(mr.getFile("filename") != null) {
				bvo.setFilename(mr.getFilesystemName("filename"));
			}else {
				bvo.setFilename("");
			}
			
			bservice.getInsertBBS(bvo);

			// dml 후에 보여줄 화면을 list로 간다면
			// 기존 list로 가는 서블릿 경로를 리다이렉트 해준다.
			isForward = false;
			path = "BBSController?cmd=allList";
			break;
			
		// 게시글 상세 보기
		case "view":
			// -----------------------------------------------------------------------
			// ★ 상세보기 들어올 때 현재 페이지 번호를 유지
			String curPage = request.getParameter("pageNum");	// ★ 추가
			String curAmount = request.getParameter("amount");	// ★ 추가

			if(curPage != null) {							    // ★ 추가
			    session.setAttribute("pageNum", curPage);
			} else {
			    session.setAttribute("pageNum", "1"); // 기본값
			}

			if(curAmount != null) {							    // ★ 추가
			    session.setAttribute("amount", curAmount);
			} else {
			    session.setAttribute("amount", "5"); // 기본값
			}

			// -----------------------------------------------------------------------
			

			// 게시글 가져오는 로직
			b_idx = Integer.parseInt(request.getParameter("b_idx"));
			bvo = bservice.getBBS(b_idx);
			
			// 조회수 증가 로직
			// 1. 상세 페이지에 접근시 세션에 정보를 저장
			// 2. 세션이 만료되기 전까지 조회수의 증가를 더 이상 하지 않는다.
			// (새로고침 등으로 조회 수 증가 방지)
			// 3. 메인 화면(allList.jsp)로 이동하게 되면 세션을 만료
			open = (String)session.getAttribute("open");
			if(open == null) {
				session.setAttribute("open", "yes");
				int hit = bvo.getHit() + 1;
				bvo.setHit(hit);
				bservice.updateHit(bvo);
			}
			session.setAttribute("bvo", bvo);
			path = "bbs/view.jsp";
			break;
			
		case "remove":
			b_idx = Integer.parseInt(request.getParameter("b_idx"));
			bservice.removeBBS(b_idx);
			isForward = false;
			
			// ----------------------------------------------------------------------------------
			// ★ 삭제 후에도 원래 보고 있던 페이지로 돌아감
			// 리다이렉트라 request x
			String rPage = (String)session.getAttribute("pageNum"); // ★ 추가 
			String rAmount = (String)session.getAttribute("amount"); // ★ 추가
			if(rPage == null) rPage = "1";	// ★ 추가
			if(rAmount == null) rAmount = "5";	// ★ 추가
			path = "BBSController?cmd=allList&pageNum=" + rPage + "&amount=" + rAmount; // ★ 추가
			// ----------------------------------------------------------------------------------
			break;
			
		case "updatePage":
			path = "bbs/update_page.jsp";
			break;
			
		case "update":
			String title = mr.getParameter("title");
			String content = mr.getParameter("content");
			b_idx = Integer.parseInt(mr.getParameter("b_idx"));

			bvo = new BVO();
			bvo.setTitle(title);
			bvo.setContent(content);
			bvo.setB_idx(b_idx);
			
			// 새 첨부 파일
			File newFile = mr.getFile("filename");
			// 기존 첨부 파일
			String oldFile = mr.getParameter("oldfile");
			
			if(newFile != null) { 
				// 새 첨부 파일 O
				if(oldFile != null) {
					// 기존 파일 O
					File removeFile = new File(realPath+"/"+oldFile);
					if(removeFile.exists()) { // 기존 첨부 파일 유무 확인
						removeFile.delete(); // 기존 첨부 파일 삭제
					}
				}
				bvo.setFilename(newFile.getName());
			}else {
				// 새 첨부 파일 X
				if(oldFile != null) {
					// 기존 첨부 파일 O
					bvo.setFilename(oldFile);
				}else {
					// 기존 첨부 파일 X, 새 첨부 파일 X
					bvo.setFilename("");
				}
			}
			
			bservice.updateBBS(bvo);
			isForward = false;

			// ---------------------------------------------------------------------------------------------------
			// ★ 수정 후에도 현재 보고 있던 페이지로 이동
			String uPage = (String)session.getAttribute("pageNum"); // ★ 추가
			String uAmount = (String)session.getAttribute("amount"); // ★ 추가
			if(uPage == null) uPage = "1";     // 기본 페이지 번호
			if(uAmount == null) uAmount = "5"; // 기본 글 개수
			path = "BBSController?cmd=view&b_idx=" + b_idx + "&pageNum=" + uPage + "&amount=" + uAmount; // ★ 추가
			// ---------------------------------------------------------------------------------------------------
			break;
			
		case "download":
			FileDownload fd = new FileDownload();
			fd.doDownload(request, response);
			break;
		}
		
		if(isForward) {
			request.getRequestDispatcher(path).forward(request, response);
		} else {
			response.sendRedirect(path);
		}
		
		
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}
}
