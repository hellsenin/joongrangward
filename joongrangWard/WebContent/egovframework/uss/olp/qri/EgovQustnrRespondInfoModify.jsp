<%--
  Class Name : EgovQustnrRespondInfoModify.jsp
  Description : 설문조사 수정 페이지
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
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="validator" uri="http://www.springmodules.org/tags/commons-validator" %>
<c:set var="ImgUrl" value="/images/egovframework/uss/olp/qri/"/>
<c:set var="CssUrl" value="/css/egovframework/uss/olp/qri/"/>
<%pageContext.setAttribute("crlf", "\r\n"); %>
<html>
<head>
<title>회의정보 관리</title>
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<link type="text/css" rel="stylesheet" href="${CssUrl}com.css" />
<script type="text/javascript" src="<c:url value="/validator.do"/>"></script>
<validator:javascript formName="qustnrRespondInfoVO" staticJavascript="false" xhtml="true" cdata="false"/>
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
function fn_egov_save_QustnrRespondInfo(){
	var varFrom = document.getElementById("qustnrRespondInfoVO");

	if(confirm("<spring:message code="common.save.msg" />")){
		varFrom.action =  "/uss/olp/qri/EgovQustnrRespondInfoModify.do";
		
		if(!validateQustnrRespondInfoVO(varFrom)){ 			
			return;
		}else{
			varFrom.submit();
		} 
	}
}
/* ********************************************************
 * 설문지정보 팝업창열기
 ******************************************************** */
 function fn_egov_QustnrManageListPopup_QustnrItemManage(){

 	window.showModalDialog("/uss/olp/qmc/EgovQustnrManageListPopup.do", self,"dialogWidth=800px;dialogHeight=500px;resizable=yes;center=yes");
 	
 }
 /* ********************************************************
  * 설문지문항정보 팝업창열기
  ******************************************************** */
  function fn_egov_QustnrQestnManageListPopup_QustnrItemManage(){

	var sParam = "";
	sParam = sParam + "searchCondition=QESTNR_ID";
	sParam = sParam + "&searchKeyword=" + document.getElementById("qestnrId").value;

  	window.showModalDialog("/uss/olp/qqm/EgovQustnrQestnManageListPopup.do?" + sParam, self,"dialogWidth=800px;dialogHeight=500px;resizable=yes;center=yes");
  	
  }
/* ********************************************************
 * 설문항목정보 팝업창열기
 ******************************************************** */
function fn_egov_QustnrItemManageListPopup_QustnrItemManage(){

	var sParam = "";
	sParam = sParam + "searchCondition=QESTNR_QESITM_ID";
	sParam = sParam + "&searchKeyword=" + document.getElementById("qestnrQesitmId").value;

  	window.showModalDialog("/uss/olp/qim/EgovQustnrItemManageListPopup.do?" + sParam, self,"dialogWidth=800px;dialogHeight=500px;resizable=yes;center=yes");
	
}
</script>
</head>
<body onLoad="fn_egov_init_QustnrRespondInfo();">
<DIV id="content" style="width:712px">
<!-- ------------------------------------------------------------------ 상단타이틀 -->
<form:form commandName="qustnrRespondInfoVO" name="qustnrRespondInfoVO" action="" method="post">
<!-- ----------------- 상단 타이틀  영역 -->
<table width="100%" cellpadding="8" class="table-search" border="0">
 <tr>
  <td width="100%"class="title_left">
   <img src="${ImgUrl}icon/tit_icon.gif" width="16" height="16" hspace="3" align="absmiddle">&nbsp;설문조사 수정</td>
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
    <td width="80%" nowrap>
	<c:out value="${fn:replace(resultList[0].qestnrSj , crlf , '<br/>')}" escapeXml="false" />
	<input name="qestnrId" id="qestnrId" type="hidden" value="${resultList[0].qestnrId}">
	<input name="qestnrTmplatId" id="qestnrTmplatId" type="hidden" value="${resultList[0].qestnrTmplatId}"> 
    </td>
  </tr>
  <tr> 
    <th width="20%" height="23" class="required_text" nowrap >설문문항정보<img src="${ImgUrl}icon/required.gif" width="15" height="15"></th>
    <td width="80%" nowrap>
    <c:out value="${fn:replace(resultList[0].qestnCn , crlf , '<br/>')}" escapeXml="false" />
	<input name="qestnrQesitmId" id="qestnrQesitmId" type="hidden" value="${resultList[0].qestnrQesitmId}">
    </td>
  </tr>
  <tr> 
    <th width="20%" height="23" class="required_text" nowrap >설문유형<img src="${ImgUrl}icon/required.gif" width="15" height="15"></th>
    <td width="80%" nowrap>
    	<div name="divQestnTyCode" id="divQestnTyCode">
    <c:if test="${resultList[0].qestnTyCode == '1'}">객관식</c:if>
    <c:if test="${resultList[0].qestnTyCode == '2'}">주관식</c:if>
    	</div>
      <!-- <input name="title" type="text" size="73" value="" maxlength="70" style="width:100%;">   -->
    </td>
  </tr>
  <tr> 
    <th width="20%" height="23" class="required_text" nowrap >설문항목정보<img src="${ImgUrl}icon/required.gif" width="15" height="15"></th>
    <td width="80%" nowrap>
		<input name="qustnrIemCn" id="qustnrIemCn" type="text" size="73" value="${resultList[0].iemCn}" maxlength="4000" style="width:300px;">
		 <a href="javascript:fn_egov_QustnrItemManageListPopup_QustnrItemManage()">
		<img src="${ImgUrl}img/search2.gif" align="absmiddle" style="border:0px" alt="설문항목정보" title="설문항목정보">
		</a>
		<input name="qustnrIemId" id="qustnrIemId" type="hidden" value="${resultList[0].qustnrIemId}">
    </td>
  </tr>   
  <tr> 
    <th width="20%" height="23" class="required_text" nowrap >
    <DIV style="padding:0px 0px 0px 0px;margin:0px 15px 0px 0px;border:solid 0px;">응답자답변내용</DIV><br><DIV style="padding:0px 0px 0px 0px;margin:0px 15px 0px 0px;border:solid 0px;">(주관식)</DIV></th>
    <td width="80%" nowrap>
      <textarea name="respondAnswerCn" class="textarea"  cols="75" rows="4"  style="width:100%;" value="">${resultList[0].respondAnswerCn}</textarea>
      <div><form:errors path="respondAnswerCn" cssClass="error" /></div>
    </td>
  </tr>
  <tr> 
    <th width="20%" height="23" class="required_text" nowrap >
    	<DIV style="padding:0px 0px 0px 0px;margin:0px 15px 0px 0px;border:solid 0px;">기타답변내용</DIV>
    </th>
    <td width="80%" nowrap>
      <textarea name="etcAnswerCn" class="textarea"  cols="75" rows="4"  style="width:100%;" value="">${resultList[0].etcAnswerCn}</textarea>
      <div><form:errors path="etcAnswerCn" cssClass="error" /></div>
    </td>
  </tr>
  <tr> 
    <th width="20%" height="23" class="required_text" nowrap >응답자명<img src="${ImgUrl}icon/required.gif" width="15" height="15"></th>
    <td width="80%" nowrap>
		<input name="respondNm" type="text" size="50" value="<c:out value="${fn:replace(resultList[0].respondNm , crlf , '<br/>')}" escapeXml="false" />" maxlength="50" style="width:120px;">
		<div><form:errors path="respondNm" cssClass="error" /></div>
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
  <td><img src="${ImgUrl}button/bu2_left.gif" width="8" height="20"></td>
  <td background="${ImgUrl}button/bu2_bg.gif" class="text_left" nowrap><a href="JavaScript:fn_egov_list_QustnrRespondInfo();"><spring:message code="button.list" /></a> 
  </td>
  <td><img src="${ImgUrl}button/bu2_right.gif" width="8" height="20"></td>      
  <td>&nbsp;</td>
  <td><img src="${ImgUrl}button/bu2_left.gif" width="8" height="20"></td>
  <td background="${ImgUrl}button/bu2_bg.gif" class="text_left" nowrap><a href="JavaScript:fn_egov_save_QustnrRespondInfo();"><spring:message code="button.save" /></a> 
  </td>
  <td><img src="${ImgUrl}button/bu2_right.gif" width="8" height="20"></td>      
</tr>
</table>
</center>

<input name="qestnrQesrspnsId" type="hidden" value="${resultList[0].qestnrQesrspnsId}">
<input name="cmd" type="hidden" value="<c:out value='save'/>"/>

</form:form>
</DIV>

</body>
</html>