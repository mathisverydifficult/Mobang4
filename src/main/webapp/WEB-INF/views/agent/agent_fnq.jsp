<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8"); %>
<% response.setContentType("text/html; charset=UTF-8"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="resources/agent/css/reset.css">
<link rel="stylesheet" type="text/css" href="resources/agent/css/agent_fnq.css">
<script type="text/javascript" src="https://code.jquery.com/jquery-3.4.1.min.js"></script>

<script type="text/javascript">

	$(document).ready(function() {
		var article = $('.fnqlist .article');
		article.addClass('hide');
		article.find('.aco_view').slideUp(0);
		$('.fnqlist .article .trigger').click(function() {
			var myArticle = $(this).parents('.article:first');
			if (myArticle.hasClass('hide')) {
				article.addClass('hide').removeClass('show');
				article.find('.aco_view').slideUp(100);
				myArticle.removeClass('hide').addClass('show');
				myArticle.find('.aco_view').slideDown(100);
			} else {
				myArticle.removeClass('show').addClass('hide');
				myArticle.find('.aco_view').slideUp(100);
			}
		});
	
		
		selectcategory();
		imagePopup(type);
		
	});
		function imagePopup(type) {
			// var height = ($(document).height()/2)-300;
			var height = (($(window).height()-$('.popup').outerHeight())/2)+10+"px";
			var width = (($(window).width()-$('.popup').outerWidth())/2)+"px";
			//	alert(height);
	//		alert($(window).height());
//			alert($('#layout').outerHeight()); 0
//			alert($('.popup').outerHeight()); 600
			
			
			if(type=='open'){
				$('#layout').attr('style','display:inline');
				$('#layout').height($(document).height());
				$('.popup').css('top',height);
				$('.popup').css('left',width);
			} else if(type=='close'){
				$('#layout').attr('style','display:none');
			}
			
		}
		
		function selectcategory(){
			$('.nonclick').on('click',function(){
				$('.clicked').prop('class','nonclick');
				$(this).prop('class','clicked');
		
				
			});
			$("#all").prop('class','clicked');
		}
</script>	

</head>
<body>
<%@ include file="form/agent_header.jsp" %>
	<div class="fnqwrap">
		<div class="servicehead">
			자주 묻는 질문
		</div>
		<div class="fnqtable">
			<div class="submenu">
				<div class="nonclick" id="all">전체질문</div>
				<div class="nonclick" id="user">회원 정보/계정관리</div>
				<div class="nonclick" id="ad">매물/광고 관리</div>
				<div class="nonclick" id="buy">상품/결제 관리</div>
				<div class="nonclick" id="review">리뷰/실시간 문의</div>
				<div class="nonclick" id="others">기타</div>
			</div>
			<div class="fnqlist">	<!-- fnq 디비 만들어서 카테고리 컬럼에 따라 출력? -->
				<div class="first">
					<div>분류</div>
					<div>제목</div>
				</div>
				<ul>
					<li class="article hide">
						<div class="aco_li">
							<span>회원 정보/계정관리</span><a class="trigger">Q. 아이디는 변경할 수 없나요?</a>
						</div>
						<div class="aco_view" style="display: none;">
							<p>아이디는 회원의 고유 계정으로 활용되는 수단으로 변경 및 수정이 불가합니다.</p>
						</div>
					</li>
					<li class="article hide">
						<div class="aco_li">
							<span>매물/광고 관리</span><a class="trigger">Q. 매물 등록(방등록)은 어떻게 하나요.</a>
						</div>
						<div class="aco_view" style="display: none;">
							<p>매물등록에서 매물을 등록하실 수 있습니다.<br>
매물 정보가 사용자 필터검색시에 반영이 되므로 꼼꼼하고 자세하게 매물정보를 기입하시면 광고노출이 더 많아질 수 있습니다.</p>
						</div>
					</li>
					<li class="article hide">
						<div class="aco_li">
							<span>상품/결제 관리</span><a class="trigger">Q. 상품내역은 어디서 확인하나요.</a>
						</div>
						<div class="aco_view" style="display: none;">
							<p>상품관리 > 상품내역에서 사용중인 상품 정보와 광고기간을 확인하실 수 있습니다.</p>
						</div>
					</li>
					<li class="article hide">
						<div class="aco_li">
							<span>리뷰/실시간 문의</span><a class="trigger">Q. 리뷰에 답변을 하고 싶어요.</a>
						</div>
						<div class="aco_view" style="display: none;">
							<p>리뷰관리에서 확인 후 답변이 가능합니다.</p>
						</div>
					</li>
				</ul>
			
<!--  				
				<table>				
					<colgroup>
						<col width="30%">
						<col width="*">
					</colgroup>
					<thead>
						<tr>
							<th>분류</th>
							<th>제목</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td>회원 정보/계정관리</td>
							<td>Q.아이디는 변경할 수 없나요?</td>
						</tr>
					</tbody>
				</table>		-->
			</div>	<!-- fnqlist -->
			
			<a class="button" onClick="javascript:imagePopup('open')">1:1 문의하기</a>
			
		</div><!-- fnqtable -->
	</div><!-- fnqwrap -->
	<div id="layout" style="display: none;">
		<!-- popup창을 만들어보쟈 -->
		<div class="popup">
			<div class="popuptitle">
				<span>1:1 문의</span>
				<a onclick="javascript:imagePopup('close')"> <img id="close"
					src="resources/agent/img/close.png">
				</a>
			</div>
			<div class="insertform">
				<form action="" method="post">
					<input type="hidden" name="">
					<div class="questionwrap">
						<p>*필수입력항목</p>
						<div class="clearFixed">
							<!-- 자동으로 넘어와서 입력 & 수정불가 -->
							<dl class="name">
								<dt>
									<label for="PI_CUST_NM">이름 <span class="color">*</span></label>
								</dt>
								<!-- 에러시 dd의 error 클래스 추가 -->
								<dd>
									<div class="inp">
										<input type="text" id="PI_CUST_NM" name="PI_CUST_NM"
											value="임미경" title="이름" readonly="">
									</div>

									<div class="errorText">
										<!-- 에러 메시지 -->
									</div>
								</dd>
							</dl>
							<dl class="pwd">
								<dt>
									<label for="EMAIL">이메일 <span class="color">*</span></label>
								</dt>
								<!-- 에러시 dd의 error 클래스 추가 -->
								<dd>
									<div class="inp">
										<input type="email" class="inqEmailValidation" id="EMAIL"
											name="EMAIL" value="missdla4929@naver.com" title="이메일"
											readonly="readonly">
									</div>
									<div class="errorText">
										<!-- 에러 메시지 -->
									</div>
								</dd>
							</dl>
						</div><!-- clearFixed -->
						<dl class="category">
							<dt>
								<label for="Type">제목<span class="color">*</span></label>
							</dt>
							<dd class="clearFixed">
								<div class="selectType">
									<div class="ui-select-wrapper">
										<select class="selectBox" id="FACILITY1" name="FACILITY1">
											<option value="">분류</option>
											<option value="000001">회원 정보/계정관리</option>
											<option value="000002">매물/광고 관리</option>
											<option value="000003">상품/결제 관리</option>
											<option value="000004">리뷰/실시간 문의</option>
											<option value="000005">기타</option>

										</select>
									
									</div>
								</div>
								<div class="title">
									<input type="text" id="title" name="title" maxlength="40" required="">
								</div>

							</dd>
						</dl>
						<dl>
                        <dt style="margin-top: 57px;"><label for="CTNT">내용<span class="color">*</span></label></dt>
                        <dd>
                            <textarea class="textarea" cols="0" rows="0" id="CTNT" name="CTNT" required="" title="내용"></textarea>
                        </dd>
                    </dl>
					</div><!-- questionwrap -->
					<div class="btngroup">
						<input type="submit" value="등록">
					</div>
				</form>
			</div>
		</div>
	</div>

	<%@ include file="form/agent_footer.jsp" %>
</body>
</html>