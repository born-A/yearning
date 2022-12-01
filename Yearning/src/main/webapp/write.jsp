<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="java.io.PrintWriter" %>
    <%@ page import="post.PostDAO" %>
    <%@ page import="post.Post" %>
    <%@ page import="java.util.ArrayList" %>
    <%@ page import="offline.OffpostDAO" %>
    <%@ page import="offline.Offpost" %>
    <%@ page import="comment.Comment" %>
<%@ page import="comment.CommentDAO" %>
    <%@ page import="java.io.File" %>
<%@ page import="java.util.Enumeration" %>
<%@ page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@ page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page import="post.JjimDAO" %>
<%@ page import="post.Jjim" %>
<%@ page import="java.net.URLEncoder" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>Yearning
        </title>
        <style type="text/css">
        	/* titlepost, titlepost:hover{
        		color : #000000;
        		text-decoration: none;
        	} */
        </style>
        <!-- Favicon-->
        <link rel="icon" type="image/x-icon" href="assets/favicon.ico" />
        <!-- Core theme CSS (includes Bootstrap)-->
        <link href="./resources/css/styles.css" rel="stylesheet" />
        <link href="./resources/css/fi_styles.css" rel="stylesheet" />
          <link href="./resources/css/issue_styles.css" rel="stylesheet" /> 
    </head>
    <body>
        <%
    		String userID = null;
    		if(session.getAttribute("userID") != null){
    			userID = (String) session.getAttribute("userID");
    		}
    		int postID = 0;
    		if(request.getParameter("postID") != null){
    			postID = Integer.parseInt(request.getParameter("postID"));
    		}
    		int pageNumber = 1;
    		if(request.getParameter("pageNumber") != null){
    			pageNumber = Integer.parseInt(request.getParameter("pageNumber"));
    		}
    		int boardID = 0;
			if (request.getParameter("boardID") != null){
				boardID = Integer.parseInt(request.getParameter("boardID"));
			}
		Post post = new PostDAO().getPost(postID);
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
        <header class="bg-dark py-5" style="background-image: url('https://ifh.cc/g/mGn8Sk.jpg')">
            <div class="container px-4 px-lg-5 my-5">
                <div class="text-center text-white">
                    <h1 class="display-4 fw-bolder">아이템 찾기</h1>
                    <p class="lead fw-normal text-white-50 mb-0">find your yearning item !</p>
                </div>
            </div>
        </header>
        <div><p></p></div>
       <div class="container">
		<div class="row">
			<form method="post" enctype="multipart/form-data" action="writeAction.jsp">
				<table class="table table-striped" style="text-align:center; border:1px solid #dddddd">
				<thead>
					<tr>
						<th style="background-color:#eeeeee; text-align:center;">게시판 글쓰기 양식</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td><input type="text" calss="form-control" placeholder="글 제목" name="postTitle" maxlength="50"></td>
					</tr>
					<tr>
						<td><textarea  class="form-control" placeholder="글 내용" name="postContent" maxlength="2048" style="height:350px;"></textarea></td>
						
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
        <!-- Footer-->
        <footer class="py-5 bg-dark">
            <div class="container px-4 px-lg-5"><p class="m-0 text-center text-white">Copyright &copy; Your Website 2022</p></div>
        </footer>
        <!-- Bootstrap core JS-->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
        <!-- Core theme JS-->
        <script src="./resources/js/scripts.js"></script>
    </body>
</html>
