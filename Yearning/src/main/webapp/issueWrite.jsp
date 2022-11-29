<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	
	<div class="container">
		<div class="row">
			<form method="post" enctype="multipart/form-data" action="issueWriteAction.jsp">
				<table class="table table-striped" style="text-align:center; border:1px solid #dddddd">
				<thead>
					<tr>
						<th style="background-color:#eeeeee; text-align:center;">Trend 글쓰기</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td><input type="text" calss="form-control" placeholder="글 제목" name="issueTitle" maxlength="50"></td>
					</tr>
					<tr>
						<td><textarea  class="form-control" placeholder="글 내용" name="issueContent" maxlength="2048" style="height:350px;"></textarea></td>
						
					</tr>
					<tr>
				<td><input type="file" name="fileName"></td>
			</tr>
				</tbody>
					
				</table>
				<input type="submit" class="btn btn-primary pull-right" value="글쓰기">
			</form>
			
		</div>
	</div>
</body>
</html>