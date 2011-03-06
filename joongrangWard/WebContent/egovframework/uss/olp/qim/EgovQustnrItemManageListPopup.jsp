<%--
  Class Name : EgovQustnrItemManageList.jsp
  Description : 설문항목 목록 페이지
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
<c:set var="ImgUrl" value="/images/egovframework/uss/olp/qim/"/>
<c:set var="CssUrl" value="/css/egovframework/uss/olp/qim/"/>
<html>
<head>
<base target="_self" />
<title>EGOV-COM</title>
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<link type="text/css" rel="stylesheet" href="${CssUrl}com.css" />
<script type="text/javaScript" language="javascript">
/* ********************************************************
 * 페이징 처리 함수
 ******************************************************** */
function linkPage(pageNo){
	document.listForm.pageIndex.value = pageNo;
	document.listForm.action = "<c:url value='/uss/olp/qim/EgovQustnrItemManageListPopup.do'/>";
   	document.listForm.submit();
}
/* ********************************************************
 * 등록 처리 함수 
 ******************************************************** */
function fn_egov_regist_QustnrItemManage(){
	self.href = "/uss/olp/qim/EgovQustnrItemManageRegist.do";
}
/* ********************************************************
 * 수정 처리 함수
 ******************************************************** */
function fn_egov_modify_QustnrItemManage(){
	self.href = "/uss/olp/qim/EgovQustnrItemManageModify.do";
}
/* ********************************************************
 * 상세회면 처리 함수
 ******************************************************** */
function fn_egov_detail_QustnrItemManage(qustnrIemId){
	var vFrom = document.listForm;
	vFrom.qustnrIemId.value = qustnrIemId;
	vFrom.action = "/uss/olp/qim/EgovQustnrItemManageDetail.do";
	vFrom.submit();
}
/* ********************************************************
 * 삭제 처리 함수
 ******************************************************** */
function fn_egov_delete_QustnrItemManage(qestnrId){
	var vFrom = document.listForm;
	if(confirm("삭제 하시겠습니까?")){
		vFrom.qestnrId.value = qestnrId;
		vFrom.cmd.value = 'del';
		vFrom.action = "/uss/olp/qim/EgovQustnrItemManageList.do";
		vFrom.submit();
	}else{
		vFrom.cmd.value = '';
	}
}
/* ********************************************************
 * 검색 함수
 ******************************************************** */
function fn_egov_search_QustnrItemManage(){
	var vFrom = document.listForm;
	
	if(vFrom.searchKeyword.value == ""){
		alert('검색어를 입력해주세요!');
		vFrom.searchKeyword.focus();
		return;
	}
	
	if(vFrom.searchCondition.selectedIndex == 0){
		alert('검색 구분을 선택해주세요!');
		vFrom.searchCondition.focus();
		return;
	}

	vFrom.action = "/uss/olp/qim/EgovQustnrItemManageList.do";
	vFrom.submit();
	
}

/* ********************************************************
 * 선택한 설문지정보 -> 설문문항 바로가기
 ******************************************************** */
function fn_egov_list_QustnrQestnManag(qestnrId, qestnrTmplatId){
	var vFrom = document.listForm;
	vFrom.qestnrId.value = qestnrId;
	vFrom.qestnrTmplatId.value = qestnrTmplatId;
	vFrom.searchCondition.options[0].selected = true;
	vFrom.searchKeyword.value = '';
	vFrom.searchMode.value = 'Y';
	vFrom.action = "/uss/olp/qqm/EgovQustnrQestnManageList.do";
	vFrom.submit();

}

function fn_egov_open_QustnrItemManage(qestnrId, qestnrTmplatId, qustnrIemId, cnt){
	var opener = window.dialogArguments;

	opener.document.getElementById("qestnrId").value = qestnrId;
	opener.document.getElementById("qestnrTmplatId").value = qestnrTmplatId;
	opener.document.getElementById("qustnrIemId").value = qustnrIemId;
	opener.document.getElementById("qustnrIemCn").value = document.getElementById("iptText_"+ cnt).value;
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

   <img src="<c:out value="${ImgUrl}"/>icon/tit_icon.gif" width="16" height="16" hspace="3" align="absmiddle">&nbsp;설문항목 목록</td>
  <th>
  </th>
  <td width="110px">
   	<select name="searchCondition" class="select" style="width:100%">
		   <option value=''>--선택하세요--</option>
		   <option value='IEM_CN' <c:if test="${searchCondition == 'IEM_CN'}">selected</c:if>>설문항목</option>
		   <option value='FRST_REGISTER_ID' <c:if test="${searchCondition == 'FRST_REGISTER_ID'}">selected</c:if>>등록자</option>
	   </select>
	</td>
  <td width="180px">
    <input name="searchKeyword" type="text" size="10" value="${searchKeyword}" maxlength="35" style="width:100%"> 
  </td>
  <th width="70px" align="center">
   <table border="0" cellspacing="0" cellpadding="0" align="center">
    <tr> 
      <td><img src="${ImgUrl}button/bu2_left.gif" width="8" height="20"></td>
      <td background="<c:out value="${ImgUrl}"/>button/bu2_bg.gif" class="text_left" nowrap><a href="JavaScript:fn_egov_search_QustnrItemManage()"><spring:message code="button.inquire" /></a> 
      </td>
      <td><img src="<c:out value="${ImgUrl}"/>button/bu2_right.gif" width="8" height="20"></td>
      <td>&nbsp;</td>
      <td><img src="<c:out value="${ImgUrl}"/>button/bu2_left.gif" width="8" height="20"></td>
      <td background="<c:out value="${ImgUrl}"/>button/bu2_bg.gif" class="text_left" nowrap><a href="javascript:fn_egov_regist_QustnrItemManage();"><spring:message code="button.create" /></a> 
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
	<th class="title" width="5%" nowrap>순번</th>
	<th class="title" nowrap>항목내용</th>
	<th class="title" width="100px" nowrap>기타답변여부</th>
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
	<div class="divDotText" style="width:320px; border:solid 0px;"><a href="#" onClick="fn_egov_open_QustnrItemManage('${resultInfo.qestnrId}', '${resultInfo.qestnrTmplatId}', '${resultInfo.qustnrIemId}', '${status.count}')">${resultInfo.iemCn}</a></div>
	</td>
	<td class="lt_text3" nowrap>${resultInfo.etcAnswerAt}</td>
	<td class="lt_text3" nowrap>${resultInfo.frstRegisterNm}</td>
	<td class="lt_text3" nowrap>${fn:substring(resultInfo.frstRegisterPnttm, 0, 10)}</td>
	<td class="lt_text3" nowrap><a href="#" onClick="fn_egov_open_QustnrItemManage('${resultInfo.qestnrId}', '${resultInfo.qestnrTmplatId}', '${resultInfo.qustnrIemId}', '${status.count}')">선택</a></td>
	<input name="iptText_${status.count}" id="iptText_${status.count}" type="hidden" value="${resultInfo.iemCn}">   
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
<input name="qestnrQesitmId" id="qestnrQesitmId" type="hidden" value="">
<input name="qustnrIemId" id="qustnrIemId" type="hidden" value="">
<input name="searchMode" id="searchMode" type="hidden" value="">

<input name="pageIndex" type="hidden" value="<c:out value='${searchVO.pageIndex}'/>"/>

</form>

</DIV>

