package org.joonzis.vo;

import java.sql.Date;

public class CVO {
	private int c_idx;
	private String writer;
	private String content;
	private String pw;
	private String ip;
	private Date reg_date;
	private int b_idx;
	
	public CVO() {
	}

	public CVO(int c_idx, String writer, String content, String pw, String ip, Date reg_date, int b_idx) {
		super();
		this.c_idx = c_idx;
		this.writer = writer;
		this.content = content;
		this.pw = pw;
		this.ip = ip;
		this.reg_date = reg_date;
		this.b_idx = b_idx;
	}

	public int getC_idx() {
		return c_idx;
	}

	public void setC_idx(int c_idx) {
		this.c_idx = c_idx;
	}

	public String getWriter() {
		return writer;
	}

	public void setWriter(String writer) {
		this.writer = writer;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getPw() {
		return pw;
	}

	public void setPw(String pw) {
		this.pw = pw;
	}

	public String getIp() {
		return ip;
	}

	public void setIp(String ip) {
		this.ip = ip;
	}

	public Date getReg_date() {
		return reg_date;
	}

	public void setReg_date(Date reg_date) {
		this.reg_date = reg_date;
	}

	public int getB_idx() {
		return b_idx;
	}

	public void setB_idx(int b_idx) {
		this.b_idx = b_idx;
	}
	
	
}
