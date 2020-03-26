<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>모방</title>
<title>Insert title here</title>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.4.1.js"></script>
<link rel="stylesheet" type="text/css" href="resources/agent/css/reset.css">
<script type="text/javascript">
$function(){
	
}
</script>
</head>
<style type="text/css">
@font-face { font-family: 'RIDIBatang'; src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_twelve@1.0/RIDIBatang.woff') format('woff'); font-weight: normal; font-style: normal; }
/* 기본 스타일 초기화 태그 -> 초기화를 하는 이유? 브라우저마다 각각의 태그에 들어있는 default style이 다르므로, 브라우저마다 레이아웃이 달라지는 오류를 범하기 위해 초기화를 선언해준다. */
*{margin: 0; padding: 0;} /* *는 모든 태그에 적용되는 스타일이므로 신중히 사용해야함. 전체 태그에 들어있는 margin과 padding을 없애준다. */
a{text-decoration: none; color:inherit;} /* a태그엔 기본적으로 text-decoration: underline 이 적용되어있어 a태그를 사용하면 텍스트 아래 밑줄이 자동으로 생긴다. 이를 없애주기 위한 것. color:inherit은 a태그는 부모요소의 color를 상속받지 않아서 일일히 a태그에 color스타일을 지정해줘야 하는데 이런 불편함을 없애기 위해 inherit(상속)속성을 미리 지정해준다.*/
ul,li,ol{
    list-style: none;
}
button{
    border: none;
    border-radius: 5px;
}
.premiumwrap{width:100%; min-height: 100vh;}
.container {
	width: 1000px;
	margin: 0 auto;
}
.top_container{position: relative; width: 100%; min-width:1200px; background-color: rgb(51,85,139); color: rgb(255,255,255); height: 300px; margin-top: 150px;
			text-align: center; font-size: 50px; line-height: 5;}

.main_container {
	background-color: #FAFAFA;
}
.search_container {
	width: 100%;
	padding: 80px 0 80px 0;
	margin: 0 auto;
	box-sizing: border-box;

}
.search_bar {
	border-bottom: 2px solid black;
}
.search_bar .search_select {
	width: 200px;
	height: 60px;
	font-size: 19.4px;
	border: none;
	background-color: #FAFAFA;
}
.search_bar .search_keyword {
	width: 700px;
	height: 58px;
	font-size: 1.2em;
	margin-left: 30px;
	border: none;
	background-color: #FAFAFA;
}
.search_button {
	width: 50px;
	height: 24px;
	border:none;
	background-color: #FAFAFA;
}
.com_container > p{
	font-size: 26px;
	margin:50px 0 20px 0;
}
.return_container {
	width: 100%;
	min-height: 650px;
	border-bottom: 1px solid rgb(216, 216, 216);
}
.return {
	width:100%;
	border: 1px solid black;
}
.return_wrap {
	height:178px;
	padding: 0 55px;
	box-sizing:border-box;
}
.return_info {
	height:178px;
	display: block;
	float:left;
	width:50%;
	position: relative;
	padding:55px 0;
	box-sizing:border-box;
}
.return_info > h2 {
	font-weight: normal;
	font-size: 26px;
    line-height: 26px;
    color: rgb(34, 34, 34);
    margin-bottom: 25px;
}
.return_info > .price {
	font-size: 26px;
    font-weight: 700;
    line-height: 26px;
    letter-spacing: -0.5px;
    color: rgb(34, 34, 34);
    position: absolute;
    top: 50%;
    transform: translateY(-50%);
    left: 100px;
}
.return_info > .price_btn {
	width: 145px;
    height: 58px;
	background-color: rgb(83, 89, 254);
    font-size: 18px;
    font-weight: bold;
    color: rgb(255, 255, 255);
    cursor: pointer;
    border-radius: 2px;
    border-width: initial;
    border-style: none;
    border-color: initial;
    border-image: initial;
    outline: none;
    position: absolute;
    top: 50%;
    right:0;
    transform: translateY(-50%);
}
.cc_container {
	padding: 110px 0 140px;
}

.customer_view > h1 {
	text-align: center;
	font-size: 35px;
	margin: 0 0 20px;
}
.customer_view > p {
	text-align: center;
	margin: 0 0 40px;
}
.customer_view > a {
	margin: 0 400px;
	display: block;
    width: 225px;
    color: rgb(34, 34, 34);
    font-size: 18px;
    font-weight: 700;
    line-height: 18px;
    text-align: center;
    box-shadow: rgba(162, 162, 162, 0.14) 3px 3px 6px 0px;
    background-color: rgb(255, 255, 255);
    padding: 20px 0px;
}
.customer_view > a:hover {
	color: rgb(83, 89, 254);
    border-width: 1px;
    border-style: solid;
    border-color: rgb(83, 89, 254);
    border-image: initial;
}
</style>
<body>
<%@ include file="form/agent_header.jsp" %>
	<div class="premiumwrap">
	<section class = "top_container">
		<div class= "container">
				프리미엄 상품
		</div>
	</section>
	<section class = "main_container">
		<div class= "container">
			<div class = "search_container">
				<div class = "search_bar">
					<select class = "search_select">
						<option selected="selected" value = "동 프리미엄 상품">동 프리미엄 검색</option>
						<option value = "역 프리미엄 상품">역 프리미엄 검색</option>
						<option value = "대학교 프리미엄 상품">대학교 프리미엄 검색</option>
					</select>
					<input type = "text" class = "search_keyword" placeholder="동, 역, 대학교 명으로 검색하세요. ex) 역삼동, 강남역, 서울대학교 등"/><input type="button" value = "검색" class = "search_button"/>
				</div>
			</div>
		</div>
	</section>
	<section class = "return_container">
		<div class = "container">
			<div class = "com_container">
				<p><span style="color:skyblue;">search_keyword</span>의 <span>option</span> 가격 결과입니다.</p>
				<div class = "return">
					<div class = "return_wrap">
						<div class = "return_info">
							<h2>서울특별시 강남구 역삼동</h2>
							<p><span style = "color: rgb(136, 136, 136); margin-right: 3px;">입점현황</span>2/4</p>
						</div><div class = "return_info">
							<div class="price">839,000 원</div>
							<button class ="price_btn">구매하기</button>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
	<section class = "cc_container">
		<div class = "container">
			<div class = "customer_view">
				<h1>궁금한 부분이 있으신가요?</h1>
				<p>광고 상품 및 이용에 대한 문의는 언제든지 고객센터에 문의해주세요.</p>
				<a href="agent_fnq.agent">고객센터 바로가기</a>
			</div>
		</div>
	</section>
	</div>
<%@ include file="form/agent_footer.jsp" %>
</body>
</html>