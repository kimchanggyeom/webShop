<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    isELIgnored="false"%>
    
<html>
<head>
<meta charset="UTF-8">
<title>파일 다운로드 요청하기</title>
</head>
<body>
 
 <form method="post"  action="result.jsp" >
	 <input type=hidden  name="param1" value="zz.png" /> <br>
	 <input type=hidden  name="param2" value="ss.png" /> <br>
   <input type ="submit" value="이미지 다운로드">	 
 </form> 
</body>
</html>
