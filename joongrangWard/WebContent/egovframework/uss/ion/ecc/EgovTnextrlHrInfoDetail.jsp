<%--
  Class Name : EgovTnextrlHrInfoDetail.jsp
  Description : 외부인사정보 상세보기
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
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<c:set var="ImgUrl" value="/images/egovframework/uss/ion/ecc/"/>
<c:set var="CssUrl" value="/css/egovframework/uss/ion/ecc/com.css"/>
<%pageContext.setAttribute("crlf", "\r\n"); %>
<html>
<head>
<title>외부인사정보</title>
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<link type="text/css" rel="stylesheet" href="<c:out value="${CssUrl}"/>" />
<script type="text/javaScript" language="javascript">
/* ********************************************************
 * 초기화
 ******************************************************** */
function fn_egov_init_TnextrlHrInfo(){

}
/* ********************************************************
 * 목록 으로 가기
 ******************************************************** */
function fn_egov_list_TnextrlHrInfo(){
	location.href = "/uss/ion/ecc/EgovTnextrlHrInfoList.do";
}
/* ********************************************************
 * 저장처리화면
 ******************************************************** */
function fn_egov_modify_TnextrlHrInfo(){
	var vFrom = document.TnextrlHrInfoForm;
	vFrom.cmd.value = '';
	vFrom.action = "/uss/ion/ecc/EgovTnextrlHrInfoModify.do";;
	vFrom.submit();

}
/* ********************************************************
 * 삭제처리
 ******************************************************** */
function fn_egov_delete_TnextrlHrInfo(){
	var vFrom = document.TnextrlHrInfoForm;
	if(confirm("삭제 하시겠습니까?")){
		vFrom.cmd.value = 'del';
		vFrom.action = "/uss/ion/ecc/EgovTnextrlHrInfoDetail.do";
		vFrom.submit();
	}else{
		vFrom.cmd.value = '';
	}
}
</script>
</head>
<body onLoad="fn_egov_init_TnextrlHrInfo();">
<DIV id="content" style="width:712px">
<!-- ------------------------------------------------------------------ 상단타이틀 -->
<form name="TnextrlHrInfoForm" id="TnextrlHrInfoForm" action="<c:url value=''/>" method="post">
<!-- ----------------- 상단 타이틀  영역 -->
<table width="100%" cellpadding="8" class="table-search" border="0">
 <tr>
  <td width="100%"class="title_left">
   <img src="<c:out value="${ImgUrl}"/>icon/tit_icon.gif" width="16" height="16" hspace="3" align="absmiddle">&nbsp;외부인사정보 상세보기</td>
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
    <th width="20%" height="23" class="required_text" nowrap>행사/이벤트/캠페인/(내용)<img src="${ImgUrl}icon/required.gif" width="15" height="15"></th>
    <td width="80%">
      ${resultList[0].eventCn}
    </td>
  </tr>
  <tr> 
    <th height="23" class="required_text">성별<img src="${ImgUrl}icon/required.gif" width="15" height="15"></th>
    <td>
      	
<c:forEach items="${comCode014}" var="comCodeList" varStatus="status">
<c:if test="${comCodeList.code eq resultList[0].sexdstnCode}">	
<c:out value="${fn:replace(comCodeList.codeNm , crlf , '<br/>')}" escapeXml="false" />
</c:if>
</c:forEach>

    </td>
  </tr> 
  
  <tr> 
    <th width="20%" height="23" class="required_text" nowrap >외부인사명<img src="${ImgUrl}icon/required.gif" width="15" height="15"></th>
    <td width="80%">
       ${resultList[0].extrlHrNm}
    </td>
  </tr>
  
  <tr> 
    <th width="20%" height="23" class="required_text" nowrap >생년월일<img src="${ImgUrl}icon/required.gif" width="15" height="15"></th>
    <td width="80%">
     ${fn:substring(resultList[0].brth, 0, 4)}-
     ${fn:substring(resultList[0].brth, 4, 6)}-
     ${fn:substring(resultList[0].brth, 6, 8)}
    </td>
  </tr> 
        
  <tr>  
    <th width="20%" height="23" class="required_text" nowrap >직업유형<img src="${ImgUrl}icon/required.gif" width="15" height="15"></th>
    <td width="80%">
    
<c:forEach items="${comCode034}" var="comCodeList" varStatus="status">
<c:if test="${comCodeList.code eq resultList[0].occpTyCode}">	
<c:out value="${fn:replace(comCodeList.codeNm , crlf , '<br/>')}" escapeXml="false" />
</c:if>
</c:forEach>

    </td>
  </tr>
  
  <tr> 
    <th width="20%" height="23" class="required_text" nowrap >소속기관</th>
    <td width="80%">
       ${resultList[0].psitnInsttNm}
    </td>
  </tr>
  
  <tr> 
    <th width="20%" height="23" class="required_text" nowrap >전화번호<img src="${ImgUrl}icon/required.gif" width="15" height="15"></th>
    <td width="80%">
       ${resultList[0].areaNo}-${resultList[0].middleTelno}-${resultList[0].endTelno}
    </td>
  </tr>
  <tr> 
    <th width="20%" height="23" class="required_text" nowrap >이메일주소<img src="${ImgUrl}icon/required.gif" width="15" height="15"></th>
    <td width="80%">
        ${resultList[0].emailAdres}
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
  <td background="<c:out value="${ImgUrl}"/>button/bu2_bg.gif" class="text_left" nowrap><a href="JavaScript:fn_egov_list_TnextrlHrInfo();">목록</a> 
  </td>
  <td><img src="<c:out value="${ImgUrl}"/>button/bu2_right.gif" width="8" height="20"></td>      
  <td>&nbsp;</td>
  <td><img src="<c:out value="${ImgUrl}"/>button/bu2_left.gif" width="8" height="20"></td>
  <td background="<c:out value="${ImgUrl}"/>button/bu2_bg.gif" class="text_left" nowrap><a href="JavaScript:fn_egov_delete_TnextrlHrInfo();">삭제</a> 
  </td>
  <td><img src="<c:out value="${ImgUrl}"/>button/bu2_right.gif" width="8" height="20"></td>
  <td>&nbsp;</td>
  <td><img src="<c:out value="${ImgUrl}"/>button/bu2_left.gif" width="8" height="20"></td>
  <td background="<c:out value="${ImgUrl}"/>button/bu2_bg.gif" class="text_left" nowrap><a href="JavaScript:fn_egov_modify_TnextrlHrInfo();">수정</a> 
  </td>
  <td><img src="<c:out value="${ImgUrl}"/>button/bu2_right.gif" width="8" height="20"></td>    
</tr>
</table>
</center>
<input name="eventId" type="hidden" value="${resultList[0].eventId}">
<input name="extrlHrId" type="hidden" value=" ${resultList[0].extrlHrId}">
<input name="cmd" type="hidden" value="<c:out value='save'/>"/>
</form>
</DIV>

</body>
</html>