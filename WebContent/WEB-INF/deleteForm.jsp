<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	int No = Integer.parseInt(request.getParameter("no"));
	System.out.println(No);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form action="/gb2/gbc" method="post">
	<input type="hidden" name="action" value="delete">
	비밀번호:<input type="password" name="password">
	<input type="hidden" name="no" value=<%=No %>>
	<button type="submit">확인</button><br>
	<a href="http://localhost:8088/gb2/gbc?action=list">메인으로 돌아가기</a>
	</form>
</body>
</html>