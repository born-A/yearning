<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html lang="en">
    <head>
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>Clean Blog - Start Bootstrap Theme</title>
        <link rel="icon" type="image/x-icon" href="assets/favicon.ico" />
        <!-- Font Awesome icons (free version)-->
        <script src="https://use.fontawesome.com/releases/v6.1.0/js/all.js" crossorigin="anonymous"></script>
        <!-- Google fonts-->
        <!-- <link href="https://fonts.googleapis.com/css?family=Lora:400,700,400italic,700italic" rel="stylesheet" type="text/css" />
        <link href="https://fonts.googleapis.com/css?family=Open+Sans:300italic,400italic,600italic,700italic,800italic,400,300,600,700,800" rel="stylesheet" type="text/css" /> -->
        <!-- Core theme CSS (includes Bootstrap)-->
      <link href="./resources/css/styles.css" rel="stylesheet" /> 
        <link href="./resources/css/issue_styles.css" rel="stylesheet" /> 
    </head>
    <body>
        <%
    		String userID = null;
    		if(session.getAttribute("userID") != null){
    			userID = (String) session.getAttribute("userID");
    		}
    		int pageNumber = 1;
    		if(request.getParameter("pageNumber") != null){
    			pageNumber = Integer.parseInt(request.getParameter("pageNumber"));
    		}
    		int boardID = 0;
			if (request.getParameter("boardID") != null){
				boardID = Integer.parseInt(request.getParameter("boardID"));
			}
    	%>
    	<%
        	if(userID == null){
        %>
       
         <!-- Navigation-->
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
                        <li class="nav-item"><a class="nav-link" href="jjimPost.jsp">스크랩</a></li>
                        <li class="nav-item"><a class="nav-link" href="login.jsp">Login</a></li>
                    </ul>
                </div>
            </div>
        </nav>
    	<% 
        	} else {
        %>
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
                        <li class="nav-item"><a class="nav-link" href="jjimPost.jsp">스크랩</a></li>
                        <li class="nav-item"><a class="nav-link" href="logout.jsp">Logout</a></li>
                       
                    </ul>
                </div>
            </div>
        </nav>
        <% 
        	}
        %>
         <!-- Header-->
        <header class="bg-dark py-5" style="background-image: url('https://ifh.cc/g/CDpNAD.jpg')">
            <div class="container px-4 px-lg-5 my-5">
                <div class="text-center text-white">
                    <h1 class="display-4 fw-bolder">Trends</h1>
                    <p class="lead fw-normal text-white-50 mb-0"><strong>최근 유행하는 트렌드를 소개합니다.</strong></p>
                </div>
            </div>
        </header>
       <!--  <!-- Page Header-->
       <!--  <header class="masthead" style="background-image: url('https://ifh.cc/g/CDpNAD.jpg')">
            <div class="container position-relative px-4 px-lg-5">
                <div class="row gx-4 gx-lg-5 justify-content-center">
                    <div class="col-md-10 col-lg-8 col-xl-7">
                        <div class="site-heading">
                            <h1>Trends</h1>
                            <span class="subheading">최근 유행하는 트렌드를 소개합니다.</span>
                        </div>
                    </div>
                </div>
            </div>
        </header>> -->
<body>
	<div><p></div>
	<div class="container">
		<div class="row">
			<form method="post" enctype="multipart/form-data" action="issueWriteAction.jsp">
				<table class="table table-striped" style="text-align:center; border:1px solid #dddddd">
				<thead>
					<tr>
						<th style="background-color:#eeeeee; text-align:center;">Trend 글쓰기</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td><input type="text" calss="form-control" placeholder="글 제목" name="issueTitle" maxlength="50"></td>
					</tr>
					<tr>
						<td><textarea  class="form-control" placeholder="글 내용" name="issueContent" maxlength="2048" style="height:350px;"></textarea></td>
						
					</tr>
					<tr>
				<td><input type="file" name="fileName"></td>
			</tr>
				</tbody>
					
				</table>
				<input type="submit" class="btn btn-primary pull-right" value="글쓰기">
			</form>
			
		</div>
	</div>
		<div><p></div>
		
		 <!-- Footer-->
        <footer class="py-5 bg-dark">
            <div class="container px-4 px-lg-5"><p class="m-0 text-center text-white">Copyright &copy; bona</p></div>
        </footer>
        <!-- Bootstrap core JS-->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
        <!-- Core theme JS-->
        <script src="./resources/js/scripts.js"></script>
</body>
</html>