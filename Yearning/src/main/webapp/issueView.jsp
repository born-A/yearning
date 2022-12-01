<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="java.io.PrintWriter" %>
    <%@ page import="issue.IssueDAO" %>
    <%@ page import="issue.Issue" %>
    <%@ page import="comment.Comment" %>
<%@ page import="comment.CommentDAO" %>
    <%@ page import="java.util.ArrayList" %>
    <%@ page import="java.io.File" %>
<%@ page import="java.util.Enumeration" %>
<%@ page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@ page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page import="post.JjimDAO" %>
<%@ page import="post.Jjim" %>
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
        	/* titleissue, titleissue:hover{
        		color : #000000;
        		text-decoration: none;
        	} */
        </style>
        <!-- Favicon-->
        <link rel="icon" type="image/x-icon" href="assets/favicon.ico" />
        <!-- Core theme CSS (includes Bootstrap)-->
       <!--  <link href="./resources/css/borderbox_styles.css" rel="stylesheet" /> -->
        <!-- <link href="./resources/css/borderbox_findItem_styles.css" rel="stylesheet" /> -->
        <link href="./resources/css/styles.css" rel="stylesheet" />
        <link href="./resources/css/findItem_styles.css" rel="stylesheet" />
    </head>
    <body>
        <%
    		String userID = null;
    		if(session.getAttribute("userID") != null){
    			userID = (String) session.getAttribute("userID");
    		}
    		int issueID = 0;
    		if(request.getParameter("issueID") != null){
    			issueID = Integer.parseInt(request.getParameter("issueID"));
    		}
    		int boardID = 0;
    		if (request.getParameter("boardID") != null){
    			boardID = Integer.parseInt(request.getParameter("boardID"));
    		}
    		if(issueID == -1){
    			PrintWriter script = response.getWriter();
    			script.println("<script>");
    			script.println("alert('유효하지 않은 글입니다.')");
    			script.println("location.href = 'findItem.jsp'");
    			script.println("</script>");
    		}
    		Issue issue = new IssueDAO().getissue(issueID);
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
                <a class="navbar-brand" href="#page-top">Yearning</a>
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
        <header class="bg-dark py-5">
            <div class="container px-4 px-lg-5 my-5">
                <div class="text-center text-white">
                    <h1 class="display-4 fw-bolder"><%=issue.getIssueTitle().replaceAll(" ", "&nbsp;").replaceAll("<","&lt;").replaceAll(">","&gt").replaceAll("\n","<br>") %></h1>
                    <p class="lead fw-normal text-white-50 mb-0">최근 유행하는 트렌드입니다. :)</p>
                </div>
            </div>
        </header>
        <!-- Page Content-->
       <div class="container">
       <!-- Product section-->
        <section class="py-5">
            <div class="container px-4 px-lg-5 my-5">
                <div class="row gx-4 gx-lg-5 align-items-center">
                
                <% 	
					String real = "/Users/bona/git/repository/Yearning/src/main/webapp/issueUpload";
					File viewFile = new File(real+"/"+issueID+".jpg");
					/* if(viewFile.exists()){ */
				%>
                    <div class="col-md-6"><img class="card-img-top mb-5 mb-md-0" src="issueUpload/<%=issueID %>.jpg" border="2px" width=600px" height="500px" alt="..." /></div>
                    <%  %>
                    
                    <div class="col-md-6">
                        <div class="small mb-1">작성 시간 : <%= issue.getIssueDate().substring(0,11) + issue.getIssueDate().substring(11,13)+"시"+issue.getIssueDate().substring(14,16)+"분"%></div>
                        <h1 class="display-5 fw-bolder"><%=issue.getIssueTitle().replaceAll(" ", "&nbsp;").replaceAll("<","&lt;").replaceAll(">","&gt").replaceAll("\n","<br>") %></h1>
                        <div class="fs-5 mb-5"> 
                        </div>
                        <p class="lead"><%=issue.getIssueContent().replaceAll(" ", "&nbsp;").replaceAll("<","&lt;").replaceAll(">","&gt").replaceAll("\n","<br>") %></p>
                        <div class="d-flex">
                            
                            <%	JjimDAO jjimDAO = new JjimDAO();
		ArrayList<Jjim> list1 = jjimDAO.getJjim(userID, issueID);
		if (list1.isEmpty()){%>
                         
                          
                            <a href="issue.jsp" class="btn btn-primary">목록</a>
			
				<a href="issueUpdate.jsp?issueID=<%= issueID %>" class="btn btn-primary">수정</a>
				<a onclick="return confirm('삭제하시겠습니까?')" href="issueDeleteAction.jsp?issueID=<%= issueID %>" class="btn btn-primary">삭제</a>
			<% 
			}
			%>
			
			
	</div>
	</div>
	</section>
	<script type="text/javascript">
	function nwindow(issueID,commentID){
		window.name = "commentParant";
		var url= "commentUpdate.jsp?issueID="+issueID+"&commentID="+commentID;
		window.open(url,"","width=600,height=230,left=300");
	}
	</script>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
	<script src="js/bootstrap.min.js"></script> 
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
