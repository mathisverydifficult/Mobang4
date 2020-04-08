<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <% request.setCharacterEncoding("UTF-8"); %>
<% response.setContentType("text/html; charset=UTF-8"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="resources/css/reset.css">
<link rel="stylesheet" type="text/css" href="resources/css/agent_header.css">
<link rel="stylesheet" type="text/css" href="resources/css/agent_footer.css">

<script type="text/javascript" src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<style type="text/css">
@font-face { font-family: 'RIDIBatang'; src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_twelve@1.0/RIDIBatang.woff') format('woff'); font-weight: normal; font-style: normal; }
/* 기본 스타일 초기화 태그 -> 초기화를 하는 이유? 브라우저마다 각각의 태그에 들어있는 default style이 다르므로, 브라우저마다 레이아웃이 달라지는 오류를 범하기 위해 초기화를 선언해준다. */
*{margin: 0; padding: 0;} /* *는 모든 태그에 적용되는 스타일이므로 신중히 사용해야함. 전체 태그에 들어있는 margin과 padding을 없애준다. */
a{text-decoration: none; color:inherit;} /* a태그엔 기본적으로 text-decoration: underline 이 적용되어있어 a태그를 사용하면 텍스트 아래 밑줄이 자동으로 생긴다. 이를 없애주기 위한 것. color:inherit은 a태그는 부모요소의 color를 상속받지 않아서 일일히 a태그에 color스타일을 지정해줘야 하는데 이런 불편함을 없애기 위해 inherit(상속)속성을 미리 지정해준다.*/
ul,li,ol{
    list-style: none;
}
	.saleswrap{width: 100%; min-height: 100vh;}
	.saleswrap .top{padding-top: 150px; position: relative; width: 1200px;
					margin-left: auto; margin-right: auto; margin: 0px auto;}
	.saleswrap .top > div {margin: 0 auto;}
	.top > div > img {margin-left : 400px;}
	.saleswrap .middle{position: relative; width: 1200px; margin-left: auto; margin-right: auto; margin: 0px auto;}
	.saleswrap .bottom{position: relative; width: 1200px; margin-left: auto; margin-right: auto; margin: 100px auto;}
	.middle > div {margin-left: 400px;}
	.bottom > div {margin: 100px 400px;}
	.bottom > div > a {
		background-color: rgb(51, 85, 139); 
		color: #fff;
		border: none;
		border-radius: 5px;
		margin-left:40px;
	}
</style>
</head>
<body>
<%@ include file="form/agent_header.jsp" %>
	
	<div class="saleswrap">
		
		<div class="top">
			<div>
				<img alt="이미지 표시불가" src="./resources/agent/img/money.svg" width="400px">
			</div>
		</div>
		<div class="middle">
			<div>
				<h1>결제가 완료되었습니다!</h1>
				<p>구매하신 상품은 마이페이지에서 확인하실 수 있습니다.</p>
			</div>
		</div>
		<div class="bottom">
			<div>
				<a href = "agent_home.all">메인페이지로</a>
				<a href = "agent_mypage.agent">구매상품 확인</a>
			</div>
		</div>
	
	</div>



<%@ include file="form/agent_footer.jsp" %>
</body>
</html>