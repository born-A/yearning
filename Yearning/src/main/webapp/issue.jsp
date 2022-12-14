<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
        <%@ page import="java.io.PrintWriter" %>
    <%@ page import="issue.IssueDAO" %>
    <%@ page import="issue.Issue" %>
    <%@ page import="java.util.ArrayList" %>
<!DOCTYPE html>
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
                        <li class="nav-item"><a class="nav-link" href="offline.jsp">???????????? ??????</a></li>
                        <li class="nav-item"><a class="nav-link" href="findItem.jsp">????????? ??????</a></li>
                        <li class="nav-item"><a class="nav-link" href="issue.jsp ">?????????</a></li>
                        <li class="nav-item"><a class="nav-link" href="jjimPost.jsp">?????????</a></li>
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
                        <li class="nav-item"><a class="nav-link" href="offline.jsp">???????????? ??????</a></li>
                        <li class="nav-item"><a class="nav-link" href="findItem.jsp">????????? ??????</a></li>
                        <li class="nav-item"><a class="nav-link" href="issue.jsp ">?????????</a></li>
                        <li class="nav-item"><a class="nav-link" href="jjimPost.jsp">?????????</a></li>
                        <li class="nav-item"><a class="nav-link" href="logout.jsp">Logout</a></li>
                       
                    </ul>
                </div>
            </div>
        </nav>
        <% 
        	}
        %>
        <!-- Page Header-->
        <header class="masthead" style="background-image: url('https://ifh.cc/g/CDpNAD.jpg')">
            <div class="container position-relative px-4 px-lg-5">
                <div class="row gx-4 gx-lg-5 justify-content-center">
                    <div class="col-md-10 col-lg-8 col-xl-7">
                        <div class="site-heading">
                            <h1>Trends</h1>
                            <span class="subheading">?????? ???????????? ???????????? ???????????????.</span>
                        </div>
                    </div>
                </div>
            </div>
        </header>
        <!-- Main Content-->
        <div class="container px-4 px-lg-5">
            <div class="row gx-4 gx-lg-5 justify-content-center">
                <div class="col-md-10 col-lg-8 col-xl-7">
              
               <%
            	IssueDAO issueDAO = new IssueDAO();
                ArrayList<Issue> list = issueDAO.getList(pageNumber);
                for(int i = 0; i < list.size(); i++){
             %>   	
				<!-- Post preview-->
                    <div class="post-preview">
                        <a href="post.html">
                            <h2 class="post-title"><a href="issueView.jsp?issueID=<%=list.get(i).getIssueID()%>"><%= list.get(i).getIssueTitle()%></a></h2>
                          
                        </a>
                        <p class="post-meta">
                            Posted by
                            <a href="#!">Admin</a>
                            <%= list.get(i).getIssueDate().substring(0,11) + list.get(i).getIssueDate().substring(11,13)+"???"+list.get(i).getIssueDate().substring(14,16)+"???"%>
                        </p>
                    </div>
                    <!-- Divider-->
                    <hr class="my-4" />
                    <%
                }
                %> 	
              
                    <!-- Pager-->
                    <%
					if(userID == null){
						
					}
					else if(userID.equals("admin")){
					%>
					<div class="d-flex justify-content-end mb-4"><a class="btn btn-primary text-uppercase" href="issueWrite.jsp">??? ????????? ????????????</a></div>
					<%
					}else {
					%>       <%} %>
                </div>
            </div>
            
        </div>
        <!-- Footer-->
      <footer class="footer bg-black small text-center text-white-50"><div class="container px-4 px-lg-5">Copyright &copy; bona
      </div></footer>
        
        <!-- Bootstrap core JS-->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
        <!-- Core theme JS-->
        <script src="./resources/js/scripts.js"></script>
    </body>
</html>
