function insert_comment(f){
	if(!f.writer.value){
		alert(`작성자를 입력하세요`);
		return;
	}
	if(!f.content.value){
		alert(`내용을 입력하세요`);
		return;
	}
	if(!f.pw.value){
		alert(`비밀번호를 입력하세요`);
		return;
	}
	
	let formData = new FormData(f); // 폼 객체 생성 (폼 안의 데이터를 key-value 쌍으로 수집)
	
	// 직렬화
	// URLSearchParams 쿼리스트링을 다루는 메소드 (FormData도 key-value 쌍을 가진 이터러블이라 가능)
	let serializedData = new URLSearchParams(formData).toString(); 
	
	// json (JSON 문자열로 직렬화)
	/*let jsonData = JSON.stringify(
						Object.fromEntries(formData.entries())
					);*/
	
	// 댓글 데이터 요청
	fetch('CommentController?' + serializedData) // 지정된 주소(url)로 요청을 보냄 (fetch : 가져오다)
		.then(response => response.json()) // 서버가 응답을 보내면, 그 응답을 JSON 형식으로 해석
		.then(data => { // JSON으로 변환된 실제 데이터를 받아서 처리
			console.log(data);
			showCommList(); // 목록 갱신
			
			
		})
		.catch(err => console.log(err)); // 요청 과정에서 에러가 나면 오류를 잡아내는 역할

}

function showCommList(){ // 댓글 목록을 가져오는 요청
	// cmd / b_idx
	// session 서버 영역
	let b_idx = new URLSearchParams(location.search).get("b_idx"); // 현재 URL에서 ? 뒤에 오는 쿼리스트링 전체 중 b_idx 값을 꺼냄
	let sendData = `cmd=commList&b_idx=${b_idx}`; 
	let msg = ``;
	fetch('CommentController?' + sendData) // 이 글(b_idx)에 달린 댓글 목록을 줘 라고 요청
		.then(response => response.json()) // 응답을 JSON으로 바꿔줘
		.then(data => { // 댓글 목록 문자열(JSON 형태)
			let cList = JSON.parse(data.cList); // 실제 배열 객체로 변환
			
			cList.forEach(cvo => {
				msg += `<tr>`;
				msg += `<td>${cvo.c_idx}</td>`;
				msg += `<td>${cvo.writer}</td>`;
				msg += `<td>${cvo.content}</td>`;
				msg += `<td>${myTime(cvo.reg_date)}</td>`;
				msg += `<td><button type="button" onclick="removeComm(${cvo.c_idx})">삭제</button></td>`;
				msg += `</tr>`;
			});
			
			if(msg == ''){
				msg += `<tr>`;
				msg += `<td colspan="5">댓글이 없습니다.</td>`;
				msg += `</tr>`;
			}
			
			document.querySelector("#commBody").innerHTML = msg; // 화면에 댓글 목록이 표시됨
			
			
		})
		.catch(err => console.log(err));
}
showCommList();

// unixTimeStamp to date
function myTime(unixTimeStamp){
	// 1. 밀리초로 넘어오면 /1000을 해준다.
	let myDate = new Date(unixTimeStamp);
	
	let date = myDate.getFullYear() + "-" + (myDate.getMonth() + 1) + "-" + myDate.getDate();
	
	return date;
}


function removeComm(c_idx){
    // 삭제 확인
    if(!confirm("정말 삭제하시겠습니까?")) return;

    // 서버로 보낼 데이터 (cmd=removeComm, c_idx)
    let sendData = `cmd=removeComm&c_idx=${c_idx}`;

    // fetch GET 요청
    fetch('CommentController?' + sendData) // 삭제 요청(c_idx 파라미터 이용)
        .then(response => response.json())
        .then(data => {
            console.log(data);

            if(data.result === "success"){
                alert("삭제되었습니다.");
                showCommList(); // 목록 다시 불러오기
            } else {
                alert("삭제 실패: " + (data.message || ""));
            }
        })
        .catch(err => {
            console.error(err);
            alert("삭제 중 오류가 발생했습니다.");
        });
}
