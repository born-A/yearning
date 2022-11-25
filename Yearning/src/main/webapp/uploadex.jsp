<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
      <%@ page import="java.io.PrintWriter" %>
    <%@ page import="post.PostDAO" %>
    <%@ page import="post.Post" %>
    <%@ page import="java.util.ArrayList" %>
    <%@ page import="java.io.File" %>
<%@ page import="java.util.Enumeration" %>
<%@ page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@ page import="com.oreilly.servlet.MultipartRequest"%>
<!DOCTYPE html>
<html>
<head>
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>Yearning
        </title>
        
        <!-- Favicon-->
        <link rel="icon" type="image/x-icon" href="assets/favicon.ico" />
        <!-- Core theme CSS (includes Bootstrap)-->
<!-- <link href="./resources/css/styles.css" rel="stylesheet" />  -->
         <link href="./resources/css/findItem_styles2.css" rel="stylesheet" />
    </head>
    
<%
    		String userID = null;
    		if(session.getAttribute("userID") != null){
    			userID = (String) session.getAttribute("userID");
    		}
    		int postID = 0;
    		if(request.getParameter("postID") != null){
    			postID = Integer.parseInt(request.getParameter("postID"));
    		}
    		if(postID == 0){
    			PrintWriter script = response.getWriter();
    			script.println("<script>");
    			script.println("alert('유효하지 않은 글입니다.')");
    			script.println("location.href = 'findItem.jsp'");
    			script.println("</script>");
    		}
    		Post post = new PostDAO().getPost(postID);
    		%>
    		
        
     
        <!-- Page Content-->
       <!-- <div class="container"> -->
    	
<% 
					String real = "/Users/bona/git/repository/Yearning/src/main/webapp/postUpload";
					File viewFile = new File(real+"/"+postID+".jpg");
					if(viewFile.exists()){
				%>
                    <!-- <div class="col-md-6"> --><img  src="postUpload/<%=postID %>.jpg" border="300px" width="300px" height="300px" />
                    <% } %>
                   

</html>