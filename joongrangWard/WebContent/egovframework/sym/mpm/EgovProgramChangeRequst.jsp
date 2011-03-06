<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%
 /**
  * @Class Name : EgovProgramChangeRequst.jsp
  * @Description : 프로그램변경요청 화면
  * @Modification Information
  * @
  * @  수정일         수정자                   수정내용
  * @ -------    --------    ---------------------------
  * @ 2009.03.10    이용          최초 생성
  *
  *  @author 공통서비스 개발팀 이용
  *  @since 2009.03.10
  *  @version 1.0
  *  @see
  *  
  *  Copyright (C) 2009 by MOPAS  All right reserved.
  */
  /* Image Path 설정 */
  String imagePath_icon   = "/images/egovframework/sym/mpm/icon/";
  String imagePath_button = "/images/egovframework/sym/mpm/button/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link rel="stylesheet" href="/css/egovframework/sym/mpm/mpm.css" type="text/css">
<title>프로그램변경요청</title>
<script>
<!--
/* ********************************************************
 * 페이징 처리 함수
 ******************************************************** */
function linkPage(pageNo){
//	document.progrmChangeRequstForm.searchKeyword.value = 
	document.progrmChangeRequstForm.pageIndex.value = pageNo;
	document.progrmChangeRequstForm.action = "<c:url value='/sym/mpm/EgovProgramChangeRequstSelect.do'/>";
   	document.progrmChangeRequstForm.submit();
}

/* ********************************************************
 * 조회 처리 함수
 ******************************************************** */
function selectProgrmChangeRequstList() { 
	document.progrmChangeRequstForm.pageIndex.value = 1;
	document.progrmChangeRequstForm.action = "<c:url value='/sym/mpm/EgovProgramChangeRequstSelect.do'/>";
	document.progrmChangeRequstForm.submit();	
}

/* ********************************************************
 * 입력 화면 호출 함수
 ******************************************************** */
function insertChangeRequst() {
   	document.progrmChangeRequstForm.action = "<c:url value='/sym/mpm/EgovProgramChangRequstStre.do'/>";
   	document.progrmChangeRequstForm.submit();	
}

/* ********************************************************
 * 상세조회처리 함수
 ******************************************************** */
function selectUpdtChangeRequstListDetail(progrmFileNm, tmp_no) {
	document.progrmChangeRequstForm.tmp_progrmNm.value  = progrmFileNm;
	document.progrmChangeRequstForm.tmp_rqesterNo.value = tmp_no;
	document.progrmChangeRequstForm.action = "<c:url value='/sym/mpm/EgovProgramChangRequstDetailSelect.do'/>";
	document.progrmChangeRequstForm.submit();	
}

function deleteChangeRequstList() {
	progrmChangeRequstForm.submit();
}
<c:if test="${!empty resultMsg}">alert("${resultMsg}");</c:if>
-->
</script>
</head>
<body> 
<form name="progrmChangeRequstForm" action ="/sym/mpm/EgovProgramChangeRequstSelect.do" method="post">
<input name="pageIndex" type="hidden" value="<c:out value='${searchVO.pageIndex}'/>"/>
<DIV id="main" style="display:"> 

<table width="717" cellpadding="8" class="table-search" border="0">
 <tr>
  <td width="40%"class="title_left">
   <img src="<%=imagePath_icon %>tit_icon.gif" width="16" height="16" hspace="3" align="absmiddle">&nbsp;프로그램변경요청</td>
  <th >
  </th>
  <td width="10%" ></td>
  <td widht="35%"></td> 
  <th width="10%">
   <table border="0" cellspacing="0" cellpadding="0"> 
    <tr> 
      <td></td>      
    </tr>
   </table>
  </th>  
 </tr>
</table>
<table width="717" border="0" cellpadding="0" cellspacing="1">
 <tr>
  <td width="100%"> 
    <table width="100%" border="0" cellpadding="0" cellspacing="1" class="table-register">
      <tr> 
        <th width="20%" height="40" class="" >프로그램파일명<img src="<%=imagePath_icon %>required.gif" width="15" height="15"></th>
        <td width="80%">
          <table border="0" cellspacing="0" cellpadding="0" align="left">
            <tr> 
              <td >&nbsp;<input name="searchKeyword" type="text" size="80" value=""  maxlength="60" ></td>
              <td width="5%"></td>
              <td><img src="<%=imagePath_button %>bu2_left.gif" width="8" height="20"></td>
              <td background="<%=imagePath_button %>bu2_bg.gif" nowrap><a href="javascript:selectProgrmChangeRequstList()">조회</a></td>
              <td><img src="<%=imagePath_button %>bu2_right.gif" width="8" height="20"></td>      
            </tr>
          </table> 
        </td>
      </tr> 
    </table>
   </td>
 </tr>    
</table>
<table width="717" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td width="75%">&nbsp;</td> 
    <td width="25%" height="10">&nbsp;
          <table border="0" cellspacing="0" cellpadding="0" align="right">
            <tr> 
              <td width="5%"></td>
              <td><img src="<%=imagePath_button %>bu2_left.gif" width="8" height="20"></td>
              <td background="<%=imagePath_button %>bu2_bg.gif" nowrap><a href="javascript:insertChangeRequst()">등록</a></td>
              <td><img src="<%=imagePath_button %>bu2_right.gif" width="8" height="20"></td> 
              <td width="10"></td>     
            </tr>
          </table>  
    </td>
  </tr>
</table>
<table width="717" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td height="10">&nbsp; </td>
  </tr>
</table>
<table width="717" cellpadding="8" class="table-line" style="table-layout:fixed">
 <thead>
  <tr>
    <th class="title" width="80"  nowrap>요청번호</th>
    <th class="title" width="177" nowrap>프로그램파일명</th>
    <th class="title" width="200" nowrap>요청제목</th>
    <th class="title" width="80"  nowrap>요청자</th>   
    <th class="title" width="100" nowrap>요청일자</th>
    <th class="title" width="80"  nowrap>처리여부</th> 
  </tr>
 </thead>    
 <tbody>
 <c:forEach var="result" items="${list_changerequst}" varStatus="status">
  <tr>
    <td class="lt_text" nowrap><c:out value="${result.rqesterNo}"/></td>
    <td class="lt_text" style="cursor:hand;" nowrap><a href="javascript:selectUpdtChangeRequstListDetail('<c:out value="${result.progrmFileNm}"/>','<c:out value="${result.rqesterNo}"/>')"><c:out value="${result.progrmFileNm}"/></a></td>
    <td class="lt_text" nowrap><c:out value="${result.rqesterSj}"/></td>
    <td class="lt_text" nowrap><c:out value="${result.rqesterPersonId}"/></td>  
    <td class="lt_text" nowrap><c:out value="${result.rqesterDe}"/></td>  
    <td class="lt_text" nowrap>
      <c:if test="${empty result.processSttus}">N/A</c:if> 
      <c:if test="${result.processSttus == 'A'}">신청중</c:if>
      <c:if test="${result.processSttus == 'P'}">진행중</c:if>
      <c:if test="${result.processSttus == 'R'}">반려</c:if>
      <c:if test="${result.processSttus == 'C'}">처리완료</c:if>
    </td>  
  </tr>
 </c:forEach>
 </tbody>  
 <!--tfoot>
  <tr class="">
   <td colspan=6 align="center"></td>
  </tr>
 </tfoot -->
</table>
<table width="717" border="0" cellspacing="0" cellpadding="0">
  <tr> 
    <td height="10"></td>
  </tr>
    <tr> 
    <td height="10">
<!-- 페이징 시작 -->
<div align="center">
  <div>
	<ui:pagination paginationInfo = "${paginationInfo}"	type="image" jsFunction="linkPage"/>
  </div>
</div>
<!-- 페이징 끝 -->
    </td>
  </tr>
</table> 
</DIV>
<input type="hidden" name="tmp_progrmNm">
<input type="hidden" name="tmp_rqesterNo">
</form>
</body>
</html>