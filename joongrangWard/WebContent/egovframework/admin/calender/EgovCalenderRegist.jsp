<%
 /**
  * @Class Name  : EgovCalenderRegist.jsp
  * @Description : EgovCalenderRegist 화면
  * @Modification Information
  * @
  * @  수정일             수정자                   수정내용
  * @ -------    --------    ---------------------------
  * @ 2009.12.14   김남수              최초 생성
  *
  *  @author 공통서비스팀 
  *  @since 2009.11.14
  *  @version 1.0
  *  @see
  *  
  *  Copyright (C) 2009 by MOPAS  All right reserved.
  */
  int year;
  int month = 0;
  int day = 0;
  String strYear = null;
  String strMonth = null;
  String strDay = null;

  strYear = request.getParameter("selyear");
  strMonth = request.getParameter("selmonth");
  strDay = request.getParameter("selday");
%>
<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="validator" uri="http://www.springmodules.org/tags/commons-validator" %>
<html>
<head>
<title>캘린더 등록</title>
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<link rel="stylesheet" type="text/css" href="/admin/common/css/common_style.css">
<link rel="stylesheet" type="text/css" href="/admin/common/css/board.css">
<script type="text/javaScript">
/* ********************************************************
 * 목록 으로 가기
 ******************************************************** */
function fn_egov_list_Calender(yy,mm){
	location.href = "/admin/calender/EgovCalenderList.do?year="+yy+"&month="+mm;
}
/* ********************************************************
 * 저장처리화면
 ******************************************************** */
 function fn_egov_insert_Calender(){
		if(confirm("저장하시겠습니까?")){
			var varForm				= document.all["frm"];
			varForm.cmd.value 		= "Regist";
			varForm.action 			= "<c:url value='/admin/calender/EgovCalenderRegist.do'/>";
			varForm.submit();
		}
 }
</script>
</head>
<body>
<form:form commandName="board" name="frm" method="post" enctype="multipart/form-data" >
<input type="hidden" name="cal_url" value="<c:url value='/sym/cmm/EgovNormalCalPopup.do'/>" />
<input type="hidden" name="cmd" />
<input type="hidden" name="year" value="<%=strYear%>" />
<input type="hidden" name="month" value="<%=strMonth%>" />
<fieldset>
<div  class="board_view">
<table summary="게시판 쓰기 페이지 입니다" class="view_type01">
	<caption>게시판 쓰기</caption>
	<colgroup>
		<col width="20%" />
		<col width="30%" />
		<col width="20%" />
		<col width="30%" />
	</colgroup>
	<tbody>
		<!-- 등록일  -->
		<tr>
			<th scope="row"><label for="option2">등록일</label></th>
			<td class="output" colspan="3">
				<input type="text" name="cal_date" size="50"  value="<%=strYear%>-<%=strMonth%>-<%=strDay%>" readOnly />
			</td>
		</tr>	
		<!-- 구분 -->
		<tr>
			<th scope="row"><label for="cal_gubun">구분</label></th>
			<td colspan="3" class="output">
				<select name="cal_gubun" title="구분">
				   <option value="문화행사">문화행사</option>
				   <option value="구정행사">구정행사</option>   
				</select>
			</td>
		</tr><form:errors path="nttSj" />
		<!-- 제목 -->
		<tr>
			<th scope="row"><label for="subject"><spring:message code="cop.nttSj" /></label></th>
			<td class="output" colspan="3">
				<input type="text" name="cal_title" id="subject" style="width:400px" class="board1" />
			</td>
		</tr><form:errors path="nttSj" />
		<input type="hidden" name="ntcrNm" value="gogo">
		<!-- 내용 -->			
		<tr>
			<th scope="row" class="con_tit"><label for="nttCn"><spring:message code="cop.nttCn" /></label></th>
			<td class="outputEditor" colspan="3">
			<textarea id="nttCn" name="cal_cont" class="textarea" cols="75" rows="8" style="width:500px;"></textarea>
			<form:errors path="nttCn" />
			</td>
		</tr>
		<input type="hidden" name="secret" value="N">		
	</tbody>
</table>
</div>
</fieldset>
</form:form>
<div id="btn_area">
	<div class="btn_right_fr">
		<a href="javascript:fn_egov_insert_Calender();"><img src="/admin/images/common/btn/btn_regist.gif" alt="등록" /></a>
		<a href="javascript:fn_egov_list_Calender(<%=strYear%>,<%=strMonth%>);"><img src="/admin/images/common/btn/btn_list.gif" alt="목록" /></a>	
	</div>	
</div><!-- btn end -->
</body>
</html>