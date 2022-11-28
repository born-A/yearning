<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="css/custom.css">

<title>Yearning</title>
</head>
<body>
	
	<div class="container" align="center">
		<div class="col-lg-4"></div>
		<div class="col-lg-4">
			<div class="jumbotron" style="padding-top: 20px;">				
				<h3><br>검색창</h3>
				<form name="c_search">
					<input type="text" id="search">
					<input type="button" onclick="send()" value="검색">
				</form>
			</div>
		</div>
		<div class="col-lg-4"></div>
	</div>
</body>
<script>
	function send(){
		var sb;
		var search = document.c_search.search.value;
		sb = "searchPost.jsp?search=" + search;
		window.opener.location.href= sb;
		window.close();
	}
</script>
</html>