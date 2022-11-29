<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="offline.OffpostDAO" %>
<%@ page import="offline.Offpost" %>
<%@ page import="java.io.PrintWriter" %>
<%@ page import="post.PostDAO" %>
<%@ page import="java.io.PrintWriter" %>
<%@ page import="java.io.File" %>
<%@ page import="java.util.Enumeration" %>
<%@ page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@ page import="com.oreilly.servlet.MultipartRequest"%>
<% request.setCharacterEncoding("UTF-8"); %>
<%@ page import="java.nio.file.Files" %>
<%@ page import="java.nio.file.Path" %>
<%@ page import="java.nio.file.Paths" %>
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
	
	String path = "/Users/bona/git/repository/Yearning/src/main/webapp/postUpload";	//사진을 저장할 경로 */
	String encType = "utf-8";				//변환형식
	int maxSize=5*1024*1024;				//사진의 size


	int boardID = 0;
	if (request.getParameter("boardID") != null){
		boardID = Integer.parseInt(request.getParameter("boardID"));
	}

	
	MultipartRequest multi = null;
	
	multi = new MultipartRequest(request,path,maxSize,encType,new DefaultFileRenamePolicy());		
	String fileName = multi.getFilesystemName("fileName");
	String offpostTitle = multi.getParameter("offpostTitle");
	String postContent = multi.getParameter("offpostContent");

	offpost.setOffpostTitle(offpostTitle);
	offpost.setOffpostContent(postContent);

	
	if(!userID.equals(offpost.getUserID())){
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('권한이 없습니다.')");
		script.println("location.href = 'findItem.jsp'");
		script.println("</script>");
	}
	
	
	else{
		if(offpost.getOffpostTitle().equals("") || offpost.getOffpostContent().equals("") ) {
					PrintWriter script = response.getWriter();
					script.println("<script>");
					script.println("alert('입력이 안 된 항목이 있습니다.')");
					script.println("history.back()"); //뒤로가기 수행
					script.println("</script>");
				} else {
					OffpostDAO offpostDAO = new OffpostDAO(); //db 접근 객체 만들기
					int result = offpostDAO.update(offpostID,  offpost.getOffpostTitle(),offpost.getOffpostContent());
					if(result == -1){
						PrintWriter script = response.getWriter();
						script.println("<script>");
						script.println("alert('글수정에 실패했습니다.')");
						script.println("history.back()");
						script.println("</script>");
					}
					else { // 회원가입이 이루어진 경우
					
						PrintWriter script = response.getWriter();
						if(fileName != null){
							File delFile = new File(path+"//"+offpostID+".jpg");
							if(delFile.exists()){
								delFile.delete();
							}
							Path oldfile = Paths.get(path+"//"+fileName);
					        Path newfile = Paths.get(path+"//"+(offpostID)+".jpg");
							/* File oldFile = new File(path+"\\"+fileName);
							File newFile = new File(path+"\\"+(postID)+".jpg"); */
							/* oldFile.renameTo(newFile); */
							Files.move(oldfile, newfile);
						}
						/* if(fileName != null){
							String real = "C:\\Users\\j8171\\Desktop\\studyhard\\JSP\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp0\\wtpwebapps\\BBS\\bbsUpload";
							File delFile = new File(real+"\\"+bbsID+"사진.jpg");
							if(delFile.exists()){
								delFile.delete();
							}
							File oldFile = new File(realFolder+"\\"+fileName);
							File newFile = new File(realFolder+"\\"+bbsID+"사진.jpg");
							oldFile.renameTo(newFile);
						} */
				 		script.println("<script>");
						script.println("location.href=\'offlinePost.jsp?boardID="+boardID+"\'");
				 		script.println("</script>");
					}
				}
	}
		
	%>
</body>
</html>