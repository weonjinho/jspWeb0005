<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>  
<%
request.setCharacterEncoding("utf-8");
String seq=request.getParameter("c");
String sql="select seq,title,writer,content,regdate,hit from notices "
		    +"where seq="+seq;
/* dbcon */
Class.forName("oracle.jdbc.driver.OracleDriver");
String url="jdbc:oracle:thin:@localhost:1521:xe";
String user="hr";
String pw="123456";
Connection con=DriverManager.getConnection(url, user, pw);

Statement stmt = con.createStatement();
ResultSet rs=stmt.executeQuery(sql);
rs.next();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="../css/nstyle.css"/>
</head>
<body>
<h3>noticeDetail.jsp</h3>
<table class="twidth">
	<colgroup>
		<col width="15%">
		<col width="35%">
		<col width="15%">
		<col width="35%">
	</colgroup>
	<caption>Detail</caption>
	<tbody>
		<tr>
			<td class="left">글번호</td>
			<td><%=rs.getString("seq") %></td>
			<td class="left">조회수</td>
			<td><%=rs.getInt("hit") %></td>
		</tr>
		<tr>
			<td class="left">작성자</td>
			<td><%=rs.getString("writer") %></td>
			<td class="left">작성시간</td>
			<td><%=rs.getString("regdate") %></td>
		</tr>
		<tr>
			<td class="left">제목</td>
			<td colspan="3" id="title"><%=rs.getString("title") %></td>
		</tr>
		<tr>
			<td class="left">내용</td>
			<td colspan="3" id="content"><%=rs.getString("content") %></td>
		</tr>
		<tr>
			<td class="left">첨부</td>
			<td colspan="3">첨부</td>
		</tr>
	</tbody>
</table>
<a href="notice.jsp">목록</a>
<a href="noticeEdit.jsp?c=<%=rs.getString("seq") %>">수정</a>
<a href="noticeDelProc.jsp?c=<%=rs.getString("seq") %>">삭제</a> 
<!-- <a href="noticeDelProc.jsp?c=100">삭제</a> -->
</body>
</html>
<%
rs.close();
stmt.close();
con.close();
%>

