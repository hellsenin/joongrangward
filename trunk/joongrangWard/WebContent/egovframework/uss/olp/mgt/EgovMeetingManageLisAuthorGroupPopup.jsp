<%--
  Class Name : EgovMeetingManageList.jsp
  Description : 회의정보 목록 페이지
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
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<c:set var="ImgUrl" value="/images/egovframework/uss/olp/mgt/"/>
<html>
<head>
<title>부서 검색 팝업</title>
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<link type="text/css" rel="stylesheet" href="/css/egovframework/uss/olp/mgt/com.css" />
<base target="_self" />
<script type="text/javaScript" language="javascript">
/* ********************************************************
 * 페이징 처리 함수
 ******************************************************** */
function linkPage(pageNo){
	document.listForm.pageIndex.value = pageNo;
	document.listForm.action = "<c:url value='/uss/olp/mgt/EgovMeetingManageList.do'/>";
   	document.listForm.submit();
}

/* ********************************************************
 * 검색 함수
 ******************************************************** */
function fn_egov_search_MeetingManage(){
	var vFrom = document.listForm;
	
	vFrom.action = "/uss/olp/mgt/EgovMeetingManageLisAuthorGroupPopup.do";
	vFrom.submit();
	
}
/* ********************************************************
 * 선택 처리 함수
 ******************************************************** */
function fn_egov_open_Popup(cnt, groupId){
	
	var opener = window.dialogArguments
	/*
	회의관리/주관자부서
	*/
	if(opener[1] == "typeMeeting1"){
		opener[0].document.getElementById("mnaerDeptId").value = groupId;
		opener[0].document.getElementById("mnaerDeptNm").value = document.getElementById("iptText_"+ cnt).value;
	}else if(opener[1] == "typeMeeting2"){
		opener[0].document.getElementById("mngtDeptId").value = groupId;
		opener[0].document.getElementById("mngtDeptNm").value = document.getElementById("iptText_"+ cnt).value;		
	}else if(opener[1] == "typeDeptSchdule"){
		opener[0].document.getElementById("schdulDeptId").value = groupId;
		opener[0].document.getElementById("schdulDeptName").value = document.getElementById("iptText_"+ cnt).value;
	}
	
	
	window.returnValue=true;
	window.close();
	
}
</script>
</head>

<DIV id="content" style="width:712px">
<form name="listForm" id="listForm" action="<c:url value=''/>" method="post">
<table width="100%" cellpadding="1" class="table-search" border="0">
 <tr>
  <td class="title_left">

   <img src="<c:out value="${ImgUrl}"/>icon/tit_icon.gif" width="16" height="16" hspace="3" align="absmiddle">&nbsp;부서 목록</td>
  <th>
  </th>
  <td width="110px">
   	<select name="searchCondition" class="select" style="width:100%">
		   <option value=''>--선택하세요--</option>
		   <option value='ORGNZT_NM' <c:if test="${searchCondition == 'GROUP_NM'}">selected</c:if>>부서명</option>
		   <option value='ORGNZT_DC' <c:if test="${searchCondition == 'GROUP_DC'}">selected</c:if>>부서설명</option>
	   </select>
	</td>
  <td width="180px">
    <input name="searchKeyword" type="text" size="10" value="${searchKeyword}" maxlength="35" style="width:100%"> 
  </td>
  <th width="30px" align="center">
   <table border="0" cellspacing="0" cellpadding="0" align="center">
    <tr> 
      <td><img src="/images/egovframework/uss/olp/mgt/button/bu2_left.gif" width="8" height="20"></td>
      <td background="<c:out value="${ImgUrl}"/>button/bu2_bg.gif" class="text_left" nowrap><a href="#" onClick="JavaScript:fn_egov_search_MeetingManage()">조회</a> 
      </td>
      <td><img src="<c:out value="${ImgUrl}"/>button/bu2_right.gif" width="8" height="20"></td>
      <td>&nbsp;</td>
    </tr>
   </table>
  </th>  
 </tr>
</table>

<table width="100%" cellspacing="0" cellpadding="0" border="0">
<tr>
	<td height="3px"></td>
</tr>
</table>
<table width="100%" cellpadding="0" class="table-line" border="0">
<thead>
<tr>  
    <th class="title" width="35px" nowrap>순번</th>
    <th class="title" width="100px" nowrap>부서명</th>
    <th class="title" nowrap>부서설명</th>
    <th class="title" width="30px" nowrap></th>
</thead>
<tbody>
<%-- 데이터를 없을때 화면에 메세지를 출력해준다 --%>
<c:if test="${fn:length(resultList) == 0}">
<tr> 
<td class="lt_text3" colspan="9">
	<spring:message code="common.nodata.msg" />
</td>
</tr>   	          				 			   
</c:if>
 <%-- 데이터를 화면에 출력해준다 --%>
<c:forEach items="${resultList}" var="resultInfo" varStatus="status">

  <tr>
		<td class="lt_text3">${(searchVO.pageIndex-1) * searchVO.pageSize + status.count}</td>
		<td class="lt_text3L">${resultInfo.orgnztNm}</td>
		<td class="lt_text3L">${resultInfo.orgnztDc}</td>
    	<td class="lt_text3" nowrap><a href="#" onClick="JavaScript:fn_egov_open_Popup('${status.count}', '${resultInfo.orgnztId}')">선택</td>
    	<input name="iptText_${status.count}" id="iptText_${status.count}" type="hidden" value="${resultInfo.orgnztNm}">
  </tr>   
</c:forEach>
</tbody>  
</table>

<table width="100%" cellspacing="0" cellpadding="0" border="0">
<tr>
	<td height="3px"></td>
</tr>
</table>

<input name="cmd" type="hidden" value="">

</form>

</DIV>

