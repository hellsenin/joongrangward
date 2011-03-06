<%--
  Class Name : EgovQustnrRespondManageDetail.jsp
  Description : 응답자정보 상세보기
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
<c:set var="ImgUrl" value="/images/egovframework/uss/olp/qrm/"/>
<c:set var="CssUrl" value="/css/egovframework/uss/olp/qrm/"/>
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
function fn_egov_init_QustnrRespondManage(){

}
/* ********************************************************
 * 목록 으로 가기
 ******************************************************** */
function fn_egov_list_QustnrRespondManage(){
	location.href = "/uss/olp/qrm/EgovQustnrRespondManageList.do";
}
/* ********************************************************
 * 저장처리화면
 ******************************************************** */
function fn_egov_modify_QustnrRespondManage(){
	var vFrom = document.QustnrRespondManageForm;
	vFrom.cmd.value = '';
	vFrom.action = "/uss/olp/qrm/EgovQustnrRespondManageModify.do";;
	vFrom.submit();

}
/* ********************************************************
 * 삭제처리
 ******************************************************** */
function fn_egov_delete_QustnrRespondManage(){
	var vFrom = document.QustnrRespondManageForm;
	if(confirm("삭제 하시겠습니까?")){
		vFrom.cmd.value = 'del';
		vFrom.action = "/uss/olp/qrm/EgovQustnrRespondManageDetail.do";
		vFrom.submit();
	}else{
		vFrom.cmd.value = '';
	}
}
</script>
</head>
<body onLoad="fn_egov_init_QustnrRespondManage();">
<DIV id="content" style="width:712px">
<!-- ------------------------------------------------------------------ 상단타이틀 -->
<form name="QustnrRespondManageForm" action="<c:url value=''/>" method="post">
<!-- ----------------- 상단 타이틀  영역 -->
<table width="100%" cellpadding="8" class="table-search" border="0">
 <tr>
  <td width="100%"class="title_left">
   <img src="${ImgUrl}icon/tit_icon.gif" width="16" height="16" hspace="3" align="absmiddle">&nbsp;응답자정보 상세보기</td>
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
    </td>
  </tr>
  <tr> 
    <th width="20%" height="23" class="required_text" nowrap >성별<img src="${ImgUrl}icon/required.gif" width="15" height="15"></th>
    <td width="80%">
    
<c:forEach items="${comCode014}" var="comCodeList" varStatus="status">
<c:if test="${comCodeList.code eq resultList[0].sexdstnCode}">	
<c:out value="${fn:replace(comCodeList.codeNm , crlf , '<br/>')}" escapeXml="false" />
</c:if>
</c:forEach>

    </td>
  </tr>
  <tr> 
    <th width="20%" height="23" class="required_text" nowrap >직업<img src="${ImgUrl}icon/required.gif" width="15" height="15"></th>
    <td width="80%">
<c:forEach items="${comCode034}" var="comCodeList" varStatus="status">
<c:if test="${comCodeList.code eq resultList[0].occpTyCode}">	
<c:out value="${fn:replace(comCodeList.codeNm , crlf , '<br/>')}" escapeXml="false" />
</c:if>
</c:forEach>
    </td>
  </tr>
  <tr> 
    <th height="23" class="required_text" >생년월일<img src="${ImgUrl}icon/required.gif" width="15" height="15"></th>
    <td>
     ${fn:substring(resultList[0].brth, 0, 4)}-
     ${fn:substring(resultList[0].brth, 4, 6)}-
     ${fn:substring(resultList[0].brth, 6, 8)}
    </td>
  </tr> 
  
  <tr> 
    <th width="20%" height="23" class="required_text" nowrap >응답자명<img src="${ImgUrl}icon/required.gif" width="15" height="15"></th>
    <td width="80%">
		<c:out value="${fn:replace(resultList[0].respondNm , crlf , '<br/>')}" escapeXml="false" />  
    </td>
  </tr>
  
  <tr> 
    <th width="20%" height="23" class="required_text" nowrap >전화번호<img src="${ImgUrl}icon/required.gif" width="15" height="15"></th>
    <td width="80%">
		${resultList[0].areaNo}-${resultList[0].middleTelno}-${resultList[0].endTelno}
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
  <td background="<c:out value="${ImgUrl}"/>button/bu2_bg.gif" class="text_left" nowrap><a href="JavaScript:fn_egov_list_QustnrRespondManage();"><spring:message code="button.list" /></a> 
  </td>
  <td><img src="<c:out value="${ImgUrl}"/>button/bu2_right.gif" width="8" height="20"></td>      
  <td>&nbsp;</td>
  <td><img src="<c:out value="${ImgUrl}"/>button/bu2_left.gif" width="8" height="20"></td>
  <td background="<c:out value="${ImgUrl}"/>button/bu2_bg.gif" class="text_left" nowrap><a href="JavaScript:fn_egov_delete_QustnrRespondManage();"><spring:message code="button.delete" /></a> 
  </td>
  <td><img src="<c:out value="${ImgUrl}"/>button/bu2_right.gif" width="8" height="20"></td>
  <td>&nbsp;</td>
  <td><img src="<c:out value="${ImgUrl}"/>button/bu2_left.gif" width="8" height="20"></td>
  <td background="<c:out value="${ImgUrl}"/>button/bu2_bg.gif" class="text_left" nowrap><a href="JavaScript:fn_egov_modify_QustnrRespondManage();"><spring:message code="button.update" /></a> 
  </td>
  <td><img src="<c:out value="${ImgUrl}"/>button/bu2_right.gif" width="8" height="20"></td>    
</tr>
</table>
</center>
<input name="qestnrRespondId" type="hidden" value="${resultList[0].qestnrRespondId}">

<input name="cmd" type="hidden" value="<c:out value=''/>"/>
</form>
</DIV>

</body>
</html>