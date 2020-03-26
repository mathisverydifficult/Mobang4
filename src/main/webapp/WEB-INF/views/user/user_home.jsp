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
				<input type="text" name="keyword" class="searchbar"> 
				<input id="roombtn" class="btn btn-primary" type="submit" value="방찾기">
			</div>
		</div>
		
		<div class="firstpara">
			<div>
				<span style="font-size: 30px;">추천방</span>
			</div>
			<div>
				<div class="viewsection">
					<div class="picturepart">

						<c:forEach var="part" begin="0" end="3">
							<div class="part">
								<a href="">
									<div class="picture">
										<img src="resources/user/img/cat4.png">
										<div class="favorite">
												<img src="resources/user/img/favorite_1.png">
										</div>
									</div>
								</a>
								<p>
									<a class="picturetitle" href="">비쌈</a>
								<p>
							</div>
						</c:forEach>
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
					<div class="picturepart">
						<c:forEach var="part" begin="0" end="3">
							<div class="part">
								<a href="#">
									<div class="picture">
										<img src="resources/user/img/cat4.png">
										<div class="favorite">
												<img src="resources/user/img/favorite_1.png">
										</div>
									</div>
									<p>
										<a class="picturetitle" href="#">고양이 키우기 가능</a>
									</p>
								</a>
							</div>
						</c:forEach>
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
						<div class="picturepart">
							<c:forEach var="part" begin="0" end="3">
								<div class="part">
									<a href="">
										<div class="picture">
											<img src="resources/user/img/cat4.png">
											<div class="favorite">
												<img src="resources/user/img/favorite_1.png">
											</div>
										</div>
										<p>
											<a class="picturetitle" href="">고양이 키우기 가능</a>
										<p>
									</a>
								</div>
							</c:forEach>
						</div>
					</div>
				</div>
			</div>
			<div class="fourpara">
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
			<jsp:include page="/WEB-INF/views/user/footer.jsp" />
		</div>
		
</body>
</html>