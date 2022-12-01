<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width", initial-scale="1">
<link rel = "stylesheet" href = "https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" />
<link rel="icon" type="image/x-icon" href="assets/favicon.ico" />
        <!-- Font Awesome icons (free version)-->
        <script src="https://use.fontawesome.com/releases/v6.1.0/js/all.js" crossorigin="anonymous"></script>
        <!-- Google fonts-->
        <link href="https://fonts.googleapis.com/css?family=Varela+Round" rel="stylesheet" />
        <link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet" />
        <!-- Core theme CSS (includes Bootstrap)-->
        <link href="./resources/css/styles.css" rel="stylesheet" />
        <link href="./resources/css/issue_styles.css" rel="stylesheet" /> 
<script type="text/javascript" src="./resources/js/validation.js"></script>
<script type-"text/javascript">
function checkjoin()
{
	/* alert("사용자 함수를 호출함"); */
	if (document.join.userID.value == "")
	{
		alert("아이디를 입력하여 주시기 바랍니다.");
		document.join.userID.focus();
		return false;
	}
	
	if ((document.join.userID.value.length < 4) || 
	    	(document.memberJoin.id.value.length >= 9))
		{
			alert("아아디는 4자에서 8자까지만 입력 해주세요");
			document.join.userID.focus();
			return false;
		}
	
	if (document.join.userPassword.value == "")
	{
		alert("비밀번호를 입력 해주세요.");
		document.join.userPassword.focus();
		return false;
	}
	if (document.join.userEmail.value == "")
	{
		alert("이메일을 입력 해주세요.");
		document.join.userEmail.focus();
		return false;
	}
	document.join.submit();
}
</script>
<style>
   
 /* html,
   body {
     height: 100%;
   }
    */
   /* body {
     display: flex;
     align-items: center;
     padding-top : 0px;
     padding-bottom: 40px;
     background-color: #f5f5f5;
   } */
   
   .form-signin {
     width: 100%;
     max-width: 330px;
     padding: 15px;
     margin: auto;
   } 
 
   .form-signin .form-floating:focus-within {
     z-index: 2;
   }
   
   .form-signin input[type="email"] {
     margin-bottom: -1px;
     border-bottom-right-radius: 0;
     border-bottom-left-radius: 0;
   }
   
   .form-signin input[type="password"] {
     margin-bottom: 10px;
     border-top-left-radius: 0;
     border-top-right-radius: 0;
   }

</style>
</head>
<body class="text-center">
<nav class="navbar navbar-expand-lg navbar-light fixed-top" id="mainNav">
            <div class="container px-4 px-lg-5">
                <a class="navbar-brand" href="home.jsp">Yearning</a>
                <button class="navbar-toggler navbar-toggler-right" type="button" data-bs-toggle="collapse" data-bs-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
                    Menu
                    <i class="fas fa-bars"></i>
                </button>
                <div class="collapse navbar-collapse" id="navbarResponsive">
                    <ul class="navbar-nav ms-auto">
                        <li class="nav-item"><a class="nav-link" href="offline.jsp">오프라인 탐방</a></li>
                        <li class="nav-item"><a class="nav-link" href="findItem.jsp">아이템 찾기</a></li>
                        <li class="nav-item"><a class="nav-link" href="issue.jsp ">트렌드</a></li>
                        <li class="nav-item"><a class="nav-link" href="login.jsp">Login</a></li>
                        
                    </ul>
                </div>
            </div>
        </nav>
   <main class="text-center">
   <header class="bg-dark py-5" style="background-image: url('https://ifh.cc/g/jSyw4S.jpg')">
            <div class="container px-4 px-lg-5 my-5">
                <div class="text-center text-white">
                    <h2 class="display-4 fw-bolder">Welcom to Yearning</h1>
                    <p class="lead fw-normal text-white-50 mb-0">please Sign up :)</p>
                </div>
            </div>
   </header>
   <section class="form-signin">
      <form name="join" action="joinAction.jsp" method="post">
         <img class="mb-4" src="./resources/images/favicon.ico" alt="" width="72" height="57">
         <h1 class="h3 mb-3 fw-normal">Yearning Sign Up</h1>
         <div><p></div>
         <div class="form-floating">
            <input type="text" class="form-control" name="userID" placeholder="아이디 입력...">
            <label for="id">아이디</label>
         </div>
         <div>
         <p>
         </div>
         <div class="form-floating">
            <input type="password" class="form-control" name="userPassword" placeholder="Password">
            <label for="pwd">비밀번호</label>
         </div>
         <div><p> </div>
         <div class="form-floating">
            <input type="text" class="form-control" name="userName" placeholder="name">
            <label for="name">이름</label>
         </div>
         <div><p> </div>
         <div class="form-floating" style="text-align-center;">
            <div class="btn-group" data-toggle="buttons">
            	<label class="btn btn=primary active">
            		<input type="radio" name="userGender" autocomplete="off" value="남자"checked>남자
            		<input type="radio" name="userGender" autocomplete="off" value="여자">여자
            	</label>
            </div>
          <div class="form-floating">
            <input type="email" class="form-control" name="userEmail" placeholder="email">
            <label for="name">이메일</label>
         </div>  
         </div>
         <div><p> </div>
         <button class="w-100 btn btn-lg btn-primary" type="submit" onclick="checkjoin()">회원가입</button>
         <p class="mt-5 mb-3 text-muted">&copy; bona</p>
      </form>
   </section>
   </main>
   <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
        <!-- Core theme JS-->
        <script src="./resources/js/scripts.js"></script>
        <!-- * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *-->
        <!-- * *                               SB Forms JS                               * *-->
        <!-- * * Activate your form at https://startbootstrap.com/solution/contact-forms * *-->
        <!-- * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *-->
        <script src="https://cdn.startbootstrap.com/sb-forms-latest.js"></script>
</body>
</html>