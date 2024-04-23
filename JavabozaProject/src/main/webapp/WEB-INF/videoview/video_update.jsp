<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>부서 정보 수정</title>
<link rel="stylesheet" type="text/css" href="./css/bootstrap.min_4.5.0.css">
<link rel="stylesheet" type="text/css" href="./css/global.css">
<script src="./js/jquery-3.5.1.min.js" type="text/javascript"></script>
<script src="./js/bootstrap.min_4.5.0.js" type="text/javascript"></script>
<script src="./js/jquery.validate.min.js" type="text/javascript"></script>
<script src="./js/dept_validity.js" type="text/javascript"></script>
</head>
<body>
	<header id="main-header" class="py-2 btn-dark text-white">
		<div class="container">
			<div class="row">
				<div class="col-md-6">
					<h1>부서 정보 수정</h1>
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
							<h5>video update</h5>
						</div>
						<div class="card-body">
							<form action="./VideoUpdateView.do" method="post" id="sign_dept">
								<fieldset>
									<div class="form-group row">
										<label for="deptno" class="ml-sm-3 col-form-label"> video number </label>
										<div class="ml-sm-3">
											<!--컨트롤의 내용은 변경되지 않지만, 데이터는 전송된다.-->
											<input type="text" name="VIDEO_NUM" id="VIDEO_NUM" class="form-control form-control-sm bg-white" value="${param.VIDEO_NUM}" readonly>
										</div>
									</div>
									<div class="form-group row">
										<label for="dname" class="ml-sm-3 col-form-label"> video title </label>
										<div class="ml-sm-3">
											<input type="text" name="VIDEO_TITLE" id="VIDEO_TITLE" class="form-control form-control-sm" value="${videoDTO.VIDEO_TITLE}">
										</div>
									</div>
									<div class="form-group row">
										<label for="loc" class="ml-sm-3 col-form-label"> video description </label>
										<div class="ml-sm-3">
											<input type="text" name="VIDEO_DECRIPTION" id="VIDEO_DECRIPTION" class="form-control form-control-sm" value="${videoDTO.VIDEO_DESCRIPTION}">
										</div>
									</div>
									<div class="form-group">
										<button type="submit" class="btn btn-secondary">등록</button>
										<button type="reset" class="btn btn-secondary">취소</button>
									</div>
								</fieldset>
							</form>
							<div class="row">
								<div class="col-md-4">
									<a href="./VideoSelect.do" class="btn btn-primary btn-block"> videos </a>
								</div>
								<div class="col-md-4">
									<a href="./VideoSelectAll.do" class="btn btn-success btn-block"> HOME </a>
								</div>
								<div class="col-md-4">
									<a href="./VideoDeleteView.do?deptno=${param.VIDEO_NUM}" class="btn btn-danger btn-block"> video 삭제 </a>
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
