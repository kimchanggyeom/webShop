<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>장바구니담기</h1>
<p>로그인한 사람: ${loginUser.manager_name}</p>
<form method="post" action="addCart.do">
	<input type="radio" name="product" value="김밥">김밥
	<input type="radio" name="product" value="햄버거">햄버거
	<input type="radio" name="product" value="콜라">콜라
	<input type="number" name="count" value="1"><br>
	<input type="submit" value="장바구니담기" >
	<input type="button" value="장바구니보기" onclick="location.href='cartview.do';">
	<input type="button" value="장바구니비우기" 
							onclick="location.href='cartremove.do';">
</form>
</body>
</html>