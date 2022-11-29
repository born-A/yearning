<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter" %>
<%@ page import="offline.Offpost" %>
<%@ page import="offline.OffpostDAO"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		String userID = null;
		if(session.getAttribute("userID") != null){
			userID = (String) session.getAttribute("userID");
		}
		if (userID == null){
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
		if(offpostID == 0){
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('유효하지 않은 글입니다.')");
			script.println("location.href = 'findItem.jsp'");
			script.println("</script>");
		}
		Offpost offpost = new OffpostDAO().getOffpost(offpostID);
		if(!userID.equals(offpost.getUserID())){
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('권한이 없습니다.')");
			script.println("location.href = 'findItem.jsp'");
			script.println("</script>");
		}
	%>
	
	<div class="container">
		<div class="row">
			<form method="post" enctype="multipart/form-data" action="offupdateAction.jsp?offpostID=<%=offpostID %>&boardID=<%=boardID%>">
				<table class="table table-striped" style="text-align:center; border:1px solid #dddddd">
				<thead>
					<tr>
						<th style="background-color:#eeeeee; text-align:center;">게시판 글수정 양식</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td><input type="text" class="form-control" placeholder="글 제목" name="offpostTitle" maxlength="50" value="<%=offpost.getOffpostTitle()%>"></td>
					</tr>
					<tr>
						<td><textarea  class="form-control" placeholder="글 내용" name="offpostContent" maxlength="2048" style="height:350px;"><%=offpost.getOffpostContent()%></textarea></td>
						
					</tr>
					<td><input type="file" name="fileName"></td>
				</tbody>
					
				</table>
				<input type="submit" class="btn btn-primary pull-right" value="글수정">
				
			</form>
			
		</div>
	</div>
</body>
</html>