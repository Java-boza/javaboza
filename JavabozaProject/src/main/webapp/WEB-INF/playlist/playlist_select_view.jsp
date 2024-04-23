<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>재생목록</title>
<link rel="stylesheet" type="text/css" href="./css/bootstrap.min_4.5.0.css">
<script src="./js/jquery-3.5.1.min.js" type="text/javascript"></script>
<script src="./js/bootstrap.min_4.5.0.js" type="text/javascript"></script>
<style>
table {
	border-collapse: collapse;
	width: 60%;
	margin: 20px auto;
	font-family: 'Nanum Gothic', sans-serif; /* 한글 폰트 설정 */
}

th, td {
	padding: 8px;
	text-align: left;
	border-bottom: 1px solid #ddd;
	font-size: 14px;
}

th {
	background-color: #f2f2f2;
	color: #333;
}

tr:first-child {
	background-color: #f2f2f2;
}

tr:nth-child(even) {
	background-color: #fff;
}

tr:nth-child(odd) {
	background-color: #fff;
}

tr:hover {
	background-color: #ddd;
}

/* 버튼 스타일 */
.button {
	display: inline-block;
	background-color: #85807F; /* 연한 회색으로 설정 */
	color: white;
	padding: 10px 20px;
	text-align: center;
	text-decoration: none;
	border-radius: 5px;
	cursor: pointer;
}

.button:hover {
	background-color: #383838;
}
/* 뒤로 가기 버튼 스타일 */
.back-button {
	position: absolute;
	top: 20px; /* 위에서 20px 만큼 떨어진 위치에 */
	left: 20px; /* 오른쪽에서 20px 만큼 떨어진 위치에 */
	background-color: #85807F;
	color: white;
	padding: 10px 20px;
	border: none;
	border-radius: 5px;
	cursor: pointer;
}

.back-button:hover {
	background-color: #383838;
}
/* 재생목록 만들기 버튼 스타일 */
.create-playlist-button {
	margin-top: 20px;
	text-align: center;
}

.create-playlist-button a {
	display: inline-block;
	background-color: #85807F; /* 연한 회색으로 설정 */
	color: white;
	padding: 10px 20px;
	text-decoration: none;
	border-radius: 5px;
	cursor: pointer;
	margin-left: 705px;
}

.create-playlist-button a:hover {
	background-color: #383838;
}
</style>
</head>
<body>
<header class="bg-dark text-white py-4">
	<div class="container">
		<h1>JAVABOZA</h1>
			<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
				<div class="collapse navbar-collapse" id="navbarNav">
					<ul class="navbar-nav ml-auto">
						<li class="nav-main">
							<a class="nav-link" href="./MainView.in">홈</a>
						</li>
						<li class="nav-playlist">
							<a class="nav-link" href="./VideoMain.do">동영상</a>
						</li>
						<li class="nav-comment">
							<a class="nav-link" href="./CommentStart.co">댓글</a>
						</li>
						<li class="nav-playlist">
							<a class="nav-link active" href="./PlayListMain.pl">플레이리스트</a>
						</li>
						<li class="nav-membership">
							<a class="nav-link" href="./PaymentMain.py">멤버십</a>
						</li>
						<li class="nav-inquiry">
							<a class="nav-link" href="./InquiryList.in">문의</a>
						</li>
						<li class="nav-login">
						<c:if test="${empty user_id}">
							<a class="nav-link" href="./MemberMain.me">로그인</a>
						</c:if>
						<c:if test="${not empty user_id}">
							<a class="nav-link" href="./LoginHome.me"> 로그인 중: ${user_id} </a>
						</c:if>
					</li>
				</ul>
			</div>
		</nav>
	</div>
</header>
	<table>
		<thead>
			<tr>
				<th>재생목록 번호</th>
				<th>사용자 ID</th>
				<th>재생목록 제목</th>
				<th>재생목록 설명</th>

			</tr>
		</thead>
		<tbody>
			<c:forEach var="playlist" items="${arrayList}">
				<tr>
					<td>${playlist.PLAYLIST_NUM}</td>
					<td>${playlist.USER_ID}</td>
					<td>${playlist.PLAYLIST_TITLE}</td>
					<td>${playlist.PLAYLIST_DESCRIPTION}</td>
					<td><a
						href="PlayListSelectDetail.pl?PLAYLIST_NUM=${playlist.PLAYLIST_NUM}"
						class="button">상세조회</a></td>
				</tr>
			</c:forEach>
			<%--객체값이 null일 경우에 반환한다.--%>
			<c:if test="${empty arrayList}">
				<tr>
					<td colspan="4">등록된 재생목록이 없습니다.</td>
				</tr>
			</c:if>

		</tbody>
	</table>
	<div class="create-playlist-button">
		<a href="./PlayListInsertView.pl">재생목록 만들기</a>
	</div>
	<script>
		// 뒤로 가기 버튼 클릭 시 index.jsp로 이동
		function goBack() {
			window.location.href = "index.jsp";
		}
	</script>
<button class="button back-button" onclick="goBack()">뒤로 가기</button>


</body>
</html>
