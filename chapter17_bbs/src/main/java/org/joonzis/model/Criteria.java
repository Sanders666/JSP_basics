package org.joonzis.model;

public class Criteria {
	private int pageNum; // 현재 사용자가 보고 있는 페이지 번호
	private int amount; // 한 페이지에 보여줄 게시글 개수
	
	public Criteria() {	}

	public Criteria(int pageNum, int amount) {
		super();
		this.pageNum = pageNum;
		this.amount = amount;
	}

	public int getPageNum() {
		return pageNum;
	}

	public void setPageNum(int pageNum) {
		this.pageNum = pageNum;
	}

	public int getAmount() {
		return amount;
	}

	public void setAmount(int amount) {
		this.amount = amount;
	}
	
}
