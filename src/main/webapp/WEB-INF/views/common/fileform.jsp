<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix = "form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<script src="https://code.jquery.com/jquery-3.4.1.min.js" crossorigin="anonymous"></script>

<title>Insert title here</title>
</head>
<body>
 
	<h1>파일업로드 및 저장 연습</h1>
	<br/>
	<form:form action="insertfile.all" method="post" enctype="multipart/form-data" modelAttribute="uploadFile" >
		file<br/>
		<input type="file" id="gdsImg" name="mpfile" placeholder="파일선택 "/><br/>
		<p style="color:red; font-weight:bold;"><form:errors path="mpfile"/></p> 
		<br/><br/>
		<br/><br/>
		content<br/>
		<textarea rows="10" cols="40" name="content" style="border: 1px solid;"></textarea><br/>
		<input type="submit" value="업로드"/>
	</form:form>
	<div class = "select_img"><img src=""/></div><br/>
	
	<!-- 선택한 파일에 대한 이미지가 출력되게 하는 스크립트 -->
	
	<script>
	  $("#gdsImg").change(function(){
		   if(this.files && this.files[0]) { 
		    var reader = new FileReader;
		    reader.onload = function(data) {
		     $(".select_img img").attr("src", data.target.result).width(500);        
		    }
		    reader.readAsDataURL(this.files[0]);
		   }
	  });
	 </script>
	<%=request.getRealPath("/") %>
	 -->
	
	<h1>다중파일업로드 및 저장 연습</h1>
	<br/>
	<form:form action="requestupload.all" method="post" enctype="multipart/form-data" modelAttribute="uploadFile" >
		file<br/>
		<input multiple="multiple" type="file" name="file" placeholder="파일선택 "/><br/>
		<p style="color:red; font-weight:bold;"><form:errors path="mpfile"/></p> 
		<br/><br/>
		<input type="text" name="src"/>
		<input type="submit" value="업로드"/>
	</form:form>
	

	<%=request.getRealPath("/") %>
	
</body>
</html>