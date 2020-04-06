<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8"); %>
<% response.setContentType("text/html; charset=UTF-8"); %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="resources/agent/css/reset.css">
<script type="text/javascript" src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
</head>
<style>
	/*전체div*/
	.completewrap{width: 100%; min-height:100vh;}
    /* head div (방올리기) */
    .completewrap .completehead{position: relative; width: 100%; min-width:1200px; background-color: rgb(51,85,139); color: rgb(255,255,255); height: 300px; margin-top: 150px;
			text-align: center; font-size: 50px; line-height: 5;}
      /* 버튼 */
    .button{text-align: center;}
    .button>input{margin:10px; background-color: rgba(51, 85, 139,0.85); color: white; font-size: 15px; padding: 11px 25px; cursor: pointer; }
	.button>input:hover{background-color: rgb(51, 85, 139);}
   
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
	<div class = "completewrap">
            <div class = "completehead">
                방올리기
            </div>
    	<div class = "container">
    		<p class = "title">방 올리기 완료</p>
    		<table class = "navy_theme">
    			<tr>
    				<th>주소</th>
    				<td>${dto.addr_rm } ${dto.addr_dt_rm }</td>
    			</tr>
    			<c:choose>
    				<c:when test="${dto.rent_rm=='월세' }">
    					<tr>
    						<th>보증금 / 월세</th><!-- choose문 돌려서 월세면 보증금/월세 나머지 매물가격?  -->
    						<td>${dto.roomprice_rm } 만원</td>
    					</tr>
    				</c:when>
    				<c:otherwise>
    					<tr>
    						<th>매물 가격</th>
    						<td>${dto.roomprice_rm } 만원</td>
    					</tr>
    				</c:otherwise>
    			</c:choose>
    			<tr>
    				<th>방구조</th>
    				<td>${dto.roomtype_rm }</td>
    			</tr>
    			<tr>
    				<th>전용 / 계약면적</th>
    				<td>${dto.roomsize_rm }m2 / ${dto.roomsize2_rm }m2</td>
    			</tr>
    			
    			<c:choose>
    				<c:when test="${empty imagelist }">
    					<tr>
    						<th>사진</th>
    						<td>존재하는 파일이 없습니다.</td>
    					</tr>
    				</c:when>
    				<c:otherwise>
    					<tr>
    						<th>사진존재함</th>
    						<td>
								<c:forEach items="${imagelist }" var="image">
									<p><c:out value="${image}"/></p>
									<p>${image }</p>
									<img src="${image }">
								</c:forEach>
    						</td>
    					</tr>
    				</c:otherwise>
    			</c:choose>
    			
    			
    			
    		</table>
    		<div class="button">
    			<input type="button" value="확인" onclick="location.href='roommanage.agent?email=missdla4929@naver.com'">
    		</div>
    	</div>
    </div>
<%@ include file="form/agent_footer.jsp" %>
</body>
</html>