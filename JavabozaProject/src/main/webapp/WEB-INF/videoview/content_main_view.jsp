<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Videos</title>
<link rel="stylesheet" type="text/css" href="./css/bootstrap.min_4.5.0.css">
<link rel="stylesheet" type="text/css" href="./css/global.css">
<script src="./js/jquery-3.5.1.min.js" type="text/javascript"></script>
<script src="./js/bootstrap.min_4.5.0.js" type="text/javascript"></script>
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
							<a class="nav-link active" href="./VideoSelectAll.do">동영상</a>
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
    
	<section class="py-4 mb-4 bg-light"></section>
	<section id="videos">
		<div class="container">
			<div class="row">
				<div class="col-md-12">
					<div class="card">
						<div class="card-header">
							<h5>Videos</h5>
						</div>
						<div class="card-body">
							<table class="table table-hover">
								<thead class="thead-light">
									<tr class="text-center">
										<th>Video Title</th>
										<th>Video Description</th>
										<th>Posted Date</th>
										<th></th>
									</tr>
								</thead>
								<tbody>
									<c:forEach var="video" items="${list}">
										<tr class="text-center">
											<td>${video.VIDEO_TITLE}</td>
											<td>${video.VIDEO_DESCRIPTION}</td>
											<td>${video.VIDEO_DATE}</td>
											<td>
												<a href="./VideoSelect.do?VIDEO_NUM=${video.VIDEO_NUM}" class="btn btn-outline-info">Show</a>
												<!-- content.jsp 로 이동 -->
												<a href="./VideoUpdate.do?VIDEO_NUM=${video.VIDEO_NUM}" class="btn btn-outline-warning">Edit</a>
												<!-- video_update_view.jsp 로 이동 -->
												<a href="./VideoDelete.do?VIDEO_NUM=${video.VIDEO_NUM}" class="btn btn-outline-danger">Delete</a>
												<!-- video_delete_view.jsp 로 이동 -->
											</td>
										</tr>
									</c:forEach>
									<c:if test="${empty list}">
										<tr>
											<td colspan="4">No videos available</td>
										</tr>
									</c:if>
								</tbody>
							</table>
							<div>
								<a href="./VideoUpload.do" class="btn btn-success btn-block">Upload Video</a>
								<a href="./VideoSelectAll.do" class="btn btn-primary btn-block">Home</a>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
</body>
</html>
