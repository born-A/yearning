<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
<jsp:useBean id="post" class="post.Post" scope="page"/>
<jsp:setProperty name="post" property="postTitle"/>
<jsp:setProperty name="post" property="postContent"/>
<!DOCTYPE html>
<html>
<head>
<!-- <meta charset="UTF-8"> -->
<title>Insert title here</title>
</head>
<body>

    
	<%	
	String userID = null;
	
	String path = "/Users/bona/git/repository/Yearning/src/main/webapp/postUpload";	//사진을 저장할 경로 */
	String encType = "utf-8";				//변환형식
	int maxSize=5*1024*1024;				//사진의 size
	/* 	
	MultipartRequest multi = null;

	//파일업로드를 직접적으로 담당		
	multi = new MultipartRequest(request,path,maxSize,encType,new DefaultFileRenamePolicy());
	
	Enumeration files = multi.getFileNames();
	PrintWriter script = response.getWriter();
	while (files.hasMoreElements()) {
        String name = (String) files.nextElement();
        String filename = multi.getFilesystemName(name);
        String original = multi.getOriginalFileName(name);
        String type = multi.getContentType(name);
        File file = multi.getFile(name);
	}*/
	
/* 	String realFolder="";
	String saveFolder = "postUpload"; */

	int boardID = 0;
	if (request.getParameter("boardID") != null){
		boardID = Integer.parseInt(request.getParameter("boardID"));
	}
	/* ServletContext context = this.getServletContext();
	realFolder = context.getRealPath(saveFolder); */
	
	MultipartRequest multi = null;
	
	multi = new MultipartRequest(request,path,maxSize,encType,new DefaultFileRenamePolicy());		
	String fileName = multi.getFilesystemName("fileName");
	String postTitle = multi.getParameter("postTitle");
	String postContent = multi.getParameter("postContent");

	post.setPostTitle(postTitle);
	post.setPostContent(postContent);
	
	
	
	if(session.getAttribute("userID") != null){
		userID = (String)session.getAttribute("userID"); // 자신에게 할당된 session ID를담아줌.
		
	}
	if(userID == null){
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('로그인을 하세요.')");
		script.println("location.href = 'login.jsp'");
		script.println("</script>");
	}else{
		if(post.getPostTitle() == null || post.getPostContent()== null){
					PrintWriter script = response.getWriter();
					script.println("<script>");
					script.println("alert('입력이 안 된 항목이 있습니다.')");
					script.println("history.back()"); //뒤로가기 수행
					script.println("</script>");
				} else {
					PostDAO postDAO = new PostDAO(); //db 접근 객체 만들기
					int postID = postDAO.write(post.getPostTitle(),userID,post.getPostContent());
					
					if(postID == -1){
						PrintWriter script = response.getWriter();
						script.println("<script>");
						script.println("alert('글쓰기에 실패했습니다.')");
						script.println("history.back()");
						script.println("</script>");
					}
					else { // 회원가입이 이루어진 경우
					        
						PrintWriter script = response.getWriter();
						if(fileName != null){
							Path oldfile = Paths.get(path+"//"+fileName);
					        Path newfile = Paths.get(path+"//"+(postID-1)+".jpg");
							/* File oldFile = new File(path+"\\"+fileName);
							File newFile = new File(path+"\\"+(postID)+".jpg"); */
							/* oldFile.renameTo(newFile); */
							Files.move(oldfile, newfile);
						}
				 		script.println("<script>");
						script.println("location.href= \'view.jsp?postID="+(postID-1)+"\'");
				 		script.println("</script>");
					}
				}
	}
		
	%>
</body>
</html>