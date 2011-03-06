<%--
  Class Name : EgovQustnrTmplatManageDetail.jsp
  Description : 설문템플릿 상세보기
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
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<c:set var="ImgUrl" value="/images/egovframework/uss/olp/qtm/"/>
<c:set var="CssUrl" value="/css/egovframework/uss/olp/qtm/"/>
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
function fn_egov_init_QustnrTmplatManage(){

}
/* ********************************************************
 * 목록 으로 가기
 ******************************************************** */
function fn_egov_list_QustnrTmplatManage(){
	location.href = "/uss/olp/qtm/EgovQustnrTmplatManageList.do";
}
/* ********************************************************
 * 저장처리화면
 ******************************************************** */
function fn_egov_modify_QustnrTmplatManage(){
	var vFrom = document.QustnrTmplatManageForm;
	vFrom.cmd.value = '';
	vFrom.action = "/uss/olp/qtm/EgovQustnrTmplatManageModify.do";;
	vFrom.submit();

}
/* ********************************************************
 * 삭제처리
 ******************************************************** */
function fn_egov_delete_QustnrTmplatManage(){
	var vFrom = document.QustnrTmplatManageForm;
	if(confirm("삭제시 설문템플릿, 설문항목, 설문문항, 설문응답자관리, 설문조사(설문결과)\n정보가 함께 삭제됩니다!\n\n삭제 하시겠습니까?")){
		vFrom.cmd.value = 'del';
		vFrom.action = "/uss/olp/qtm/EgovQustnrTmplatManageDetail.do";
		vFrom.submit();
	}else{
		vFrom.cmd.value = '';
	}
}
</script>
</head>
<body onLoad="fn_egov_init_QustnrTmplatManage();">
<DIV id="content" style="width:712px">
<!-- ------------------------------------------------------------------ 상단타이틀 -->
<form name="QustnrTmplatManageForm" id="QustnrTmplatManageForm" action="<c:url value=''/>" method="post">
<!-- ----------------- 상단 타이틀  영역 -->
<table width="100%" cellpadding="8" class="table-search" border="0">
 <tr>
  <td width="100%"class="title_left">
   <img src="${ImgUrl}icon/tit_icon.gif" width="16" height="16" hspace="3" align="absmiddle">&nbsp;설문템플릿 상세보기</td>
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
    <th height="23" class="required_text" >템플릿유형<img src="${ImgUrl}icon/required.gif" width="15" height="15"></th>
    <td >
       ${resultList[0].qestnrTmplatTy}   
    </td>
  </tr> 
  
  <tr> 
    <th width="20%" height="23" class="required_text" nowrap >템플릿유형&nbsp;&nbsp;&nbsp;<br>이미지정보<img src="${ImgUrl}icon/required.gif" width="15" height="15"></th>
    <td width="80%" >
     <c:if test="${resultList[0].qestnrTmplatImagepathnm ne null}">
      	<c:if test="${resultList[0].qestnrTmplatImagepathnm ne ''}">
    	<img src="/uss/olp/qtm/EgovQustnrTmplatManageImg.do?qestnrTmplatId=${resultList[0].qestnrTmplatId}">
    	</c:if>
	</c:if>
    </td> 
  </tr>
  
  <tr> 
    <th width="20%" height="23" class="required_text" nowrap >템플릿설명<img src="${ImgUrl}icon/required.gif" width="15" height="15"></th>
    <td width="80%" >
      <br>
      <c:out value="${fn:replace(resultList[0].qestnrTmplatCn , crlf , '<br/>')}" escapeXml="false" />
	  <br><br>
    </td>
  </tr>
  <tr> 
    <th width="20%" height="23" class="required_text" nowrap >템플릿파일(경로)<img src="${ImgUrl}icon/required.gif" width="15" height="15"></th>
    <td width="80%" >
     ${resultList[0].qestnrTmplatCours}    
    </td>
  </tr>
</table>

<!-- ------------------------------------------------------------------ 줄간격조정  -->
<table width="100%" cellspacing="0" cellpadding="0" border="0">
<tr>
	<td height="3px"></td>
</tr>
</table>
<!-- ------------------------------------------------------------------ 목록/저장버튼  -->
<center>
<table border="0" cellspacing="0" cellpadding="0" align="center">
<tr> 
  <td><img src="<c:out value="${ImgUrl}"/>button/bu2_left.gif" width="8" height="20"></td>
  <td background="<c:out value="${ImgUrl}"/>button/bu2_bg.gif" class="text_left" nowrap><a href="JavaScript:fn_egov_list_QustnrTmplatManage();"><spring:message code="button.list" /></a> 
  </td>
  <td><img src="<c:out value="${ImgUrl}"/>button/bu2_right.gif" width="8" height="20"></td>      
  <td>&nbsp;</td>
  <td><img src="<c:out value="${ImgUrl}"/>button/bu2_left.gif" width="8" height="20"></td>
  <td background="<c:out value="${ImgUrl}"/>button/bu2_bg.gif" class="text_left" nowrap><a href="JavaScript:fn_egov_delete_QustnrTmplatManage();"><spring:message code="button.delete" /></a> 
  </td>
  <td><img src="<c:out value="${ImgUrl}"/>button/bu2_right.gif" width="8" height="20"></td>
  <td>&nbsp;</td>
  <td><img src="<c:out value="${ImgUrl}"/>button/bu2_left.gif" width="8" height="20"></td>
  <td background="<c:out value="${ImgUrl}"/>button/bu2_bg.gif" class="text_left" nowrap><a href="JavaScript:fn_egov_modify_QustnrTmplatManage();"><spring:message code="button.update" /></a> 
  </td>
  <td><img src="<c:out value="${ImgUrl}"/>button/bu2_right.gif" width="8" height="20"></td>    
</tr>
</table>
</center>
<input name="qestnrTmplatId" type="hidden" value="${resultList[0].qestnrTmplatId} "/>

<input name="cmd" type="hidden" value="<c:out value=''/>"/>
</form>
</DIV>

</body>
</html>