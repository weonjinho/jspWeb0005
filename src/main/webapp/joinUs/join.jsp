<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="../css/join.css">
</head>
<body>
<h3>join.jsp</h3>
<form action="joinProc.jsp" id="join">
<label for="id">아이디</label>
<input type="text" name="id"/>
<input type="button" value="중복확인">
<br/>
<label for="pwd">비밀번호</label>
<input type="text" name="pwd"/>
<br/>
<label for="pwd2">비밀번호확인</label>
<input type="text" name="pwd2"/>
<br/>
<label for="name">이름</label>
<input type="text" name="name"/>
<br/>
<label for="gender">성별</label>
<select name="gender">
	<option value="남성">남성</option>
	<option value="여성">여성</option>
</select>
<br/>
<label for="year">생년월일</label>
<input type="text" name="year" size="5">년
<input type="text" name="month" size="5">월
<input type="text" name="day" size="5">일

<input type="radio" name="IsLunar" value="Solar" checked>양력
<input type="radio" name="IsLunar" value="IsLunar" checked>음력<br/>

<label for="cphone">핸드폰번호</label>
<input type="tel" name="cphone"/>예)010-1111-222<br/>


<label for="email">이메일</label>
<input type="tel" name="email"/><br/>


<label for="habit">취미</label><br/>
<input type="checkbox" name="habit" value="music"/>음악
<input type="checkbox" name="habit" value="movie"/>영화
<input type="checkbox" name="habit" value="trip"/>여행<br/>

<input type="submit" value="확인">







</form>


</body>
</html>