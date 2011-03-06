<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%
 /**
  * @Class Name : EgovProgramChgHst.jsp
  * @Description : 프로그램변경이력 조회 화면
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
<title>프로그램변경이력</title>
<script language="javascript1.2">
<!--
/* ********************************************************
 * 페이징 처리 함수
 ******************************************************** */
function linkPage(pageNo){
//	document.programChgHstForm.searchKeyword.value = 
	document.programChgHstForm.pageIndex.value = pageNo;
	document.programChgHstForm.action = "<c:url value='/sym/mpm/EgovProgramChgHstListSelect.do'/>";
   	document.programChgHstForm.submit();
}

/* ********************************************************
 * 조회 처리 함수
 ******************************************************** */ 
function selectProgrmChgHstList() { 
	document.programChgHstForm.pageIndex.value = 1;
	document.programChgHstForm.action = "<c:url value='/sym/mpm/EgovProgramChgHstListSelect.do'/>";
	document.programChgHstForm.submit();
}

/* ********************************************************
 * 상세조회처리 함수
 ******************************************************** */
function selectChgHstListDetail(progrmFileNm, tmp_no) {
    document.programChgHstForm.tmp_rqesterNo.value = '';
	document.programChgHstForm.tmp_progrmNm.value = progrmFileNm;
	document.programChgHstForm.tmp_rqesterNo.value = tmp_no;
	document.programChgHstForm.action = "<c:url value='/sym/mpm/EgovProgramChgHstListDetailSelect.do'/>";
	document.programChgHstForm.submit();	
}
-->
</script>
</head>
<body> 
<form name="programChgHstForm" action ="/sym/mpm/EgovProgramChgHstListSelect.do" method="post">
<input name="pageIndex" type="hidden" value="<c:out value='${searchVO.pageIndex}'/>"/>
<DIV id="main" style="display:"> 

<table width="717" cellpadding="8" class="table-search" border="0">
 <tr>
  <td width="40%"class="title_left">
   <img src="<%=imagePath_icon %>tit_icon.gif" width="16" height="16" hspace="3" align="absmiddle">&nbsp;프로그램변경이력</td>
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
        <th width="20%" height="40" class="" >프로그램명*&nbsp;</th>
        <td width="80%">
          <table border="0" cellspacing="0" cellpadding="0" align="left">
            <tr> 
              <td >&nbsp;<input name="progrmFileNm" type="text" size="80" value=""  maxlength="60" ></td>
              <td width="5%"></td>
              <td><img src="<%=imagePath_button %>bu2_left.gif" width="8" height="20"></td>
              <td background="<%=imagePath_button %>bu2_bg.gif" nowrap><a href="javascript:selectProgrmChgHstList()">조회</a></td>
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
    <td width="90%">&nbsp;</td> 
    <td width="10%" height="10">&nbsp;</td>
  </tr>
</table>
<table width="717" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td height="10">&nbsp; </td>
  </tr>
</table>
<table width="717" cellpadding="8" class="table-line">
 <thead>
  <tr>
    <th class="title" width="15%" nowrap>프로그램파일명</th>
    <th class="title" width="10%" nowrap>처리상태</th>
    <th class="title" width="30%" nowrap>처리내용</th>
    <th class="title" width="15%" nowrap>변경요청자</th>   
    <th class="title" width="15%" nowrap>변경요청일자</th>
    <th class="title" width="15%" nowrap>변경완료일자</th> 
  </tr>
 </thead>    
 <tbody>
 <c:forEach var="result" items="${list_changerequst}" varStatus="status">
  <tr>
    <td class="lt_text3" style="cursor:hand;" nowrap><a href="javascript:selectChgHstListDetail('<c:out value="${result.progrmFileNm}"/>','<c:out value="${result.rqesterNo}"/>')"><c:out value="${result.progrmFileNm}"/></a></td>
    <td class="lt_text3" style="cursor:hand;" nowrap>
      <c:if test="${empty result.processSttus}">N/A</c:if> 
      <c:if test="${result.processSttus == 'A'}">신청중</c:if>
      <c:if test="${result.processSttus == 'P'}">진행중</c:if>
      <c:if test="${result.processSttus == 'R'}">반려</c:if>
      <c:if test="${result.processSttus == 'C'}">처리완료</c:if> 
    </td>
    <td class="lt_text3" style="cursor:hand;" nowrap><c:out value="${result.rqesterProcessCn}"/></td>
    <td class="lt_text3" style="cursor:hand;" nowrap><c:out value="${result.rqesterPersonId}"/></td>  
    <td class="lt_text3" style="cursor:hand;" nowrap><c:out value="${result.rqesterDe}"/></td>  
    <td class="lt_text3" style="cursor:hand;" nowrap><c:out value="${result.processDe}"/></td>  
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