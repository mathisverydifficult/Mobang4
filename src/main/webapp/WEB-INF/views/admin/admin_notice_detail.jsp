<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

  
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<title></title>
</head>
<body>



<div class ="container">
<input type="hidden" value="${dto.seq_nt }" name="seqQ"/> <!-- 수정할 때 글봐야하니까. -->
	
		<h2>${dto.title_nt }</h2>	
		<br/>
		
		
		<p>내용</p>
		<p>${dto.content_nt }</p>
		<input type="button" value="수정" onclick="location.href='notice_update.admin?seq_nt=${dto.seq_nt}'"/>
		<input type="button" value="취소" onclick="location.href='notice_list.admin'"/>
		<input type="button" value="삭제" onclick="location.href='notice_delete.admin?seq_nt=${dto.seq_nt}'"/>
		
		
</div>




</body>
</html>