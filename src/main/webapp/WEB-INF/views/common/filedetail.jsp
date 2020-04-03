<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spirng" uri="http://www.springframework.org/tags" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://code.jquery.com/jquery-3.4.1.min.js" crossorigin="anonymous"></script>
<title>Insert title here</title>
</head>
<body>

<h1>controller에서 바로 넘긴 데이터</h1>
<!-- controller에서  object 생성해서 넘긴 정보들 -->
<label>번호 : </label>${fileObj.seqQ }<br/>
<label>파일 명 : </label>${fileObj.name }<br/>
<label>파일설명 : </label>${fileObj.content }<br/>
 
<h1>controller에서 db의 값을 불러와서 넘긴 데이터</h1>
<label>번호 : </label>${dto.seqQ }<br/>
<label>파일 명 : </label>${dto.name }<br/>
<label>파일설명 : </label>${dto.content }<br/>

<h1>사진 불러오기</h1>
<h2>${imagepath }</h2>
<img src="${imagepath }"><br/>

<p>${filenames }</p>
<p>${list }</p>

<form action="download.all" method="post">
		<input type="hidden" name="name" value="${dto.name }"/>
		<input type="submit" value="download"/>
</form>




</body>
</html>