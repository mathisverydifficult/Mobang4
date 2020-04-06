<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script type="text/javascript" src="https://code.jquery.com/jquery-3.4.1.min.js"></script>

<link rel="stylesheet" type="text/css" href="resources/agent/css/agent_header.css">   
<link rel="stylesheet" type="text/css" href="resources/agent/css/reset.css">   
<style type="text/css">
	
	li{display: inline-block;}
	.roomdetailwrap{width: 100%; min-height:100vh;}
	.roomdetailwrap .top{position:relative; width: 1200px; padding-top:100px; margin-left: auto; margin-right: auto; margin: 0px auto;}
	.roomdetailwrap .top>span{color:rgb(136, 136, 136); display: block; margin: 20px 10px 10px 10px; font-size: 20px;
	padding-left: 10px; border-left: 2px solid rgb(51, 85, 139);}
	.roomdetailwrap .top div span{font-size: 16px; display:inline-block; margin-top: 10px;}
	.roomdetailwrap .top div{font-size: 15px;}
	
	.roomdetailwrap .contentwrap{width:1200px; margin-left: auto; margin-right: auto;}
	.roomdetailwrap .contentwrap .title{color: rgb(51, 85, 139); font-size: 40px;}
	.roomdetailwrap .contentwrap .content{margin: 5px; font-size: 20px;}
	
	.roomdetailwrap .detail{width:1200px; margin-left: auto; margin-right: auto;}	
	.roomdetailwrap .photowrap{text-align: center;}
.roomdetailwrap .photo{width:1200px; padding-top:30px; margin-left: auto; margin-right: auto;
						overflow:hidden; height:auto; display: inline-block;}
.roomdetailwrap .button{padding: 24px 0; margin: 0 -32px; border-top: 1px solid #f4f2ef; text-align: center; background: #f9f9f9;}
.roomdetailwrap .button>input{background-color: rgba(51, 85, 139,0.85); color: white; font-size: 15px; padding: 11px 25px; cursor: pointer;}
.roomdetailwrap .button>input:hover{background-color: rgb(51, 85, 139);}
.roomdetailwrap .photo>img {width: 300px; height: 300px; float: left; margin: 50px;}
.roomdetailwrap .option{width:1200px; margin-left: auto; margin-right: auto; padding-top: 20px;}

	
	.firstpara {
	display: flex;
	-webkit-box-align: center;
	align-items: center;
	width: 100%;
	padding-top: 35px;
	margin-bottom: 35px;
}

.firstpara>li{
	padding-right: 30px;
	margin-left:30px;
	border-right: 1px solid lightgray;
}

.myvalue{
	display: flex;
    -webkit-box-align: center;
    align-items: center;
    height: 37px;
}

.manwon{
	top: 8px;
    position: relative;
}

.phone{
	display: flex;
    align-items: center;
    -webkit-box-pack: end;
    justify-content: flex-end;
    flex: 1 1 0%;
}

.phone>div>p{
	text-align: right;
}

.roomdetailwrap .title{
	border-bottom: 1px solid lightgray;
}

.roomdetailwrap .detail>div{
	width:100%;
	position:relative;
}

.roomdetailwrap .detail>div>ul{
	width: 100%;
    margin-bottom: 30px;
    padding-inline-start: 0;
    margin-left: 30px;
}

.detail>div>ul>li{
	float: left;
    width: 25%;
    height: 50px;
    line-height: 50px;
    border-bottom: 1px solid rgb(235, 235, 235);
}

.detail>div>ul>li>p{
	float: left;
    width: 100px;
    color: rgb(136, 136, 136);
    font-size: 14px;
}

.detail>ul>li>div{
	float: left;
    color: rgb(34, 34, 34);
    font-size: 14px;
}

.roomdetailwrap .options{
    position: relative;
   	padding: 100px 80px;
    margin: 0px auto;
    border-top: 1px solid rgb(221, 221, 221);
}

.roomdetailwrap .location{
	padding:100px;
}



.thisagentroom{
	margin-top:50px;
}

.index{
	margin-left: 4%;
	margin-bottom:5%;
    float: left;
    width: 20%;
    height: 230px;
    border: 1px solid rgb(221, 221, 221);
}

.icon{
	float: left;
    width: 162px;
    height: 70px;
    margin-bottom: 50px;
}

.option{
	height: 400px;
}

.optionimg{
	width: 70px;
    height: 70px;
    margin: 0px auto;
}

.optionimg>img{
	width: 70px;
    height: 70px;
    margin: 0px auto;
}

.icon>p{
	text-align: center;
}
</style>
</head>
<body>
<%@ include file="form/agent_header2.jsp" %>
<div class="roomdetailwrap">   
   <div class="top">
   	<span>내가 올린 방</span>
      <ul class="firstpara">
         <li>
            <p>
               <span>${dto.roomtype_rm }</span>
            </p>
            <div class="myvalue">
               <h2>
                  ${dto.rent_rm }
                  ${dto.roomprice_rm }
               </h2>
               <span class="manwon">만원</span>
            </div>
         </li>
         <li>
            <p>전용면적</p>
            <div class="myvalue">
               <h2>
                  ${dto.roomsize_rm }㎡
               </h2>
            </div>
         </li>
         <li>
            <p>관리비</p>
            <div class="myvalue">
               <h2>
                  ${dto.expense_rm }
               </h2>
               <span class="manwon">만원</span>
            </div>
         </li>
      </ul>
      
      <div><span>주소 |  </span> ${dto.addr_rm } ${dto.addr_dt_rm }</div>
      
   </div>
   <div class="detail">
      <div>
         <ul>
            <li>
               <p> · 해당층/건물층</p>
               <div>
                  ${dto.floor_rm }
                  /
                  ${dto.floor2_rm }
               </div>
            </li>
            <li>
               <p> · 전용/계약면적</p>
               <div>
                  ${dto.roomsize_rm }
                  /
                  ${dto.roomsize2_rm }
               </div>
            </li>
            <li>
               <p> · 엘리베이터</p>
               <div>
                  ${dto.elevator_rm }
               </div>
            </li>
            <li>
               <p> · 주차장</p>
               <div>
                  ${dto.parking_rm }
               </div>
            </li>
            <li>
               <p> · 반려동물</p>
               <div>
                  ${dto.animal_rm }
               </div>
            </li>
            <li>
               <p> · 베란다/발코니</p>
               <div>
                  ${dto.veranda_rm }
               </div>
            </li>
            <li>
               <p> · 입주가능일</p>
               <div>
                  ${dto.roomin_rm }
               </div>
            </li>
            <li>
               <p>  </p>
               <div>
                  
               </div>
            </li>
         </ul>
      </div>
   </div>
   <div class="photowrap">
   <div class="photo">
      <c:forEach items="${imagelist }" var="image">
      	<img src="${image }">
      </c:forEach>
   </div>
   </div>
   <div class="contentwrap">
   	<div class="title">${dto.title_rm }</div>
   	<div class="content">${dto.content_rm }</div>
   </div>
   <div class="option">
      <div style="display:inline-block; font-size:15px;">옵션</div>
      <div class="options">
      <c:if test="${dto.aircon_rm eq '에어컨' }">
         <div class="icon">
            <div class="optionimg">
               <img src='resources/user/img/icon/Aircon.jpg' />
            </div>
            <p>${dto.aircon_rm }</p>
         </div>
        </c:if>
         <c:if test="${dto.washer_rm eq '세탁기' }">
         <div class="icon">
            <div class="optionimg">
               <img src='resources/user/img/icon/washer.jpg' />
            </div>
            <p>${dto.washer_rm }</p>
         </div>
         </c:if>
         <c:if test="${dto.gasrange_rm eq '가스레인지' }">
         <div class="icon">
            <div class="optionimg">
               <img src='resources/user/img/icon/gasrange.jpg' />
            </div>
            <p>${dto.gasrange_rm }</p>
         </div>
         </c:if>
         <c:if test="${dto.desk_rm eq '책상' }">
         <div class="icon">
            <div class="optionimg">
               <img src='resources/user/img/icon/desk.jpg' />
            </div>
            <p>${dto.desk_rm }</p>
         </div>
         </c:if>
         <c:if test="${dto.tv_rm eq 'TV' }">
         <div class="icon">
            <div class="optionimg">
               <img src='resources/user/img/icon/tv.png' />
            </div>
            <p>${dto.tv_rm }</p>
         </div>
         </c:if>
         <c:if test="${dto.ref_rm eq '냉장고' }">
         <div class="icon">
            <div class="optionimg">
               <img src='resources/user/img/icon/ref.jpg' />
            </div>
            <p>${dto.ref_rm }</p>
         </div>
         </c:if>
         <c:if test="${dto.bed_rm eq '침대' }">
         <div class="icon">
            <div class="optionimg">
               <img src='resources/user/img/icon/bed.jpg' />
            </div>
            <p>${dto.bed_rm }</p>
         </div>
         </c:if>
         <c:if test="${dto.showhouse_rm eq '신발장' }">
         <div class="icon">
            <div class="optionimg">
               <img src='resources/user/img/icon/shoes.png' />
            </div>
            <p>${dto.showhouse_rm }</p>
         </div>
         </c:if>
         <c:if test="${dto.microwave_rm eq '전자레인지' }">
         <div class="icon">
            <div class="optionimg">
               <img src='resources/user/img/icon/microwave.jpg' />
            </div>
            <p>${dto.microwave_rm }</p>
         </div>
         </c:if>
         <c:if test="${dto.induction_rm eq '인덕션' }">
         <div class="icon">
            <div class="optionimg">
               <img src='resources/user/img/icon/induction.jfif' />
            </div>
            <p>${dto.induction_rm }</p>
         </div>
         </c:if>
      </div>
   </div>

	<div class="button">
		<input type="button" value="목록" onclick="location.href='roommanage.agent'">
		<input type="button" value="수정" onclick="location.href='agent_roomupdate.agent?no_rm=${dto.no_rm}'">
		<input type="button" value="삭제" onclick="location.href='agent_roomdelete.agent?no_rm=${dto.no_rm}'">
	</div>
</div>

<%@ include file="form/agent_footer.jsp" %>


</body>
</html>