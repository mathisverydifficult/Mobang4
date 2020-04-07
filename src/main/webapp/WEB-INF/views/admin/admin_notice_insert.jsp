<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix = "form" uri="http://www.springframework.org/tags/form" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://code.jquery.com/jquery-3.4.1.min.js" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>

<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>

<link href="https://cdn.jsdelivr.net/npm/summernote@0.8.16/dist/summernote-bs4.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.16/dist/summernote-bs4.min.js"></script>
<style type="text/css">

th, td {
    border: 1px solid #444444;
  }
  
  
</style>


<script type="text/javascript">


function validate() {
	
    // 이메일이 적합한지 검사할 정규식
    var title = document.getElementById("title_nt");
    var content = document.getElementById("summernote");
   
    if(title.value=="") {
    	alert("제목을 입력해주세요");
    	title.focus();
    	return false;
    }
    
    if(content.value=="") {
    	alert("내용을 입력해주세요");
    	content.focus();
    	return false;
    }
    alert("글 작성이 완료되었습니다.");
    return true;
    
   
}


</script>


<title>Insert title here</title>
</head>
<jsp:include page="/WEB-INF/views/admin/form/header.jsp" />
<body>

<div class="jumbotron text-center" id="headblock" style="background-color:#33558B;">
  <div>
  	<h1 style="color: white;">공지사항</h1>
  </div>
</div>



<div class="container">

	<div>
		<form:form method="post" enctype="multipart/form-data" modelAttribute="AgentNoticeDto" action="notice_insert.admin" onsubmit="return validate();">		
			
			<label>제목</label><br/>
			<input type="text" id="title_nt" name="title_nt"/> <br/>
			
								
			<label>내용</label><br/>
			<textarea id="summernote" name="content_nt"></textarea>
			<textarea id="summernote" name="contentQ"></textarea>
		    <script>
		      $('#summernote').summernote({
		        tabsize: 2,
		        height: 400
		      });
		    </script>
			
			
		    <script>
		      $('#summernote').summernote({
		        tabsize: 2,
		        height: 400
		      });
		    </script>
		
			
			
		
			<input type="submit" value="글작성"/>
			<input type="button" value="취소" onclick="location.href='notice_list.admin'"/><br/>
		</form:form>
	</div>
	
	
	<div>
	
	
	
	
	
	
	
	</div>
	
	
</div>


<%@ include file="form/admin_footer.jsp" %>
</body>
</html>