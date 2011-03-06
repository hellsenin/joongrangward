<%
 /**
  * @Class Name  : EgovCalenderModify.jsp
  * @Description : EgovCalenderModify 화면
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
  strYear = request.getParameter("year");
  strMonth = request.getParameter("month");
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
<title>캘린더 수정</title>
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
 function fn_egov_modify_Sulmun(){
	document.frm.action  = "<c:url value='/admin/calender/EgovCalenderModify.do'/>";
	document.frm.cmd.value = "Modify";
	document.frm.submit();	

}
</script>
</head>
<body onLoad="fnInit();">
<form:form  name="frm" method="post" enctype="multipart/form-data" >
<input name="cmd" type="hidden" value="Modify">
<input type="hidden" name="sel_idx" value='<c:out value="${result.cal_idx}" />' />
<input type="hidden" name="year" value="<%=strYear%>" />
<input type="hidden" name="month" value="<%=strMonth%>" />
<fieldset>
<div  class="board_view">
<table summary="캘린더수정 페이지 입니다" class="view_type01">
	<caption>캘린더수정</caption>
	<colgroup>
		<col width="20%" />
		<col width="30%" />
		<col width="20%" />
		<col width="30%" />
	</colgroup>
	<tbody>
	   <tr>
			<th scope="row">일정 등록일</th>
			<td colspan="3" class="output">
				<input type="text" name="cal_date" size="50" value='<c:out value="${result.cal_date}" />' readOnly/>
			</td>
		</tr>
			   <tr>
			<th scope="row"><label for="cal_gubun">구분</label></th>
			<td class="output" colspan="3">
				<select name="cal_gubun" title="구분">
				   <option value="문화행사" <c:if test="${result.cal_gubun == '문화행사'}"> selected="selected"</c:if>>문화행사</option>
				   <option value="구정행사" <c:if test="${result.cal_gubun == '구정행사'}"> selected="selected"</c:if>>구정행사</option>   
				</select>
			</td>
		</tr>
		<tr>
			<th scope="row"><label for="subject">제목</label></th>
			<td colspan="3" class="output">
				<input type="text" name="cal_title"  id="subject" style="width:400px" class="board1" value='<c:out value="${result.cal_title}" />' />
			</td>
		</tr>
		<tr>
			<th scope="row" class="con_tit">내용</th>
			<td class="outputEditor" colspan="3">								
		      <textarea  name="cal_cont" class="textarea" cols="75" rows="28" style="width:500px;"><c:out value="${result.cal_cont}" escapeXml="false" /></textarea> 
			</td>
		</tr>
	</tbody>
</table>
</div>	
</fieldset>
</form:form>
<div id="btn_area">
	<div class="btn_right_fr">
		<a href="javascript:fn_egov_modify_Sulmun();"><img src="/admin/images/common/btn/btn_regist.gif" alt="등록" /></a>
		<a href="javascript:fn_egov_list_Calender(<%=strYear%>,<%=strMonth%>);"><img src="/admin/images/common/btn/btn_list.gif" alt="목록" /></a>	
	</div>
</div><!-- btn end -->
</body>
</html>


