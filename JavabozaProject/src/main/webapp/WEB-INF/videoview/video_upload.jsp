<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>동영상 업로드</title>
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
                <h1>동영상 업로드</h1>
            </div>
        </div>
    </div>
</header>
<section class="py-4 mb-4 bg-light"></section>
<section id="video-upload">
    <div class="container">
        <div class="row">
            <div class="col-md-12">
                <div class="card">
                    <div class="card-header">
                        <h5>UPLOAD</h5>
                    </div>
                    <div class="card-body">
                        <form action="./VideoUpload.do" method="post" enctype="multipart/form-data" id="video-upload-form">
                            <fieldset>
                                <div class="form-group row">
                                    <label for="videoTitle" class="ml-sm-3 col-form-label">제목</label>
                                    <div class="ml-sm-3">
                                        <input type="text" name="videoTitle" id="videoTitle" class="form-control form-control-sm">
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <label for="videoDescription" class="ml-sm-3 col-form-label">설명</label>
                                    <div class="ml-sm-3">
                                        <textarea name="videoDescription" id="videoDescription" class="form-control form-control-sm" rows="3"></textarea>
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <label for="videoFile" class="ml-sm-3 col-form-label">video file</label>
                                    <div class="ml-sm-3">
                                        <input type="file" name="videoFile" id="videoFile" class="form-control-file">
                                    </div>
                                </div>
                                <div class="form-group">
                                    <button type="submit" class="btn btn-secondary">Upload</button>
                                    <button type="reset" class="btn btn-secondary">취소</button>
                                </div>
                            </fieldset>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
<!-- content_main.jsp로 이동하는 버튼 -->
<div class="container mt-3">
    <div class="row">
        <div class="col-md-12">
            <a href="./VideoSelectAll.do" class="btn btn-primary">HOME</a>
        </div>
    </div>
</div>
</body>
</html>
