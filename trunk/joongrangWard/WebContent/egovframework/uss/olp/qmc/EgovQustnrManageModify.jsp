<%--
  Class Name : EgovQustnrManageModify.jsp
  Description : 설문관리 수정 페이지
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
<c:set var="ImgUrl" value="/images/egovframework/uss/olp/qmc/"/>
<c:set var="CssUrl" value="/css/egovframework/uss/olp/qmc/"/>
<html>
<head>
<title>회의정보 관리</title>
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<link type="text/css" rel="stylesheet" href="${CssUrl}com.css" />
<script type="text/javascript" src="<c:url value='/js/egovframework/cmm/sym/cal/EgovCalPopup.js' />"></script>

<script type="text/javascript" src="<c:url value="/validator.do"/>"></script>
<validator:javascript formName="qustnrManageVO" staticJavascript="false" xhtml="true" cdata="false"/>

<script type="text/javaScript" language="javascript">


/* ********************************************************
 * 초기화
 ******************************************************** */
function fn_egov_init_QustnrManage(){
	
}
/* ********************************************************
 * 목록 으로 가기
 ******************************************************** */
function fn_egov_list_QustnrManage(){
	location.href = "/uss/olp/qmc/EgovQustnrManageList.do";
}
/* ********************************************************
 * 저장처리화면
 ******************************************************** */
function fn_egov_save_QustnrManage(form){

	var sStartDay = form.qestnrBeginDe.value.replaceAll("-","");
	var sEndDay = form.qestnrEndDe.value.replaceAll("-","");

	var iStartDay = parseInt(sStartDay);
	var iEndDay = parseInt(sEndDay);
	
	if(confirm("<spring:message code="common.save.msg" />")){
		if(!validateQustnrManageVO(form)){ 			
			return;
		}else{
			if(iStartDay > iEndDay || iEndDay < iStartDay){
				alert("설문기간  시작일은 종료일  보다 클수 없고 \n\n설문기간 종료일은 시작일 보다 작을수 없습니다!");
				return;
			}
			form.submit();
		}
	}
}

/* ********************************************************
* PROTOTYPE JS FUNCTION
******************************************************** */
String.prototype.trim = function(){
	return this.replace(/^\s+|\s+$/g, "");
}

String.prototype.replaceAll = function(src, repl){
	 var str = this;
	 if(src == repl){return str;}
	 while(str.indexOf(src) != -1) {
	 	str = str.replace(src, repl);
	 }
	 return str;
}
</script>
</head>
<body onLoad="fn_egov_init_QustnrManage();">
<DIV id="content" style="width:712px">
<c:set var="qustnrManageVO.qestnrSj" value="${resultList[0].qestnrPurps}"/>
<!-- ------------------------------------------------------------------ 상단타이틀 -->
<form:form commandName="qustnrManageVO" name="qustnrManageVO">
<!-- ----------------- 상단 타이틀  영역 -->
<table width="100%" cellpadding="8" class="table-search" border="0">
 <tr>
  <td width="100%"class="title_left">
   <img src="${ImgUrl}icon/tit_icon.gif" width="16" height="16" hspace="3" align="absmiddle">&nbsp;설문관리 수정</td>
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
    <th width="20%" height="23" class="required_text" nowrap >설문제목<img src="${ImgUrl}icon/required.gif" width="15" height="15"></th>
    <td width="80%" nowrap>
      
      <form:input path="qestnrSj" size="73" cssClass="txaIpt" maxlength="250" />
      <form:errors path="qestnrSj"/>
    </td>
  </tr>
  <tr> 
    <th width="20%" height="23" class="required_text" nowrap >설문목적<img src="${ImgUrl}icon/required.gif" width="15" height="15"></th>
    <td width="80%" nowrap>
    	<form:textarea path="qestnrPurps" rows="3" cols="20" cssClass="txaClass"/>
    	<form:errors path="qestnrPurps"/>
    </td>
  </tr>
  <tr> 
    <th height="23" class="required_text" >설문작성안내 내용<img src="${ImgUrl}icon/required.gif" width="15" height="15"></th>
    <td>
    	<form:textarea path="qestnrWritngGuidanceCn" rows="3" cols="20" cssClass="txaClass"/>
    	<form:errors path="qestnrWritngGuidanceCn"/>
    </td>
  </tr> 
  
  <tr> 
    <th width="20%" height="23" class="required_text" nowrap >설문대상<img src="${ImgUrl}icon/required.gif" width="15" height="15"></th>
    <td width="80%" nowrap>
		<form:select path="qestnrTrget">
			<option value="">선택</option>
		    <form:options items="${comCode034}" itemValue="code" itemLabel="codeNm"/>
		</form:select>
		<div><form:errors path="qestnrTrget"/></div> 
    </td>
  </tr>
  
  <tr> 
    <th width="20%" height="23" class="required_text" nowrap >설문기간<img src="${ImgUrl}icon/required.gif" width="15" height="15"></th>
    <td width="80%" nowrap>
      <form:input path="qestnrBeginDe" size="10" maxlength="10" readonly="true" />
      <form:errors path="qestnrBeginDe"/>
      <a href="javascript:fn_egov_NormalCalendar(document.forms[0], document.forms[0].qestnrBeginDe);">
      <img src="<c:url value='/images/egovframework/cmm/sym/cal/bu_icon_carlendar.gif' />" align="absmiddle" style="border:0px" alt="설문기간시작달력" title="설문기간시작달력">
      </a>
      ~<form:input path="qestnrEndDe" size="10" maxlength="10" readonly="true" />
      <form:errors path="qestnrEndDe"/>
      <a href="javascript:fn_egov_NormalCalendar(document.forms[0], document.forms[0].qestnrEndDe);">
      <img src="<c:url value='/images/egovframework/cmm/sym/cal/bu_icon_carlendar.gif' />" align="absmiddle"  style="border:0px" alt="설문기간종료달력" title="설문기간종료달력">
      </a>
    </td>
  </tr>
  
    <tr> 
    <th width="20%" height="23" class="required_text" nowrap >템플릿 유형<img src="${ImgUrl}icon/required.gif" width="15" height="15"></th>
    <td width="80%" nowrap>
      
		<table border="0" cellspacing="0" cellpadding="0" align="center">
		<tr> 
		<c:forEach items="${listQustnrTmplat}" var="resultQustnrTmplat" varStatus="status">
		  <td><img src="/uss/olp/qtm/EgovQustnrTmplatManageImg.do?qestnrTmplatId=${resultQustnrTmplat.qestnrTmplatId}" align="absmiddle"></td>
		</c:forEach>
		</tr>
		</tr>
		<tr> 
		<c:forEach items="${listQustnrTmplat}" var="resultQustnrTmplat" varStatus="status">
		  <td height="10" align="center"><input type="radio" name="qestnrTmplatId" value="${resultQustnrTmplat.qestnrTmplatId}" style="border:0px" <c:if test="${resultList[0].qestnrTmplatId ==  resultQustnrTmplat.qestnrTmplatId}">checked</c:if>>${resultQustnrTmplat.qestnrTmplatTy}</td>
		</c:forEach>
		</tr>
		</table>
		
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
  <td background="${ImgUrl}button/bu2_bg.gif" class="text_left" nowrap><a href="JavaScript:fn_egov_list_QustnrManage();"><spring:message code="button.list" /></a> 
  </td>
  <td><img src="${ImgUrl}button/bu2_right.gif" width="8" height="20"></td>      
  <td>&nbsp;</td>
  <td><img src="${ImgUrl}button/bu2_left.gif" width="8" height="20"></td>
  <td background="${ImgUrl}button/bu2_bg.gif" class="text_left" nowrap><a href="JavaScript:fn_egov_save_QustnrManage(document.forms[0]);"><spring:message code="button.save" /></a> 
  </td>
  <td><img src="${ImgUrl}button/bu2_right.gif" width="8" height="20"></td>      
</tr>
</table>
</center>

<input name="qestnrId" type="hidden" value="${resultList[0].qestnrId}">
<input name="cmd" type="hidden" value="<c:out value='save'/>"/>
<input type="hidden" name="cal_url" value="<c:url value='/sym/cmm/EgovNormalCalPopup.do'/>" />
</form:form>
</DIV>

</body>
</html>