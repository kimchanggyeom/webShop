<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>JSTL연습</h1>
<p>myName request>session>application : ${myName}</p>
<p>requestScope myName : ${requestScope.myName}</p>
<p>sessionScope myName : ${sessionScope.myName}</p>
<p>applicationScope myName : ${applicationScope.myName}</p>
<ul>
	<c:set var="count" value="0"/>
	<c:forEach items="${admins}" var="admin">
	<c:set var="count" value="${sum+100}"></c:set>
	<li style="color:${status.first?'red':'blue'};" > ${status.first}:${status.last}:  ${sum}: ${status.index}: ${status.count}: ${admin}----------${admin.manager_name}</li>
	</c:forEach>
</ul>
<hr>
<h2>score평가</h2>
<c:if test="${score>=90}">
	<p>합격입니다.</p>
</c:if>
<c:if test="${score<90}">
	<p>불합격입니다.</p>
</c:if>
<hr>
	<c:choose>
		<c:when test="${score>=90}">
			<p>A학점</p>
		</c:when>
		<c:when test="${score>=80 && score<90}">
			<p>B학점</p>
		</c:when>
		<c:otherwise>
			<p>C학점</p>
		</c:otherwise>
	</c:choose>
	<hr>
	<c:out value="오늘은 <목요일>입니다."></c:out>
	
	<h2>숫자, 날짜 format</h2>
	<c:set value="1000000" var="price"/>
	1.price : ${price}
	2.price : <fmt:formatNumber value="${price}" groupingUsed="true" type="currency"></fmt:formatNumber>
	
	3. 오늘 : ${today}<br>
	<fmt:formatDate value="${today}" pattern="YYYY-MM-dd hh:mm:ss"/><br>
	<fmt:formatDate value="${today}" dateStyle="full"/><br>
	<fmt:formatDate value="${today}" type="both" timeStyle = "full"/><br>
<h2>JSTL에서 문자열함수 사용하기</h2>	
<p>myName: ${myName}</p>		
<p>myName: ${fn:substring(myName,0,3)}</p>		
<p>myName: ${fn:length(myName)}</p>		
</body>
</html>