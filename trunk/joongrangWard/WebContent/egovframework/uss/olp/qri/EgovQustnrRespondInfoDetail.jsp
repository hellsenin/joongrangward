<%--
  Class Name : EgovQustnrRespondInfoDetail.jsp
  Description : 설문조사 상세보기
  Modification Information
 
      수정일         수정자                   수정내용
    -------    --------    ---------------------------
     2008.03.09    장동한          최초 생성
 
    author   : 공통서비스 개발팀 장동한
    since    : 2009.03.09
   
    Copyright (C) 2009 by MOPAS  All right reserved.
--%>
<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<c:set var="ImgUrl" value="/images/egovframework/uss/olp/qri/"/>
<c:set var="CssUrl" value="/css/egovframework/uss/olp/qri/"/>
<%pageContext.setAttribute("crlf", "\r\n"); %>
<html>
<head>
<title>회의정보 관리</title>
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<link type="text/css" rel="stylesheet" href="${CssUrl}com.css" />
<script type="text/javaScript" language="javascript">


/* ********************************************************
 * 초기화
 ******************************************************** */
function fn_egov_init_QustnrRespondInfo(){

}
/* ********************************************************
 * 목록 으로 가기
 ******************************************************** */
function fn_egov_list_QustnrRespondInfo(){
	location.href = "/uss/olp/qri/EgovQustnrRespondInfoList.do";
}
/* ********************************************************
 * 저장처리화면
 ******************************************************** */
function fn_egov_modify_QustnrRespondInfo(){
	var vFrom = document.QustnrRespondInfoForm;
	vFrom.cmd.value = '';
	vFrom.action = "/uss/olp/qri/EgovQustnrRespondInfoModify.do";;
	vFrom.submit();

}
/* ********************************************************
 * 삭제처리
 ******************************************************** */
function fn_egov_delete_QustnrRespondInfo(){
	var vFrom = document.QustnrRespondInfoForm;
	if(confirm("삭제 하시겠습니까?")){
		vFrom.cmd.value = 'del';
		vFrom.action = "/uss/olp/qri/EgovQustnrRespondInfoDetail.do";
		vFrom.submit();
	}else{
		vFrom.cmd.value = '';
	}
}
</script>
</head>
<body onLoad="fn_egov_init_QustnrRespondInfo();">
<DIV id="content" style="width:712px">
<!-- ------------------------------------------------------------------ 상단타이틀 -->
<form name="QustnrRespondInfoForm" id="QustnrRespondInfoForm" action="<c:url value=''/>" method="post">
<!-- ----------------- 상단 타이틀  영역 -->
<table width="100%" cellpadding="8" class="table-search" border="0">
 <tr>
  <td width="100%"class="title_left">
   <img src="${ImgUrl}icon/tit_icon.gif" width="16" height="16" hspace="3" align="absmiddle">&nbsp;설문조사 상세보기</td>
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
    <th width="20%" height="23" class="required_text" nowrap >설문관리정보<img src="${ImgUrl}icon/required.gif" width="15" height="15"></th>
    <td width="80%">
	<c:out value="${fn:replace(resultList[0].qestnrSj , crlf , '<br/>')}" escapeXml="false" />
	<input name="qestnrId" type="hidden" value="${resultList[0].qestnrId}">
	<input name="qestnrTmplatId" type="hidden" value="${resultList[0].qestnrTmplatId}">  
    </td>
  </tr>
  <tr> 
    <th width="20%" height="23" class="required_text" nowrap >설문문항정보<img src="${ImgUrl}icon/required.gif" width="15" height="15"></th>
    <td width="80%">
    <c:out value="${fn:replace(resultList[0].qestnCn , crlf , '<br/>')}" escapeXml="false" />
	<input name="qestnrQesitmId" type="hidden" value="${resultList[0].qestnrQesitmId}">
    </td>
  </tr>
  <tr> 
    <th width="20%" height="23" class="required_text" nowrap >설문유형<img src="${ImgUrl}icon/required.gif" width="15" height="15"></th>
    <td width="80%">
    <c:if test="${resultList[0].qestnTyCode == '1'}">객관식</c:if>
    <c:if test="${resultList[0].qestnTyCode == '2'}">주관식</c:if>
      <!-- <input name="title" type="text" size="73" value="" maxlength="70" style="width:100%;">   -->
    </td>
  </tr>
  <tr> 
    <th width="20%" height="23" class="required_text" nowrap >설문항목정보<img src="${ImgUrl}icon/required.gif" width="15" height="15"></th>
    <td width="80%">
   	 	<c:out value="${fn:replace(resultList[0].iemCn , crlf , '<br/>')}" escapeXml="false" />
		<input name="qustnrIemId" type="hidden" value="${resultList[0].qustnrIemId}">
    </td>
  </tr>   
  <tr> 
    <th width="20%" height="23" class="required_text" nowrap >응답자답변내용<br>(주관식)<img src="${ImgUrl}icon/required.gif" width="15" height="15"></th>
    <td width="80%">
      <br>
      <c:out value="${fn:replace(resultList[0].respondAnswerCn , crlf , '<br/>')}" escapeXml="false" />
	  <br><br>
    </td>
  </tr>
  <tr> 
    <th width="20%" height="23" class="required_text" nowrap >기타답변내용<img src="${ImgUrl}icon/required.gif" width="15" height="15"></th>
    <td width="80%">
      <br>
      <c:out value="${fn:replace(resultList[0].etcAnswerCn , crlf , '<br/>')}" escapeXml="false" />
	  <br><br>
    </td>
  </tr>
  <tr> 
    <th width="20%" height="23" class="required_text" nowrap >응답자명<img src="${ImgUrl}icon/required.gif" width="15" height="15"></th>
    <td width="80%">
		 <c:out value="${fn:replace(resultList[0].respondNm , crlf , '<br/>')}" escapeXml="false" />
    </td>
  </tr>
</table>


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
  <td background="<c:out value="${ImgUrl}"/>button/bu2_bg.gif" class="text_left" nowrap><a href="JavaScript:fn_egov_list_QustnrRespondInfo();"><spring:message code="button.list" /></a> 
  </td>
  <td><img src="<c:out value="${ImgUrl}"/>button/bu2_right.gif" width="8" height="20"></td>      
  <td>&nbsp;</td>
  <td><img src="<c:out value="${ImgUrl}"/>button/bu2_left.gif" width="8" height="20"></td>
  <td background="<c:out value="${ImgUrl}"/>button/bu2_bg.gif" class="text_left" nowrap><a href="JavaScript:fn_egov_delete_QustnrRespondInfo();"><spring:message code="button.delete" /></a> 
  </td>
  <td><img src="<c:out value="${ImgUrl}"/>button/bu2_right.gif" width="8" height="20"></td>
  <td>&nbsp;</td>
  <td><img src="<c:out value="${ImgUrl}"/>button/bu2_left.gif" width="8" height="20"></td>
  <td background="<c:out value="${ImgUrl}"/>button/bu2_bg.gif" class="text_left" nowrap><a href="JavaScript:fn_egov_modify_QustnrRespondInfo();"><spring:message code="button.update" /></a> 
  </td>
  <td><img src="<c:out value="${ImgUrl}"/>button/bu2_right.gif" width="8" height="20"></td>    
</tr>
</table>
</center>
<input name="cmd" type="hidden" value="<c:out value=''/>"/>

<input name="qestnrQesrspnsId" id="qestnrQesrspnsId" type="hidden" value="${resultList[0].qestnrQesrspnsId}">
</form>
</DIV>

</body>
</html>