<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>회원 정보 수정</title>

<style>
body {
   font-family: Arial, sans-serif;
   background-color: #f4f4f4;
   margin: 0;
   padding: 0;
   text-align: center;
}

.container {
   max-width: 800px;
   margin: 50px auto;
   padding: 20px;
   background-color: white;
   border-radius: 10px;
   box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
}

h1 {
   color: #333;
}

.links {
   margin-top: 30px;
}

.links a {
   display: inline-block;
   margin: 10px;
   padding: 10px 20px;
   background-color: green;
   color: white;
   text-decoration: none;
   border-radius: 5px;
   transition: background-color 0.3s ease;
}

.links a:hover {
   background-color: #0056b3;
}

}
a:hover {
   text-decoration: underline;
}

a:active {
   text-decoration: underline;
}
</style>

<script type="text/javascript">
   function memberDelete() {
      if (confirm("${memberDTO.user_name}님 회원을 탈퇴 하시겠습니까?")) {
         location.href = "./MemberDelete.me?user_id=${user_id}"
      }
   }

</script>

</head>
<body>


   <section id="member">
      <div class="container">
         <div class="row">
            <div class="col-md-12">
               <div class="card">
                  <div class="card-header">
                     <h3 class="text-muted">
                        <i class="fas fa-user-tag mr-sm-1"></i>회원 정보 수정
                     </h3>
                  </div>
                  <div class="card-body">
                     <form action="./MemberUpdateView.me" method="get"
                        id="signupForm" enctype="application/x-www-form-urlencoded">
                  
                                                      
                              <div class="form-group row">
                                    <label for="user_id" class="col-4 col-form-label pr-0"><i
                                       class="fas fa-user-check mr-sm-1"></i>아이디</label>
                                    <div class="col-8 pl-0">
                                       <input type="text" name="user_id" id="user_id"
                                          class="form-control bg-white" value="${memberDTO.user_id}"
                                          readonly>
                                    </div>
                                 </div>

                                 <div class="form-group row">
                                    <label for="user_name" class="col-4 col-form-label pr-0"><i
                                       class="fas fa-user-plus mr-sm-1"></i>이름</label>
                                    <div class="col-8 pl-0">
                                       <input type="text" name="user_name" id="user_name"
                                          class="form-control" value="${memberDTO.user_name}">
                                    </div>
                                 </div>

                                 <div class="form-group row">
                                    <label for="user_pw" class="col-4 col-form-label pr-0"><i
                                       class="fas fa-unlock-alt mr-sm-1"></i>비밀번호</label>
                                    <div class="col-8 pl-0">
                                       <input type="password" name="user_pw" id="user_pw"
                                          class="form-control">
                                    </div>
                                 </div>

                                 <div class="form-group row">
                                    <label for="pwdre" class="col-4 col-form-label pr-0"><i
                                       class="fas fa-lock mr-sm-1"></i>비번확인</label>
                                    <div class="col-8 pl-0">
                                       <input type="password" name="pwdre" id="pwdre"
                                          class="form-control">
                                    </div>
                                 </div>

                                 <div class="form-group row">
                                    <label for="user_email" class="col-4 col-form-label pr-0"><i
                                       class="fas fa-envelope-open mr-sm-1"></i>이메일</label>
                                    <div class="col-8 pl-0">
                                       <input type="email" name="user_email" id="user_email"
                                          class="form-control" value="${memberDTO.user_email}">
                                    </div>
                                 </div>

                                 <div class="form-group row">
                                    <label for="user_age" class="col-4 col-form-label pr-0"><i
                                       class="fas fa-user-clock mr-sm-1"></i>나이</label>
                                    <div class="col-8 pl-0">
                                       <input type="text" name="user_age" id="user_age"
                                          class="form-control" value="${memberDTO.user_age}">
                                    </div>
                                 </div>
                                 
                                 <div class="form-group row">
                                    <label for="user_phone_num" class="col-4 col-form-label pr-0"><i
                                       class="fas fa-user-clock mr-sm-1"></i>전화번호</label>
                                    <div class="col-8 pl-0">
                                       <input type="tel" name="user_phone_num" id="user_phone_num"
                                          class="form-control" value="${memberDTO.user_phone_num}">
                                    </div>
                                 </div>
                              
                              <div class="form-group row">
                                 <label for="user_bdate" class="col-4 col-form-label pr-0"><i
                                    class="fas fa-birthday-cake mr-sm-2"></i>생일</label>
                                 <div class="col-8 pl-0">
                                    <input type="date" name="user_bdate" id="user_bdate"
                                       class="form-control" value="${memberDTO.user_bdate}">
                                 </div>
                              </div>

                           <div>
                              <button type="submit" class="btn btn-outline-primary mr-sm-1"
                              >
                                 <i class="fas fa-save mr-sm-1"></i>정보 수정
                              </button>
                              <button type="reset" id="clear"
                                 class="btn btn-outline-warning mr-sm-1">
                                 <i class="fas fa-share-square mr-sm-1"></i>수정 취소
                              </button>
                              <button type="button" class="btn btn-outline-danger mr-sm-1"
                                 onclick="memberDelete()">
                                 <i class="fas fa-user-times mr-sm-1"></i>회원 탈퇴
                              </button>
                           </div>
                     </form>
                  </div>

               </div>
            </div>
         </div>
      </div>
   </section>

</body>
</html>