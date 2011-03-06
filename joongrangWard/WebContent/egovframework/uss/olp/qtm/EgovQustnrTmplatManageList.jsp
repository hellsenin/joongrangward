<%--
  Class Name : EgovQustnrTmplatManageList.jsp
  Description : 설문템플릿 목록 페이지
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
<c:set var="ImgUrl" value="/images/egovframework/uss/olp/qtm/"/>
<c:set var="CssUrl" value="/css/egovframework/uss/olp/qtm/"/>
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
	document.listForm.action = "<c:url value='/uss/olp/qtm/EgovQustnrTmplatManageList.do'/>";
   	document.listForm.submit();
}
/* ********************************************************
 * 등록 처리 함수 
 ******************************************************** */
function fn_egov_regist_QustnrTmplatManage(){
	location.href = "/uss/olp/qtm/EgovQustnrTmplatManageRegist.do";
}
/* ********************************************************
 * 수정 처리 함수
 ******************************************************** */
function fn_egov_modify_QustnrTmplatManage(){
	location.href = "/uss/olp/qtm/EgovQustnrTmplatManageModify.do";
}
/* ********************************************************
 * 상세회면 처리 함수
 ******************************************************** */
function fn_egov_detail_QustnrTmplatManage(qestnrTmplatId){
	var vFrom = document.listForm;
	vFrom.qestnrTmplatId.value = qestnrTmplatId;
	vFrom.action = "/uss/olp/qtm/EgovQustnrTmplatManageDetail.do";
	vFrom.submit();
}
/* ********************************************************
 * 삭제 처리 함수
 ******************************************************** */
function fn_egov_delete_QustnrTmplatManage(mtgId){
	var vFrom = document.listForm;
	if(confirm("삭제 하시겠습니까?")){
		vFrom.mtgId.value = mtgId;
		vFrom.cmd.value = 'del';
		vFrom.action = "/uss/olp/qtm/EgovQustnrTmplatManageList.do";
		vFrom.submit();
	}else{
		vFrom.cmd.value = '';
	}
}
/* ********************************************************
 * 검색 함수
 ******************************************************** */
function fn_egov_search_QustnrTmplatManage(){
	var vFrom = document.listForm;
	
	vFrom.action = "/uss/olp/qtm/EgovQustnrTmplatManageList.do";
	vFrom.submit();
	
}
</script>
</head>

<DIV id="content" style="width:712px">

<form name="listForm" id="listForm" action="<c:url value=''/>" method="post">

<table width="100%" cellpadding="1" class="table-search" border="0">
 <tr>
  <td class="title_left">

   <img src="<c:out value="${ImgUrl}"/>icon/tit_icon.gif" width="16" height="16" hspace="3" align="absmiddle">&nbsp;설문템플릿 목록</td>
  <th>
  </th>
  <td width="100px">
   	<select name="searchCondition" class="select" style="width:100%">
		   <option value=''>선택하세요</option>
		   <option value='QESTNR_TMPLAT_CN' <c:if test="${searchCondition == 'QESTNR_TMPLAT_CN'}">selected</c:if>>템플릿설명</option>
		   <option value='QESTNR_TMPLAT_TY' <c:if test="${searchCondition == 'QESTNR_TMPLAT_TY'}">selected</c:if>>템플릿유형</option>
	   </select>
	</td>
  <td width="180px">
    <input name="searchKeyword" type="text" size="10" value="${searchKeyword}" maxlength="35" style="width:100%"> 
  </td>
  <th width="70px" align="center">
   <table border="0" cellspacing="0" cellpadding="0" align="center">
    <tr> 
      <td><img src="${ImgUrl}button/bu2_left.gif" width="8" height="20"></td>
      <td background="<c:out value="${ImgUrl}"/>button/bu2_bg.gif" class="text_left" nowrap><a href="JavaScript:fn_egov_search_QustnrTmplatManage()"><spring:message code="button.inquire" /></a> 
      </td>
      <td><img src="<c:out value="${ImgUrl}"/>button/bu2_right.gif" width="8" height="20"></td>
      <td>&nbsp;</td>
      <td><img src="<c:out value="${ImgUrl}"/>button/bu2_left.gif" width="8" height="20"></td>
      <td background="<c:out value="${ImgUrl}"/>button/bu2_bg.gif" class="text_left" nowrap><a href="javascript:fn_egov_regist_QustnrTmplatManage();"><spring:message code="button.create" /></a> 
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
	<th class="title" width="100px" nowrap>템플릿유형</th>
	<th class="title" width="100px" nowrap>템플릿유형<br>이미지정보</th>
	<th class="title" >템플릿설명</th>
	<th class="title" width="70px" nowrap>작성자명</th>   
	<th class="title" width="70px" nowrap>등록일자</th>       
</tr>
</thead>
<tbody>
<c:forEach items="${resultList}" var="resultInfo" varStatus="status">
<tr>
	<td class="lt_text3" nowrap>${(searchVO.pageIndex-1) * searchVO.pageSize + status.count}</td>
	<td class="lt_text3L" nowrap><div class="divDotText" style="width:100px;">${resultInfo.qestnrTmplatTy}</div></td>
	<td class="lt_text3"><img src="/uss/olp/qtm/EgovQustnrTmplatManageImg.do?qestnrTmplatId=${resultInfo.qestnrTmplatId}" onLoad="if(this.width>65){this.width=65}"></td>
	<td class="lt_text3L" nowrap><div class="divDotText" style="width:320px;"><a href="JavaScript:fn_egov_detail_QustnrTmplatManage('${resultInfo.qestnrTmplatId}');">${resultInfo.qestnrTmplatCn}</a></div></td>
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
<input name="qestnrTmplatId" type="hidden" value="">

<input name="pageIndex" type="hidden" value="<c:out value='${searchVO.pageIndex}'/>"/>

</form>

</DIV>

