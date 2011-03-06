<%--
  Class Name : EgovTnextrlHrInfoList.jsp
  Description : 외부인사정보 목록
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
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
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
 * 페이징 처리 함수
 ******************************************************** */
function linkPage(pageNo){
	document.listForm.pageIndex.value = pageNo;
	document.listForm.action = "<c:url value='/uss/ion/ecc/EgovTnextrlHrInfoList.do'/>";
   	document.listForm.submit();
}
/* ********************************************************
 * 등록 처리 함수 
 ******************************************************** */
function fn_egov_regist_TnextrlHrInfo(){
	location.href = "/uss/ion/ecc/EgovTnextrlHrInfoRegist.do";
}
/* ********************************************************
 * 수정 처리 함수
 ******************************************************** */
function fn_egov_modify_TnextrlHrInfo(){
	location.href = "/uss/ion/ecc/EgovTnextrlHrInfoModify.do";
}
/* ********************************************************
 * 상세회면 처리 함수
 ******************************************************** */
function fn_egov_detail_TnextrlHrInfo(extrlHrId){
	var vFrom = document.listForm;
	vFrom.extrlHrId.value = extrlHrId;
	vFrom.action = "/uss/ion/ecc/EgovTnextrlHrInfoDetail.do";
	vFrom.submit();
}
/* ********************************************************
 * 삭제 처리 함수
 ******************************************************** */
function fn_egov_delete_TnextrlHrInfo(extrlHrId){
	var vFrom = document.listForm;
	if(confirm("삭제 하시겠습니까?")){
		vFrom.extrlHrId.value = extrlHrId;
		vFrom.cmd.value = 'del';
		vFrom.action = "/uss/ion/ecc/EgovTnextrlHrInfoList.do";
		vFrom.submit();
	}else{
		vFrom.cmd.value = '';
	}
}
/* ********************************************************
 * 검색 함수
 ******************************************************** */
function fn_egov_search_TnextrlHrInfo(){
	var vFrom = document.listForm;
	

	vFrom.action = "/uss/ion/ecc/EgovTnextrlHrInfoList.do";
	vFrom.submit();
	
}
</script>
</head>

<DIV id="content" style="width:712px">
<form name="listForm" id="listForm" action="<c:url value=''/>" method="post">

<table width="100%" cellpadding="1" class="table-search" border="0">
 <tr>
  <td class="title_left">

   <img src="<c:out value="${ImgUrl}"/>icon/tit_icon.gif" width="16" height="16" hspace="3" align="absmiddle">&nbsp;외부인사정보 목록</td>

  <td width="120px">
   	<select name="searchCondition" class="select" style="width:100%">
		   <option value=''>--선택하세요--</option>
		   <option value='EXTRL_HR_NM' <c:if test="${searchCondition == 'EXTRL_HR_NM'}">selected</c:if>>외부인사명</option>
		   <option value='PSITN_INSTT_NM' <c:if test="${searchCondition == 'PSITN_INSTT_NM'}">selected</c:if>>소속기관</option>
	   </select>
	</td>
  <td width="180px">
    <input name="searchKeyword" type="text" size="10" value="${searchKeyword}" maxlength="35" style="width:100%"> 
  </td>
  <td width="65x" align="right">
   <table border="0" cellspacing="0" cellpadding="0" align="right">
    <tr> 
      <td><img src="<c:out value="${ImgUrl}"/>button/bu2_left.gif" width="8" height="20"></td>
      <td background="<c:out value="${ImgUrl}"/>button/bu2_bg.gif" class="text_left" nowrap><a href="JavaScript:fn_egov_search_TnextrlHrInfo()">조회</a> 
      </td>
      <td><img src="<c:out value="${ImgUrl}"/>button/bu2_right.gif" width="8" height="20"></td>
      <td>&nbsp;</td>
      <td><img src="<c:out value="${ImgUrl}"/>button/bu2_left.gif" width="8" height="20"></td>
      <td background="<c:out value="${ImgUrl}"/>button/bu2_bg.gif" class="text_left" nowrap><a href="javascript:fn_egov_regist_TnextrlHrInfo();">등록</a> 
      </td>
      <td><img src="<c:out value="${ImgUrl}"/>button/bu2_right.gif" width="8" height="20"></td>
    </tr>
   </table>
  </td>  
 </tr>
</table>

<table width="100%" cellpadding="0" class="table-line" border="0">
 <thead>
  <tr>  
    <th class="title" width="35px" nowrap>순번</th>
    <th class="title" width="100px" nowrap>성별</th>
    <th class="title" nowrap>외부인사명</th>
    <th class="title" width="100px" nowrap>소속기관</th>
    
    <th class="title" width="80px" nowrap>작성자명</th>   
    <th class="title" width="80px" nowrap>등록일자</th>           
  </tr>
 </thead>  
  <tbody>
 <c:forEach items="${resultList}" var="resultInfo" varStatus="status">
    <tr>
    <td class="lt_text3" nowrap><c:out value="${status.count}"/></td>
    <td class="lt_text3" nowrap>

<c:forEach items="${comCode014}" var="comCodeList" varStatus="status">
<c:if test="${comCodeList.code eq resultInfo.sexdstnCode}">	
<c:out value="${fn:replace(comCodeList.codeNm , crlf , '<br/>')}" escapeXml="false" />
</c:if>
</c:forEach>

    
    </td>  
    <td class="lt_text3" nowrap><a href="JavaScript:fn_egov_detail_TnextrlHrInfo('${resultInfo.extrlHrId}')">${resultInfo.extrlHrNm}</a></td> 
     
    <td class="lt_text3" nowrap>${resultInfo.psitnInsttNm}</td> 
     
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

<input name="cmd" type="hidden" value="">
<input name="extrlHrId" type="hidden" value="">
<input name="pageIndex" type="hidden" value="<c:out value='${searchVO.pageIndex}'/>"/>
</form>


</DIV>

