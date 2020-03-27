<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
 <% request.setCharacterEncoding("UTF-8"); %>
<% response.setContentType("text/html; charset=UTF-8"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>모방 | 공인중개사</title>
<link rel="stylesheet" type="text/css" href="resources/agent/css/reset.css">
<script type="text/javascript" src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<style type="text/css">
	.imgwrap{width: 100%; min-width:1200px; min-height:100vh; height: 680px; padding-top: 186px; background:linear-gradient( rgba(0, 0, 0, 0.3), rgba(0, 0, 0, 0.3) ), url(resources/agent/img/agent_main.jpg);
    background-size: cover;  background-position: center center; background-repeat: no-repeat; }
    .imgwrap .mainwrap{position: relative; width: 100%; height: 100%;  margin: 0px auto;}
    .imgwrap .mainwrap h1{margin-bottom: 20px; font-size: 50px; font-weight: 700; color: rgb(255, 255, 255);
    text-shadow: rgba(0, 0, 0, 0.29) 0px 2px 0px; line-height: 65px; margin-left: 100px;}
    .imgwrap .mainwrap h1 p:nth-child(2){color: rgb(51, 85, 139); position: relative; font-size: 70px; margin-top: 10px;}
    .mainwrap>a{display: inline-block; width: 228px; height: 58px; background-color: rgb(51, 85, 139); font-size: 18px;
    font-weight: 700; color: rgb(255, 255, 255); line-height: 58px; text-align: center; border-width: 1px;
    border-style: solid; border-color: rgb(51, 85, 139); border-image: initial; margin-left: 100px;}
    

</style>

<script type="text/javascript">
window.onload = function (){
	// 브라우저 축소하면 가로스크롤바 생기게하고싶은데ㅠ
	var windowWidth = $(window).innerWidth();
	//$(".imgwrap").css('width',windowWidth);
	if(windowWidth>1200){
		//document.getElementsByTagName('body').style.overflow-x="hidden";
		$('body').css('overflow-x','hidden');
	}
}

</script>
</head>
<body>

	<%@ include file="form/agent_header.jsp" %>

	<div class="imgwrap">
		<div class="mainwrap">
			<h1>
				<p>모든 부동산 매물관리는</p>
				<p>모방</p>
			</h1>
			<a href="roommanage.agent">시작하기</a>
		</div>
	</div>


	<%@ include file="form/agent_footer.jsp" %>
</body>
</html>