<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>요청하신 주소는 존재하지않습니다.</h1>
<h2><%=request.getRequestURI() %></h2>
<h2 id ="here"></h2>
<script type="text/javascript">
	here.innerHTML = location.href;
</script>
</body>
</html>