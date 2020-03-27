<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>
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
<link rel="stylesheet" type="text/css"
	href="resources/user/css/room_search.css">
<jsp:include page="/WEB-INF/views/user/header.jsp" />
<script type="text/javascript">
function favoriteclick(){
	
	$(".favorite").on("click",function(e){
		$(".favorite>img").each(function(){
			if(this.src.indexOf("_2") > 0){
				this.src=this.src.replace("_2.png","_1.png");
			} else if(this.src.indexOf("_1") > 0){
				this.src=this.src.replace("_1.png","_2.png");
			}
		});
		
	});
}
</script>

</head>
<body>
	<script type="text/javascript"
		src="//dapi.kakao.com/v2/maps/sdk.js?appkey=a8ded785b631dc1b3efa28d959d4d6d5&libraries=services"></script>

	<div class="container">
		<form>
			<div class="searchheader">
				<div class="keyword">
					<input type="text" name="keyword" placeholder="잠실동"
						class="searchbar" /> <a onclick="return submit()">검색</a>
				</div>
				<div class="filter">
					<div class="smallfilter">
						<div class="seperate">
							<span>원룸, 투·쓰리룸, 오피스텔</span>
						</div>
					</div>
					<div class="smallfilter">
						<div class="seperate">
							<span>월세, 전세, 매매</span>
						</div>
					</div>
					<div class="smallfilter">
						<div class="seperate">
							<span>가격대</span>
						</div>
					</div>
					<div class="smallfilter">
						<div class="seperate">
							<span>관리비</span>
						</div>
					</div>
					<div class="smallfilter">
						<div class="seperate">
							<span>방크기</span>
						</div>
					</div>
				</div>

			</div>

		</form>


		<div class="row" style="margin-bottom: 50px;">
			<div class="col-sm-6">
				<div class="leftpart">
		 			<c:forEach var="room" begin="0" end="10">
						<div class="room">
							<a>
								<div class="photo">
									<img src="resources/user/img/cat4.png">
									<div class="favorite">
										<img id="img1" src="resources/user/img/favorite_1.png" onclick="favoriteclick()"/>
									</div>
								</div>
								<p class="explain" id="roomtitle">이천역원룸</p>
								<p class="explain">가격 저렴</p>
							</a>
						</div>
					</c:forEach>
				</div>
				<div style="text-align:center;">
					<ul class="pagination">
				    <li>
				      <a href="#" aria-label="Previous">
				        <span aria-hidden="true">&laquo;</span>
				      </a>
				    </li>
				    <li><a href="#">1</a></li>
				    <li><a href="#">2</a></li>
				    <li><a href="#">3</a></li>
				    <li><a href="#">4</a></li>
				    <li><a href="#">5</a></li>
				    <li>
				      <a href="#" aria-label="Next">
				        <span aria-hidden="true">&raquo;</span>
				      </a>
				    </li>
				  </ul>
				 </div>
			</div>
			<div class="col-sm-6">
				<div id="map" style="height: 700px;"></div>
			</div>
		</div>

	</div>
	
	
	
	
	
<jsp:include page="/WEB-INF/views/user/footer.jsp" />

	<script type="text/javascript">
		// 마커를 클릭하면 장소명을 표출할 인포윈도우 입니다
		var infowindow = new kakao.maps.InfoWindow({
			zIndex : 1
		});
		var container = document.getElementById('map');
		var options = {
			center : new kakao.maps.LatLng(37.271, 127.435),
			level : 7
		};

		var map = new kakao.maps.Map(container, options); //지도 생성

		var ps = new kakao.maps.services.Places(); //장소 검색 객체 생성

		ps.keywordSearch('롯데캐슬', placesSearchCB); //키워드로 장소를 검색

		//키워드 검색 완료 시 호출되는 콜백함수
		function placesSearchCB(data, status, pagination) {
			if (status === kakao.maps.services.Status.OK) {

				// 검색된 장소 위치를 기준으로 지도 범위를 재설정하기위해
				// LatLngBounds 객체에 좌표를 추가합니다
				var bounds = new kakao.maps.LatLngBounds();

				for (var i = 0; i < data.length; i++) {
					displayMarker(data[i]);
					bounds.extend(new kakao.maps.LatLng(data[i].y, data[i].x));
				}

				// 검색된 장소 위치를 기준으로 지도 범위를 재설정합니다.
				map.setBounds(bounds);
			}
		}

		//지도에 마커를 표시하는 함수입니다
		function displayMarker(place) {

			//마커를 생성하고 지도에 표시합니다
			var marker = new kakao.maps.Marker({
				map : map,
				position : new kakao.maps.LatLng(place.y, place.x)
			});

			//마커에 클릭이벤트 등록
			kakao.maps.event
					.addListener(
							marker,
							'click',
							function() {
								//마커를 클릭하면 장소명이 인포 윈도우에 표출
								infowindow
										.setContent('<div style="padding:5px; font-size:12px;">'
												+ place.place_name + '</div>');
								infowindow.open(map, marker);
							});
		}
		
		
		
	</script>

</body>
</html>





