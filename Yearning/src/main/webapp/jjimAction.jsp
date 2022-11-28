<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="post.JjimDAO" %>
<%@ page import="post.Jjim" %>
<%@ page import="post.Post" %>
<%@ page import="java.io.PrintWriter" %>
<%@ page import="java.util.ArrayList"%>
<% request.setCharacterEncoding("UTF-8"); %>
<jsp:useBean id="post" class="post.Jjim" scope="page" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Yearning</title>
</head>
<body>
	 <%
	 	String userID = null;
	 	if(session.getAttribute("userID") != null){
	 		userID = (String) session.getAttribute("userID");
	 	}
	 	if(userID == null){
	 		PrintWriter script = response.getWriter();
	 		script.println("<script>");
			script.println("alert('로그인을 해주세요.')");
	 		script.println("location.href = 'login.jsp'");
	 		script.println("</script>");
	 	} 
	 	else{
		 	int postID = 0; 
		 	if (request.getParameter("postID") != null){
		 		postID = Integer.parseInt(request.getParameter("postID"));
		 	}
		 	if (postID == 0){
		 		PrintWriter script = response.getWriter();
		 		script.println("<script>");
		 		script.println("alert('유효하지 않은 글입니다.')");
		 		script.println("location.href = 'login.jsp'");
		 		script.println("</script>");
		 	}
		 	JjimDAO jjimDAO = new JjimDAO();
			ArrayList<Jjim> list = jjimDAO.getJjim(userID, postID);
			int result = 0;
			if (list.isEmpty()){
				result = jjimDAO.write(userID, postID);
			}
			else{
				result = jjimDAO.delete(userID, postID);
			}
	 		if (result == -1){
		 		PrintWriter script = response.getWriter();
		 		script.println("<script>");
		 		script.println("alert('평가를 실패했습니다.')");
		 		script.println("history.back()");
		 		script.println("</script>");
		 	}
	 		
	 		else{
		 		PrintWriter script = response.getWriter();
		 		script.println("<script>");
		 		script.println("location.href=document.referrer;");
		 		script.println("</script>");
		 	}
	 	}
	 %>
</body>
</html>