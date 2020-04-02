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
<link rel="stylesheet" type="text/css" href="resources/agent/css/agent_mypage.css">
<script type="text/javascript" src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script type="text/javascript">

$(document).ready(function(){
	
	$('.nonclick').on('click',function(){
		$('.clicked').prop('class','nonclick');
		$(this).prop('class','clicked');
		var viewid = $(this).attr('id');
		if(viewid=="account"){
			$('.mypagewrap .account').css('display','');
			$('.mypagewrap .product').css('display','none');
			$('.mypagewrap .review').css('display','none');
		}else if(viewid=="product"){
			$('.mypagewrap .product').css('display','inline');
			$('.mypagewrap .account').css('display','none');
			$('.mypagewrap .review').css('display','none');
		} else{
			$('.mypagewrap .product').css('display','none');
			$('.mypagewrap .account').css('display','none');
			$('.mypagewrap .review').css('display','block');
		}
	});
	$("#account").prop('class','clicked');
	
});

</script>
</head>
<body>
<%@ include file="form/agent_header2.jsp" %>
	<div class="mypagewrap">
		<span>마이페이지</span>
		<article class="menu">
			<div class="nonclick" id="account">계정 관리</div>
			<div class="nonclick" id="product">상품 관리</div>
			<div class="nonclick" id="review">리뷰/문의 관리</div>
		</article>
		
		<!-- 계정관리 -->
		<article class="account">
			<span>공인중개사 정보</span>
			<div>
				<div>
					<div class="titlelist">중개사무소명</div>
					<div class="list">${account.agtname_agt }</div><!-- db정보 받아오기 -->
				</div>
				<div>
					<div class="titlelist">중개사 등록번호</div>
					<div class="list">${account.qualno_agt}</div><!-- db정보 받아오기 -->
				</div>
				<div>
					<div class="titlelist">사업자 등록번호</div>
					<div class="list">${account.comno_agt}</div><!-- db정보 받아오기 -->
				</div>
				<div>
					<div class="titlelist">중개사 주소</div>
					<div class="list">${account.addr_agt}</div><!-- db정보 받아오기 -->
				</div>
				<div>
					<div class="titlelist">중개사 대표명</div>
					<div class="list">${account.name_agt}</div><!-- db정보 받아오기 -->
				</div>
			</div>
			<span>개인 정보</span>
			<div>
				<div>	
					<div class="titlelist" style="height: 155px; line-height: 152px; padding-top: 15px;">프로필</div>
					<c:choose>
    					<c:when test="${accont.userfile eq null }">
							<div class="list" style="height: 155px;">
								<img src="resources/agent/img/sampleprofile.png">
							</div>
						</c:when>
						<c:otherwise>
							<div class="list" style="height: 155px;">
							
							</div>
						</c:otherwise>
					</c:choose>					
				</div>
				<div>
					<div class="titlelist">이름</div>
					<div class="list">${account.name}</div><!-- db정보 받아오기 -->
				</div>
				<div>
					<div class="titlelist">이메일</div>
					<div class="list">${account.email}</div><!-- db정보 받아오기 -->
				</div>
				<div>
					<div class="titlelist">휴대폰 번호</div>
					<div class="list">${account.phone}</div><!-- db정보 받아오기 -->
				</div>
			</div>
			<!-- <a href="">내 정보 수정하기</a> -->
		</article>
		
		<!-- 상품관리 -->
		<article class="product">
			<span>상품 내역</span>
			<div class="productlist">
				<table>
					<colgroup>
						<col width="16.6%">
						<col width="16.6%">
						<col width="16.6%">
						<col width="16.6%">
						<col width="16.6%">
						<col width="16.6%">	
					</colgroup>
					<thead><!-- 나중에 보고 바꾸거나 알아서 -->
						<tr>
							<th>결제일</th>
							<th>상품명</th>
							<th>상품분류</th>
							<th>광고개수</th>
							<th>광고기간</th>
							<th>결제금액</th>
						</tr>
					</thead>
					<tbody><!-- 리스트 비었을때 & 있을때 나누자  -->
						<tr><th colspan="6">상품내역이 없습니다.</th></tr>
						<tr>
							<td>2019-04-01</td>
							<td>대학교</td>
							<td>서울대학교</td>
							<td>50개</td>
							<td>2019-04-01 ~ 2019-05-01</td>
							<td>30000원</td>
						</tr>
						<tr>
							<td>2019-03-27</td>
							<td>지하철</td>
							<td>강남역</td>
							<td>50개</td>
							<td>2019-03-27 ~ 2019-04-26</td>
							<td>30000원</td>
						</tr>
					</tbody>
				</table>
			</div>
		<!-- 숫자 pagenation추가 -->
		</article>
		<!-- 리뷰/문의 관리 -->
		<article class="review">
			<span>리뷰 내역</span>
			<span>1:1 문의 내역</span>
		
		</article>
	</div>
	
	

<%@ include file="form/agent_footer.jsp" %>
</body>
</html>