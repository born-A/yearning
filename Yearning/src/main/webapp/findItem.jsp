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
        <!-- Page Content-->
        <div class="container px-4 px-lg-5">
            <!-- Heading Row-->
           <div class="row gx-4 gx-lg-5 align-items-center my-5">
                <div class="col-lg-7"><img class="img-fluid rounded mb-4 mb-lg-0" src="https://ifh.cc/g/Mcvj35.jpg" alt="…" /></div>
                <div class="col-lg-5">
                    <h1 class="font-weight-light">당신이 원하는 아이템을 찾아보세요 !</h1>
                   <p>당신이 찾는 아이템의 이미지를 포함한 <br>게시물을 올려서 다른 유저들에게 <br>도움을 요청해보세요! <br>그들이 당신이 찾는 아이템의 위치를 찾아줄 수 있습니다 :)</p>
                    <a class="btn btn-primary" href="write.jsp">게시물 등록하기</a>
                </div>
            </div>
            <!-- Call to Action-->
             <div class="card text-white bg-secondary my-5 py-4 text-center">
            <p>다른 유저들도 같은 아이템을 찾고 있을 수도 있어요 !
            
            <div class="card mb-4">
                       
                        <div class="card-body">
                            <div class="input-group">
                                <input class="form-control" type="text" placeholder="원하는 아이템을 검색 해보세요 !" aria-label="Enter search term..." aria-describedby="button-search" />
                                <form name = "p_search">
					<input type="button" value="검색" class="btn btn-primary" id="button-search" onclick="nwindow()"/>
				</form>	
                            </div>
                        </div>
                    </div>
            	
            </div>
            <!-- Content Row-->
            <div class="row gx-4 gx-lg-5">
             <% 	
					String real = "/Users/bona/git/repository/Yearning/src/main/webapp/postUpload";
					File viewFile = new File(real+"/"+postID+".jpg");
					%>
            <%
            	PostDAO postDAO = new PostDAO();
                ArrayList<Post> list = postDAO.getList(pageNumber);
                for(int i = 0; i < list.size(); i++){
             %>   	
             <div class="col-md-4 mb-5">
                    <div class="card h-100">
                        <div class="card-body">
                         <img class="card-img-top" src="postUpload/<%=list.get(i).getPostID() %>.jpg" alt="..." />
                            <h2 class="card-title"><%= list.get(i).getPostTitle()%></a></h2> 
                           <%--  <h2 class="card-title"><a href="uploadex.jsp?postID=<%=list.get(i).getPostID()%>"><%= list.get(i).getPostTitle()%></a></h2> --%>
                            <p class="card-text">작성자 : <%= list.get(i).getUserID()%></p>
                            <p class="card-text"><%= list.get(i).getPostDate().substring(0,11) + list.get(i).getPostDate().substring(11,13)+"시"+list.get(i).getPostDate().substring(14,16)+"분"%></p>
                           
                        </div>
                        <div class="card-footer"><a class="btn btn-primary btn-sm" href="view.jsp?postID=<%=list.get(i).getPostID()%>">상세보기</a></div>
                    </div>
                </div>
             	<%
                }
                %> 	
                
            </div>
            <!-- Pagination-->
                    <nav aria-label="Pagination">
                        <hr class="my-0" />
                        <ul class="pagination justify-content-center my-4">
                            <li class="page-item disabled"><a class="page-link" href="#" tabindex="-1" aria-disabled="true">Newer</a></li>
                            <li class="page-item active" aria-current="page"><a class="page-link" href="#!">1</a></li>
                            <li class="page-item"><a class="page-link" href="#!">2</a></li>
                            <li class="page-item"><a class="page-link" href="#!">3</a></li>
                            <li class="page-item disabled"><a class="page-link" href="#!">...</a></li>
                            <li class="page-item"><a class="page-link" href="#!">5</a></li>
                            <li class="page-item"><a class="page-link" href="#!">Older</a></li>
                        </ul>
                    </nav>
            </div>
            
        </div>

		<%
        	if(pageNumber != 1){
        %>
        	<a href="post.jsp?pageNumber - 1%>"class="btn btn-success btn-araw-left">이전</a>
        <%	
        	} if(postDAO.nextPage(pageNumber + 1)){
        %>
        	<a href="post.jsp?pageNumber + 1%>"class="btn btn-success btn-arraw-left">다음</a>
        <%
		}
        %>
		<script>
	function nwindow(){
		window.name = "parant";
		var url= "search.jsp";
		window.open(url,"","width=250,height=200,left=300");
	}
</script>

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
