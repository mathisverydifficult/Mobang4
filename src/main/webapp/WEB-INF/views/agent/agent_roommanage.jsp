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
<style type="text/css">

	/*전체div*/
	.roommanagewrap{width: 100%; min-height:100vh;}
	/* 관리홈 div */
	.roommanagewrap .managewrap{position:relative; width: 1200px; height: 500px; padding-top:100px;
	margin-left: auto; margin-right: auto; margin: 0px auto; }
	.roommanagewrap .managewrap>span{color:rgb(136, 136, 136); display: block; margin: 20px 10px 10px 10px; font-size: 20px;
	padding-left: 10px; border-left: 2px solid rgb(51, 85, 139);}
	/* 왼쪽 매물등록현황 */
	.roommanagewrap .managewrap .left{width:400px; height:300px; float:left; margin:50px 75px 50px 100px;
	background-color: rgb(51, 85, 139);}
	/* 오른쪽 나의광고 상품 */
	.roommanagewrap .managewrap .right{float: left; width: 450px; height:300px; margin:50px 70px 50px 75px;
	background-color:rgb(51, 85, 139);}
	/* 네모안 요소들 */
	.roommanagewrap .managewrap .smalltitle{color: rgb(255, 255, 255); height: 40px; border-bottom: 1px solid rgb(136, 136, 136); 
	font-size: 15px; padding-left: 20px; line-height: 40px; }
	.roommanagewrap .smalltitle>span{color:rgb(136, 136, 136); position: relative; float: right; font-size: 15px; margin-top: 0px; margin-right: 10px; cursor: pointer;}
	.roommanagewrap .ad{color: rgb(255, 255, 255); font-size: 20px; line-height: 81px; padding-left: 10px;}
	.roommanagewrap .ad .dday{float: right; padding-right: 20px; font-size: 17px;}
	/* 방리스트 div */
	.roommanagewrap .listwrap{width:1200px; padding-top:30px; margin-left: auto; margin-right: auto;}
	.roommanagewrap .listwrap>span{color:rgb(136, 136, 136); display: block; margin: 20px 10px 10px 10px; font-size: 20px;
	padding-left: 10px; border-left: 2px solid rgb(51, 85, 139);}
	.roommanagewrap .roomlistnone{text-align: center; font-size: 27px; padding-top: 110px; height: 290px;}
	.roommanagewrap .roomlist{overflow:hidden; height:auto; display: inline-block;}
	.roommanagewrap .roomlist .picture>img{width: 360px; height: 280px; float: left; margin: 10px;}
	
	
</style>
</head>
<body>
<%@ include file="form/agent_header2.jsp" %>
	<div class="roommanagewrap">
		<div class="managewrap">
			<span>관리 홈</span>
			<div class="left">
				<div class="smalltitle">
					매물 등록 현황
				</div>
				<div style="color:white; padding: 76px 0 0 122px; font-size: 40px;">
					32 / 50 <!-- db 데이터 불러와야함 나중에 고치기 -->
				</div>
			</div>
			<div class="right">
				<div class="smalltitle">
					나의 광고 상품
					<span onclick="location.href='agent_mypageproduct.agent?email=missdla4929@naver.com'">더보기></span> <!-- 마이페이지 상품관리랑 연결 -->
				</div>
				<div class="ad">일반 상품<span></span><span class="dday">D-120</span></div>
				<div class="ad">프리미엄 상품<span></span><span class="dday">D-60</span></div>
				<div class="ad">플러스 상품<span class="dday">구매하기</span></div><!-- 구매 했을 경우 디데이 / 구매 안했을 경우 구매하기 -->
			</div>
		</div>
		<div class="listwrap">
			<span>올린 방 목록</span>
			<!-- list 있을 경우와 없을경우 db불러오기 -->
			<!-- 없을 경우 올린 방 목록이 없습니다 / 있을 경우 6개씩 나오게 스크롤페이징 or 숫자로 페이징 -->
			<c:choose>
				<c:when test="${empty list }">
					<div class="roomlistnone">
						방을 등록해 주세요
					</div>
				</c:when>
				<c:otherwise>
					<c:forEach items="${list }" var="dto">
						<div class="roomlist" onclick="">
							<div class="picture"><img src="resources/agent/img/sampleroom.jpg"> </div>
							<c:if test="${dto.plusyn_agt eq 'Y' }"><span>플러스+</span><br></c:if>
							<span>${dto.roomtype_rm }</span><br>
							<span>${dto.rent_rm }</span> <span>${dto.roomprice_rm }</span><br>
							<span>${dto.floor_rm } 층,${dto.roomsize_rm }m²,관리비${dto.expense_rm }만</span><br>
							<span>${dto.title_rm }</span>							
						</div>
					</c:forEach>
					
							<div class="pagination">
					<ul>
					<c:if test="${pageMaker.prev }">
				    	<li class="arrow"><a href="roommanage.agent${pageMaker.makeQuery(pageMaker.startPage-1) }&email=missdla4929@naver.com">&laquo;</a></li>
				    </c:if>
				    <c:forEach begin="${pageMaker.startPage}" end="${pageMaker.endPage}" var="idx">
				    	<li><a href="roommanage.agent${pageMaker.makeQuery(idx) }&email=missdla4929@naver.com">${idx }</a></li>
				    </c:forEach>
				    <c:if test="${pageMaker.next && pageMaker.endPage > 0}">
				    <li class="arrow">
				      <a href="roommanage.agent${pageMaker.makeQuery(pageMaker.endPage+1) }&email=missdla4929@naver.com">
				        &raquo;
				      </a>
				    </li>
				     </c:if> 
				  </ul>
			</div>
				</c:otherwise>
			</c:choose>
			
		</div>
	</div>


<%@ include file="form/agent_footer.jsp" %>
</body>
</html>