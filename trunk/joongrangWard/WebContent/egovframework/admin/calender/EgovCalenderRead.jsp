<%
 /**
  * @Class Name  : EgovCalenderRead.jsp
  * @Description : EgovCalenderRead 화면
  * @Modification Information
  * @
  * @  수정일             수정자                   수정내용
  * @ -------    --------    ---------------------------
  * @ 2009.12.17   김남수              최초 생성
  *
  *  @author 공통서비스팀 
  *  @since 2009.12.17
  *  @version 1.0
  *  @see
  *  
  *  Copyright (C) 2009 by MOPAS  All right reserved.
  */
  int year = 0;
  int month = 0;
  String strYear = null;
  String strMonth = null;
  strYear = request.getParameter("selyear");
  strMonth = request.getParameter("selmonth");
%>
<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<html>
<head>
<title>캘린더 상세보기</title>
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<link href="/admin/common/css/common_style.css" rel="stylesheet" type="text/css" />
<link href="/admin/common/css/board.css" rel="stylesheet" type="text/css" />
<script type="text/javaScript">
/* ********************************************************
* 수정을 위한 처리 함수
******************************************************** */
function fnForUpdate(){
	document.frm.action 			= "<c:url value='/admin/calender/EgovCalenderModify.do'/>";
	document.frm.submit();			
}
/* ********************************************************
* 삭제 처리 함수
******************************************************** */
function fnDelete(){
	if(confirm("삭제하시겠습니까?")){
		document.frm.action 			= "<c:url value='/admin/calender/EgovCalenderDelete.do'/>";
		document.frm.cmd.value 			= "Delete";
		document.frm.submit();
	}
}
/* ********************************************************
* 목록 으로 가기
******************************************************** */
function fn_egov_list_Calender(yy,mm){
	location.href = "/admin/calender/EgovCalenderList.do?year="+yy+"&month="+mm;
}
</script>
</head>
<body>
<form name="frm" method="post" action="">
<input type="hidden" name="cmd" />
<input type="hidden" name="sel_idx" value='<c:out value="${result.cal_idx}" />' />
<input type="hidden" name="year" value="<%=strYear%>" />
<input type="hidden" name="month" value="<%=strMonth%>" />
<!-- //board_view start -->
<div class="board_view">
<table summary="구정일정을 보실 수 있습니다" class="view_type01">
	<caption>구정일정사항 보기 페이지</caption>
	<colgroup>
		<col width="12%" />
		<col width="*" />
		<col width="12%" />
		<col width="30%" />
	</colgroup>
	<tbody>
		<tr>
			<th scope="row">제목</th>
			<td class="output"><c:out value="${result.cal_title}" /></td>
			<!-- 등록일 -->
			<th scope="row">일정 등록일</th>
			<td class="output"><c:out value="${result.cal_date}" /></td>
		</tr>
		<tr>
			<th scope="row">담당부서</th>
			<td class="output"><c:out value="${result.cal_dept}" /></td>
			<!-- 조회수 -->
			<th scope="row">조회수</th>
			<td class="output"><c:out value="${result.cal_count}"/></td>
		</tr>
		<tr>
			<th scope="row">구분</th>
			<td class="output" colspan="3"><c:out value="${result.cal_gubun}" /></td>
		</tr>
		<tr>
			<th scope="row">내용</th>
			<td class="output" colspan="3"><c:out value="${result.cal_cont}" escapeXml="false" />	
			<br/><br/><br/><br/><br/>
			<br/><br/><br/><br/><br/>
			</td>
		</tr>
	</tbody>
</table>
</div>
<div id="btn_area">
	<div class="btn_right_fl">
		<a href="javascript:fnForUpdate()"><img src="/admin/images/common/btn/btn_modify.gif" alt="수정" /></a>
		<a href="javascript:fnDelete()"><img src="/admin/images/common/btn/btn_delete.gif" alt="삭제" /></a>
	</div>
	<div class="btn_right_fr">
		<a href="javascript:fn_egov_list_Calender(<%=strYear%>,<%=strMonth%>);"><img src="/admin/images/common/btn/btn_list.gif" alt="목록" /></a>	
	</div>
</div><!-- btn end -->
</form>
</body>
</html>