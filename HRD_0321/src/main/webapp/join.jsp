<%@page import="java.sql.ResultSet"%>
<%@page import="DBPKG.util"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
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
	
	<script>
		function check(form) {
			if (form.custname.value == ""){
				alert("이름을 입력하세요.");
				form.custname.focus();
				return false;
			}
			if (form.address.value == ""){
				alert("주소를 입력하세요.");
				form.custname.focus();
				return false;
			}
			if (form.joindate.value == ""){
				alert("날짜를 입력하세요.");
				form.custname.focus();
				return false;
			}
			if (form.grade.value == ""){
				alert("등급을 입력하세요.");
				form.custname.focus();
				return false;
			}
			if (form.city.value == ""){
				alert("도시코드를 입력하세요.");
				form.custname.focus();
				return false;
			}
			
			alert("회원 등록이 완료되었습니다.")
			return true;
		}
	</script>
	<section style="position: fixed;
		top: 80px;
		width: 100%;
		height: 100%;
		background-color: lightgray">
		
		<form method="post" action="action.jsp" name="frm"
		style="display: flex;
		flex-direction: column;
		justify-content: center;
		align-items: center;
		text-align: center;"
		onsubmit="return check(this);">
		
		<input type="hidden" name="mode" value="insert">
	
	
	<h2>홈쇼핑 회원 등록</h2>
	<table border="1" class="table table-hover">

			<%
			Connection conn = null;
			Statement stmt = null;
			String custno = "";
			
			try{
				conn = util.getConnection();
				stmt = conn.createStatement();
				String sql = "SELECT max(custno)+1 custno FROM member_tbl_02 ";
				ResultSet rs = stmt.executeQuery(sql);
				rs.next();
				custno = rs.getString("custno");
				System.out.print(custno);
				
			}catch(Exception e){
				e.getStackTrace();
			}
		
			%>
			
	
			<tr>
				<th>회원번호(자동발생)</th>
				<td><input type="text" name="custno" value="<%= custno %>" readonly="readonly"></td>
			</tr>
			<tr>
				<th>회원성명</th>
				<td><input type="text" name="custname"><br></td>
			</tr>
			<tr>
				<th>회원전화</th>
				<td><input type="text" name="phone"><br></td>
			</tr>
			<tr>
				<th>회원주소</th>
				<td><input type="text" name="address"><br></td>
			</tr>
			<tr>
				<th>가입일자</th>
				<td><input type="date" name="joindate"><br></td>
			</tr>
			<tr>
				<th>고객등급</th>
				<td><input type="text" name="grade"><br></td>
			</tr>
			<tr>
				<th>도시코드</th>
				<td><input type="text" name="city"><br></td>
			</tr>
			<tr>
				<td colspan="2">
					<input type="submit" value="등록" class="btn btn-primary btn-sm">
					<input type="button" value="조회" onclick="locatrion='list.jsp'" class="btn btn-primary btn-sm">
				</td>
			</tr>
			
			
			
	</table>
	</form>
	</section>
	<jsp:include page="footer.jsp" />
</body>
</html>