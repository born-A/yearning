<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="post.PostDAO" %>
<%@ page import="post.Post" %>
<%@ page import="java.io.PrintWriter" %>
<% request.setCharacterEncoding("UTF-8"); %>
<!DOCTYPE html>
<html>
<head>
<!-- <meta charset="UTF-8"> -->
<title>Insert title here</title>
</head>
<body>
	<%	
	String userID = null;
	if(session.getAttribute("userID") != null){
		userID = (String)session.getAttribute("userID"); // 자신에게 할당된 session ID를담아줌.
		
	}
	if(userID == null){
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('로그인을 하세요.')");
		script.println("location.href = 'login.jsp'");
		script.println("</script>");
	}
	int postID = 0;
	if(request.getParameter("postID") != null){
		postID = Integer.parseInt(request.getParameter("postID"));
	}
	if(postID == -2){
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('유효하지 않은 글입니다.')");
		script.println("location.href = 'findItem.jsp'");
		script.println("</script>");
	}
	Post post = new PostDAO().getPost(postID);
	if(!userID.equals(post.getUserID())){
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('권한이 없습니다.')");
		script.println("location.href = 'findItem.jsp'");
		script.println("</script>");
	}
	
	
	else{
		if(request.getParameter("postTitle") == null || request.getParameter("postContent")== null || request.getParameter("postTitle").equals("") || request.getParameter("postContent").equals("") ) {
					PrintWriter script = response.getWriter();
					script.println("<script>");
					script.println("alert('입력이 안 된 항목이 있습니다.')");
					script.println("history.back()"); //뒤로가기 수행
					script.println("</script>");
				} else {
					PostDAO postDAO = new PostDAO(); //db 접근 객체 만들기
					int result = postDAO.update(postID,  request.getParameter("postTitle"),request.getParameter("postContent"));
					if(result == -1){
						PrintWriter script = response.getWriter();
						script.println("<script>");
						script.println("alert('글수정에 실패했습니다.')");
						script.println("history.back()");
						script.println("</script>");
					}
					else { // 회원가입이 이루어진 경우
					
						PrintWriter script = response.getWriter();
						script.println("<script>");
						script.println("location.href='findItem.jsp'");
						script.println("</script>");
					}
				}
	}
		
	%>
</body>
</html>