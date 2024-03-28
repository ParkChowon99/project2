<%@page import="DBPKG.util"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css" integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N" crossorigin="anonymous">
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
	Connection conn = null;
	Statement stmt = null;
	
	System.out.println("action.jsp");
	
	String custno = request.getParameter("custno");
	String custname = request.getParameter("custname");
	String phone = request.getParameter("phone");
	String address = request.getParameter("address");
	String joindate = request.getParameter("joindate");
	String grade = request.getParameter("grade");
	String city = request.getParameter("city");
	
	String mode = request.getParameter("mode");
	
	try{
		conn = util.getConnection();
		String sql = "";
		PreparedStatement pstmt;
		
		switch(mode){
		case "insert" :
			sql = "INSERT INTO member_tbl_02 VALUES (?, ?, ?, ?, TO_DATE(?, 'yyyy-mm-dd'), ?, ?)";
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, custno);
			pstmt.setString(2, custname);
			pstmt.setString(3, phone);
			pstmt.setString(4, address);
			pstmt.setString(5, joindate);
			pstmt.setString(6, grade);
			pstmt.setString(7, city);
			pstmt.executeUpdate();
			pstmt.close();
			response.sendRedirect("list.jsp");
			break;
			
		case "modify" :
			sql = "UPDATE member_tbl_02 SET "
				+ "custname=?, "
				+ "phone=?, "
				+ "address=?, "
				+ "joindate=TO_DATE(?,'yyyy-mm-dd'), "
				+ "grade=?, "
				+ "city=? "
				+ "WHERE custno=?";
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, custname);
			pstmt.setString(2, phone);
			pstmt.setString(3, address);
			pstmt.setString(4, joindate);
			pstmt.setString(5, grade);
			pstmt.setString(6, city);
			pstmt.setString(7, custno);
			pstmt.executeUpdate();
			pstmt.close();
			response.sendRedirect("list.jsp");
			break;
			
		case "delete" :
			sql = "DELETE FROM member_tbl_02 WHERE custno = ?";
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, custno);
			pstmt.executeUpdate();
			pstmt.close();
			response.sendRedirect("list.jsp");
			break;
		}
		
		}catch(Exception e){
			e.getStackTrace();
	}
	%>
</body>
</html>