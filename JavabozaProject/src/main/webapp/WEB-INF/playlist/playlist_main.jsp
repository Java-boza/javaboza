<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>JAVABOZA</title>
<link rel="stylesheet" type="text/css"
	href="./css/bootstrap.min_4.5.0.css">
<script src="./js/jquery-3.5.1.min.js" type="text/javascript"></script>
<script src="./js/bootstrap.min_4.5.0.js" type="text/javascript"></script>
<style>
/* 추가적인 CSS 스타일링을 원하시면 여기에 작성하세요 */
.thumbnail-container {
	display: grid;
	grid-template-columns: repeat(2, 1fr); /* 가로로 2개의 열을 생성합니다. */
	grid-gap: 20px; /* 그리드 사이의 간격을 설정합니다. */
}

.thumbnail {
	width: 100%; /* 각 썸네일의 너비를 100%로 설정합니다. */
}

.thumbnail iframe {
	width: 100%; /* 동영상의 너비를 100%로 설정합니다. */
	height: 315px;
}

.button {
	background-color: black; /* 버튼의 배경색을 빨간색으로 설정합니다. */
	color: white; /* 버튼의 텍스트 색상을 흰색으로 설정합니다. */
	border: none; /* 버튼의 테두리를 없앱니다. */
	padding: 10px 20px; /* 버튼의 여백을 설정합니다. */
	border-radius: 5px; /* 버튼의 모서리를 둥글게 만듭니다. */
	position: absolute; /* 절대 위치로 설정합니다. */
	top: 180px; /* 위쪽 여백을 설정합니다. */
	left: 20px; /* 왼쪽 여백을 설정합니다. */
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
							<a class="nav-link" href="./VideoSelectAll.do">동영상</a>
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

	<main class="py-4">
		<div class="container">
			<section id="featured">
				<h2 class="mb-4">주요 동영상</h2>
				<div class="row">
					<button class="button" onclick="redirectToPlaylistSelect()">재생목록</button>
				</div>
				<div class="thumbnail-container">
					<div class="thumbnail">
						<iframe src="https://www.youtube.com/embed/r_J0orUTaIY"
							frameborder="0" allowfullscreen></iframe>
					</div>
					<div class="thumbnail">
						<iframe src="https://www.youtube.com/embed/88_Czg3o0tw"
							frameborder="0" allowfullscreen></iframe>
					</div>
					<div class="thumbnail">
						<iframe src="https://www.youtube.com/embed/IjRz5XOGtqQ"
							frameborder="0" allowfullscreen></iframe>
					</div>
					<div class="thumbnail">
						<iframe src="https://www.youtube.com/embed/vIZo_ndXc-A"
							frameborder="0" allowfullscreen></iframe>
					</div>
				</div>
			</section>

			<section id="popular" class="mt-5">
				<h2 class="mb-4">인기 동영상</h2>
				<div class="row">
					<!— 여기에 인기 동영상 목록을 표시하세요 —>
				</div>
			</section>
		</div>
	</main>
	<script>
        function redirectToPlaylistSelect() {
            // PlayListSelect.pl 경로로 이동
            window.location.href = "./PlayListSelect.pl";
        }
    </script>
</body>
</html>
