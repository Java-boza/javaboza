<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>동영상 정보 삭제</title>
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
                <h1>동영상 정보 삭제</h1>
            </div>
        </div>
    </div>
</header>
<section class="py-4 mb-4 bg-light">
</section>
<section id="videos">
    <div class="container">
        <div class="row">
            <div class="col-md-12">
                <div class="card">
                    <div class="card-header">
                        <h5>삭제된 동영상 정보</h5>
                    </div>
                    <div class="card-body">
                        <table class="table table-hover">
                            <thead class="thead-light">
                                <tr class="text-center">
                                    <th>Video Title</th>
                                    <th>Video Description</th>
                                    <th>Upload Date</th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr class="text-center">
                                    <td>${videoDTO.VIDEO_NUM}</td>
                                    <td>${videoDTO.VIDEO_TITLE}</td>
                                    <td>${videoDTO.VIDEO_DESCRIPTION}</td>
                                    <td>${videoDTO.VIDEO_DATE}</td>
                                </tr>
                            </tbody>
                        </table>
                        <div>
                            <a href="./VideoSelectAll.do" class="btn btn-primary btn-block">HOME</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
</body>
</html>
