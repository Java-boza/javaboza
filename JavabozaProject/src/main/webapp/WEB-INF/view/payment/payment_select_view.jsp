<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>



<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>멤버십 가입</title>
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
							<a class="nav-link" href="./VideoSelectAll.do">동영상</a>
						</li>
						<li class="nav-comment">
							<a class="nav-link" href="./CommentStart.co">댓글</a>
						</li>
						<li class="nav-playlist">
							<a class="nav-link" href="./PlayListMain.pl">플레이리스트</a>
						</li>
						<li class="nav-membership">
							<a class="nav-link active" href="./PaymentMain.py">멤버십</a>
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
 <section id="department">
  <div class="container">
   <div class="row">
    <div class="col-md-12">
     <div class="card">
      <div class="card-header">
       <h5>멤버십</h5>
      </div>
      <div class="card-body">
       <table class="table table-hover">
        
        <tbody>
       <c:choose>
         <%-- 세션에 아이디 저장되어있는지 확인--%>
          <c:when test="${empty sessionScope.user_id}">
            <c:redirect url="./LoginView.me" />
          </c:when>
         <%-- c:when 조건이 참인 경우에만 내부 코드 실행--%>
          <c:when test="${empty paymentDTO}">
              <p>멤버십에 가입하지 않았습니다.</p>
              <a href="./PaymentInsertView.py?user_id=${user_id}" class="btn btn-success btn-block">멤버십 가입하기</a>    
         </c:when>
      
         <%-- c:otherwise 조건이 거짓인 경우에만 내부 코드 실행--%>
          <c:otherwise>
              <h3>${paymentDTO.user_id}님</h3>
              <h3>${paymentDTO.membership_grade}</h3><br>
                <a href="./PaymentSelectDetail.py?user_id=${paymentDTO.user_id}" class="btn btn-success btn-block">멤버십 상세보기</a>
          </c:otherwise>
      </c:choose>
        </tbody>
       </table>
       <div>
       </div>
      </div>
     </div>
    </div>
   </div>
  </div>
 </section>
 
</body>
</html>