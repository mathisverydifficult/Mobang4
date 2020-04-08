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
<link rel="stylesheet" type="text/css" href="resources/agent/css/agent_roommanage.css">
<script type="text/javascript" src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script type="text/javascript">
$(document).ready(function() {
//	var imagelist = [];
//	<c:forEach items="${list }" var="dto">
//	imagelist.push("${dto.picture_rm}");
//	</c:forEach>
//	alert(imagelist);
//	var filelist = []; //imagelist.split('/_/');
//	for(var i=0;i<imagelist.length;i++){
		//alert(imagelist[i]);
		//alert(imagelist[i].split('/_/')[0]);
//		filelist.push(imagelist[i].split('/_/')[0]);
//	}
	
	//alert(filelist);
//	for(var i=0;i<filelist.length;i++){
//		var index = "#"+i;
//		alert(filelist[i]);
//		$(index).attr('src',filelist[i]);
//	}

});
</script>
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
					<span onclick="location.href='agent_mypageproduct.agent'">더보기></span> <!-- 마이페이지 상품관리랑 연결 -->
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
					<c:forEach items="${filelist }" var="img">
						<div class="roomlist" onclick="">
							<div class="picture"><img src="${img}"></div>
						</div>
					</c:forEach>
					<c:forEach items="${list }" var="dto">
						<div class="roomlist" onclick="location.href='agent_roomdetail.agent?no_rm=${dto.no_rm}'">
							<c:if test="${dto.plusyn_agt eq 'Y' }"><span>플러스+</span><br></c:if>
							<span>${dto.roomtype_rm }</span><br>
							<span class="price">${dto.rent_rm }</span> <span class="price">${dto.roomprice_rm }</span><br>
							<span>${dto.floor_rm }층,${dto.roomsize_rm }m²,관리비${dto.expense_rm }만</span><br>
							<span>${dto.title_rm }</span>							
						</div>
					</c:forEach>
					
							<div class="pagination">
					<ul>
					<c:if test="${pageMaker.prev }">
				    	<li class="arrow"><a href="roommanage.agent${pageMaker.makeQuery(pageMaker.startPage-1) }">&laquo;</a></li>
				    </c:if>
				    <c:forEach begin="${pageMaker.startPage}" end="${pageMaker.endPage}" var="idx">
				    	<li><a href="roommanage.agent${pageMaker.makeQuery(idx) }">${idx }</a></li>
				    </c:forEach>
				    <c:if test="${pageMaker.next && pageMaker.endPage > 0}">
				    <li class="arrow">
				      <a href="roommanage.agent${pageMaker.makeQuery(pageMaker.endPage+1) }">
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