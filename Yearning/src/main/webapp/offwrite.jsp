<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		String userID = null;
		if(session.getAttribute("userID") != null){
			userID = (String) session.getAttribute("userID");
		}
		int boardID = 0;
		if (request.getParameter("boardID") != null){
			boardID = Integer.parseInt(request.getParameter("boardID"));
		}
	%>
    <head>
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>Blog Post - Start Bootstrap Template</title>
        <!-- Favicon-->
        <link rel="icon" type="image/x-icon" href="assets/favicon.ico" />
        <!-- Core theme CSS (includes Bootstrap)-->
         <link href="./resources/css/styles.css" rel="stylesheet" />
        <!-- <link href="./resources/css/findItem_styles.css" rel="stylesheet" /> -->
    </head>
    <body>
        
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
                        <li class="nav-item"><a class="nav-link" href="#about">About</a></li>
                        <li class="nav-item"><a class="nav-link" href="offline.jsp">쇼핑몰 탐방</a></li>
                        <li class="nav-item"><a class="nav-link" href="findItem.jsp">아이템 찾기</a></li>
                        <li class="nav-item"><a class="nav-link" href="#projects">트렌드</a></li>
                        <li class="nav-item"><a class="nav-link" href="#contact">Contact</a></li>
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
                <a class="navbar-brand" href="#page-top">Yearning</a>
                <button class="navbar-toggler navbar-toggler-right" type="button" data-bs-toggle="collapse" data-bs-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
                    Menu
                    <i class="fas fa-bars"></i>
                </button>
                <div class="collapse navbar-collapse" id="navbarResponsive">
                    <ul class="navbar-nav ms-auto">
                        <li class="nav-item"><a class="nav-link" href="#about">About</a></li>
                        <li class="nav-item"><a class="nav-link" href="offline.jsp">쇼핑몰 탐방</a></li>
                        <li class="nav-item"><a class="nav-link" href="findItem.jsp">아이템 찾기</a></li>
                        <li class="nav-item"><a class="nav-link" href="#projects">트렌드</a></li>
                        <li class="nav-item"><a class="nav-link" href="jjimPost.jsp">스크랩</a></li>
                        <li class="nav-item"><a class="nav-link" href="logout.jsp">Logout</a></li>
                    </ul>
                </div>
            </div>
        </nav>
        <% 
        	}
        %>
        <%
	if(boardID == 1){
%>
		<header class="py-5 bg-dark border-bottom mb-4">
            <div class="container">
                <div class="text-center my-5">
                <br>
                    <h1 class="text-white fw-bolder">스타필드 고양</h1>
                    <p class="text-white-50 lead mb-0">당신의 생생한 이야기를 다른 유저들에게 공유해주세요 ! </p>
                </div>
            </div>
        </header>
        
                
<% }
	else if(boardID == 2){
%>
		<header class="py-5 bg-light border-bottom mb-4">
            <div class="container">
                <div class="text-center my-5">
                    <h1 class="fw-bolder">더현대서울</h1>
                    <p class="lead mb-0">당신의 생생한 이야기를 다른 유저들에게 공유해주세요 ! </p>
                </div>
            </div>
        </header>
        
                
<% }
	else if(boardID == 3){
%>
		<header class="py-5 bg-light border-bottom mb-4">
            <div class="container">
                <div class="text-center my-5">
                    <h1 class="fw-bolder">롯데몰 수원점</h1>
                    <p class="lead mb-0">당신의 생생한 이야기를 다른 유저들에게 공유해주세요 ! </p>
                </div>
            </div>
        </header>
        
<% }
	else if(boardID == 4){
%>
		<header class="py-5 bg-light border-bottom mb-4">
            <div class="container">
                <div class="text-center my-5">
                    <h1 class="fw-bolder">현대프리미엄아울렛 김포점</h1>
                    <p class="lead mb-0">당신의 생생한 이야기를 다른 유저들에게 공유해주세요 ! </p>
                </div>
            </div>
        </header>
        
<% }%>
	<div class="container">
		<div class="row">
			<form method="post" enctype="multipart/form-data" action="offwriteAction.jsp?boardID=<%=boardID%>">
				<table class="table table-striped" style="text-align:center; border:1px solid #dddddd">
				<thead>
					<tr>
						<th style="background-color:#eeeeee; text-align:center;">게시판 글쓰기 양식</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td><input type="text" class="form-control" placeholder="글 제목" name="offpostTitle" maxlength="50"></td>
					</tr>
					<tr>
						<td><textarea  class="form-control" placeholder="글 내용" name="offpostContent" maxlength="2048" style="height:350px;"></textarea></td>
						
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
	<div><p><p></div>
	<div><p><p></div>
        <footer class="py-5 bg-dark">
            <div class="container"><p class="m-0 text-center text-white">Copyright &copy; Your Website 2022</p></div>
        </footer>
        <!-- Bootstrap core JS-->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
        <!-- Core theme JS-->
        <script src="js/scripts.js"></script>
</body>
</html>