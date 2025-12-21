/* ------------ form 관련 요소들 -----------------*/
const f = document.forms[0];

/* ------------ 함수 -----------------*/
document.querySelectorAll("button").forEach(btn => {
	btn.addEventListener('click', ()=>{
		let type = btn.id;
		if(type === 'loginBtn'){
			login();
		}else if(type === 'mainBtn'){
			location.href = 'MemberController?cmd=mainPage';
		}
		
	});
});
// 로그인
function login(){
	// 1. 아이디 및 비밀번호 빈 값 검증
	if(f.mId.value == '' || f.mPw.value == ''){
		alert("회원 정보를 입력하세요.");
		return;
	}
	
	// 2. mId, mPw, cmd 데이터 json으로 변환 후 전송
	let formData = new FormData(f);
	let jsonData = JSON.stringify(
				Object.fromEntries(formData.entries())
				);
	
	/* 
		fetch : 브라우저에게 서버로 요청을 보내라고 지시하는 함수
	   	then : 응답 오면 어떤 일을 할지 지정하여 실행 (fetch 는 비동기라서 바로 완료되지 않음)
	   	catch : 요청 하다가 실패하면 여기서 처리
	 */ 
	
	// 요청을 보낼 서버의 URL(요청 주소), "이 요청을 어떻게 보낼 것인가?"를 설정하는 옵션 객체
	fetch('MemberAsyncController', { 
			method : 'POST',
			body : jsonData,
			headers : {
				'Content-type' : 'application/json; charset=UTF-8'
			}
		})
		// .then은 “정상적인 응답” 전용
		.then(response => response.json())
		.then(data => {
			if(data.result === 'success'){
				location.href = 'MemberController?cmd=mainPage';
			}else{
				alert("아이디 혹은 비밀번호가 일치하지 않습니다.");
			}
		})
		// .catch는 “요청 자체 실패/예외” 전용
		.catch(err => console.log(err));
}
