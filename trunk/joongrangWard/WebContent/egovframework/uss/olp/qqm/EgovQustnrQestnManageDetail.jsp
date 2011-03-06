<%--
  Class Name : EgovQustnrQestnManageDetail.jsp
  Description : 설문문항 상세보기
  Modification Information
 
      수정일         수정자                   수정내용
    -------    --------    ---------------------------
     2008.03.09    장동한          최초 생성
 
    author   : 공통서비스 개발팀 장동한
    since    : 2009.03.19
   
    Copyright (C) 2009 by MOPAS  All right reserved.
--%>
<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<c:set var="ImgUrl" value="/images/egovframework/uss/olp/qqm/"/>
<c:set var="CssUrl" value="/css/egovframework/uss/olp/qqm/"/>
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
function fn_egov_init_QustnrQestnManage(){

}
/* ********************************************************
 * 목록 으로 가기
 ******************************************************** */
function fn_egov_list_QustnrQestnManage(){
	var vFrom = document.QustnrQestnManageForm;
	vFrom.cmd.value = '';
	vFrom.action = "/uss/olp/qqm/EgovQustnrQestnManageList.do";
	vFrom.submit();
}
/* ********************************************************
 * 저장처리화면
 ******************************************************** */
function fn_egov_modify_QustnrQestnManage(){
	var vFrom = document.QustnrQestnManageForm;
	vFrom.cmd.value = '';
	vFrom.action = "/uss/olp/qqm/EgovQustnrQestnManageModify.do";;
	vFrom.submit();

}
/* ********************************************************
 * 삭제처리
 ******************************************************** */
function fn_egov_delete_QustnrQestnManage(){
	var vFrom = document.QustnrQestnManageForm;
	if(confirm("삭제시  설문문항, 설문항목, 설문조사(설문결과)\n정보가 함께 삭제됩니다!\n\n삭제 하시겠습니까?")){
		vFrom.cmd.value = 'del';
		vFrom.action = "/uss/olp/qqm/EgovQustnrQestnManageDetail.do";
		vFrom.submit();
	}else{
		vFrom.cmd.value = '';
	}
}
</script>
</head>
<body onLoad="fn_egov_init_QustnrQestnManage();">
<DIV id="content" style="width:712px">
<!-- ------------------------------------------------------------------ 상단타이틀 -->
<form name="QustnrQestnManageForm" id="QustnrQestnManageForm" action="<c:url value=''/>" method="post">
<!-- ----------------- 상단 타이틀  영역 -->
<table width="100%" cellpadding="8" class="table-search" border="0">
 <tr>
  <td width="100%"class="title_left">
   <img src="${ImgUrl}icon/tit_icon.gif" width="16" height="16" hspace="3" align="absmiddle">&nbsp;설문문항 상세보기</td>
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
    <th width="20%" height="23" class="required_text" nowrap>설문지정보(제목)<img src="${ImgUrl}icon/required.gif" width="15" height="15"></th>
    <td width="80%">
      ${resultList[0].qestnrSj}
    </td>
  </tr>
  <tr> 
    <th width="20%" height="23" class="required_text" nowrap>질문순번<img src="${ImgUrl}icon/required.gif" width="15" height="15"></th>
    <td width="80%">
      ${resultList[0].qestnSn}  
    </td>
  </tr>
  <tr> 
    <th width="20%" height="23" class="required_text" nowrap >질문유형<img src="${ImgUrl}icon/required.gif" width="15" height="15"></th>
    <td width="80%">

<c:forEach items="${cmmCode018}" var="comCodeList" varStatus="status">
<c:if test="${comCodeList.code eq resultList[0].qestnTyCode}">	
<c:out value="${fn:replace(comCodeList.codeNm , crlf , '<br/>')}" escapeXml="false" />
</c:if>
</c:forEach>

    </td>
  </tr>
  <tr> 
    <th height="23" class="required_text" >질문 내용<img src="${ImgUrl}icon/required.gif" width="15" height="15"></th>
    <td>
      <br>
      <c:out value="${fn:replace(resultList[0].qestnCn , crlf , '<br/>')}" escapeXml="false" />
	  <br><br>
    </td>
  </tr> 
  <tr> 
    <th width="20%" height="23" class="required_text" nowrap >최대선택건수<img src="${ImgUrl}icon/required.gif" width="15" height="15"></th>
    <td width="80%">
    ${resultList[0].mxmmChoiseCo}
    </td>
  </tr>
<!-- 
  <tr> 
    <th width="20%" height="23" class="required_text" nowrap >최초등록시점</th>
    <td width="80%" nowrap>
    ${resultList[0].mxmmChoiseCo}
    </td>
  </tr>
	<tr> 
    <th width="20%" height="23" class="required_text" nowrap >최초등록아이디</th>
    <td width="80%" nowrap>
    ${resultList[0].frstRegisterId}
    </td>
  </tr>
  <tr> 
    <th width="20%" height="23" class="required_text" nowrap >최종수정시점</th>
    <td width="80%" nowrap>
    ${resultList[0].lastUpdusrPnttm}
    </td>
  </tr>
	<tr> 
    <th width="20%" height="23" class="required_text" nowrap >최종수정아이디</th>
    <td width="80%" nowrap>
    ${resultList[0].lastUpdusrId}
    </td>
  </tr>
 -->
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
  <td background="<c:out value="${ImgUrl}"/>button/bu2_bg.gif" class="text_left" nowrap><a href="JavaScript:fn_egov_list_QustnrQestnManage();"><spring:message code="button.list" /></a> 
  </td>
  <td><img src="<c:out value="${ImgUrl}"/>button/bu2_right.gif" width="8" height="20"></td>      
  <td>&nbsp;</td>
  <td><img src="<c:out value="${ImgUrl}"/>button/bu2_left.gif" width="8" height="20"></td>
  <td background="<c:out value="${ImgUrl}"/>button/bu2_bg.gif" class="text_left" nowrap><a href="JavaScript:fn_egov_delete_QustnrQestnManage();"><spring:message code="button.delete" /></a> 
  </td>
  <td><img src="<c:out value="${ImgUrl}"/>button/bu2_right.gif" width="8" height="20"></td>
  <td>&nbsp;</td>
  <td><img src="<c:out value="${ImgUrl}"/>button/bu2_left.gif" width="8" height="20"></td>
  <td background="<c:out value="${ImgUrl}"/>button/bu2_bg.gif" class="text_left" nowrap><a href="JavaScript:fn_egov_modify_QustnrQestnManage();"><spring:message code="button.update" /></a> 
  </td>
  <td><img src="<c:out value="${ImgUrl}"/>button/bu2_right.gif" width="8" height="20"></td>    
</tr>
</table>
</center>
<input name="qestnrQesitmId" type="hidden" value="${resultList[0].qestnrQesitmId}">
<input name="cmd" type="hidden" value="<c:out value=''/>"/>
<%-- 설문지정보 상태유지 --%>
<c:if test="${qustnrQestnManageVO.searchMode == 'Y'}">
<input name="qestnrTmplatId" id="qestnrTmplatId" type="hidden" value="${qustnrQestnManageVO.qestnrTmplatId}">
<input name="qestnrId" id="qestnrId" type="hidden" value="${qustnrQestnManageVO.qestnrId}">
<input name="searchMode" id="searchMode" type="hidden" value="${qustnrQestnManageVO.searchMode}">
</c:if>

</form>
</DIV>

</body>
</html>