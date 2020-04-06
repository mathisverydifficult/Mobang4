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
<script type="text/javascript" src="https://code.jquery.com/jquery-3.4.1.js"></script>
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<link rel="stylesheet" type="text/css" href="resources/agent/css/reset.css">
<link rel="stylesheet" type="text/css" href="resources/agent/css/agent_roominsert.css">
<script type="text/javascript">

function execDaumPostcode() {
    new daum.Postcode({
        oncomplete: function(data) {
            // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

            // 도로명 주소의 노출 규칙에 따라 주소를 표시한다.
            // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
            var roadAddr = data.roadAddress; // 도로명 주소 변수
            var extraRoadAddr = ''; // 참고 항목 변수

            // 법정동명이 있을 경우 추가한다. (법정리는 제외)
            // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
            if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                extraRoadAddr += data.bname;
            }
            // 건물명이 있고, 공동주택일 경우 추가한다.
            if(data.buildingName !== '' && data.apartment === 'Y'){
               extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
            }
            // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
            if(extraRoadAddr !== ''){
                extraRoadAddr = ' (' + extraRoadAddr + ')';
            }

            // 우편번호와 주소 정보를 해당 필드에 넣는다.
            document.getElementById('postcode').value = data.zonecode;
            document.getElementById("roadAddress").value = roadAddr;
            document.getElementById("jibunAddress").value = data.jibunAddress;
            
            // 참고항목 문자열이 있을 경우 해당 필드에 넣는다.
            if(roadAddr !== ''){
                document.getElementById("extraAddress").value = extraRoadAddr;
            } else {
                document.getElementById("extraAddress").value = '';
            }

            var guideTextBox = document.getElementById("guide");
            // 사용자가 '선택 안함'을 클릭한 경우, 예상 주소라는 표시를 해준다.
            if(data.autoRoadAddress) {
                var expRoadAddr = data.autoRoadAddress + extraRoadAddr;
                guideTextBox.innerHTML = '(예상 도로명 주소 : ' + expRoadAddr + ')';
                guideTextBox.style.display = 'block';

            } else if(data.autoJibunAddress) {
                var expJibunAddr = data.autoJibunAddress;
                guideTextBox.innerHTML = '(예상 지번 주소 : ' + expJibunAddr + ')';
                guideTextBox.style.display = 'block';
            } else {
                guideTextBox.innerHTML = '';
                guideTextBox.style.display = 'none';
            }
        }
    }).open();
}



</script>
</head>
<body>
<%@ include file="form/agent_header.jsp" %>
	<section class = "top_container">
        <div class = "container">
            <div class = "main_title">
                방 수정하기
            </div>
        </div>
    </section>
			<form action="agent_roomupdateres.agent" method="post">
			<input type="hidden" value="${updatedto.no_rm }" name="no_rm">
    <section class = "map_container">
    	<div class = "container _00">
    		<p class = "title">위치정보</p>
				<div class="location">
					<input type="text" id="postcode" placeholder="우편번호" readonly="readonly">
					<input type="button" onclick="execDaumPostcode()" value="우편번호 찾기"><br> 
					<input type="text" id="roadAddress" placeholder="도로명주소" readonly="readonly" name="addr_rm" value="${updatedto.addr_rm }"> 
					<input type="text" id="jibunAddress" placeholder="지번주소">
					<input type="text" id="detailAddress" placeholder="상세주소" name="addr_dt_rm" value="${updatedto.addr_dt_rm }">
					<input type="text" id="extraAddress" placeholder="참고항목" readonly="readonly">
					<span id="guide" style="color: #999; display: none"></span><br> 
				</div>
		</div>
    </section>
    <section class = "photo_container">
    	<div class = "container _01">
    		<p class = "title">사진등록</p>
    		<div class= "photo_wrap">
	    		<div><input type="hidden" value="path" name="picture_rm"></div>
	    		<div></div>
	    		<div></div>
	    		<div></div>
	    		
	    		<div></div>
	    		<div></div>
	    		<div></div>
	    		<div></div>
	    	</div>
    	</div>
    </section>
    <section class = "dt_container">
    	<div class = "container _02">
    		<p class = "title">상세정보</p>
    			<table class = "navy_theme">
    			
    				<tr>
    					<th>계약형태</th>
    					<td>
    						<div>
    							<input type = "radio" name= "rent_rm" value = "월세" <c:if test="${updatedto.rent_rm eq'월세' }">checked</c:if>><span>월세</span>
    							<input type = "radio" name= "rent_rm" <c:if test="${updatedto.rent_rm=='전세' }">checked</c:if> value = "전세"/><span>전세</span>
    							<input type = "radio" name= "rent_rm" <c:if test="${updatedto.rent_rm=='매매' }">checked</c:if> value = "매매"/><span>매매</span>
    						</div>
    					</td>
    				</tr>
    				<tr>	
    					<th>보증금/월세</th>
    					<td><input type = "text" name = "roomprice_rm" placeholder="금액을 입력해주세요." value="${updatedto.roomprice_rm }"/><span>만원</span><span class="remark">※무보증일 경우 0/월세를 입력, 월세가 없을시 보증금/0을 입력하세요.</span></td>
    				</tr>
    				<tr>	
    					<th>방구조</th>
    					<td>
    						<select name = "roomtype_rm" class="roomtype">
    							<option value = "원룸" <c:if test="${updatedto.roomtype_rm=='원룸' }">selected</c:if>>원룸</option>
    							<option value = "투룸" <c:if test="${updatedto.roomtype_rm=='투룸' }">selected</c:if>>투룸</option>
    							<option value = "쓰리룸"<c:if test="${updatedto.roomtype_rm=='쓰리룸' }">selected</c:if>>쓰리룸</option>
    							<option value = "오피스텔"<c:if test="${updatedto.roomtype_rm=='오피스텔' }">selected</c:if>>오피스텔</option>
    							<option value = "아파트"<c:if test="${updatedto.roomtype_rm=='아파트' }">selected</c:if>>아파트</option>
    						</select>
    					</td>
    				</tr>
    				<tr>	
    					<th>관리비</th>
    					<td><input type = "text" name = "expense_rm" value="${updatedto.expense_rm }"/><span>만원</span><span class="remark">※ 없을시엔 0 입력.</span></td>
    				</tr>
    				<tr>	
    					<th>크기</th>
    					<td><span>전용 면적 : </span><input type = "text" name = "roomsize_rm" value="${updatedto.roomsize_rm }"/><span>㎡ </span><br/>
    						<span>계약 면적 : </span><input type = "text" name = "roomsize2_rm" value="${updatedto.roomsize2_rm }"/><span>㎡</span><br/>
    					</td>
    				</tr>
    				<tr>
    					<th>층수</th>
    					<td>
    						<span>해당 층 수 : </span><input type = "text" name = "floor_rm" value="${updatedto.floor_rm }"/><span> / 건물 층 수 : </span><input type = "text" name = "floor2_rm" value="${updatedto.floor2_rm }">
    					</td>
    				</tr>
    				<tr>
    					<th>옵션</th>
    					<td>
    						<div>
    						<c:choose>
    						<c:when test="${updatedto.aircon_rm eq '에어컨' }">
    							<input type = "checkbox" name = "aircon_rm" value = "에어컨" checked="checked"/><span>에어컨</span>
    						</c:when>
    						<c:otherwise>
    							<input type = "checkbox" name = "aircon_rm" value = "에어컨"/><span>에어컨</span>
    						</c:otherwise>
    						</c:choose>
    						<c:choose>
    						<c:when test="${updatedto.ref_rm eq '냉장고' }">
    							<input type = "checkbox" name = "ref_rm" value = "냉장고" checked="checked"/><span>냉장고</span>
    						</c:when>
    						<c:otherwise>
    							<input type = "checkbox" name = "ref_rm" value = "냉장고"/><span>냉장고</span>
    						</c:otherwise>
    						</c:choose>
    						<c:choose>
    						<c:when test="${updatedto.washer_rm eq '세탁기' }">
    							<input type = "checkbox" name = "washer_rm" value = "세탁기" checked="checked"/><span>세탁기</span>
    						</c:when>
    						<c:otherwise>
    							<input type = "checkbox" name = "washer_rm" value = "세탁기"><span>세탁기</span>
    						</c:otherwise>
    						</c:choose>
    						<c:choose>
    						<c:when test="${updatedto.gasrange_rm eq '가스레인지' }">
    							<input type = "checkbox" name = "gasrange_rm" value = "가스레인지" checked="checked"/><span>가스레인지</span>
    						</c:when>
    						<c:otherwise>
    							<input type = "checkbox" name = "gasrange_rm" value = "가스레인지"/><span>가스레인지</span>
    						</c:otherwise>
    						</c:choose>
    						<c:choose>
    						<c:when test="${updatedto.induction_rm eq '인덕션' }">
    							<input type = "checkbox" name = "induction_rm" value = "인덕션" checked="checked"/><span>인덕션</span>
    						</c:when>
    						<c:otherwise>
    							<input type = "checkbox" name = "induction_rm" value = "인덕션"/><span>인덕션</span>
    						</c:otherwise>
    						</c:choose>
    						</div>
    						<div>
    						<c:choose>
    						<c:when test="${updatedto.microwave_rm eq '전자레인지' }">
    							<input type = "checkbox" name = "microwave_rm" value = "전자레인지" checked="checked"/><span>전자레인지</span>
    						</c:when>
    						<c:otherwise>
    							<input type = "checkbox" name = "microwave_rm" value = "전자레인지"/><span>전자레인지</span>
    						</c:otherwise>
    						</c:choose>
    						<c:choose>
    						<c:when test="${updatedto.tv_rm eq 'TV' }">
    							<input type = "checkbox" name = "tv_rm" value = "TV" checked="checked"/><span>TV</span>
    						</c:when>
    						<c:otherwise>
    							<input type = "checkbox" name = "tv_rm" value = "TV"/><span>TV</span>
    						</c:otherwise>
    						</c:choose>
    						<c:choose>
    						<c:when test="${updatedto.desk_rm eq '책상' }">
    							<input type = "checkbox" name = "desk_rm" value = "책상" checked="checked"/><span>책상</span>
    						</c:when>
    						<c:otherwise>
    							<input type = "checkbox" name = "desk_rm" value = "책상"/><span>책상</span>
    						</c:otherwise>
    						</c:choose>
    						<c:choose>
    						<c:when test="${updatedto.bed_rm eq '침대'}">
    							<input type = "checkbox" name = "bed_rm" value = "침대" checked="checked"/><span>침대</span>
    						</c:when>
    						<c:otherwise>
    							<input type = "checkbox" name = "bed_rm" value = "침대"/><span>침대</span>
    						</c:otherwise>
    						</c:choose>
    						<c:choose>
    						<c:when test="${updatedto.closet_rm eq '옷장' }">
    							<input type = "checkbox" name = "closet_rm" value = "옷장" checked="checked"/><span>옷장</span>
    						</c:when>
    						<c:otherwise>
    							<input type = "checkbox" name = "closet_rm" value = "옷장"/><span>옷장</span>
    						</c:otherwise>
    						</c:choose>
    						<c:choose>
    						<c:when test="${updatedto.showhouse_rm eq '신발장' }">
    							<input type = "checkbox" name = "showhouse_rm" value = "신발장" checked="checked"/><span>신발장</span>
    						</c:when>
    						<c:otherwise>
    							<input type = "checkbox" name = "showhouse_rm" value = "신발장"/><span>신발장</span>
    						</c:otherwise>
    						</c:choose>
    						</div>
    					</td>
    				</tr>
    				<tr>
    					<th>베란다</th>
    					<td>
    						<div>
    							<input type = "radio" name= "veranda_rm" <c:if test="${updatedto.veranda_rm=='Y' }">checked</c:if>  value = "Y"/><span>있음 </span>
    							<input type = "radio" name= "veranda_rm" <c:if test="${updatedto.veranda_rm=='N' }">checked</c:if> value = "N"/><span>없음  </span>
    						</div>
    					</td>
    				</tr>
    				<tr>
    					<th>주차</th>
    					<td>
    						<div>
    							<input type = "radio" name= "parking_rm" <c:if test="${updatedto.parking_rm=='Y' }">checked</c:if> value = "Y"/><span>가능  </span>
    							<input type = "radio" name= "parking_rm" <c:if test="${updatedto.parking_rm=='N' }">checked</c:if> value = "N"/><span>불가능  </span>
    						</div>
    					</td>
    				</tr>
    				<tr>
    					<th>엘레베이터</th>
    					<td>
    						<div>
    							<input type = "radio" name= "elevator_rm" checked=" <c:if test="${updatedto.elevator_rm=='Y' }">checked</c:if>" value = "Y"/><span>가능 </span>
    							<input type = "radio" name= "elevator_rm" checked=" <c:if test="${updatedto.elevator_rm=='N' }">checked</c:if>" value = "N"/><span>불가능 </span>
    						</div>
    					</td>
    				</tr>
    				<tr>
    					<th>반려동물</th>
    					<td>
    						<div>
    							<input type = "radio" name= "animal_rm"  <c:if test="${updatedto.animal_rm=='Y' }">checked</c:if> value ="Y"/><span>가능 </span>
    							<input type = "radio" name= "animal_rm"  <c:if test="${updatedto.animal_rm=='N' }">checked</c:if> value = "N"/><span>불가능 </span>
    							<input type = "radio" name= "animal_rm" <c:if test="${updatedto.animal_rm=='고양이만' }">checked</c:if> value = "고양이만"/><span>고양이만 </span>
    							<input type = "radio" name= "animal_rm" <c:if test="${updatedto.animal_rm=='확인필요' }">checked</c:if> value = "확인 필요"/><span>확인필요 </span>
    						</div>
    					</td>
    				</tr>
    				<tr>
    					<th>입주가능일</th>
    					<td><input type = "date" name = "roomin_rm" value="${updatedto.roomin_rm }"/></td>
    				</tr>
    				<tr>
    					<th>제목</th>
    					<td><input type = "text" name = "title_rm" class="content" value="${updatedto.title_rm }"/></td>
    				</tr>
    				<tr>
    					<th>상세설명</th>
    					<td><textarea rows="20" cols="60" name = "content_rm">${updatedto.content_rm }</textarea></td>
    				</tr>
    			</table>
    			<div class="button">
    				<input type="submit" value="수정완료">
    				<input type="button" value="취소" onclick="location.href='agent_roomdetail.agent?no_rm=${updatedto.no_rm}'">
    			</div>
    	</div>
    </section>
    		</form>
<%@ include file="form/agent_footer.jsp" %>
</body>
</html>