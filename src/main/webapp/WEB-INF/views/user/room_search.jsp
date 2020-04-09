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

	$(".seperate").click(function(){					//클릭한 필터 외에 나머지 필터 hide
		if($(this).next().css("display")=="none" ){
			$(".filterbox").hide();
			var target = $(this).next();
			target.show();
			
// 			filterSearch();
		} else $(this).next().hide();
		
	});
	
});


</script>

</head>
<body>
	<script type="text/javascript"
		src="//dapi.kakao.com/v2/maps/sdk.js?appkey=a8ded785b631dc1b3efa28d959d4d6d5&libraries=services"></script>

	<div class="container">
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
						<div class="seperate" id="roomtypeText">
						
						</div>
						<div class="filterbox">
							<h1>
							방종류
							<p class="dupcheck">중복선택이 가능합니다.</p>
							<ul>
								<li>
									<label class="roomlabel">
										<input name="multi_room_type" type="checkbox" value="원룸" class="checkbox_check" onclick="javascript:chkClick();">
										<span class="CheckBox"></span>
										<span class="checktext">원룸</span>
									</label>
								</li>
								<li>
									<label class="roomlabel">
										<input name="multi_room_type" type="checkbox" value="투룸" class="checkbox_check" onclick="javascript:chkClick();">
										<span class="CheckBox"></span>
										<span class="checktext">투룸</span>
									</label>
								</li>
								<li>
									<label class="roomlabel">
										<input name="multi_room_type" type="checkbox" value="쓰리룸" class="checkbox_check" onclick="javascript:chkClick();">
										<span class="CheckBox"></span>
										<span class="checktext">쓰리룸</span>
									</label>
								</li>
								<li>
									<label class="roomlabel">
										<input name="multi_room_type" type="checkbox" value="오피스텔" class="checkbox_check" onclick="javascript:chkClick();">
										<span class="CheckBox"></span>
										<span class="checktext">오피스텔</span>
									</label>
								</li>
							</ul>
							</h1>
						</div> 
					</div>
					<div class="smallfilter">
						<div class="seperate" id="rentText">
							
						</div>
						<div class="filterbox">
							<h1>
							매물종류
							<p class="dupcheck">중복선택이 가능합니다.</p>
							<ul>
								<li>
									<label class="roomlabel">
										<input name="rent_type" type="checkbox" value="월세" class="checkbox_check" onclick="javascript:chkClick();">
										<span class="CheckBox"></span>
										<span class="checktext">월세</span>
									</label>
								</li>
								<li>
									<label class="roomlabel">
										<input name="rent_type" type="checkbox" value="전세" class="checkbox_check" onclick="javascript:chkClick();">
										<span class="CheckBox"></span>
										<span class="checktext">전세</span>
									</label>
								</li>
								<li>
									<label class="roomlabel">
										<input name="rent_type" type="checkbox" value="매매" class="checkbox_check" onclick="javascript:chkClick();">
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
							<h1>가격대</h1>
						</div> 
					</div>
					<div class="smallfilter" id="manageprice">
						<div class="seperate">
							<span>관리비</span>
						</div>
						<div class="filterbox">
							<h1>관리비</h1>
						</div>
					</div>
					<div class="smallfilter" id="roomsize">
						<div class="seperate">
							<span>방크기</span>
						</div>
						<div class="filterbox">
							<h1>방 크기</h1>
						</div>
					</div>
				</div>

			</div>

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

	
		$(document).ready(function(){		//검색체크
			$(".checkbox_check").prop('checked', true);
			
// 			$(".checkbox_check").change(function(){
				
// 				var array = [];
				
// 		        if( $(this).prop('checked')){
		        	
// 		        	for(var i=0; i<$(this).prop('checked'); i++){
// 		        		var value = $(this).val();
// 		        		array.push(value);
// 		        		 $("#roomtype").find(".seperate").html("<span>"+array[i]+"</span>");
// 		        	}
// 		        }else{
// 		            array.pop(value);
// 		        }
		        
// 		        console.log(array);
		        
// // 		        for(var i=0; i<array; i++){
// // 		           
// // 		            console.log(array);
// // 		        }
// 		    });
		
			
			var keyword = "${keyword}";
			document.getElementById('keyword').value = keyword;
			
// 			var roomTy = "${roomTy}";
// 			document.getElementsByName("multi_room_type").length = roomTy;
// 			var roomtype = document.getElementByName("multi_room_type").length;
// 			for(var i=0; i<roomtype; i++){
// 				if(document.getElementByName("multi_room_type")[i].checked==true){
// 					console.log(document.getElementByName("multi_room_type")[i].value);
// 				}
// 			}
			
			chkClick();
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
		
		function chkClick() {
			var roomTy = document.getElementsByName("multi_room_type").length;
 			var str = "";
 			var str2 = "";
 			

 			for(var i =0; i< roomTy; i++){
 				if(document.getElementsByName("multi_room_type")[i].checked==true){
 					str += document.getElementsByName("multi_room_type")[i].value +" ";
 				}
 			}
 			$("#roomtypeText").text(str);
 			
 			var rentTy = document.getElementsByName("rent_type").length;
 			
 			for(var i =0; i<rentTy; i++){
 				if(document.getElementsByName("rent_type")[i].checked==true){
 					str2 += document.getElementsByName("rent_type")[i].value +" ";
 				}
 			}
 			$("#rentText").text(str2);
 			
 			searchPlace();
		}
		

		function searchPlace(){
 			var keyword = document.getElementById('keyword').value;
 			
 			var roomTy = document.getElementsByName("multi_room_type").length;
 			
 			var roomArray = "";
 			
 			for(var i =0; i< roomTy; i++){
 				if(document.getElementsByName("multi_room_type")[i].checked==true){
					var str = document.getElementsByName("multi_room_type")[i].value;
					roomArray += str +",";
 				}
 			}
 			
 			var rentTy = document.getElementsByName("rent_type").length;
 			
 			var rentArray = "";
 			for(var i =0; i< rentTy; i++){
 				if(document.getElementsByName("rent_type")[i].checked==true){
					var str = document.getElementsByName("rent_type")[i].value;
					rentArray += str +",";
 				}
 			}
 			
			$.ajax({
				type: "GET", 
				url:"room_search.all",		//검색어가 있을경우 검색 리스트만, 없을 경우 전체 리스트 출력
				dataType:"json", 
				data: {
					keyword : keyword,
					roomArray : roomArray,
					rentArray : rentArray
				},
				success : function(result){
					var list = new Array();
					var html = "";
					
					for(var i=0; i<result.length; i++){
						list[i] = result[i];
						
						html += "<div class='room' style='cursor:pointer;'>	"
							+"<div class='favorite'>"
							+"<img id="+list[i].no_rm+" src='resources/user/img/favorite_"+list[i].checkdib+".png' /></div>"	//checkdib : 찜한방 일경우 2, 아닐경우 1
							+"<a href='room_detail.all?myno="+list[i].no_rm+"'> <div class='photo'>"
							+"<img src="+list[i].picture_rm.split("/_/")[0]+">"
							+"</div>"
						+"<p class='explain' id='roomtitle'>"+list[i].title_rm+"</p>"
						+"<p class='explain'>"+list[i].roomtype_rm+"</p>"
						+"<p class='explain'>"+list[i].rent_rm+"</p></a>"
						+"</div>"
						
						
						myaddress(list[i].addr_rm, list[i].addr_dt_rm);		//주소에 따른 좌표 출력함수
						
						
					}
					$(".leftpart").html(html);		//가져온 리스트 화면에 출력
					
					$(".favorite").click(function(){
						var favo = $(this).children();
							if(favo.attr("src").indexOf("_2") > 0){
								var test = favo.attr("src").replace("_2.png","_1.png");		//찜한방(_2) 클릭시 (_1)교체
								favo.attr('src', test);
								var id = favo.attr('id');							//id에 방번호 저장
								favodelete(id);										//삭제함수 호출 (찜한방리스트에서 삭제)
							} else if(favo.attr("src").indexOf("_1") > 0){
								var test = favo.attr("src").replace("_1.png","_2.png");		
								favo.attr('src', test);
								var id = favo.attr('id');
 								favorited(id);					//찜하기 함수 호출 (insert)
							}
							
				   	});
					
				},
				error : function(a, b, c){
					alert("Ajax에러:"+a + b + c);
				}
			});
		}
		
		function favodelete(id){		//찜한방 삭제
			$.ajax({
				type: "GET", 
				url:"dibs_delete.user",
				dataType:"json", 
				data: {
					dibsFv : id
				
				},
				success : function(result){
					
				},
				error : function(a, b, c){
					alert(a + b + c);
				}
			});
		}
		
		function favorited(id){			//찜하기 insert
			$.ajax({
				type: "GET", 
				url:"dibs_insert.user",
				dataType:"json", 
				data: {
					dibsFv : id
				
				},
				success : function(result){
					
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
					var coords=new kakao.maps.LatLng(result[0].y, result[0].x);		//coords에 경도 위도 저장
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





