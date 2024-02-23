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
<h3>noticeDelProc.jsp</h3>
<%
String seq=request.getParameter("c");
String sql="delete from notices where seq="+seq;
/* 해당글을 삭제하고, notice.jsp로 돌아가기 */
/* db접속 */
Class.forName("oracle.jdbc.driver.OracleDriver");
String url="jdbc:oracle:thin:@localhost:1521:xe";
String user="hr";
String pw="123456";
Connection con=DriverManager.getConnection(url, user, pw);
PreparedStatement pstmt=con.prepareStatement(sql);
// ResultSet rs=stmt.executeQuery(sql);
int delCnt=pstmt.executeUpdate();
/* delCnt : 삭제된 갯수. */
if(delCnt>0){
	response.sendRedirect("notice.jsp");	
}else{
	out.write("삭제오류");
}
%>
</body>
</html>