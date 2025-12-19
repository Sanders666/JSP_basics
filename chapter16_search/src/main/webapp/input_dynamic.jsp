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
			<h1>무엇을 검색 하시겠습니까?</h1>
			<table>
				<tr>
					<th>검색 옵션</th>
				</tr>
				<tr>
					<td>
						선택 검색 : 
						<select name="key">
							<option value="1">직원ID</option>
							<option value="2">성명</option>
							<option value="3">부서ID</option>
						</select> 
					</td>
				</tr>
				<tr>
					<td>
						입력 검색 : <input type="text" name="value">
					</td>
				</tr>
				<tr>
					<td>
						<input type="button" value="검색" onclick="search_dynamic(this.form)">
						<input type="hidden" name="cmd" value="dynamicList">
					</td>
				</tr>
			</table>
		</form>
	</div>
</body>
<script type="text/javascript">
	function search_dynamic(f){
		if(f.value.value == ''){
			alert("검색 내용을 입력하세요");
			return;
		}
		
		f.action = '/chapter16_search/Controller';
		f.submit();
	}
</script>
</html>
