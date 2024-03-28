<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css" integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N" crossorigin="anonymous">
<head>
<meta charset="UTF-8">
<title>홈</title>
</head>
<body>
	<jsp:include page="header.jsp" />
	
	<section style="position: fixed;
		top: 80px;
		width: 100%;
		height: 100%;
		background-color: lightgray">
	
		<h2 style="text-align: center;">쇼핑몰 회원관리 프로그램</h2><br>
	
		<p style="padding-left: 40px">
			쇼핑몰 회원정보와 회원 매출 정보 데이터베이스를 구축하고 회원관리 프로그램을 작성하는 프로그램이다.<br>
			프로그램 작성 순서<br>
			1. 회원 정보 테이블을 생성한다.<br>
			2. 매출 정보 테이블을 생성한다.<br>
			3. 회원 정보, 매출 정보 테이블에서 제시된 문제의 참조데이터를 추가 생성한다.<br>
			4. 회원 정보 입력 화면 프로그램을 작성한다.<br>
			5. 회원 정보 조회 프로그램을 작성한다.<br>
			6. 회원 매출 정보 조회 프로그램을 작성한다.
	</p>
	</section>
	
	<jsp:include page="footer.jsp" />
</body>
</html>