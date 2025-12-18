package org.joonzis.model;

import java.util.Calendar;

import javax.servlet.http.HttpServletRequest;

public class Now {
	public String process(HttpServletRequest request) {
		
		Calendar cal = Calendar.getInstance();
		int h = cal.get(Calendar.HOUR);
		int m = cal.get(Calendar.MINUTE);
		int s = cal.get(Calendar.SECOND);
		
		String now = h + "시 " + m + "분 " + s + "초";
		request.setAttribute("now", now);
		
		return "view/output.jsp";
	}
}
