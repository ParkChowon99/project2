<%@page import="java.sql.ResultSet"%>
<%@page import="DBPKG.util"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css" integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N" crossorigin="anonymous">
<head>
<meta charset="UTF-8">
<title>회원등록</title>
</head>
<body>
	<jsp:include page="header.jsp" />
	<section style="position: fixed;
		top: 80px;
		width: 100%;
		height: 100%;
		background-color: lightgray">
		
	<form style="display: flex;
	flex-direction: column;
	justify-content: center;
	align-items: center;
	text-align: center;"
	method="post" action="action.jsp" name="frm">
	
	
	<h2>홈쇼핑 회원 정보 수정</h2>
	<table border="1">
	

		<%
		String mod_custno = request.getParameter("mod_custno");
		
		Connection conn = null;
		Statement stmt = null;
		String custno = "";
			
		try{
			conn = util.getConnection();
			stmt = conn.createStatement();
			String sql = "SELECT * FROM member_tbl_02 WHERE custno = " + mod_custno;
			ResultSet rs = stmt.executeQuery(sql);
			
			if(rs.next()){
				
			%>
			
			
	
			<tr>
				<th>회원번호(자동발생)</th>
				<td><input type="text" name="custno" value="<%= mod_custno %>" readonly="readonly"></td>
			</tr>
			<tr>
				<th>회원성명</th>
				<td><input type="text" name="custname" value="<%= rs.getString(2) %>"><br></td>
			</tr>
			<tr>
				<th>회원전화</th>
				<td><input type="text" name="phone" value="<%= rs.getString(3) %>"><br></td>
			</tr>
			<tr>
				<th>회원주소</th>
				<td><input type="text" name="address" value="<%= rs.getString(4) %>"><br></td>
			</tr>
			<tr>
				<th>가입일자</th>
				<td><input type="date" name="joindate" value="<%= rs.getDate(5) %>"><br></td>
			</tr>
			<tr>
				<th>고객등급</th>
				<td><input type="text" name="grade" value="<%= rs.getString(6) %>"><br></td>
			</tr>
			<tr>
			<th>거주지역</th>
				<td>
					<input type="text" name="city" value="<%= rs.getString(7) %>"><br>
				</td>
			</tr>
			<tr>
				<td colspan="2">
					<button type="submit" name="mode" value="modify">수정</button>
					<button type="button" onclick="location= 'list.jsp'">조회</button>
					<button type="submit" name="mode" value="delete">삭제</button>
				</td>
			</tr>
			
			<%
			}
			}catch(Exception e){
				e.getStackTrace();
			}
			%>
			
			
	</table>
	</form>
	</section>
	<jsp:include page="footer.jsp" />
</body>
</html>