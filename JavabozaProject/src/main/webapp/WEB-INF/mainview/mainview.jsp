<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>JAVABOZA</title>
    <link rel="stylesheet" type="text/css" href="./css/bootstrap.min_4.5.0.css">
    <script src="./js/jquery-3.5.1.min.js" type="text/javascript"></script>
    <script src="./js/bootstrap.min_4.5.0.js" type="text/javascript"></script>
    <style>
        /* 추가적인 CSS 스타일링을 원하시면 여기에 작성하세요 */
         footer {
            position: fixed;
            left: 0;
            bottom: 0;
            width: 100%;
            background-color: #343a40; /* 푸터 배경색 */
            color: white; /* 푸터 텍스트 색상 */
            text-align: center; /* 푸터 텍스트 가운데 정렬 */
            padding: 10px; /* 푸터 패딩 */
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
							<a class="nav-link active" href="./MainView.in">홈</a>
						</li>
						<li class="nav-playlist">
							<a class="nav-link" href="./VideoSelectAll.do">동영상</a>
						</li>
						<li class="nav-comment">
							<a class="nav-link" href="./CommentStart.co">댓글</a>
						</li>
						<li class="nav-playlist">
							<a class="nav-link" href="./PlayListMain.pl">플레이리스트</a>
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
                    <!-- 여기에 주요 동영상 목록을 표시하세요 -->
                </div>
            </section>
            
            <section id="popular" class="mt-5">
                <h2 class="mb-4">인기 동영상</h2>
                <div class="row">
                    <!-- 여기에 인기 동영상 목록을 표시하세요 -->
                </div>
            </section>
        </div>
    </main>
    
    <footer class="bg-dark text-white py-4">
        <div class="container text-center">
            <p>&copy; 2024 동영상 스트리밍 사이트. TEAM JAVABOZA.</p>
        </div>
    </footer>
</body>
</html>
