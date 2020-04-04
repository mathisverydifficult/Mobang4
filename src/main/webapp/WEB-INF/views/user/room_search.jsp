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


$(function(){

	$(".seperate").click(function(){
		if($(this).next().css("display")=="none" ){
			$(".filterbox").hide();
			var target = $(this).next();
			target.show();
			
		} else $(this).next().hide();
		
	});
});

</script>

</head>
<body>
	<script type="text/javascript"
		src="//dapi.kakao.com/v2/maps/sdk.js?appkey=a8ded785b631dc1b3efa28d959d4d6d5&libraries=services"></script>

	<div class="container">
		<form action="">
			<div class="searchheader">
				<div class="keyword">
					<a>
					<input type="text" id="keyword" name="keyword" placeholder="잠실동" class="searchbar" /> 
					</a>
					<a>
						<img id="img1" src="resources/user/img/search.PNG" style="width:45px; height:45px; cursor:pointer; margin-bottom:6px;" onclick="searchPlace()"/>		
					</a>
				</div>
				<div class="filter">
					<div class="smallfilter" id="roomtype">
						<div class="seperate">
							<span>원룸, 투·쓰리룸, 오피스텔</span>
						</div>
						<div class="filterbox">
							<h1>
							방종류
							<p class="dupcheck">중복선택이 가능합니다.</p>
							<ul>
								<li>
									<label class="roomlabel">
										<input name=multi_room_type" type="checkbox" class="checkbox_check" checked>
										<span class="CheckBox"></span>
										<span class="checktext">원룸</span>
									</label>
								</li>
								<li>
									<label class="roomlabel">
										<input name=multi_room_type" type="checkbox" class="checkbox_check" checked>
										<span class="CheckBox"></span>
										<span class="checktext">투·쓰리룸</span>
									</label>
								</li>
								<li>
									<label class="roomlabel">
										<input name=multi_room_type" type="checkbox" class="checkbox_check" checked>
										<span class="CheckBox"></span>
										<span class="checktext">오피스텔</span>
									</label>
								</li>
							</ul>
							</h1>
						</div> 
					</div>
					<div class="smallfilter" id="rent">
						<div class="seperate">
							<span>월세, 전세, 매매</span>
						</div>
						<div class="filterbox">
							<h1>
							매물종류
							<p class="dupcheck">중복선택이 가능합니다.</p>
							<ul>
								<li>
									<label class="roomlabel">
										<input name=multi_room_type" type="checkbox" class="checkbox_check" checked>
										<span class="CheckBox"></span>
										<span class="checktext">월세</span>
									</label>
								</li>
								<li>
									<label class="roomlabel">
										<input name=multi_room_type" type="checkbox" class="checkbox_check" checked>
										<span class="CheckBox"></span>
										<span class="checktext">전세</span>
									</label>
								</li>
								<li>
									<label class="roomlabel">
										<input name=multi_room_type" type="checkbox" class="checkbox_check" checked>
										<span class="CheckBox"></span>
										<span class="checktext">매매</span>
									</label>
								</li>
							</ul>
							</h1>
						</div> 
					</div>
					<div class="smallfilter" id="price">
						<div class="seperate">
							<span>가격대</span>
						</div>
						<div class="filterbox">
							<h1>
							매물종류
							
							</h1>
						</div> 
					</div>
					<div class="smallfilter" id="manageprice">
						<div class="seperate">
							<span>관리비</span>
						</div>
						<div class="filterbox">
							<h1>
							매물종류
							
							</h1>
						</div>
					</div>
					<div class="smallfilter" id="roomsize">
						<div class="seperate">
							<span>방크기</span>
						</div>
						<div class="filterbox">
							<h1>
							매물종류
							
							</h1>
						</div>
					</div>
				</div>

			</div>

		</form>


		<div class="row" style="margin-bottom: 50px;">
			<div class="col-sm-6">
				<div class="leftpart">
		 			
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
	
		$(document).ready(function(){
			
			var keyword = "${keyword}";
			document.getElementById('keyword').value = keyword;
			searchPlace();
			
		});
		// 마커를 클릭하면 장소명을 표출할 인포윈도우 입니다
		var infowindow = new kakao.maps.InfoWindow({
			zIndex : 1
		});
		var container = document.getElementById('map');
		var options = {
			center : new kakao.maps.LatLng(37.271, 127.435),
			level : 6
		};
		
// 		var clusterer = new kakao.maps.MarkerClusterer({
// 	        map: map, // 마커들을 클러스터로 관리하고 표시할 지도 객체 
// 	        averageCenter: true, // 클러스터에 포함된 마커들의 평균 위치를 클러스터 마커 위치로 설정 
// 	        minLevel: 10 // 클러스터 할 최소 지도 레벨 
// 	    });
		

		var map = new kakao.maps.Map(container, options); //지도 생성
		
		var geocoder=new kakao.maps.services.Geocoder(); //주소 - 좌표 변환 객체 생성

		function searchPlace(){
 			var keyword = document.getElementById('keyword').value;
 			
// 			$("#roomtype>.checkbox_check:checked").each(function(){
// 				var roomtype = $(this).val();
// 				alert("벨류값확인:" + roomtype);
// 			})
			
			$.ajax({
				type: "GET", //요청 메소드 방식
				url:"room_search.user",
				dataType:"json", //서버가 요청 URL을 통해서 응답하는 내용의 타입
				data: {
					keyword: keyword
				},
				success : function(result){
					var list = new Array();
					var html = "";
					
					for(var i=0; i<result.length; i++){
						list[i] = result[i];
						
						html += "<div class='room' style='cursor:pointer;'>	"
							+"<div class='favorite'>"
							+"<img id="+list[i].no_rm+" src='resources/user/img/favorite_1.png' /></div>"
							+"<a href='room_detail.user?myno="+list[i].no_rm+"'> <div class='photo'>"
							+"<img src="+list[i].picture_rm+">"
							+"</div>"
						+"<p class='explain' id='roomtitle'>"+list[i].title_rm+"</p>"
						+"<p class='explain'>"+list[i].addr_rm+"</p>"
						+"<p class='explain'>"+list[i].addr_dt_rm+"</a>"
						+"</div>"
						myaddress(list[i].addr_rm, list[i].addr_dt_rm);
						
						
					}
					$(".leftpart").html(html);
					
					$(".favorite").click(function(){
						var favo = $(this).children();
							if(favo.attr("src").indexOf("_2") > 0){
								var test = favo.attr("src").replace("_2.png","_1.png");
								favo.attr('src', test);
							} else if(favo.attr("src").indexOf("_1") > 0){
								var test = favo.attr("src").replace("_1.png","_2.png");
								favo.attr('src', test);
								var id = favo.attr('id');
 								favorited(id);
							}
							
				   	});
					
				},
				error : function(a, b, c){
					alert(a + b + c);
				}
			});
		}
		
		function favorited(id){
			$.ajax({
				type: "GET", //요청 메소드 방식
				url:"favorite_dibs.user",
				dataType:"json", //서버가 요청 URL을 통해서 응답하는 내용의 타입
				data: {
					dibsFv : id
				},
				success : function(result){
					alert(result);
				},
				error : function(a, b, c){
					alert(a + b + c);
				}
			});
		}
		

		//주소로 좌표 검색
		function myaddress(address, roomname){
			geocoder.addressSearch(address, function(result, status){	//keyword = 올라와 있는 매물의 주소로 변경!
				
				//정상적으로 검색이 완료됐을 경우
				if(status===kakao.maps.services.Status.OK){
					var coords=new kakao.maps.LatLng(result[0].y, result[0].x);
					yy = result[0].x;
					xx = result[0].y;
					
					//결과값으로 받은 위치를 마커로 표시
					var marker = new kakao.maps.Marker({
						map : map,
						position: coords
					});
					map.setCenter(coords);
				}
				kakao.maps.event
				.addListener(
					marker,
					'click',
					function() {
						//마커를 클릭하면 장소명이 인포 윈도우에 표출
						infowindow.setContent('<div style="padding:5px; font-size:12px;">'+ roomname + '</div>');
						infowindow.open(map, marker);
					});
				
			})
			
		}

		//키워드 검색 완료 시 호출되는 콜백함수
// 		function placesSearchCB(data, status, pagination) {
// 			if (status === kakao.maps.services.Status.OK) {

// 				// 검색된 장소 위치를 기준으로 지도 범위를 재설정하기위해
// 				// LatLngBounds 객체에 좌표를 추가합니다
// 				var bounds = new kakao.maps.LatLngBounds();

// 				for (var i = 0; i < data.length; i++) {
// 					displayMarker(data[i]);
// 					bounds.extend(new kakao.maps.LatLng(data[i].y, data[i].x));
// 				}

// 				// 검색된 장소 위치를 기준으로 지도 범위를 재설정합니다.
// 				map.setBounds(bounds);
// 			}
// 		}
		//지도에 마커를 표시하는 함수입니다
// 		function displayMarker(place) {

// 			//마커를 생성하고 지도에 표시합니다
// 			var marker = new kakao.maps.Marker({
// 				map : map,
// 				position : new kakao.maps.LatLng(place.y, place.x)
// 			});

// 			//마커에 클릭이벤트 등록
// 			kakao.maps.event
// 					.addListener(
// 							marker,
// 							'click',
// 							function() {
// 								//마커를 클릭하면 장소명이 인포 윈도우에 표출
// 								infowindow
// 										.setContent('<div style="padding:5px; font-size:12px;">'
// 												+ place.place_name + '</div>');
// 								infowindow.open(map, marker);
// 							});
// 		}
		
	</script>

</body>
</html>





