<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="offline.OffpostDAO" %>
<%@ page import="offline.Offpost" %>
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
	int boardID = 0;
	if (request.getParameter("boardID") != null){
		boardID = Integer.parseInt(request.getParameter("boardID"));
	}
	int offpostID = 0;
	if(request.getParameter("offpostID") != null){
		offpostID = Integer.parseInt(request.getParameter("offpostID"));
	}
	if(offpostID == -2){
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('유효하지 않은 글입니다.')");
		script.println("location.href = 'findItem.jsp'");
		script.println("</script>");
	}
	Offpost post = new OffpostDAO().getOffpost(offpostID);
	if(!userID.equals(post.getUserID())){
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('권한이 없습니다.')");
		script.println("location.href = 'findItem.jsp'");
		script.println("</script>");
	}else{
		
					OffpostDAO offpostDAO = new OffpostDAO(); //db 접근 객체 만들기
					int result = offpostDAO.delete(offpostID);
					if(result == -1){
						PrintWriter script = response.getWriter();
						script.println("<script>");
						script.println("alert('글삭제에 실패했습니다.')");
						script.println("history.back()");
						script.println("</script>");
					}
					else { // 회원가입이 이루어진 경우
					
						PrintWriter script = response.getWriter();
						script.println("<script>");
						script.println("location.href=\'offlinePost.jsp?boardID="+boardID+"\'");
						script.println("</script>");
					}
	}
		
	%>
</body>
</html>