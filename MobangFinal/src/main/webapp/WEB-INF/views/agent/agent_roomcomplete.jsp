<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="resources/agent/css/reset.css">
</head>
<style>
@font-face { font-family: 'RIDIBatang'; src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_twelve@1.0/RIDIBatang.woff') format('woff'); font-weight: normal; font-style: normal; }
	* {
		margin: 0; 
		padding: 0;
	}
	body{
		font-family: "RIDIBatang";
    	-webkit-tap-highlight-color: transparent;
    	text-decoration: none;
	}
	.top_container{    
        padding: 3em 0 2em;
        background-color: rgb(51,85,139);
        color: #fff;
        text-align: center;
    }
    .top_container h1{
        font-size: 3em;
        margin-bottom: 1em;
    }
    .container {
        width: 1200px;
        margin: 0 auto; /*block요소를 가운데로 오게 해준다.*/
    }
	p.title {
    	margin: 80px 0px 30px 25px;
    	font-size: 1.3em;
    	color: rgb(51,85,139);
    }
    .navy_theme {
    	border-spacing: 0px;
    	border: 2px solid rgb(51,85,139);
    	margin: 0 auto;
    }
    .navy_theme th {
    	width: 192px;
    	background-color: rgb(51,85,139);
    	color: white;
    	padding: 25px 0;
    }
    .navy_theme td {
    	width: 965px;
    	padding: 15px 25px;
    	box-sizing: border-box;
    }
</style>
<body>
<%@ include file="form/agent_header.jsp" %>
	<section class = "top_container">
        <div class = "container">
            <div class = "main_title">
                <h1>방올리기</h1>
            </div>
        </div>
    </section>
    <section>
    	<div class = "container">
    		<p class = "title">방 올리기 완료</p>
    		<table class = "navy_theme">
    			<tr>
    				<th>주소</th>
    				<td>주소예제</td>
    			</tr>
    			<tr>
    				<th>보증금 / 월세</th>
    				<td>500 / 35만원</td>
    			</tr>
    			<tr>
    				<th>건물형태</th>
    				<td>다세대 / 다가구</td>
    			</tr>
    			<tr>
    				<th>방구조</th>
    				<td>원룸</td>
    			</tr>
    			<tr>
    				<th>전용 / 계약면적</th>
    				<td>16.52m2 / 16.52m2</td>
    			</tr>
    		</table>
    	</div>
    </section>
<%@ include file="form/agent_footer.jsp" %>
</body>
</html>