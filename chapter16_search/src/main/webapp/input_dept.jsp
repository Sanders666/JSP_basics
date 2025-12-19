<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	div{
		width: 800px;
		text-align: center;
		margin: auto;
	}
	table{
		width: 100%;
		border-collapse: collapse;
	}
	th, td{
		border: 1px solid gray;
	}
	th{
		padding: 5px;
		background-color: darkslateblue;
		color: white;
	}
</style>
</head>
<body>
	<div>
		<form>
			<h1>부서를 선택하고 검색 버튼을 누르세요</h1>
			<table>
				<tr>
					<th>부서 검색</th>
				</tr>
				<tr>
					<td>
						<select name="department_id">
							<option value="">::부서선택::</option>
						</select>
						<input type="button" value="검색" onclick="search_dept(this.form)">
						<input type="hidden" name="cmd" value="deptList">
					</td>
				</tr>
			</table>
		</form>
	</div>
</body>
<script type="text/javascript">
	let sel = document.querySelector("select[name='department_id']");
	for(let i=1; i<=11; i++){
		sel.innerHTML += '<option value="'+ (i*10) +'">'+(i*10)+'</option>';
	}
	
	function search_dept(f){
		if(f.department_id.value == ''){
			alert("부서 번호를 선택하세요.");
			return;
		}
		
		f.action = '/chapter16_search/Controller';
		f.submit();
	}
</script>
</html>
