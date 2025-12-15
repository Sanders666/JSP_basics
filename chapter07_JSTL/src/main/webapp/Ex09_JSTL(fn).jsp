<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>함수 사용</title>
</head>
<body>
	<c:set var="str1" value="Functions <태그>를 사용합니다." />
	<c:set var="str2" value="사용" />
	<c:set var="tokens" value="1,2,3,4,5,6,7,8,9,10"/>
	
	<h3>${str1 }</h3>
	<h3>${str2 }</h3>	
	<h3>${tokens }</h3><br>
	
	length(str1) = ${fn:length(str1)} <br>
	toUpperCase(str1) = ${fn:toUpperCase(str1) } <br>
	toLowerCase(str1) = ${fn:toLowerCase(str1) } <br>
	subString(str1, 3, 6) = ${fn:substring(str1,3,6) } <br>
	subStringAfter(str1, str2) = ${fn:substringAfter(str1, str2) } <br>	<!-- str1에서 str1이 포함되어 있는 str2 이후의 문자열을 구한다. -->
	subStringBefore(str1, str2) = ${fn:substringBefore(str1, str2) } <br> <!-- str1에서 str1이 포함되어 있는 str2 이전의 문자열을 구한다. -->
	trim(str1) = ${fn:trim(str1)} <br>	<!-- 좌우 공백문자를 제거 -->
	replace(str1, src, dest) = ${fn:replace(str1, " ", "_")} <br> <!-- src 문자를 dest 문자로 대체 -->
	indexOf(str1, str2) = ${fn:indexOf(str1, str2)} <br> <!-- str1에서 str2이 위치한 인덱스를 구한다. -->
	startsWith(str1, str2) = ${fn:startsWith(str1, 'Fun') } <br> <!-- str1이 str2로 시작할 경우 true 반환 -->
	endsWith(str1, str2) = ${fn:endsWith(str1, "합니다.") } <br> <!-- str1이 str2로 끝날 경우 true 반환 -->
	contains(str1, str2) = ${fn:contains(str1, str2) } <br> <!-- str1이 str2를 포함하고 있을 경우 true 반환 -->
	containsIgnoreCase(str1, str2) = ${fn:containsIgnoreCase(str1, 'fun') } <br> <!-- 대소문자 구분없는 contains -->
	
	<c:set var="array" value="${fn:split(tokens, ',') }" />
	
	join(array, "-") = ${fn:join(array, "-") }<br>
	escapeXml(str1) = ${fn:escapeXml(str1) } <!-- XML의 객체 참조에 해당하는 특수 문자를 처리한다. -->
	
</body>
</html>