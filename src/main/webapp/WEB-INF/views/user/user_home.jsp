<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
	
<script type="text/javascript"
	src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
		
<title>Insert title here</title>
<link rel="stylesheet" type="text/css"
	href="resources/user/css/user_home.css">
</head>

<jsp:include page="/WEB-INF/views/user/header.jsp" />
<body>
	<div class="container">
		<div class="title">
			<p class="word">어디 살래요?</p>
			<div class="search">
				<svg class="bi bi-search" width="1em" height="1em" viewBox="0 0 16 16" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
				  <path fill-rule="evenodd" d="M10.442 10.442a1 1 0 011.415 0l3.85 3.85a1 1 0 01-1.414 1.415l-3.85-3.85a1 1 0 010-1.415z" clip-rule="evenodd"/>
				  <path fill-rule="evenodd" d="M6.5 12a5.5 5.5 0 100-11 5.5 5.5 0 000 11zM13 6.5a6.5 6.5 0 11-13 0 6.5 6.5 0 0113 0z" clip-rule="evenodd"/>
				</svg>
				<form action="homesearch.user" method="get">
					<input type="text" name="keyword" class="searchbar"> 
					<input id="roombtn" class="btn btn-primary" type="submit" value="방찾기">
				</form>
			</div>
		</div>
		
		<div class="firstpara">
			<div>
				<span style="font-size: 30px;">추천방</span>
			</div>
			<div>
				<div class="viewsection">
					<div class="picturepart">		<!-- 추천방 리스트 뿌려지는 div -->

					</div>
				</div>
			</div>
		</div>
		<div class="secondpara">
			<div class="titleline">
				<span style="font-size: 30px;">최근 본 방</span> 
				<span style="float:right; margin-top:20px; font-size:18px;">
					<a href="favorite_recent.user">모두보기></a>
				</span>
			</div>

			<div>
				<div class="viewsection">
					<div class="picturepart" id="recentpart">		<!-- 최근본방 리스트 뿌려지는 div -->
					<c:choose>
						<c:when test="${empty recentlist}">
							<div class="explain">최근 본 방이 없습니다</div>
						</c:when>
						<c:otherwise>
							<c:forEach items="${recentlist }" var="recent" begin="0" end="3" >
								<div class= "part" style="cursor:pointer;">
									<div class="favorite">
										<img id="${recent.no_rm }" src= "resources/user/img/favorite_${recent.checkdib }.png"/>
									</div>
									<a href="room_detail.user?myno=${recent.no_rm }"> 
										<div class="picture">
											<img src="${recent.picture_rm }">
										</div>
										<p class="explain" id="roomtitle">${recent.title_rm}</p>
										<p class="explain">${recent.addr_rm}</p>	
										<p class="explain">${recent.addr_dt_rm}</p>
									</a>	
								</div>
							</c:forEach>
						</c:otherwise>
					</c:choose>
						
					</div>
				</div>
			</div>
			</div>
							
			
			<div class="thirdpara">
				<div class="titleline">
					<span style="font-size: 30px;">찜한 방</span> 
					<span style="float:right; margin-top:20px; font-size:18px;">
						<a href="favorite_recent.user">모두보기></a>
					</span>
				</div>
				<div>
					<div class="viewsection">
						<div class="picturepart" id="favoritepart">		<!-- 찜한방 리스트 뿌려지는 div -->
<<<<<<< HEAD
						<c:choose>
							<c:when test="${not empty list }">
								
							</c:when>
							<c:otherwise>
								<div class="explain">해당 게시글이 없습니다. 마음에 드는 방을 찜해보세요.</div>
							</c:otherwise>
						</c:choose>
=======
						<c:if test="${empty html}">
							<p>해당 게시글이 없습니다. 로그인 후 마음에 드는 방을 찜해보세요.</p>
						</c:if>
>>>>>>> 947d257786e3ad37a29e787b70bed16960e6d489
						</div>
					</div>
				</div>
			</div>
			<div class="fourpara">						<!-- 제일 하단 사이트맵 -->
				<div class="sitemap">
					<a>원룸</a><br/><br/>
					<a>투 쓰리룸</a><br/><br/>
					<a>오피스텔</a><br/><br/>
					<a>아파트</a>
				</div>
				<div class="sitemap">
					<a href="agent_home.agent">공인중개사</a><br/><br/>
					<a>중개사 회원가입</a><br/><br/><br/><br/>
				</div>
				<div class="sitemap">
					<a>고객지원</a><br/><br/>
					<a>자주묻는 질문</a><br/><br/>
					<a>문의</a><br/><br/>
				</div>
				<div class="sitemap">
					<a>about 모방</a><br/><br/>
					<a>회사소개</a><br/><br/>
					<a>이용약관</a><br/><br/>
					<a>제휴문의</a>
				</div>
			</div>
		
		</div>
		<jsp:include page="/WEB-INF/views/user/footer.jsp" />	
		
	<script type="text/javascript">
	$(document).ready(function(){
		$.ajax({						//찜한방 리스트 가져오는 ajax
			type: "GET", 
			url:"diblist.user",				
			dataType:"json",
			
			success : function(result){
				var list = new Array();
				var html = "";
				
				for(var i=0; i<result.length; i++){
					list[i] = result[i];
					
					
					html += "<div class='part' style='cursor:pointer;'>	"
						+"<div class='favorite'>"
						+"<img id="+list[i].no_rm+" src='resources/user/img/favorite_"+list[i].checkdib+".png' /></div>"	//checkdib : 1번이면 빈하트, 2번이면 빨간하트
						+"<a href='room_detail.all?myno="+list[i].no_rm+"'> <div class='picture'>"
						+"<img src="+list[i].picture_rm.split("/_/")[0]+">"								//이미지 경로
						+"</div>"
					+"<p class='explain' id='roomtitle'>"+list[i].title_rm+"</p>"		//방제목
					+"<p class='explain'>"+list[i].addr_rm+"</p>"						//방주소
					+"<p class='explain'>"+list[i].addr_dt_rm+"</a>"					//건물명
					+"</div>"
					
				}
				$("#favoritepart").html(html);
				
				$(".favorite").click(function(){									//클릭 시 찜하기 기능 
					var favo = $(this).children();									//img태그 하트
						if(favo.attr("src").indexOf("_2") > 0){						//이미지 마지막 index가 _2일 경우
							var test = favo.attr("src").replace("_2.png","_1.png");		//_1로 교체
							favo.attr('src', test);						
							var id = favo.attr('id');								//하트img의 id(방번호) 저장
							favodelete(id);											//찜하기 삭제함수 호출
						} else if(favo.attr("src").indexOf("_1") > 0){				
							var test = favo.attr("src").replace("_1.png","_2.png");
							favo.attr('src', test);
							var id = favo.attr('id');
							favorited(id);											//찜하기 함수 호출
						}
						
			   	});
				
				function favodelete(id){		//찜한 방 취소
					$.ajax({
						type: "GET", 
						url:"dibs_delete.user",
						dataType:"json", 
						data: {
							dibsFv : id			// dibsFv - 방번호 보냄
						},
						success : function(result){
							
						},
						error : function(a, b, c){
							alert("삭제에러 : "+a + b + c);
						}
					});
				}
				
				function favorited(id){			//찜한 방 insert
					$.ajax({
						type: "GET", 
						url:"dibs_insert.user",
						dataType:"json", 
						data: {
							dibsFv : id			// dibsFv - 방번호 보냄
						
						},
						success : function(result){
							
						},
						error : function(a, b, c){
							alert("insert에러"+a + b + c);
						}
					});
				}
				
			},
			error : function(a, b, c){
				alert("에러:"+a + b + c);
			}
		});
		
// 		$.ajax({						//최근 본 방 가져오는 ajax
// 			type: "GET", 
// 			url:"recentlist.user",				
// 			dataType:"json",
			
// 			success : function(result){
// 				var list = new Array();
// 				var html = "";
				
// 				for(var i=0; i<result.length; i++){
// 					list[i] = result[i];
					
// 					html += "<div class='part' style='cursor:pointer;'>	"
// 						+"<div class='favorite'>"
// 						+"<img id="+list[i].no_rm+" src='resources/user/img/favorite_"+list[i].checkdib+".png' /></div>"	//checkdib : 1번이면 빈하트, 2번이면 빨간하트
// 						+"<a href='room_detail.user?myno="+list[i].no_rm+"'> <div class='picture'>"
// 						+"<img src="+list[i].picture_rm+">"								//이미지 경로
// 						+"</div>"
// 					+"<p class='explain' id='roomtitle'>"+list[i].title_rm+"</p>"		//방제목
// 					+"<p class='explain'>"+list[i].addr_rm+"</p>"						//방주소
// 					+"<p class='explain'>"+list[i].addr_dt_rm+"</a>"					//건물명
// 					+"</div>"
					
// 				}
// 				$("#recentpart").html(html);
				
// 				$(".favorite").click(function(){									//클릭 시 찜하기 기능 
// 					var favo = $(this).children();									//img태그 하트
// 						if(favo.attr("src").indexOf("_2") > 0){						//이미지 마지막 index가 _2일 경우
// 							var test = favo.attr("src").replace("_2.png","_1.png");		//_1로 교체
// 							favo.attr('src', test);						
// 							var id = favo.attr('id');								//하트img의 id(방번호) 저장
// 							favodelete(id);											//찜하기 삭제함수 호출
// 						} else if(favo.attr("src").indexOf("_1") > 0){				
// 							var test = favo.attr("src").replace("_1.png","_2.png");
// 							favo.attr('src', test);
// 							var id = favo.attr('id');
// 							favorited(id);											//찜하기 함수 호출
// 						}
						
// 			   	});
				
// 				function favodelete(id){		//찜한 방 취소
// 					$.ajax({
// 						type: "GET", 
// 						url:"dibs_delete.user",
// 						dataType:"json", 
// 						data: {
// 							dibsFv : id			// dibsFv - 방번호 보냄
// 						},
// 						success : function(result){
							
// 						},
// 						error : function(a, b, c){
// 							alert("삭제에러 : "+a + b + c);
// 						}
// 					});
// 				}
				
// 				function favorited(id){			//찜한 방 insert
// 					$.ajax({
// 						type: "GET", 
// 						url:"dibs_insert.user",
// 						dataType:"json", 
// 						data: {
// 							dibsFv : id			// dibsFv - 방번호 보냄
						
// 						},
// 						success : function(result){
							
// 						},
// 						error : function(a, b, c){
// 							alert("insert에러"+a + b + c);
// 						}
// 					});
// 				}
				
// 			},
// 			error : function(a, b, c){
// 				alert("에러:"+a + b + c);
// 			}
// 		});
		
	});
	
	
	
	</script>
</body>
</html>












