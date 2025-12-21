// 정규식과 비동기를 이용해서 검증 거치고, 회원가입 진행

/* ------------ form 관련 요소들 -----------------*/
const f = document.forms[0];
const mIdValidState = document.querySelector("#mIdValidState");
const mPwValidState = document.querySelector("#mPwValidState");
const mPwReValidState = document.querySelector("#mPwReValidState");
let idCk=pwCk=pwReCk=nameCk=emailCk=false; // 검증

/* ------------ 정규식 -----------------*/
const regExpId = /^[a-z]+[0-9a-z]{3,12}$/;	// 아이디 검증 정규식
const regExpPw = /^[0-9a-zA-Z]{8,16}$/;		// 비밀번호 검증 정규식
const regExpName = /^[가-힣a-zA-Z]{2,12}$/;	// 이름 검증 정규식 
const regExpEmail = /^[a-zA-Z0-9+-\_.]+@[a-zA-Z0-9-]+\.[a-zA-Z0-9-.]+$/;	// 이메일 검증 정규식

/* ------------ 함수 -----------------*/
document.querySelectorAll("button").forEach(btn => {
	btn.addEventListener('click', ()=>{
		
		let type = btn.id;

		if(type === 'duplicateCkBtn'){
			validateId();
		}else if(type === 'joinBtn'){
			join();
		}else if(type === 'resetBtn'){
			f.reset();
		}else if(type === 'mainBtn'){
			location.href = `MemberController?cmd=mainPage`;
		}
		
	});
});
// 데이터 검증 완료 함수
function validated(inputTarget, resultState, comment){
	inputTarget.classList.add("is-valid");
	inputTarget.classList.remove("is-invalid");
	if(resultState){
		resultState.classList.add("valid-feedback");
		resultState.classList.remove("invalid-feedback");
		comment ? // truthy/falsy
			resultState.innerHTML = comment : 
				resultState.innerHTML = '' ;
	}
}
// 데이터 검증 미완료 함수
function invalidate(inputTarget, resultState, comment){
	inputTarget.classList.remove("is-valid");
	inputTarget.classList.add("is-invalid");
	if(resultState){
		resultState.classList.remove("valid-feedback");
		resultState.classList.add("invalid-feedback");
		comment ? // truthy/falsy
			resultState.innerHTML = comment : 
				resultState.innerHTML = '' ;
	}
}
// 검증 스타일 초기화 함수
function Initialization(inputTarget, resultState){
	inputTarget.classList.remove("is-valid");
	inputTarget.classList.remove("is-invalid");
	if(resultState){
		resultState.classList.remove("valid-feedback");
		resultState.classList.remove("invalid-feedback");
		resultState.innerHTML = '';
	}
}
// 아이디 중복 확인
function validateId(){
	let target = f.mId;
	
	if(target.value == ''){
		Initialization(target, mIdValidState);
		alert("아이디를 입력하세요.");
		idCk = false;
		return;		
	}else if(!regExpId.exec(target.value)){
		invalidate(target, mIdValidState, "형식에 맞지 않은 아이디입니다.");
		idCk = false;
		return;
	}
	
	const params = {
		cmd : 'validateId',
		mId : target.value
	};
	const queryString = Object.keys(params)
				.map( //encodeURIComponent : 글자를 인터넷 주소로 안전하게 바꿔주는 마법
					key => encodeURIComponent(key) + "=" +
					encodeURIComponent(params[key])
					)
				.join('&');
				
	fetch(`MemberAsyncController?${queryString}`) // ${queryString}대신 queryString도 가능
		.then(response => response.json())
		.then(data => {
			if(data.result == 1){
				invalidate(target, mIdValidState, "중복된 아이디입니다.");
				idCk = false;
			}else{
				validated(target, mIdValidState, "사용 가능한 아이디입니다.");
				idCk = true;
			}
		})
		.catch(err => console.log(err))
}
// 비밀번호 입력 검증
f.mPw.addEventListener('keyup', e => {
	let target = e.currentTarget; // mPw
	
	if(target.value == ''){
		Initialization(target, mPwValidState);
		pwCk = false;
	}else if(regExpPw.exec(target.value)){
		validated(target, mPwValidState);
		pwCk = true;
	}else{
		invalidate(target, mPwValidState, "올바른 형식이 아닙니다.");
		pwCk = false;
	}
});
// 비밀번호 확인 입력 검증
f.mPwRe.addEventListener('keyup', e => {
	let target = e.currentTarget;
	
	if(target.value == ''){
		Initialization(target, mPwReValidState);
		pwReCk = false;
	}else if(target.value === f.mPw.value){
		validated(target, mPwReValidState);
		pwReCk = true;
	}else{
		invalidate(target, mPwReValidState, '비밀번호가 일치하지 않습니다');
		pwReCk = false;
	}
});
// 이름 입력 검증
f.mName.addEventListener('input', e => {
	let target = e.currentTarget;
	
	if(target.value == ''){
		Initialization(target);
		nameCk = false;
	}else if(regExpName.exec(target.value)){
		validated(target);
		nameCk = true;
	}else{
		invalidate(target);
		nameCk = false;
	}
});
// 이메일 입력 검증
f.mEmail.addEventListener('input', e => {
	let target = e.currentTarget;
	
	if(target.value == ''){
		Initialization(target);
		emailCk = false;
	}else if(regExpEmail.exec(target.value)){
		validated(target);
		emailCk = true;
	}else{
		invalidate(target);
		emailCk = false;
	}
});
// 회원가입
function join(){
	// post방식 - json 전달
	// 1. 데이터 검증 완료
	if(!idCk || !pwCk || !pwReCk || !nameCk || !emailCk){
		alert('입력 내용을 확인해주세요');
		return; 	
	}
	
	// 2. form 데이터들을 json으로 변경
	let formData = new FormData(f);
	let jsonData = JSON.stringify(
				Object.fromEntries(formData.entries())
				);
				
	// 3. fetch로 데이터 통신
	fetch('MemberAsyncController', {
			method : 'POST',
			body : jsonData,
			headers : {
				'Content-type' : 'application/json; charset=UTF-8'
			}
		})
		.then(response => response.json())
		.then(data => {
			console.log(data);
			
			if(data.result == 1){
				alert("회원가입이 성공했습니다");
				location.href = 'MemberController?cmd=mainPage';
			}else{
				alert("회원가입이 실패했습니다");
			}
			
		})
		.catch(err => console.log(err));
}

