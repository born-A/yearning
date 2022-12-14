<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="java.io.PrintWriter" %>
    <%@ page import="post.PostDAO" %>
    <%@ page import="post.Post" %>
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
        	/* titlepost, titlepost:hover{
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
        <!-- <link href="./resources/css/findItem_styles.css" rel="stylesheet" /> -->
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
    		int boardID = 0;
    		if (request.getParameter("boardID") != null){
    			boardID = Integer.parseInt(request.getParameter("boardID"));
    		}
    		if(postID == -1){
    			PrintWriter script = response.getWriter();
    			script.println("<script>");
    			script.println("alert('???????????? ?????? ????????????.')");
    			script.println("location.href = 'findItem.jsp'");
    			script.println("</script>");
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
                <a class="navbar-brand" href="#page-top">Yearning</a>
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
       
        
        
         <!-- Header-->
        <header class="bg-dark py-5">
            <div class="container px-4 px-lg-5 my-5">
                <div class="text-center text-white">
                    <h1 class="display-4 fw-bolder">????????? ??????????????? !</h1>
                    <p class="lead fw-normal text-white-50 mb-0">Please Find This Item !!</p>
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
					String real = "/Users/bona/git/repository/Yearning/src/main/webapp/postUpload";
					File viewFile = new File(real+"/"+postID+".jpg");
					/* if(viewFile.exists()){ */
				%>
                    <div class="col-md-6"><img class="card-img-top mb-5 mb-md-0" src="postUpload/<%=postID %>.jpg" border="2px" width=600px" height="500px" alt="..." /></div>
                    <%  %>
                    
                    <div class="col-md-6">
                        <div class="small mb-1">?????? ?????? : <%= post.getPostDate().substring(0,11) + post.getPostDate().substring(11,13)+"???"+post.getPostDate().substring(14,16)+"???"%></div>
                        <h1 class="display-5 fw-bolder"><%=post.getPostTitle().replaceAll(" ", "&nbsp;").replaceAll("<","&lt;").replaceAll(">","&gt").replaceAll("\n","<br>") %></h1>
                        <div class="fs-5 mb-5"> 
                            <span>????????? : <%= post.getUserID() %></span>
                        </div>
                        <p class="lead"><%=post.getPostContent().replaceAll(" ", "&nbsp;").replaceAll("<","&lt;").replaceAll(">","&gt").replaceAll("\n","<br>") %></p>
                        <div class="d-flex">
                            
                            <%	JjimDAO jjimDAO = new JjimDAO();
		ArrayList<Jjim> list1 = jjimDAO.getJjim(userID, postID);
		if (list1.isEmpty()){%>
                            <button class="btn btn-outline-dark flex-shrink-0" type="button" onclick = "location.href='jjimAction.jsp?postID=<%=postID%>'">
                                
                            	<img src="https://ifh.cc/g/7dyjoy.png">
                            	</button>
	<%	}
		else{%>
		<button style="padding: 10px 10px;" class="btn btn-outline-dark flex-shrink-0" type="button" onclick = "location.href='jjimAction.jsp?postID=<%=postID%>'">
                              <img src="https://ifh.cc/g/7dyjoy.png">
                            	</button>
                            	<br>
	<%	} %>	
                          
                            <div><p><p></div><br>
			<%
				if (userID != null && userID.equals(post.getUserID())){
			%>
				<a href="update.jsp?postID=<%= postID %>" class="btn btn-primary">??????</a>
				<a onclick="return confirm('?????????????????????????')" href="deleteAction.jsp?postID=<%= postID %>" class="btn btn-primary">??????</a>
			<% 
			}
			%>
			</div>
			</div>
			<div><p></div>
			<br>
			
			<div class="container">
			
			<div class="form-group">
			<form method="post" encType = "multipart/form-data" action="commentAction.jsp?postID=<%= postID %>">
					<table class="table table-striped" style="text-align: center; border: 1px solid #dddddd">
						<tr>
							<td style="border-bottom:none;" valign="middle"><br><br><%=userID %></td>
							<td><input type="text" style="height:100px;" class="form-control" placeholder="???????????? ???????????? ????????? ????????????." name = "commentText"></td>
							<td><br><br><input type="submit" class="btn-primary pull" value="?????? ??????"></td>
						</tr>
						<tr>
							<td colspan="3"><input type="file" name="fileName"></td>
						</tr>
					</table>
			</form>
			</div>
			<div class="row">
				<table class="table table-striped" style="text-align: center; border: 1px solid #dddddd">
					<tbody>
					<tr>
						<td align="left" bgcolor="beige">??????</td>
					</tr>
					<tr>
						<%
							CommentDAO commentDAO = new CommentDAO();
							ArrayList<Comment> list = commentDAO.getList(postID);
							for(int i=0; i<list.size(); i++){
						%>
							<div class="container">
								<div class="row">
									<table class="table table-striped" style="text-align: center; border: 1px solid #dddddd">
										<tbody>
										<tr>						
										<td align="left"><%= list.get(i).getUserID() %>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<%= list.get(i).getCommentDate().substring(0,11) + list.get(i).getCommentDate().substring(11,13) + "???" + list.get(i).getCommentDate().substring(14,16) + "???" %></td>		
										<td colspan="2"></td>
										<td align="right"><%
													if(list.get(i).getUserID() != null && list.get(i).getUserID().equals(userID)){
												%>
														<form name = "p_search">
															<a type="button" onclick="nwindow(<%=postID %>,<%=list.get(i).getCommentID()%>)" class="btn-primary">??????</a>
														</form>	
														<a onclick="return confirm('????????? ?????????????????????????')" href = "commentDeleteAction.jsp?bbsID=<%=postID %>&commentID=<%= list.get(i).getCommentID() %>" class="btn-primary">??????</a>
																	
												<%
													}
												%>	
										</td>
										</tr>
										<tr>
											<td colspan="5" align="left"><%= list.get(i).getCommentText() %>
											<% 	
												String commentReal = "/Users/bona/git/repository/Yearning/src/main/webapp/commentUpload";
												File commentFile = new File(commentReal+"/"+postID+list.get(i).getCommentID()+".jpg");
												if(commentFile.exists()){
											%>	
											<br><br><img src = "commentUpload/<%=postID %><%=list.get(i).getCommentID() %>.jpg" border="300px" width="300px" height="300px"><br><br></td>											
											<%} %>	
										</tr>
									</tbody>
								</table>			
							</div>
						</div>
						<%
							}
						%>
					</tr>
				</table>
			</div>
		</div>
		<div style="text-align:center;">
			<a style="display:block;  width:100px; height:60px;" href="findItem.jsp" class="btn btn-primary">??????</a>
		</div>
		</div>
	</div>
	<script type="text/javascript">
	function nwindow(postID,commentID){
		window.name = "commentParant";
		var url= "commentUpdate.jsp?postID="+postID+"&commentID="+commentID;
		window.open(url,"","width=600,height=230,left=300");
	}
	</script>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
	<script src="js/bootstrap.min.js"></script> 
                        </div>
                    </div>
                </div>
            </div>
        </section>
		
	</div>
	


        <!-- Footer-->
        <footer class="py-5 bg-dark">
            <div class="container px-4 px-lg-5"><p class="m-0 text-center text-white">Copyright &copy; Yearning</p></div>
        </footer>
        <!-- Bootstrap core JS-->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
        <!-- Core theme JS-->
        <script src="./resources/js/scripts.js"></script>
    </body>
</html>
