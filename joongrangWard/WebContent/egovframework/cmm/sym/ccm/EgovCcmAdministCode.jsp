<%
 /**
  * @Class Name  : EgovCcmAdministCode.jsp
  * @Description : EgovCcmAdministCode 화면
  * @Modification Information
  * @
  * @  수정일             수정자                   수정내용
  * @ -------    --------    ---------------------------
  * @ 2009.04.01   이중호              최초 생성
  *
  *  @author 공통서비스팀 
  *  @since 2009.04.01
  *  @version 1.0
  *  @see
  *  
  *  Copyright (C) 2009 by MOPAS  All right reserved.
  */
%>

<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<html>
<head>
<title>행정코드 목록</title>
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<link type="text/css" rel="stylesheet" href="/css/egovframework/cmm/sym/ccm/com.css" />
<script type="text/javaScript" language="javascript">
<!--
/* ********************************************************
 * 초기화
 ******************************************************** */
function fnInit(){
	var varParam        = window.dialogArguments;
	var varForm			= document.all["Form"];
	var pForm			= parent.document.all["pForm"];
	if (varParam.administZoneSe) {
		var administZoneSe = varParam.administZoneSe;
		if(pForm.init.value != "OK") {
			pForm.init.value  = "OK";
			varForm.action      = "<c:url value='/sym/ccm/adc/EgovCcmAdministCode.do'/>";
			varForm.searchCondition.value  = administZoneSe;
			varForm.submit();
		}
	}
}

/* ********************************************************
 * 페이징 처리 함수
 ******************************************************** */
function linkPage(pageNo){
	document.listForm.pageIndex.value = pageNo;
	document.listForm.action = "<c:url value='/sym/ccm/adc/EgovCcmAdministCode.do'/>";
   	document.listForm.submit();
}
/* ********************************************************
 * 조회 처리 
 ******************************************************** */
function fnSearch(){
	document.listForm.pageIndex.value = 1;
   	document.listForm.submit();
}
/* ********************************************************
* 결과 반환 
******************************************************** */
function fnReturnDay(administZoneCode,administZoneNm){
	var retVal   = new Object();
	retVal.administZoneCode = administZoneCode;
	retVal.administZoneNm   = administZoneNm;
	parent.window.returnValue = retVal;
	parent.window.close();
}	
-->
</script>
</head>

<body onLoad=javascript:fnInit();>

<DIV id="content" style="display">
<form name="Form" action="" method="post">
	<input type=hidden name="administZoneSe">
	<input type=hidden name="administZoneCode">
	<input type=hidden name="searchCondition">
</form>
<form name="listForm" action="<c:url value='/sym/ccm/adc/EgovCcmAdministCode.do'/>" method="post">
<table width="700" cellpadding="8" class="table-search" border="0">
 <tr>
  <td width="35%"class="title_left">

   <img src="/images/egovframework/cmm/sym/ccm/icon/tit_icon.gif" width="16" height="16" hspace="3" align="absmiddle" alt="제목">&nbsp;행정코드 목록</td>
  <th>
  </th>
	  <td width="25%">
		   <c:if test="${searchVO.searchCondition == '1'}">법정동 지역명</c:if>
		   <c:if test="${searchVO.searchCondition == '2'}">행정동 지역명</c:if>
	  </td>
  <td width="30%">
    <input name="searchKeyword" type="text" size="20" value="${searchVO.searchKeyword}"  maxlength="20" > 
  </td>
  <th width="10%">
   <table border="0" cellspacing="0" cellpadding="0">
    <tr> 
      <td><img src="/images/egovframework/cmm/sym/ccm/btn/bu2_left.gif" alt="조회" width="8" height="20"></td>
      <td background="/images/egovframework/cmm/sym/ccm/btn/bu2_bg.gif" class="text_left" nowrap><a href="javascript:fnSearch();" >조회</a></td>
      <td><img src="/images/egovframework/cmm/sym/ccm/btn/bu2_right.gif" alt="조회" width="8" height="20"></td>
    </tr>
   </table>
  </th>  
 </tr>
</table>

<table width="700" cellspacing="0" cellpadding="0" border="0">
<tr>
	<td height="3px"></td>
</tr>
</table>

<table width="700" cellpadding="0" class="table-line" border="0">
<thead>
<tr>  
	<th class="title" width="10%" nowrap>순번</th>
	<th class="title" width="15%" nowrap>구분</th>
	<th class="title" width="15%" nowrap>행정구역코드</th>
	<th class="title" width="60%" nowrap>행정구역명</th>
</tr>
</thead>    
<tbody>
<c:forEach items="${resultList}" var="resultInfo" varStatus="status">
<tr style="cursor:pointer;cursor:hand;" onclick="javascript:fnReturnDay('${resultInfo.administZoneCode}','${resultInfo.administZoneNm}');">
	<td class="lt_text3" nowrap><c:out value="${(searchVO.pageIndex - 1) * searchVO.pageSize + status.count}"/></td>
	<td class="lt_text3" nowrap>
		<c:choose>
			<c:when test='${resultInfo.administZoneSe == "1"}'>법정동</c:when>
			<c:when test='${resultInfo.administZoneSe == "2"}'>행정동</c:when>
		</c:choose>
	</td>
	<td class="lt_text3" nowrap>${resultInfo.administZoneCode}</td>
	<td class="lt_text"  nowrap>${resultInfo.administZoneNm}</td>
</tr>   
</c:forEach>

<c:if test="${fn:length(resultList) == 0}">
	<tr> 
		<td class="lt_text3" colspan=5>
			<spring:message code="common.nodata.msg" />
		</td>
	</tr>   	          				 			   
</c:if>
    	
    	
</tbody>  
</table>

<table width="700" cellspacing="0" cellpadding="0" border="0">
<tr>
	<td height="3px"></td>
</tr>
</table>

<div align="center">
	<div>
		<ui:pagination paginationInfo = "${paginationInfo}"
				type="image"
				jsFunction="linkPage"
				/>
	</div>
</div>

<input name="pageIndex" type="hidden" value="<c:out value='${searchVO.pageIndex}'/>"/>

</form>

</DIV>
</body>
