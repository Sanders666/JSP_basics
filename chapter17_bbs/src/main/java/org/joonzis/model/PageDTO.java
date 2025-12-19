package org.joonzis.model;

public class PageDTO {
	// -------------------------
	// 필드 변수
	// -------------------------
	private int startPage; // 현재 페이지 그룹에서 시작 페이지 번호 (UI에서 보여줄 첫 페이지)
	private int endPage;   // 현재 페이지 그룹에서 마지막 페이지 번호 (UI에서 보여줄 마지막 페이지)
	private boolean prev, next; // 이전(prev) 버튼과 다음(next) 버튼 활성 여부
	private int total;     // 전체 게시글 수
	private Criteria cri;  // 페이징 기준 정보(현재 페이지 번호, 페이지당 보여줄 게시글 수 등)

	// -------------------------
	// 기본 생성자
	// -------------------------
	public PageDTO() {}

	// -------------------------
	// 전체 페이지 정보 계산 생성자
	// -------------------------
	public PageDTO(Criteria cri, int total) {
		this.cri = cri;   // 전달받은 기준 정보를 저장
		this.total = total; // 전체 게시글 수 저장

		// 1~10, 11~20처럼 버튼 묶음 단위로 페이지를 계산
		this.endPage = (int)(Math.ceil(cri.getPageNum() / 10.0)) * 10;
		// Math.ceil(cri.getPageNum()/10.0) → 현재 페이지가 속한 10개 단위 그룹 계산
		// 예: 페이지 1~10 → ceil(1/10)=1 → 1*10=10 → endPage=10
		// 예: 페이지 11~20 → ceil(11/10)=2 → 2*10=20 → endPage=20

		this.startPage = this.endPage - 9;
		// 시작 페이지는 현재 버튼 그룹의 끝 번호에서 9를 빼서 결정
		// 예: endPage=10 → startPage=1, endPage=20 → startPage=11

		// 실제 전체 페이지 수 계산
		int realEnd = (int)(Math.ceil((total * 1.0) / cri.getAmount()));
		// total: 전체 게시글 수
		// cri.getAmount(): 한 페이지에 보여줄 게시글 수
		// 예: total=82, amount=10 → realEnd = ceil(82/10)=9 → 실제 끝 페이지는 9페이지

		if(realEnd < this.endPage) {
			this.endPage = realEnd;
		}
		// 전체 게시글 수보다 endPage가 크면 실제 마지막 페이지(realEnd)로 보정

		this.prev = this.startPage > 1; 
		// startPage가 1보다 크면 이전 버튼(prev) 활성화
		// 예: startPage=11 → prev=true, startPage=1 → prev=false

		this.next = this.endPage < realEnd; 
		// endPage가 실제 마지막 페이지보다 작으면 다음 버튼(next) 활성화
		// 예: endPage=10, realEnd=15 → next=true, endPage=15, realEnd=15 → next=false
	}

	// -------------------------
	// getter / setter
	// -------------------------
	public int getStartPage() {
		return startPage;
	}
	public void setStartPage(int startPage) {
		this.startPage = startPage;
	}

	public int getEndPage() {
		return endPage;
	}
	public void setEndPage(int endPage) {
		this.endPage = endPage;
	}

	public boolean isPrev() {
		return prev;
	}
	public void setPrev(boolean prev) {
		this.prev = prev;
	}

	public boolean isNext() {
		return next;
	}
	public void setNext(boolean next) {
		this.next = next;
	}

	public int getTotal() {
		return total;
	}
	public void setTotal(int total) {
		this.total = total;
	}

	public Criteria getCri() {
		return cri;
	}
	public void setCri(Criteria cri) {
		this.cri = cri;
	}
}
