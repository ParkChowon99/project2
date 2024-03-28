<%@page import="DBPKG.util"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css" integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N" crossorigin="anonymous">
<head>
<meta charset="UTF-8">
<title>회원목록조회/수정</title>
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
	text-align: center;">
	
	
	<h2>회원목록조회/수정</h2>
	<table border="1">
			<tr>
				<td>회원번호</td>
				<td>회원성명</td>
				<td>전화번호</td>
				<td>주소</td>
				<td>가입일자</td>
				<td>고객등급</td>
				<td>거주지역</td>
			</tr>
			
			<%
			Connection conn = null;
			Statement stmt = null;
			String grade = "";
			
			try{
				conn = util.getConnection();
				stmt = conn.createStatement();
				String sql = "SELECT * FROM member_tbl_02 ORDER BY custno";
				ResultSet rs = stmt.executeQuery(sql);
				
				while(rs.next()){
					grade = rs.getString("grade");
					switch(grade){
					case "A":
						grade = "VIP";
						break;
					case "B":
						grade = "일반";
						break;
					case "C":
						grade = "직원";
						break;
					}
			%>
			
			<tr>
				<!--  <td><%= rs.getString("custno") %></td> -->
				<td><a href="modify.jsp?mod_custno=<%= rs.getString("custno") %>">
														<%= rs.getString("custno") %></a></td>
				<td><%= rs.getString("custname") %></td>
				<td><%= rs.getString("phone") %></td>
				<td><%= rs.getString("address") %></td>
				<td><%= rs.getDate("joindate") %></td>
				<td><%= grade %></td>
				<td><%= rs.getString("city") %></td>
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