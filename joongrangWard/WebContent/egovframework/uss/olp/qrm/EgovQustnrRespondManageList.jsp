<%--
  Class Name : EgovQustnrRespondManageList.jsp
  Description : 응답자정보 목록 페이지
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
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<c:set var="ImgUrl" value="/images/egovframework/uss/olp/qrm/"/>
<c:set var="CssUrl" value="/css/egovframework/uss/olp/qrm/"/>
<html>
<head>
<title>EGOV-COM</title>
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<link type="text/css" rel="stylesheet" href="${CssUrl}com.css" />
<script type="text/javaScript" language="javascript">
/* ********************************************************
 * 페이징 처리 함수
 ******************************************************** */
function linkPage(pageNo){
	document.listForm.pageIndex.value = pageNo;
	document.listForm.action = "<c:url value='/uss/olp/qrm/EgovQustnrRespondManageList.do'/>";
   	document.listForm.submit();
}
/* ********************************************************
 * 등록 처리 함수 
 ******************************************************** */
function fn_egov_regist_QustnrRespondManage(){
	location.href = "/uss/olp/qrm/EgovQustnrRespondManageRegist.do";
}
/* ********************************************************
 * 상세회면 처리 함수
 ******************************************************** */
function fn_egov_detail_QustnrRespondManage(qestnrRespondId){
	var vFrom = document.listForm; 
	vFrom.qestnrRespondId.value = qestnrRespondId; 
	vFrom.action = "/uss/olp/qrm/EgovQustnrRespondManageDetail.do"; 
	vFrom.submit();
}

/* ********************************************************
 * 검색 함수
 ******************************************************** */
function fn_egov_search_QustnrRespondManage(){
	var vFrom = document.listForm;

	vFrom.action = "/uss/olp/qrm/EgovQustnrRespondManageList.do";
	vFrom.submit();
	
}



</script>
</head>

<DIV id="content" style="width:712px">

<form name="listForm" action="<c:url value=''/>" method="post">
<table width="100%" cellpadding="1" class="table-search" border="0">
 <tr>
  <td class="title_left">

   <img src="<c:out value="${ImgUrl}"/>icon/tit_icon.gif" width="16" height="16" hspace="3" align="absmiddle">&nbsp;응답자정보 목록</td>
  <th>
  </th>
  <td width="110px">
   	<select name="searchCondition" class="select" style="width:100%">
		   <option value=''>--선택하세요--</option>
		   <option value='RESPOND_NM' <c:if test="${searchCondition == 'RESPOND_NM'}">selected</c:if>>응답자명</option>
		   <option value='BRTH' <c:if test="${searchCondition == 'BRTH'}">selected</c:if>>생년월일</option>
	   </select>
	</td>
  <td width="180px">
    <input name="searchKeyword" type="text" size="10" value="${searchKeyword}" maxlength="35" style="width:100%"> 
  </td>
  <th width="70px" align="center">
   <table border="0" cellspacing="0" cellpadding="0" align="center">
    <tr> 
      <td><img src="${ImgUrl}button/bu2_left.gif" width="8" height="20"></td>
      <td background="<c:out value="${ImgUrl}"/>button/bu2_bg.gif" class="text_left" nowrap><a href="JavaScript:fn_egov_search_QustnrRespondManage()"><spring:message code="button.inquire" /></a> 
      </td>
      <td><img src="<c:out value="${ImgUrl}"/>button/bu2_right.gif" width="8" height="20"></td>
      <td>&nbsp;</td>
      <td><img src="<c:out value="${ImgUrl}"/>button/bu2_left.gif" width="8" height="20"></td>
      <td background="<c:out value="${ImgUrl}"/>button/bu2_bg.gif" class="text_left" nowrap><a href="javascript:fn_egov_regist_QustnrRespondManage();"><spring:message code="button.create" /></a> 
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
    <th class="title" nowrap>설문지정보(제목)</th>
    <th class="title" width="80px" nowrap>응답자명</th>
    <th class="title" width="100px" nowrap>등록자</th>       
    <th class="title" width="70px" nowrap>등록일자</th>                 
  </tr>
</thead> 
<tbody>
<%-- 데이터를 없을때 화면에 메세지를 출력해준다 --%>
<c:if test="${fn:length(resultList) == 0}">
<tr> 
<td class="lt_text3" colspan="5">
	<spring:message code="common.nodata.msg" />
</td>
</tr>   	          				 			   
</c:if>
 <%-- 데이터를 화면에 출력해준다 --%>
<c:forEach items="${resultList}" var="resultInfo" varStatus="status">
<tr>
    <td class="lt_text3" nowrap>${(searchVO.pageIndex-1) * searchVO.pageSize + status.count}</td>
    <td class="lt_text3L" nowrap>
    <div class="divDotText" style="width:420px; border:solid 0px;"><a href="#" onClick="fn_egov_detail_QustnrRespondManage('${resultInfo.qestnrRespondId}')">${resultInfo.qestnrSj}</a></div>
    </td>
    <td class="lt_text3">${resultInfo.respondNm}</div></td>
    <td class="lt_text3">${resultInfo.frstRegisterNm}</td>
    <td class="lt_text3">${fn:substring(resultInfo.frstRegisterPnttm, 0, 10)}</td>
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
<input name="qestnrRespondId" type="hidden" value="">
<input name="searchMode" type="hidden" value="">

<input name="pageIndex" type="hidden" value="<c:out value='${searchVO.pageIndex}'/>"/>

</form>

</DIV>

