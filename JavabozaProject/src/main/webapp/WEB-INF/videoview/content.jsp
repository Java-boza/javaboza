<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>show video</title>
<link rel="stylesheet" type="text/css" href="./css/bootstrap.min_4.5.0.css">
<link rel="stylesheet" type="text/css" href="./css/global.css">
<script src="./js/jquery-3.5.1.min.js" type="text/javascript"></script>
<script src="./js/bootstrap.min_4.5.0.js" type="text/javascript"></script>
</head>
<body>
	<header id="main-header" class="py-2 btn-dark text-white">
		<div class="container">
			<div class="row">
				<div class="col-md-6">
					<h1>show video</h1>
				</div>
			</div>
		</div>
	</header>
	<section class="py-4 mb-4 bg-light"></section>
	<section id="department">
		<div class="container">
			<div class="row">
				<div class="col-md-12">
					<div class="card">
						<div class="card-header">
							<h5>show video</h5>
						</div>
						<div class="card-body">
							<table class="table table-hover">
								<thead class="thead-light">
									<tr class="text-center">
										<th>video title</th>
										<th>video description</th>
										<th>좋아요</th>
										<!-- 좋아요 버튼 추가 -->
										<th>동영상 수정</th>
										<!-- 동영상 수정 버튼 추가 -->
									</tr>
								</thead>
								<tbody>
									<tr class="text-center">
										<td>${videoDTO.VIDEO_TITLE}</td>
										<td>${videoDTO.VIDEO_DESCRIPTION}</td>
										<td>
											<!-- 좋아요 버튼 -->
											<button type="button" class="btn btn-primary">좋아요</button>
										</td>
										<td>
											<!-- 동영상 수정 버튼 -->
											<a href="./VideoUpdate.do?videoId=${videoDTO.VIDEO_NUM}" class="btn btn-warning">Edit</a>
										</td>
									</tr>
								</tbody>
							</table>
							<div class="row">
								<div class="col-md-4">
									<a href="./VideoSelectAll.do" class="btn btn-primary btn-block">HOME</a>
								</div>
								<div class="col-md-4">
									<a href="./VideoUpdate.do?deptno=${videoDTO.VIDEO_NUM}" class="btn btn-warning btn-block"> * </a>
								</div>
								<div class="col-md-4">
									<a href="./VideoDeleteView.do?deptno=${videoDTO.VIDEO_NUM}" class="btn btn-danger btn-block"> - </a>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!-- content_main.jsp로 돌아가는 버튼 추가 -->
	<div class="container mt-4">
		<div class="row justify-content-center">
			<div class="col-md-4">
				<a href="./content_main.jsp" class="btn btn-secondary btn-block">HOME</a>
			</div>
		</div>
	</div>
</body>
</html>
