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
<link rel="stylesheet" type="text/css" href="resources/agent/css/agent_notice.css">
<script type="text/javascript" src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script type="text/javascript">
/*function selectone(board_no){
	location.href="BoardFrServlet?command=select&board_no="+board_no;
}*/
$(document).ready(function() {
	
	$('.noticetable table tbody tr').hover(function(){
		$(this).css({'background-color': 'rgba(51, 85, 139,0.6)','color': 'rgb(255,255,255)'});
		$(this).find('a').css('color','rgb(255,255,255)');
	},function(){
		$(this).css({'background-color':'' ,'color': 'black'});
		$(this).find('a').css('color','black');
	});
	
});
	
	function selectone(){
		location.href="agent_notice_selectone.jsp";		
	}
	

</script>
</head>
<body>
<%@ include file="form/agent_header.jsp" %>
	<div class="noticewrap">
		<div class="servicehead">
		공지사항
		</div>
		<div class="noticetable">
			<table>
					<colgroup>
						<col width="10%">
						<col width="*">
						<col width="15%">
					</colgroup>
					<thead>
						<tr>
							<th>번호</th>
							<th>제목</th>
							<th>날짜</th>
						</tr>
					</thead>
					<tbody><!-- 나중에 db값 불러오기 -->
						<tr>
							<td>5</td>
							<td onclick="selectone()"><a href="agent_notice_selectone.jsp">공지사항입니다</a></td>
							<td>2020.03.20</td>
						</tr>
						<tr>
							<td>4</td>
							<td>공지사항입니다</td>
							<td>2020.03.19</td>
						</tr>
						<tr>
							<td>3</td>
							<td>공지사항입니다</td>
							<td>2020.03.18</td>
						</tr>
						<tr>
							<td>2</td>
							<td>공지사항입니다</td>
							<td>2020.03.17</td>
						</tr>
						<tr>
							<td>1</td>
							<td>공지사항입니다</td>
							<td>2020.03.16</td>
						</tr>
					</tbody>
			</table>
			<!-- 숫자페이징 -->
		</div>
	<!-- 관리자페이지에서 글 쓸 수있게??? 관리자만 -->
	</div>

<%@ include file="form/agent_footer.jsp" %>

</body>
</html>