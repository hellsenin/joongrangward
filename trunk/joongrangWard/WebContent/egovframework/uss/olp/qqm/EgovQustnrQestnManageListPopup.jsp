<%--
  Class Name : EgovQustnrQestnManageList.jsp
  Description : 설문문항 목록 페이지
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
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<c:set var="ImgUrl" value="/images/egovframework/uss/olp/qqm/"/>
<c:set var="CssUrl" value="/css/egovframework/uss/olp/qqm/"/>
<html>
<head>
<title>설문문항 목록 팝업</title>
<base target="_self" />
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<link type="text/css" rel="stylesheet" href="${CssUrl}com.css" />
<script type="text/javaScript" language="javascript">
/* ********************************************************
 * 페이징 처리 함수
 ******************************************************** */
function linkPage(pageNo){
	document.listForm.pageIndex.value = pageNo;
	document.listForm.action = "<c:url value='/uss/olp/qqm/EgovQustnrQestnManageList.do'/>";
   	document.listForm.submit();
}
/* ********************************************************
 * 등록 처리 함수 
 ******************************************************** */
function fn_egov_regist_QustnrQestnManage(){
	var vFrom = document.listForm;
	vFrom.cmd.value = '';
	vFrom.action = "/uss/olp/qqm/EgovQustnrQestnManageRegist.do";
	vFrom.submit();
}
/* ********************************************************
 * 수정 처리 함수
 ******************************************************** */
function fn_egov_modify_QustnrQestnManage(){
	location.href = "/uss/olp/qqm/EgovQustnrQestnManageModify.do";
}
/* ********************************************************
 * 상세회면 처리 함수
 ******************************************************** */
function fn_egov_detail_QustnrQestnManage(qestnrQesitmId){
	var vFrom = document.listForm;
	vFrom.qestnrQesitmId.value = qestnrQesitmId;
	vFrom.action = "/uss/olp/qqm/EgovQustnrQestnManageDetail.do";
	vFrom.submit();
}
/* ********************************************************
 * 삭제 처리 함수
 ******************************************************** */
function fn_egov_delete_QustnrQestnManage(qestnrId){
	var vFrom = document.listForm;
	if(confirm("삭제 하시겠습니까?")){
		vFrom.qestnrId.value = qestnrId;
		vFrom.cmd.value = 'del';
		vFrom.action = "/uss/olp/qqm/EgovQustnrQestnManageList.do";
		vFrom.submit();
	}else{
		vFrom.cmd.value = '';
	}
}
/* ********************************************************
 * 검색 함수
 ******************************************************** */
function fn_egov_search_QustnrQestnManage(){
	var vFrom = document.listForm;

	vFrom.action = "/uss/olp/qqm/EgovQustnrQestnManageList.do";
	vFrom.submit();
	
}
/* ********************************************************
 * 선택 처리 함수
 ******************************************************** */
function fn_egov_open_QustnrQestnManage(qestnrQesitmId,  cnt, qestnTyCode){
	
	var opener = window.dialogArguments;

	opener.document.getElementById("qestnrQesitmId").value = qestnrQesitmId;
	opener.document.getElementById("qestnrQesitmCn").value = document.getElementById("iptText_"+ cnt).value;

	if( opener.document.getElementById("divQestnTyCode") != null ){

		if(qestnTyCode == '1')
			opener.document.getElementById("divQestnTyCode").innerText = '객관식';
		else if(qestnTyCode == '2')
			opener.document.getElementById("divQestnTyCode").innerText = '주관식';
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

   <img src="<c:out value="${ImgUrl}"/>icon/tit_icon.gif" width="16" height="16" hspace="3" align="absmiddle">&nbsp;설문문항 목록</td>
  <th>
  </th>
  <td width="110px">
   	<select name="searchCondition" class="select" style="width:100%">
		   <option value=''>--선택하세요--</option>
		   <option value='QESTN_SN' <c:if test="${searchVO.searchCondition == 'QESTN_SN'}">selected</c:if>>질문내용</option>
		   <option value='MXMM_CHOISE_CO' <c:if test="${searchVO.searchCondition == 'MXMM_CHOISE_CO'}">selected</c:if>>최대선택건수</option>
	   </select>
	</td>
  <td width="180px">
    <input name="searchKeyword" type="text" size="10" value="${searchVO.searchKeyword}" maxlength="35" style="width:100%"> 
  </td>
  <th width="70px" align="center">
   <table border="0" cellspacing="0" cellpadding="0" align="center">
    <tr> 
      <td><img src="${ImgUrl}button/bu2_left.gif" width="8" height="20"></td>
      <td background="<c:out value="${ImgUrl}"/>button/bu2_bg.gif" class="text_left" nowrap><a href="JavaScript:fn_egov_search_QustnrQestnManage()"><spring:message code="button.inquire" /></a> 
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

 
<table width="100%" cellpadding="0" class="table-line">
 <thead>
  <tr>  
    <th class="title" width="10%" nowrap>번호</th>
    <th class="title" nowrap>질문내용</th>
    <th class="title" width="20%" nowrap>질문유형</th>
    <th class="title" width="15%" nowrap>등록자</th>   
    <th class="title" width="15%" nowrap>등록일자</th>  
    <th class="title" width="30px" nowrap></th>
  </tr>
 </thead>    
 <tbody>
<c:forEach items="${resultList}" var="resultInfo" varStatus="status">
  <tr>
    <td class="lt_text3" nowrap>${(searchVO.pageIndex-1) * searchVO.pageSize + status.count}</td>
    <td class="lt_text3L" nowrap>
    <div class="divDotText" style="width:320px; border:solid 0px;">${resultInfo.qestnCn}</div>
    </td>
    <td class="lt_text3" nowrap>
    <c:if test="${resultInfo.qestnTyCode == '1'}">객관식</c:if>
    <c:if test="${resultInfo.qestnTyCode == '2'}">주관식</c:if>
    </td>
    <td class="lt_text3" nowrap>${resultInfo.frstRegisterNm}</td>
    <td class="lt_text3" nowrap>${fn:substring(resultInfo.frstRegisterPnttm, 0, 10)}</td>
    <td class="lt_text3" nowrap><a href="#" onClick="JavaScript:fn_egov_open_QustnrQestnManage('${resultInfo.qestnrQesitmId}', '${status.count}', '${resultInfo.qestnTyCode}')">선택</td>
    <input name="iptText_${status.count}" id="iptText_${status.count}" type="hidden" value="${resultInfo.qestnCn}">
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

<c:if test="${qustnrQestnManageVO.searchMode == 'Y'}">
<input name="qestnrTmplatId" id="qestnrTmplatId" type="hidden" value="${qustnrQestnManageVO.qestnrTmplatId}">
<input name="qestnrId" id="qestnrId" type="hidden" value="${qustnrQestnManageVO.qestnrId}">
<input name="searchMode" id="qestnrId" type="hidden" value="${qustnrQestnManageVO.searchMode}">
</c:if>

<input name="qestnrQesitmId" id="qestnrQesitmId" type="hidden" value="">
<input name="cmd" type="hidden" value="">

<input name="pageIndex" type="hidden" value="<c:out value='${searchVO.pageIndex}'/>"/>

</form>

</DIV>

