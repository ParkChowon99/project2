<%@page import="java.sql.ResultSet"%>
<%@page import="DBPKG.util"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원매출조회</title>
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
	
	
	<h2>회원매출조회</h2>
	<table border="1">
			<tr>
				<td>회원번호</td>
				<td>회원성명</td>
				<td>고객등급</td>
				<td>매출</td>
			</tr>
			
			<%
			Connection conn = null;
			Statement stmt = null;
			String grade = "";
			
			try{
				conn = util.getConnection();
				stmt = conn.createStatement();
				String sql = "SELECT mem.custno, mem.custname, mem.grade, sum(mon.price) as price "
						+ "FROM member_tbl_02 mem, money_tbl_02 mon "
						+ "WHERE mem.custno = mon.custno "
						+ "GROUP BY mem.custno, mem.custname, mem.grade "
						+ "ORDER BY sum(mon.price) DESC";
				
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
				<td><%= rs.getString("custno") %></td>
				<td><%= rs.getString("custname") %></td>
				<td><%= grade %></td>
				<td><%= rs.getString("price") %></td>
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