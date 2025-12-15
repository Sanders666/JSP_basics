<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<c:set var="n" value="123456789.123456789"/>

	<h3>formatNumber의 groupingUsed</h3>
	천 단위 구분 기호 + 소수 3 자리 : <fmt:formatNumber value="${n }"/><br>
	천 단위 구분 기호 없이 소수 3 자리 : <fmt:formatNumber value="${n }" groupingUsed="no"/><br>
	
	<hr>
	
	<h3>formatNumber의 pattern</h3>
	천 단위 구분 기호 + 소수 2 자리 : <fmt:formatNumber value="${n }" pattern="#,##0.00"/><br>
	천 단위 구분 기호 + 정수 : <fmt:formatNumber value="${n }" pattern="#,000"/><br>
	
	<hr>
	
	<h3>formatNumber의 type</h3>
	퍼센트 : <fmt:formatNumber value="0.1" type="percent"/>
	원화 표기 : <fmt:formatNumber value="${n }" type="currency"/>
	달러 표기 : <fmt:formatNumber value="${n }" type="currency" currencySymbol="$"/>

</body>
</html>