<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page import="java.util.List" %>

<%@ page import="com.javaex.dao.GuestDao" %>
<%@ page import="com.javaex.vo.GuestVo" %>

<%
	List<GuestVo> gList = (List<GuestVo>)request.getAttribute("guestList");
	System.out.println(gList.toString());
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form action="/gb2/gbc" method="get">
		<input type="hidden" name="action" value="add">
		<table border="1" width="500px">
			<tr>
				<td>이름</td>
				<td><input type="text" name="name"></td>
				<td>비밀번호</td>
				<td><input type="text" name="password"></td>
			</tr>
			<tr>
				<td colspan="4"><textarea name="content" rows="5" cols="40" style="resize: none; width: 480px;"></textarea></td>
			</tr>
			<tr>
				<td colspan="4"><button>확인</button></td>
			</tr>
		</table>
		<br>
	</form>
	<%for(GuestVo guestVo : gList) {%>
	<table border="1" width="500px">
		<tr>
			<td><%=guestVo.getNo()%></td>
			<td><%=guestVo.getName()%></td>
			<td><%=guestVo.getDate()%></td>
			<td><a href="http://localhost:8088/gb2/gbc?action=dform&no=<%=guestVo.getNo()%>">삭제</a></td>
		</tr>
		<tr>
			<td colspan="4" style="white-space: pre-line;"><%=guestVo.getContent()%></td>
		</tr>
	</table><br>
	<%} %>
</body>
</html>