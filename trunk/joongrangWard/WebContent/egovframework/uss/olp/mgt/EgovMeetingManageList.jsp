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
<title>EgovMeetingManageList</title>
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<link type="text/css" rel="stylesheet" href="/css/egovframework/uss/olp/mgt/com.css" />
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
 * 등록 처리 함수 
 ******************************************************** */
function fn_egov_regist_MeetingManage(){
	location.href = "/uss/olp/mgt/EgovMeetingManageRegist.do";
}
/* ********************************************************
 * 수정 처리 함수
 ******************************************************** */
function fn_egov_modify_MeetingManage(){
	location.href = "/uss/olp/mgt/EgovMeetingManageModify.do";
}
/* ********************************************************
 * 상세회면 처리 함수
 ******************************************************** */
function fn_egov_detail_MeetingManage(mtgId){
	var vFrom = document.listForm;
	vFrom.mtgId.value = mtgId;
	vFrom.action = "/uss/olp/mgt/EgovMeetingManageDetail.do";
	vFrom.submit();
}
/* ********************************************************
 * 삭제 처리 함수
 ******************************************************** */
function fn_egov_delete_MeetingManage(mtgId){
	var vFrom = document.listForm;
	if(confirm("삭제 하시겠습니까?")){
		vFrom.mtgId.value = mtgId;
		vFrom.cmd.value = 'del';
		vFrom.action = "/uss/olp/mgt/EgovMeetingManageList.do";
		vFrom.submit();
	}else{
		vFrom.cmd.value = '';
	}
}
/* ********************************************************
 * 검색 함수
 ******************************************************** */
function fn_egov_search_MeetingManage(){
	var vFrom = document.listForm;

	
	vFrom.action = "/uss/olp/mgt/EgovMeetingManageList.do";
	vFrom.submit();
	
}
</script>
</head>

<DIV id="content" style="width:712px">
<form name="listForm" id="listForm" action="<c:url value=''/>" method="post">
<table width="100%" cellpadding="1" class="table-search" border="0">
 <tr>
  <td class="title_left">

   <img src="<c:out value="${ImgUrl}"/>icon/tit_icon.gif" width="16" height="16" hspace="3" align="absmiddle">&nbsp;회의정보 목록</td>
  <th>
  </th>
  <td width="110px">
   	<select name="searchCondition" class="select" style="width:100%">
		   <option value=''>--선택하세요--</option>
		   <option value='MTG_NM' <c:if test="${searchCondition == 'MTG_NM'}">selected</c:if>>회의명</option>
		   <option value='MTG_MTR_CN' <c:if test="${searchCondition == 'MTG_MTR_CN'}">selected</c:if>>회의안건내용</option>
	   </select>
	</td>
  <td width="180px">
    <input name="searchKeyword" type="text" size="10" value="${searchKeyword}" maxlength="35" style="width:100%"> 
  </td>
  <th width="70px" align="center">
   <table border="0" cellspacing="0" cellpadding="0" align="center">
    <tr> 
      <td><img src="/images/egovframework/uss/olp/mgt/button/bu2_left.gif" width="8" height="20"></td>
      <td background="<c:out value="${ImgUrl}"/>button/bu2_bg.gif" class="text_left" nowrap><a href="JavaScript:fn_egov_search_MeetingManage()">조회</a> 
      </td>
      <td><img src="<c:out value="${ImgUrl}"/>button/bu2_right.gif" width="8" height="20"></td>
      <td>&nbsp;</td>
      <td><img src="<c:out value="${ImgUrl}"/>button/bu2_left.gif" width="8" height="20"></td>
      <td background="<c:out value="${ImgUrl}"/>button/bu2_bg.gif" class="text_left" nowrap><a href="javascript:fn_egov_regist_MeetingManage();">등록</a> 
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
    <th class="title" width="80px" nowrap>회의일자</th>
    <th class="title" nowrap>회의명</th>
    <th class="title" width="100px" nowrap>회의장소</th>
    
    <th class="title" width="80px" nowrap>회의시작시간</th>
    <th class="title" width="80px" nowrap>회의종료시간</th>
    
    
    <th class="title" width="70px" nowrap>작성자명</th>   
    <th class="title" width="70px" nowrap>등록일자</th>          
</tr>
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
<!-- 
		<td><c:out value="${status.count}"/></td>
		<td>${resultInfo.mtgId}</td>
		<td>${resultInfo.mtgNm}</td>
		<td>${resultInfo.mtgMtrCn}</td>
		<td>${resultInfo.mtgSn}</td>
		<td>${resultInfo.mtgCo}</td>
		<td>${resultInfo.mtgDe}</td>
		<td>${resultInfo.mtgPlace}</td>
		<td>${resultInfo.mtgBeginTime}</td>
		<td>${resultInfo.mtgEndTime}</td>
 -->
  <tr>
		<td class="lt_text3">${(searchVO.pageIndex-1) * searchVO.pageSize + status.count}</td>
		<td class="lt_text3"><a href="javascript:fn_egov_detail_MeetingManage('${resultInfo.mtgId}');">${resultInfo.mtgDe}</a></td>
		<td ><a href="javascript:fn_egov_detail_MeetingManage('${resultInfo.mtgId}');">${resultInfo.mtgNm}</a></td>
		<td class="lt_text3">${resultInfo.mtgPlace}</td>
		
		<td class="lt_text3">
		<c:forTokens var="one" 
		            items="${resultInfo.mtgBeginTime}"
		            delims=":" varStatus="sts">
		         <c:if test="${sts.count == 1}">${one}시</c:if>
		         <c:if test="${sts.count == 2}">${one}분</c:if>
		</c:forTokens>
		</td>
		<td class="lt_text3">
		<c:forTokens var="one" 
		            items="${resultInfo.mtgEndTime}"
		            delims=":" varStatus="sts">
		         <c:if test="${sts.count == 1}">${one}시</c:if>
		         <c:if test="${sts.count == 2}">${one}분</c:if>
		</c:forTokens>
		</td>
		<td class="lt_text3">${resultInfo.frstRegisterNm}</td>
		<td class="lt_text3" nowrap>${fn:substring(resultInfo.frstRegisterPnttm, 0, 10)}</td>
  </tr>   
</c:forEach>
</tbody>  
</table>

<table width="100%" cellspacing="0" cellpadding="0" border="0">
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
<input name="mtgId" type="hidden" value="">
<input name="mtgNm" type="hidden" value="">
<input name="mtgMtrCn" type="hidden" value="">
<input name="mtgSn" type="hidden" value="">
<input name="mtgCo" type="hidden" value="">
<input name="mtgDe" type="hidden" value="">

<input name="cmd" type="hidden" value="">

<input name="pageIndex" type="hidden" value="<c:out value='${searchVO.pageIndex}'/>"/>

</form>

</DIV>

