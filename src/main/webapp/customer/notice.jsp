<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h3>notice.jsp</h3>
<%
Class.forName("oracle.jdbc.driver.OracleDriver");
String url="jdbc:oracle:thin:@localhost:1521:xe";
String user="hr";
String pw="123456";
Connection con=DriverManager.getConnection(url, user, pw);
String sql="select seq,title,writer,content,regdate,hit " 
			+"from notices order by to_number(seq) desc";
// 실행
Statement stmt = con.createStatement();
ResultSet rs=stmt.executeQuery(sql);
%>
<table width="500" border="1">
	<tr>
		<th>번호</th>
		<th>제목</th>
		<th>작성자</th>
		<th>작성명</th>
		<th>작성일</th>
		<th>조회수</th>
	</tr>
	<%
	while(rs.next()){
	%>
	<tr>
		<td><%=rs.getString("seq") %></td>
		<td><a href="noticeDetail.jsp?c=<%=rs.getString("seq")%>"><%=rs.getString("title")%></a></td>
		<td><%=rs.getString("writer") %></td>
		<td><%=rs.getString("content") %></td>
		<td><%=rs.getString("regdate") %></td>
		<td><%=rs.getInt("hit") %></td>
	</tr>
	<%
	}
	%>
</table>
<a href="noticeReg.jsp">글쓰기</a>
</body>
</html>