<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.4.1.js"></script>
<link rel="stylesheet" type="text/css" href="resources/agent/css/reset.css">
<style type="text/css">
@font-face { font-family: 'RIDIBatang'; src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_twelve@1.0/RIDIBatang.woff') format('woff'); font-weight: normal; font-style: normal; }

/* 기본 스타일 초기화 태그 -> 초기화를 하는 이유? 브라우저마다 각각의 태그에 들어있는 default style이 다르므로, 브라우저마다 레이아웃이 달라지는 오류를 범하기 위해 초기화를 선언해준다. */
	*{margin: 0; padding: 0;} /* *는 모든 태그에 적용되는 스타일이므로 신중히 사용해야함. 전체 태그에 들어있는 margin과 padding을 없애준다. */
	a{text-decoration: none; color:inherit;} /* a태그엔 기본적으로 text-decoration: underline 이 적용되어있어 a태그를 사용하면 텍스트 아래 밑줄이 자동으로 생긴다. 이를 없애주기 위한 것. color:inherit은 a태그는 부모요소의 color를 상속받지 않아서 일일히 a태그에 color스타일을 지정해줘야 하는데 이런 불편함을 없애기 위해 inherit(상속)속성을 미리 지정해준다.*/

	.container {
        width: 1200px;
        margin: 0 auto; /*block요소를 가운데로 오게 해준다.*/
    }
    .main_title{position: relative; width: 100%; min-width:1200px; background-color: rgb(51,85,139); color: rgb(255,255,255); height: 300px; margin-top: 150px;
			text-align: center; font-size: 50px; line-height: 5;}
    .navy_theme th {
    	width: 192px;
    	background-color: rgb(51,85,139);
    	color: white;
    	padding: 25px 0;
    }
    .navy_theme td {
    	width: 965px;
    	padding: 15px 25px;
    	box-sizing: border-box;
    }
    .navy_theme {
    	border-spacing: 0px;
    	border: 2px solid rgb(51,85,139);
    	margin: 0 auto;
    }
    .navy_theme  input {
    	padding : 0 15px;
    	box-sizing: border-box;
    	border: 1px solid rgb(51,85,139);
    	height: 30px;
    }
    .navy_theme textarea{border: 1px solid rgb(51,85,139);}
    
    p.title {
    	margin: 80px 0px 30px 25px;
    	font-size: 1.3em;
    	color: rgb(51,85,139);
    }
    .top_container{    
        background-color: rgb(51,85,139);
        color: #fff;
        text-align: center;
    }
    .top_container h1{
        font-size: 3em;
        margin-bottom: 1em;
    }
    .photo_wrap {
    	margin: 0 auto;
    	width: 1157px;
    }
    .photo_wrap::after{ /* after란 이 태그 마지막에 무언가 들어가게 하는것.*/
    	clear:both;
    	content: "";
    	width: 100%;
    	height: 1px;
    	display: block;
    }
    .photo_wrap > div {
    	width: 200px;
    	height: 200px;
    	border: 2px solid rgb(51,85,139);
    	float: left;
    	margin-left :100px;
    	margin-bottom: 50px;
    }
    .photo_wrap > div:first-child {
    	margin-left:0;
    }
    .photo_wrap > div:nth-child(4n+1) {
    	margin-left:0;
    }
    
    .dt_container{margin-bottom: 25px;}
</style>
</head>
<body>
<%@ include file="form/agent_header.jsp" %>
	<section class = "top_container">
        <div class = "container">
            <div class = "main_title">
                방올리기
            </div>
        </div>
    </section>
    <section class = "map_container">
    	<div class = "container _00">
    		<p class = "title">위치정보</p>
    		<form action="" method="post">
    			<table class = "navy_theme">
    				<tr>
    					<th>주소</th>
    					<td><input type = "text" placeholder="내용을 입력해주세요." name = "addr_rm" required="required" style="width:300px; height:40px;"/><button style = "width:99px; height:41px; background-color: rgb(51,85,139); color: #fff; margin-left:15px; border-radius: 4px;">주소검색</button></td>
    				</tr>
    				<tr>
    					<th>상세주소</th>
    					<td><input type = "text" placeholder="내용을 입력해주세요." name = "addr_dt_rm" style = "width:657px; height:40px"/></td>
    				</tr>
    			</table>
   			</form>
    	</div>
    </section>
    <section class = "photo_container">
    	<div class = "container _01">
    		<p class = "title">사진등록</p>
    		<div class= "photo_wrap">
	    		<div></div>
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
    		<form action="" method="post">
    			<table class = "navy_theme">
    			
    				<tr>	
    					<th>보증금/월세</th>
    					<td><input type = "text" name = "roomprice_rm" placeholder="금액을 입력해주세요."/><span>만원</span><span style="color: red; padding-left:15px;">※무보증일 경우 0/월세를 입력, 월세가 없을시 보증금/0을 입력하세요.</span></td>
    				</tr>
    				<tr>	
    					<th>방구조</th>
    					<td>
    						<select name = "roomtype_rm">
    							<option value = "원룸" selected="selected">원룸</option>
    							<option value = "투룸">투룸</option>
    							<option value = "쓰리룸">쓰리룸</option>
    							<option value = "오피스텔">오피스텔</option>
    							<option value = "아파트">아파트</option>
    						</select>
    					</td>
    				</tr>
    				<tr>	
    					<th>관리비</th>
    					<td><input type = "text" name = "expense_rm" placeholder="금액을 입력해주세요."/><span>만원</span><span style="color: red; padding-left:15px;">※ 없을시엔 0 입력.</span></td>
    				</tr>
    				<tr>	
    					<th>크기</th>
    					<td><span>전용 면적 : </span><input type = "text" name = "roomsize_rm"/><span>㎡ </span><br/>
    						<span>계약 면적 : </span><input type = "text" name = "roomsize2_rm"/><span>㎡</span><br/>
    					</td>
    				</tr>
    				<tr>
    					<th>층수</th>
    					<td>
    						<span>해당 층 수 : </span><input type = "text" name = "floor_rm"/><span> / 건물 층 수 : </span><input type = "text" name = "floor2_rm">
    					</td>
    				</tr>
    				<tr>
    					<th>빌트인</th>
    					<td><input type = "text" name = "builtin_rm" placeholder="ex)에어컨,냉장고,옷장 등"/></td>
    				</tr>
    				<tr>
    					<th>옵션</th>
    					<td>
    						<div>
    							<input type = "checkbox" name = "aircon_rm" value = "에어컨"/><span>에어컨</span>
    							<input type = "checkbox" name = "aircon_rm" value = "냉장고"/><span>냉장고</span>
    							<input type = "checkbox" name = "aircon_rm" value = "세탁기"/><span>세탁기</span>
    							<input type = "checkbox" name = "aircon_rm" value = "가스레인지"/><span>가스레인지</span>
    							<input type = "checkbox" name = "aircon_rm" value = "인덕션"/><span>인덕션</span>
    						</div>
    						<div>
    							<input type = "checkbox" name = "aircon_rm" value = "전자레인지"/><span>전자레인지</span>
    							<input type = "checkbox" name = "aircon_rm" value = "책상"/><span>책상</span>
    							<input type = "checkbox" name = "aircon_rm" value = "책장"/><span>책장</span>
    							<input type = "checkbox" name = "aircon_rm" value = "침대"/><span>침대</span>
    							<input type = "checkbox" name = "aircon_rm" value = "옷장"/><span>옷장</span>
    						</div>
    						<div>
    							<input type = "checkbox" name = "aircon_rm" value = "신발장"/><span>신발장</span>
    							<input type = "checkbox" name = "aircon_rm" value = "싱크대"/><span>싱크대</span>
    						</div>
    					</td>
    				</tr>
    				<tr>
    					<th>주차</th>
    					<td>
    						<div>
    							<input type = "radio" name= "parking_rm" checked="checked" value = "가능"/><span>가능  </span>
    							<input type = "radio" name= "parking_rm" value = "불가능"/><span>불가능  </span>
    						</div>
    					</td>
    				</tr>
    				<tr>
    					<th>엘레베이터</th>
    					<td>
    						<div>
    							<input type = "radio" name= "elevator_rm" checked="checked" value = "가능"/><span>가능 </span>
    							<input type = "radio" name= "elevator_rm" value = "불가능"/><span>불가능 </span>
    						</div>
    					</td>
    				</tr>
    				<tr>
    					<th>반려동물</th>
    					<td>
    						<div>
    							<input type = "radio" name= "animal_rm" checked="checked" value ="가능"/><span>가능 </span>
    							<input type = "radio" name= "animal_rm" value = "불가능"/><span>불가능 </span>
    							<input type = "radio" name= "animal_rm" value = "고양이만"/><span>고양이만 </span>
    							<input type = "radio" name= "animal_rm" value = "확인 필요"/><span>확인필요 </span>
    						</div>
    					</td>
    				</tr>
    				<tr>
    					<th>입주가능일</th>
    					<td><input type = "date" name = "roomin_rm"/></td>
    				</tr>
    				<tr>
    					<th>제목</th>
    					<td><input type = "text" name = "title_rm"/></td>
    				</tr>
    				<tr>
    					<th>상세설명</th>
    					<td><textarea rows="20" cols="60" name = "content_rm"></textarea></td>
    				</tr>
    			</table>
    		</form>
    	</div>
    </section>
<%@ include file="form/agent_footer.jsp" %>
</body>
</html>