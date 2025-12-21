document.querySelectorAll("button").forEach(btn => {
	btn.addEventListener('click', ()=>{
		
		let type = btn.id;
		let sendData = '';

		if(type === 'myPageBtn'){
			sendData = 'cmd=myPage';
		}else if(type === 'loginBtn'){
			sendData = 'cmd=loginPage';
		}else if(type === 'joinBtn'){
			sendData = 'cmd=joinPage';
		}else if(type === 'logoutBtn'){
			sendData = 'cmd=logout';
		}
		
		location.href = `/chapter18_member/MemberController?${sendData}`;
		
	});
});


