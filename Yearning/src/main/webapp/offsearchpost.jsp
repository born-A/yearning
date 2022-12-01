<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
        <%@ page import="java.io.PrintWriter" %>
    <%@ page import="offline.OffpostDAO" %>
    <%@ page import="offline.Offpost" %>
    <%@ page import="java.util.ArrayList" %>
    <%@ page import="java.io.File" %>
<%@ page import="java.util.Enumeration" %>
<%@ page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@ page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page import="java.net.URLDecoder"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>Yearning</title>
        <link rel="icon" type="image/x-icon" href="assets/favicon.ico" />
        <!-- Font Awesome icons (free version)-->
        <script src="https://use.fontawesome.com/releases/v6.1.0/js/all.js" crossorigin="anonymous"></script>
        <!-- Google fonts-->
        <link href="https://fonts.googleapis.com/css?family=Lora:400,700,400italic,700italic" rel="stylesheet" type="text/css" />
        <link href="https://fonts.googleapis.com/css?family=Open+Sans:300italic,400italic,600italic,700italic,800italic,400,300,600,700,800" rel="stylesheet" type="text/css" />
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
    			script.println("location.href = '.jsp'");
    			script.println("</script>");
    		}
    		Offpost offpost = new OffpostDAO().getOffpost(offpostID);
    		int pageNumber = 1; //기본페이지
    		if (request.getParameter("pageNumber") != null){
    			pageNumber = Integer.parseInt(request.getParameter("pageNumber")); //파라미터는 꼭 이런식으로 바꿔줘야됨
    		}
    		String search = null;
    		if(request.getParameter("search") != null){
    			search = request.getParameter("search");
    		}
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
        <!-- Page content-->
        <div class="container">
            <div class="row">
                <!-- Blog entries-->
                <div class="col-lg-8">
                    <!-- Featured blog post-->
                    <div class="card mb-4">
                        <a href="#!"><img class="card-img-top" src="https://ifh.cc/g/xskYnw.jpg" alt="..." /></a>
                        <div class="card-body">
                
                            <h2 class="card-title">스타필드 고양</h2>
                            <p class="card-text">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Reiciendis aliquid atque, nulla? Quos cum ex quis soluta, a laboriosam. Dicta expedita corporis animi vero voluptate voluptatibus possimus, veniam magni quis!</p>
                            <a class="btn btn-primary" href="offwrite.jsp?boardID=<%=boardID%>">게시물 등록하기</a>
                        </div>
                    </div>
                
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
        <!-- Page content-->
        <div class="container">
            <div class="row">
                <!-- Blog entries-->
                <div class="col-lg-8">
                    <!-- Featured blog post-->
                    <div class="card mb-4">
                        <a href="#!"><img class="card-img-top" src="https://dummyimage.com/850x350/dee2e6/6c757d.jpg" alt="..." /></a>
                        <div class="card-body">
                            <div class="small text-muted">January 1, 2022</div>
                            <h2 class="card-title">더현대서울</h2>
                            <p class="card-text">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Reiciendis aliquid atque, nulla? Quos cum ex quis soluta, a laboriosam. Dicta expedita corporis animi vero voluptate voluptatibus possimus, veniam magni quis!</p>
                            <a class="btn btn-primary" href="offwrite.jsp?boardID=<%=boardID%>">Read more →</a>
                        </div>
                    </div>
                </div>
                
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
        <!-- Page content-->
        <div class="container">
            <div class="row">
                <!-- Blog entries-->
                <div class="col-lg-8">
                    <!-- Featured blog post-->
                    <div class="card mb-4">
                        <a href="#!"><img class="card-img-top" src="https://dummyimage.com/850x350/dee2e6/6c757d.jpg" alt="..." /></a>
                        <div class="card-body">
                            <h2 class="card-title">롯데몰 수원점</h2>
                            <p class="card-text">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Reiciendis aliquid atque, nulla? Quos cum ex quis soluta, a laboriosam. Dicta expedita corporis animi vero voluptate voluptatibus possimus, veniam magni quis!</p>
                            <a class="btn btn-primary" href="offwrite.jsp?boardID=<%=boardID%>">Read more →</a>
                        </div>
                    </div>
               </div>
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
        <!-- Page content-->
        <div class="container">
            <div class="row">
                <!-- Blog entries-->
                <div class="col-lg-8">
                    <!-- Featured blog post-->
                    <div class="card mb-4">
                        <a href="#!"><img class="card-img-top" src="https://dummyimage.com/850x350/dee2e6/6c757d.jpg" alt="..." /></a>
                        <div class="card-body">
                            <h2 class="card-title">현대프리미엄아울렛 김포점</h2>
                            <p class="card-text">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Reiciendis aliquid atque, nulla? Quos cum ex quis soluta, a laboriosam. Dicta expedita corporis animi vero voluptate voluptatibus possimus, veniam magni quis!</p>
                            <a class="btn btn-primary" href="offwrite.jsp?boardID=<%=boardID%>">Read more →</a>
                        </div>
                    </div>
<% }%>
			<div class="row">
			 
                        <% 	
					String real = "/Users/bona/git/repository/Yearning/src/main/webapp/offUpload";
					File viewFile = new File(real+"/"+offpostID+".jpg");
					%>
                    <!-- Nested row for non-featured blog posts-->
                   <%
            	OffpostDAO offpostDAO = new OffpostDAO();
                		   ArrayList<Offpost> list = offpostDAO.searchList(boardID,pageNumber,search);
							for(int i=0; i<list.size(); i++){	
							System.out.println(list.get(i));
             %>   	
             <div class="col-md-4 mb-5">
                    <div class="card h-100">
                        <div class="card-body">
                         <img class="card-img-top" src="offUpload/<%=list.get(i).getOffpostID() %>.jpg" alt="..." />
                            <h2 class="card-title"><%= list.get(i).getOffpostTitle()%></a></h2> 
                           <%--  <h2 class="card-title"><a href="uploadex.jsp?postID=<%=list.get(i).getPostID()%>"><%= list.get(i).getPostTitle()%></a></h2> --%>
                            <p class="card-text"><%= list.get(i).getUserID()%></p>
                         
                            <p class="card-text"><%= list.get(i).getOffpostDate().substring(0,11) + list.get(i).getOffpostDate().substring(11,13)+"시"+list.get(i).getOffpostDate().substring(14,16)+"분"%></p>
                            
                        </div>
                        <div class="card-footer"><a class="btn btn-primary btn-sm" href="offView.jsp?boardID=<%=boardID%>&postID=<%=list.get(i).getOffpostID()%>">상세보기</a></div>
                    </div>
                </div>
             	<%
                }
                %> 	
                </div>
                </div>
                <!-- Side widgets-->
                <div class="col-lg-4">
                    <!-- Search widget-->
                    <div class="card mb-4">
                        <div class="card-header">Search</div>
                        <div class="card-body">
                            <div class="input-group">
                                <input class="form-control" type="text" placeholder="원하는 아이템을 검색 해보세요 !" aria-label="Enter search term..." aria-describedby="button-search" />
                                <form name = "p_search">
					<input type="button" value="검색" class="btn btn-primary" id="button-search" onclick="nwindow(<%=boardID%>)"/>
				</form>	
                            </div>
                        </div>
                    </div>
                   
                    <!-- Side widget-->
                    <div class="card mb-4">
                        <div class="card-header">최근 본 글 목록</div>
                        
                        <div class="card-body"><%
                        	if(ck != null){
                        		for(Cookie c : ck){
                        			if(c.getName().indexOf("sname")!=-1){
                        				out.println(java.net.URLDecoder.decode(c.getValue(), "UTF-8")+"<br/>");
                        			}
                        		}
                        	}
                        %>
                       </div>
                    </div>
                </div>
                
                   
                
            </div>
        </div>
        <script>
	function nwindow(boardID){
		window.name = "parant";
		var url= "offsearch.jsp?boardID="+boardID;
		window.open(url,"","width=250,height=200,left=300");
	}
</script>
        
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
