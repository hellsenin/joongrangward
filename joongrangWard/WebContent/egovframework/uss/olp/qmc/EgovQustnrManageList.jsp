<%--
  Class Name : EgovQustnrManageList.jsp
  Description : 설문관리 목록 페이지
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
<c:set var="ImgUrl" value="/images/egovframework/uss/olp/qmc/"/>
<c:set var="CssUrl" value="/css/egovframework/uss/olp/qmc/"/>
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
	document.listForm.action = "<c:url value='/uss/olp/qmc/EgovQustnrManageList.do'/>";
   	document.listForm.submit();
}
/* ********************************************************
 * 등록 처리 함수 
 ******************************************************** */
function fn_egov_regist_QustnrManage(){
	location.href = "/uss/olp/qmc/EgovQustnrManageRegist.do";
}
/* ********************************************************
 * 수정 처리 함수
 ******************************************************** */
function fn_egov_modify_QustnrManage(){
	location.href = "/uss/olp/qmc/EgovQustnrManageModify.do";
}
/* ********************************************************
 * 상세회면 처리 함수
 ******************************************************** */
function fn_egov_detail_QustnrManage(qestnrId){
	var vFrom = document.listForm;
	vFrom.qestnrId.value = qestnrId;
	vFrom.action = "/uss/olp/qmc/EgovQustnrManageDetail.do";
	vFrom.submit();
}
/* ********************************************************
 * 삭제 처리 함수
 ******************************************************** */
function fn_egov_delete_QustnrManage(qestnrId){
	var vFrom = document.listForm;
	if(confirm("삭제 하시겠습니까?")){
		vFrom.qestnrId.value = qestnrId;
		vFrom.cmd.value = 'del';
		vFrom.action = "/uss/olp/qmc/EgovQustnrManageList.do";
		vFrom.submit();
	}else{
		vFrom.cmd.value = '';
	}
}
/* ********************************************************
 * 검색 함수
 ******************************************************** */
function fn_egov_search_QustnrManage(){
	var vFrom = document.listForm;

	vFrom.action = "/uss/olp/qmc/EgovQustnrManageList.do";
	vFrom.submit();
	
}

/* ********************************************************
 * 선택한 설문지정보 -> 설문문항 바로가기
 ******************************************************** */
function fn_egov_list_QustnrQestnManag(qestnrId, qestnrTmplatId, Type){
	var vFrom = document.listForm;
	var sAction = "";
	vFrom.qestnrId.value = qestnrId;
	vFrom.qestnrTmplatId.value = qestnrTmplatId;
	vFrom.searchCondition.options[0].selected = true;
	vFrom.searchKeyword.value = '';
	vFrom.searchMode.value = 'Y';

	//QRM QQM QRI
	if(Type == 'QRM'){ //설문응답자정보
		sAction  = "/uss/olp/qrm/EgovQustnrRespondManageList.do";
	}else if(Type == 'QQM'){ //설문문항
		sAction  = "/uss/olp/qqm/EgovQustnrQestnManageList.do";
	}else if(Type == 'QRI'){ //응답자결과
		sAction  = "/uss/olp/qri/EgovQustnrRespondInfoList.do";
	}
	
	vFrom.action = sAction;
	vFrom.submit();

}
 /* ********************************************************
  * 통계
  ******************************************************** */
function fn_egov_statistics_QustnrQestnManag(qestnrId, qestnrTmplatId){
	var vFrom = document.listForm;
	vFrom.qestnrId.value = qestnrId;
	vFrom.qestnrTmplatId.value = qestnrTmplatId;
	vFrom.searchCondition.options[0].selected = true;
	vFrom.searchKeyword.value = '';
	vFrom.action = "/uss/olp/qnn/EgovQustnrRespondInfoManageStatistics.do"; 
	vFrom.submit();
}
</script>
</head>

<DIV id="content" style="width:712px">

<form name="listForm" action="<c:url value=''/>" method="post">
<table width="100%" cellpadding="1" class="table-search" border="0">
 <tr>
  <td class="title_left">

   <img src="<c:out value="${ImgUrl}"/>icon/tit_icon.gif" width="16" height="16" hspace="3" align="absmiddle">&nbsp;설문관리 목록</td>
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
      <td><img src="<c:out value="${ImgUrl}"/>button/bu2_left.gif" width="8" height="20"></td>
      <td background="<c:out value="${ImgUrl}"/>button/bu2_bg.gif" class="text_left" nowrap><a href="javascript:fn_egov_regist_QustnrManage();"><spring:message code="button.create" /></a> 
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
	<th class="title" width="60px" nowrap>설문응답<br>자정보</th>
	<th class="title" width="60px" nowrap>설문문항</th>
	<th class="title" width="60px" nowrap>설문조사</th>
	<th class="title" width="50px" nowrap>통계</th>
	<th class="title" width="70px" nowrap>등록자</th>   
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
<tr>
	<td class="lt_text3" nowrap>${(searchVO.pageIndex-1) * searchVO.pageSize + status.count}</td>
	<td class="lt_text3L" nowrap><div class="divDotText" style="width:150px;"><a href="JavaScript:fn_egov_detail_QustnrManage('${resultInfo.qestnrId}');">${resultInfo.qestnrSj}</a></div></td>
	<td class="lt_text3" nowrap>${resultInfo.qestnrBeginDe}~${resultInfo.qestnrEndDe}</td>
	<td class="lt_text3" nowrap><a href="JavaScript:fn_egov_list_QustnrQestnManag('${resultInfo.qestnrId}','${resultInfo.qestnrTmplatId}','QRM');">보기</a></td>
	<td class="lt_text3" nowrap><a href="JavaScript:fn_egov_list_QustnrQestnManag('${resultInfo.qestnrId}','${resultInfo.qestnrTmplatId}','QQM');">보기</a></td> 
	<td class="lt_text3" nowrap><a href="JavaScript:fn_egov_list_QustnrQestnManag('${resultInfo.qestnrId}','${resultInfo.qestnrTmplatId}','QRI');">보기</a></td>
	<td class="lt_text3" nowrap><a href="JavaScript:fn_egov_statistics_QustnrQestnManag('${resultInfo.qestnrId}','${resultInfo.qestnrTmplatId}');">보기</a></td>
	
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
<input name="qestnrId" type="hidden" value="">
<input name="qestnrTmplatId" type="hidden" value="">
<input name="searchMode" type="hidden" value="">

<input name="pageIndex" type="hidden" value="<c:out value='${searchVO.pageIndex}'/>"/>

</form>

</DIV>

