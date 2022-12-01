<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="java.io.PrintWriter" %>
    <%@ page import="offline.OffpostDAO" %>
    <%@ page import="offline.Offpost" %>
    <%@ page import="comment.Comment" %>
<%@ page import="comment.CommentDAO" %>
    <%@ page import="java.util.ArrayList" %>
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
        <title>Blog Post - Start Bootstrap Template</title>
        <!-- Favicon-->
        <link rel="icon" type="image/x-icon" href="assets/favicon.ico" />
        <!-- Core theme CSS (includes Bootstrap)-->
         <link href="./resources/css/styles.css" rel="stylesheet" />
        <!-- <link href="./resources/css/findItem_styles.css" rel="stylesheet" /> -->
    </head>
    <body>
        <%
    		String userID = null;
    		if(session.getAttribute("userID") != null){
    			userID = (String) session.getAttribute("userID");
    		}
    		int offpostID = 0;
    		if(request.getParameter("offpostID") != null){
    			offpostID = Integer.parseInt(request.getParameter("offpostID"));
    		}
    		int boardID = 0;
    		if (request.getParameter("boardID") != null){
    			boardID = Integer.parseInt(request.getParameter("boardID"));
    		}
    		if(offpostID == -1){
    			PrintWriter script = response.getWriter();
    			script.println("<script>");
    			script.println("alert('유효하지 않은 글입니다.')");
    			script.println("location.href = 'findItem.jsp'");
    			script.println("</script>");
    		}
    		Offpost offpost = new OffpostDAO().getOffpost(offpostID);
    	%>
    	<%
    	String cp = request.getContextPath();
    	request.setCharacterEncoding("UTF-8");
    	
    	Cookie[] ck = request.getCookies();
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
                    <p class="text-white-50 lead mb-0">A Bootstrap 5 starter layout for your next blog homepage</p>
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
                    <p class="lead mb-0">A Bootstrap 5 starter layout for your next blog homepage</p>
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
                    <p class="lead mb-0">A Bootstrap 5 starter layout for your next blog homepage</p>
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
                    <p class="lead mb-0">A Bootstrap 5 starter layout for your next blog homepage</p>
                </div>
            </div>
        </header>
        
<% }%>
       
        <!-- Page content-->
        <div class="container mt-5">
            <div class="row">
                <div class="col-lg-8">
                    <!-- Post content-->
                    <article>
                        <!-- Post header-->
                        <header class="mb-4"></header>
                        <%
                        String offpostTitles = offpost.getOffpostTitle().replaceAll(" ", "&nbsp;").replaceAll("<","&lt;").replaceAll(">","&gt").replaceAll("\n","<br>");
                        %>
                        <% 	
					String real = "/Users/bona/git/repository/Yearning/src/main/webapp/offUpload";
					File viewFile = new File(real+"/"+offpostID+".jpg");
					
					String s = request.getContextPath();
					request.setCharacterEncoding("UTF-8");
					
					Cookie c = new Cookie("sname1",URLEncoder.encode(offpostTitles,"UTF-8"));
					c.setMaxAge(50*60*24);
					response.addCookie(c);

					/* if(viewFile.exists()){ */
				%>
                            <!-- Post title-->
                            <h1 class="fw-bolder mb-1"><%=offpost.getOffpostTitle().replaceAll(" ", "&nbsp;").replaceAll("<","&lt;").replaceAll(">","&gt").replaceAll("\n","<br>") %></h1>
                            <!-- Post meta content-->
                            <div class="text-muted fst-italic mb-2"> <%= offpost.getOffpostDate().substring(0,11) + offpost.getOffpostDate().substring(11,13)+"시"+offpost.getOffpostDate().substring(14,16)+"분"%></div>
                            <!-- Post categories-->
                            
                        <!-- Preview image figure-->
                        <figure class="mb-4"><img class="img-fluid rounded" src="offUpload/<%=offpostID %>.jpg" alt="..." /></figure>
                        <!-- Post content-->
                        <section class="mb-5">
                           <p class="lead"><%=offpost.getOffpostContent().replaceAll(" ", "&nbsp;").replaceAll("<","&lt;").replaceAll(">","&gt").replaceAll("\n","<br>") %></p>
                        </section>
                         <a href="offlinePost.jsp?boardID=<%=boardID %>" class="btn btn-primary">목록</a>
			<%
				if (userID != null && userID.equals(offpost.getUserID())){
			%>
				<a href="offupdate.jsp?offpostID=<%= offpostID %>&boardID=<%=boardID %>" class="btn btn-primary">수정</a>
				<a onclick="return confirm('삭제하시겠습니까?')" href="offdeleteAction.jsp?offpostID=<%=offpostID %>&boardID=<%=boardID %>" class="btn btn-primary">삭제</a>
			<% 
			}
			%>
                    </article>
                    <!-- Comments section-->
                    <section class="mb-5">
                       
                    </section>
                </div>
                <!-- Side widgets-->
                <div class="col-lg-4">
                   
                  
                    <!-- Side widget-->
                    <div class="card mb-4">
                        <div class="card-header">최근 본 글 목록</div>
                        
                        <div class="card-body"><%
                        	if(ck != null){
                        		for(Cookie cs : ck){
                        			if(cs.getName().indexOf("sname")!=-1){
                        				out.println(java.net.URLDecoder.decode(cs.getValue(), "UTF-8")+"<br/>");
                        			}
                        		}
                        	}
                        %>
                       </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- Footer-->
        <footer class="py-5 bg-dark">
            <div class="container"><p class="m-0 text-center text-white">Copyright &copy; Your Website 2022</p></div>
        </footer>
        <!-- Bootstrap core JS-->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
        <!-- Core theme JS-->
        <script src="js/scripts.js"></script>
    </body>
</html>
