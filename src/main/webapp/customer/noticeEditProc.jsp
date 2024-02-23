<%@page import="java.sql.PreparedStatement"%>
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
<h3>noticeEditProc.jsp</h3>
<%
request.setCharacterEncoding("utf-8");
String seq=request.getParameter("c");
String title=request.getParameter("title");
String content=request.getParameter("content");
String sql="update notices set title=?,content=? "
			+"where seq="+seq;

Class.forName("oracle.jdbc.driver.OracleDriver");
String url="jdbc:oracle:thin:@localhost:1521:xe";
String user="hr";
String pw="123456";
Connection con=DriverManager.getConnection(url, user, pw);
PreparedStatement pstmt=con.prepareStatement(sql);
pstmt.setString(1, title);
pstmt.setString(2, content);
pstmt.executeUpdate();
response.sendRedirect("noticeDetail.jsp?c="+seq);
%>
<%=seq %>
<%=title %>
<%=content %>
<!--원 데이터를 여기까지 끌고 와야한다.  -->
</body>
</html>
