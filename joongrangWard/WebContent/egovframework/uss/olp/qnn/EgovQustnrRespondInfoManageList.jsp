<%--
  Class Name : EgovQustnrRespondInfoManageList.jsp
  Description : 설문조사(설문등록) 목록 페이지
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
<c:set var="ImgUrl" value="/images/egovframework/uss/olp/qnn/"/>
<c:set var="CssUrl" value="/css/egovframework/uss/olp/qnn/"/>
<%--  자마스크립트 메세지 출력 --%>
${reusltScript}
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
	document.listForm.action = "<c:url value='/uss/olp/qnn/EgovQustnrRespondInfoManageList.do'/>";
   	document.listForm.submit();
}

/* ********************************************************
 * 검색 함수
 ******************************************************** */
function fn_egov_search_QustnrManage(){
	var vFrom = document.listForm;

	vFrom.action = "<c:url value='/uss/olp/qnn/EgovQustnrRespondInfoManageList.do'/>";
	vFrom.submit();
	
}

/* ********************************************************
 * 선택한 설문지정보 -> 설문문항 바로가기
 ******************************************************** */
function fn_egov_regist_QustnrRespondInfoManage(qestnrId, qestnrTmplatId){

	 document.getElementById("qestnrId").value = qestnrId;
	 document.getElementById("qestnrTmplatId").value = qestnrTmplatId; 
	 document.listForm.action = "<c:url value='/uss/olp/qnn/EgovQustnrRespondInfoManageRegist.do'/>";
	 document.listForm.submit();
}

 /* ********************************************************
  * 선택한 전체 통계보기
  ******************************************************** */
 function fn_egov_statistics_QustnrRespondInfoManage(qestnrId, qestnrTmplatId){

 	 document.getElementById("qestnrId").value = qestnrId;
 	 document.getElementById("qestnrTmplatId").value = qestnrTmplatId; 
 	 document.listForm.action = "<c:url value='/uss/olp/qnn/EgovQustnrRespondInfoManageStatistics.do'/>";
 	 document.listForm.submit();
 }

</script>
</head>

<DIV id="content" style="width:712px">

<form name="listForm" id="listForm" action="<c:url value=''/>" method="post">
<table width="100%" cellpadding="1" class="table-search" border="0">
 <tr>
  <td class="title_left">

   <img src="<c:out value="${ImgUrl}"/>icon/tit_icon.gif" width="16" height="16" hspace="3" align="absmiddle">&nbsp;설문참여  목록</td>
  <th>
  </th>
  <td width="110px">
   	<select name="searchCondition" class="select" style="width:100%">
		   <option value=''>--선택하세요--</option>
		   <option value='QESTNR_SJ' <c:if test="${searchCondition == 'QESTNR_SJ'}">selected</c:if>>설문제목</option>
		   <option value='FRST_REGISTER_ID' <c:if test="${searchCondition == 'FRST_REGISTER_ID'}">selected</c:if>>등록자</option>
	   </select>
	</td>
  <td width="180px">
    <input name="searchKeyword" type="text" size="10" value="${searchKeyword}" maxlength="35" style="width:100%"> 
  </td>
  <th width="70px" align="center">
   <table border="0" cellspacing="0" cellpadding="0" align="center">
    <tr> 
      <td><img src="/images/egovframework/uss/olp/mgt/button/bu2_left.gif" width="8" height="20"></td>
      <td background="<c:out value="${ImgUrl}"/>button/bu2_bg.gif" class="text_left" nowrap><a href="JavaScript:fn_egov_search_QustnrManage()"><spring:message code="button.inquire" /></a> 
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
	<th class="title" nowrap>설문제목</th>
	<th class="title" width="150px" nowrap>설문기간</th>
	<th class="title" width="60px" nowrap>통계</th>
	<th class="title" width="70px" nowrap>등록자</th>   
	<th class="title" width="70px" nowrap>등록일자</th>         
</tr>
</thead> 
<tbody>
<%-- 데이터를 없을때 화면에 메세지를 출력해준다 --%>
<c:if test="${fn:length(resultList) == 0}">
<tr> 
<td class="lt_text3" colspan="8">
	<spring:message code="common.nodata.msg" />
</td>
</tr>   	          				 			   
</c:if>
 <%-- 데이터를 화면에 출력해준다 --%>
<c:forEach items="${resultList}" var="resultInfo" varStatus="status">
<tr>
	<td class="lt_text3" nowrap>${(searchVO.pageIndex-1) * searchVO.pageSize + status.count}</td>
	<td class="lt_text3L" nowrap>
	<div class="divDotText" style="width:300px;border:1px;"><a href="JavaScript:fn_egov_regist_QustnrRespondInfoManage('${resultInfo.qestnrId}','${resultInfo.qestnrTmplatId}');">${resultInfo.qestnrSj}</a></div>
	</td>
	<td class="lt_text3" nowrap>${resultInfo.qestnrBeginDe}~${resultInfo.qestnrEndDe}</td>
	
	<td class="lt_text3" nowrap><a href="JavaScript:fn_egov_statistics_QustnrRespondInfoManage('${resultInfo.qestnrId}','${resultInfo.qestnrTmplatId}');">보기</a></td>
	<td class="lt_text3" nowrap>${resultInfo.frstRegisterNm}</td>
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
<input name="qestnrId" id="qestnrId" type="hidden" value="">
<input name="qestnrTmplatId" id="qestnrTmplatId" type="hidden" value="">

<input name="pageIndex" type="hidden" value="<c:out value='${searchVO.pageIndex}'/>"/>

</form>

</DIV>

