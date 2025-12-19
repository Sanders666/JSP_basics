// 게시글 삽입 페이지 이동 함수
function moveInsertPage(){
	location.href = 'BBSController?cmd=insertBBSPage';
}
// 목록으로 이동하는 함수
function view_all(){
	location.href = 'BBSController?cmd=allList';
}
// 게시글 등록
function insert(f){
	// 작성자, 제목, 내용 필수 검증 후 전송
	if(!f.writer.value){
		alert("작성자를 입력하세요");
		return;
	}
	if(!f.title.value){
		alert("제목을 입력하세요");
		return;
	}
	if(!f.content.value){
		alert("내용 입력하세요");
		return;
	}
	f.action = 'BBSController';
	f.submit();
}
// 게시글 수정 페이지 이동 함수
function updatePage(){
	location.href = 'BBSController?cmd=updatePage';
}
// 게시글 수정 함수
function update(f){
	if(!f.title.value){
		alert("제목을 입력하세요");
		return;
	}
	if(!f.content.value){
		alert("내용을 입력하세요");
		return;
	}
	f.action = 'BBSController';
	f.submit();
}

// 게시글 삭제 함수
function removeBBS(b_idx){
	if(confirm('해당 게시글을 삭제하시겠습니까?')){
		location.href = 'BBSController?cmd=remove&b_idx=' + b_idx;
	}
}

// 페이지 버튼 클릭 이벤트
document.querySelectorAll('.page-nation li a').forEach( aEle =>{
		aEle.addEventListener('click', (e) => {
			e.preventDefault();
			
			let pageNum = e.currentTarget.getAttribute('href');
			
			let sendData = 'cmd=allList&pageNum='+pageNum+'&amount=5';
			location.href = 'BBSController?' + sendData;			
		});
	});
