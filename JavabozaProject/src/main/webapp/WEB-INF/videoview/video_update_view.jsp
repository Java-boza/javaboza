<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>동영상 수정 완료</title>
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
					<h1>동영상 수정 완료</h1>
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
							<h5>동영상 수정 완료</h5>
						</div>
						<div class="card-body">
							<div class="alert alert-success" role="alert">수정되었습니다.</div>
							<div class="row">
								<div class="col-md-4">
									<a href="./VideoSelectAll.do" class="btn btn-success btn-block"> HOME </a>
								</div>
								<div class="col-md-4">
									<a href="./VideoUpload.do" class="btn btn-success btn-block"> UPLOAD </a>
								</div>
								<div class="col-md-4">
									<a href="./VideoDelete.do?deptno=${param.VIDEO_NUM}" class="btn btn-danger btn-block"> DELETE </a>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
</body>
</html>
