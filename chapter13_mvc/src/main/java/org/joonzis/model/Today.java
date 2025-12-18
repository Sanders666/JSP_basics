package org.joonzis.model;

import java.util.Calendar;

import javax.servlet.http.HttpServletRequest;

public class Today {
	public String process(HttpServletRequest request) {
		
		Calendar cal = Calendar.getInstance();
		int year = cal.get(Calendar.YEAR);
		int month = cal.get(Calendar.MONTH) + 1;
		int day = cal.get(Calendar.DATE);
		
		String today = year + "년 " + month + "월 " + day + "일";
		request.setAttribute("today", today);
		
		return "view/output.jsp";
	}
}
