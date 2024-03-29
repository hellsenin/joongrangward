<%--
  Class Name : EgovEventCmpgnDetail.jsp
  Description : 행사/이벤트/캠페인 수정
  Modification Information
 
      수정일         수정자                   수정내용
    -------    --------    ---------------------------
     2008.03.12    장동한          최초 생성
 
    author   : 공통서비스 개발팀 장동한
    since    : 2009.03.12
   
    Copyright (C) 2009 by MOPAS  All right reserved.
--%>
<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="validator" uri="http://www.springmodules.org/tags/commons-validator" %>
<c:set var="ImgUrl" value="/images/egovframework/uss/ion/ecc/"/>
<c:set var="CssUrl" value="/css/egovframework/uss/ion/ecc/com.css"/>
<html>
<head>
<title></title>
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<link type="text/css" rel="stylesheet" href="<c:out value="${CssUrl}"/>" />
<script type="text/javascript" src="/js/egovframework/cmm/sym/cal/EgovCalPopup.js"></script>
<script type="text/javascript" src="<c:url value="/validator.do"/>"></script>
<validator:javascript formName="eventCmpgnVO" staticJavascript="false" xhtml="true" cdata="false"/>
<script type="text/javaScript" language="javascript">
/* ********************************************************
 * 초기화
 ******************************************************** */
function fn_egov_init_EventCmpgn(){

}
/* ********************************************************
 * 목록 으로 가기
 ******************************************************** */
function fn_egov_list_EventCmpgn(){
	location.href = "/uss/ion/ecc/EgovEventCmpgnList.do";
}
/* ********************************************************
 * 저장처리화면
 ******************************************************** */
function fn_egov_save_EventCmpgn(){
	var varFrom = document.getElementById("eventCmpgnVO");;
	if(confirm("저장 하시겠습니까?")){
		varFrom.cmd.value = 'save';
		varFrom.action = "/uss/ion/ecc/EgovEventCmpgnModify.do";;
		if(!validateEventCmpgnVO(varFrom)){ 			
			return;
		}else{
			<%-- 업무사용자만 승인 가능하도록 처리--%>
			<c:if test="${SUserSe eq 'USR'}">
			if(document.getElementsByName("eventConfmAt")[0].checked == true ){
				if(document.getElementById("eventConfmDe").value == ""){
					alert("승인 신청일을 입력해주세요!");
					document.getElementById("eventConfmDe").focus();
					return;
				}
			} 
			</c:if>
			if(document.getElementById("svcUseNmprCo").value == ""){
				document.getElementById("svcUseNmprCo").value = "0" ;
			}
			varFrom.submit();
		} 
	}

}

</script>
</head>
<body onLoad="fn_egov_init_EventCmpgn();">
<DIV id="content" style="width:712px">
<!-- ------------------------------------------------------------------ 상단타이틀 -->
<form:form commandName="eventCmpgnVO"  action="" method="post">
<!-- ----------------- 상단 타이틀  영역 -->
<table width="100%" cellpadding="8" class="table-search" border="0">
 <tr>
  <td width="100%"class="title_left">
   <img src="<c:out value="${ImgUrl}"/>icon/tit_icon.gif" width="16" height="16" hspace="3" align="absmiddle">&nbsp;행사/이벤트/캠페인  수정</td>
 </tr>
</table>
<!-- ------------------------------------------------------------------ 줄간격조정  -->
<table width="100%" cellspacing="0" cellpadding="0" border="0">
<tr>
	<td height="3px"></td>
</tr>
</table>
<!-- ------------------------------------------------------------------ 등록  폼 영역  -->
<table width="100%" border="0" cellpadding="0" cellspacing="1" class="table-register">  
  
  <tr> 
    <th width="20%" height="23" class="required_text" nowrap >행사유형<img src="<c:out value="${ImgUrl}"/>icon/required.gif" width="15" height="15"></th>
    <td width="80%" nowrap>
		<select name="eventTyCode">
			<option value="">선택</option>
			<c:forEach items="${comCode035}" var="comCodeList" varStatus="status">
				<option value="${fn:trim(comCodeList.code)}" <c:if test="${comCodeList.code eq resultList[0].eventTyCode}">selected</c:if>>${comCodeList.codeNm}</option>
			</c:forEach>  
		</select>
	    <div><form:errors path="eventTyCode" cssClass="error" /></div>
    </td>
  </tr>
  
  <tr> 
    <th width="20%" height="23" class="required_text" nowrap >행사내용<img src="<c:out value="${ImgUrl}"/>icon/required.gif" width="15" height="15"></th>
    <td width="80%" nowrap>
     	 <textarea name="eventCn" class="textarea"  cols="75" rows="4"  style="width:100%;" value="">${resultList[0].eventCn}</textarea>
     	 <div><form:errors path="eventCn" cssClass="error" /></div> 
    </td>
  </tr>
 
  <tr> 
    <th width="20%" height="23" class="required_text" nowrap >행사시작일자<img src="<c:out value="${ImgUrl}"/>icon/required.gif" width="15" height="15"></th>
    <td width="80%" nowrap>
     <input name="eventSvcBeginDe" type="text" size="73" value="${resultList[0].eventSvcBeginDe}" maxlength="10" style="width:80px;">
      <a href="javascript:fn_egov_NormalCalendar(document.forms[0], document.forms[0].eventSvcBeginDe);">
     <img src="/images/egovframework/cmm/sym/cal/bu_icon_carlendar.gif" align="absmiddle" style="border:0px" alt="행사시작일자달력" title="행사시작일자달력" ></a>
     </a>
     <div><form:errors path="eventSvcBeginDe" cssClass="error" /></div>  
    </td>
  </tr>
  
  <tr> 
    <th width="20%" height="23" class="required_text" nowrap >행사종료일자<img src="<c:out value="${ImgUrl}"/>icon/required.gif" width="15" height="15"></th>
    <td width="80%" nowrap>
   <input name="eventSvcEndDe" type="text" size="73" value="${resultList[0].eventSvcEndDe}" maxlength="10" style="width:80px;">
   <a href="javascript:fn_egov_NormalCalendar(document.forms[0], document.forms[0].eventSvcEndDe);">
   <img src="/images/egovframework/cmm/sym/cal/bu_icon_carlendar.gif" style="border:0px" alt="행사종료일자달력" title="행사종료일자달력"></a>
   </a>
   <div><form:errors path="eventSvcEndDe" cssClass="error" /></div>    
    </td>
  </tr>
  
  <tr> 
    <th width="20%" height="23" class="required_text" nowrap >서비스이용인원수</th>
    <td width="80%" nowrap>
     	<input name="svcUseNmprCo" id="svcUseNmprCo" type="text" size="73" value="${resultList[0].svcUseNmprCo}" maxlength="10" style="width:60px;">  
    </td>
  </tr>
  
  <tr> 
    <th width="20%" height="23" class="required_text" nowrap >담당자명</th>
    <td width="80%" nowrap>
     	<input name="chargerNm" id="chargerNm" type="text" size="73" value="${resultList[0].chargerNm}" maxlength="50" style="width:100px;">
    </td>
  </tr>
  
  <tr> 
    <th width="20%" height="23" class="required_text" nowrap >준비물내용</th>
    <td width="80%" nowrap>
     	<textarea name="prparetgCn" class="textarea"  cols="75" rows="4"  style="width:100%;" value="">${resultList[0].prparetgCn}</textarea>
     	<div><form:errors path="prparetgCn" cssClass="error" /></div>  
    </td>
  </tr>
  <%-- 업무사용자만 승인 가능하도록 처리--%>
  <c:if test="${SUserSe eq 'USR'}">
  <tr> 
    <th width="20%" height="23" class="required_text" nowrap >승인여부</th>
    <td width="80%" nowrap>

     	승인:<input id="eventConfmAt" name="eventConfmAt" type="radio" value="Y" <c:if test="${resultList[0].eventConfmAt eq 'Y'}">checked</c:if> />&nbsp; 
     	미승인:<input id="eventConfmAt" name="eventConfmAt" type="radio" value="N"  onClick="document.forms[0].eventConfmDe.value='';" <c:if test="${resultList[0].eventConfmAt eq 'N'}">checked</c:if> />&nbsp;

    </td>
  </tr>
  
  <tr> 
    <th width="20%" height="23" class="required_text" nowrap >승인일</th>
    <td width="80%" nowrap>
	<input name="eventConfmDe" id="eventConfmDe" value="${resultList[0].eventConfmDe}" type="text" size="73" value="" maxlength="10" style="width:80px;" readonly="true" > 
	<a href="javascript:fn_egov_NormalCalendar(document.forms[0], document.forms[0].eventConfmDe);">
	<img src="/images/egovframework/cmm/sym/cal/bu_icon_carlendar.gif" onClick="" align="absmiddle" style="border:0px" alt="승인일달력" title="승인일달력">
	</a>
    </td>
  </tr>
  </c:if>
</table>
<c:if test="${SUserSe ne 'USR'}">
<input name="eventConfmAt" id="eventConfmAt" type="hidden" value=""/>
<input name="eventConfmDe" id="eventConfmDe" type="hidden" value=""/>
</c:if>
<!-- ------------------------------------------------------------------ 줄간격조정  -->
<table width="100%" cellspacing="0" cellpadding="0" border="0">
<tr>
	<td height="3px"></td>
</tr>
</table>
<center>
<!-- ------------------------------------------------------------------ 목록/저장버튼  -->
<table border="0" cellspacing="0" cellpadding="0" align="center">
<tr> 
  <td><img src="<c:out value="${ImgUrl}"/>button/bu2_left.gif" width="8" height="20"></td>
  <td background="<c:out value="${ImgUrl}"/>button/bu2_bg.gif" class="text_left" nowrap><a href="JavaScript:fn_egov_list_EventCmpgn();">목록</a> 
  </td>
  <td><img src="<c:out value="${ImgUrl}"/>button/bu2_right.gif" width="8" height="20"></td>      
  <td>&nbsp;</td>
  <td><img src="<c:out value="${ImgUrl}"/>button/bu2_left.gif" width="8" height="20"></td>
  <td background="<c:out value="${ImgUrl}"/>button/bu2_bg.gif" class="text_left" nowrap><a href="JavaScript:fn_egov_save_EventCmpgn();">저장</a> 
  </td>
  <td><img src="<c:out value="${ImgUrl}"/>button/bu2_right.gif" width="8" height="20"></td>      
</tr>
</table>
</center>

<input name="eventId" id="eventId"  type="hidden" value="${resultList[0].eventId}">
<input type="hidden" id="cal_url" name="cal_url" value="<c:url value='/sym/cmm/EgovNormalCalPopup.do'/>" />
<input name="cmd" id="cmd" type="hidden" value="<c:out value=''/>"/>
</form:form>
</DIV>

</body>
</html>