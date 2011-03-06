<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%
 /** 
  * @Class Name : EgovProgramChgHstDetail.jsp
  * @Description : 프로그램변경이력 상세조회 화면
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
<title>프로그램변경이력상세</title>
<script language="javascript1.2">
<!--
/* ********************************************************
 * 수정 처리 함수
 ******************************************************** */
function updateChangRequstProcess() {
	progrmChangRequstProcessForm.submit();
}

/* ********************************************************
 * 삭제 처리 함수
 ******************************************************** */
function deleteChangRequstProcess() {
   document.progrmChangRequstProcessForm.action = "<c:url value='EgovProgramChangeRequstProcessDelete.do'/>";
   document.progrmChangRequstProcessForm.submit();	
}

/* ********************************************************
 * 목록조회 함수
 ******************************************************** */
function selectList(){
	location.href = "/sym/mpm/EgovProgramChgHstListSelect.do";
}
-->
</script>
</head>
<body> 
<form name="progrmChangeRequstForm" action ="/sym/mpm/EgovProgramChgHstListDetailSelect" method="post">
<DIV id="main" style="display:"> 

<table width="717" cellpadding="8" class="table-search" border="0">
 <tr>
  <td width="100%" class="title_left">
   <img src="<%=imagePath_icon %>tit_icon.gif" width="16" height="16" hspace="3" align="absmiddle">&nbsp;프로그램변경이력상세조회</td>
 </tr>
</table>

<table width="717" cellpadding="8" class="table-search" border="0">
 <tr>
  <td width="100%" class="title_left">
   <img src="<%=imagePath_icon %>tit_icon_pop.gif" width="16" height="16" hspace="3" align="absmiddle">&nbsp;변경요청내역</td>
 </tr>
</table>

<table width="717" border="0" cellpadding="0" cellspacing="1" class="table-register">
  <tr> 
    <th width="20%" height="23" class="required_text" nowrap >요청번호</th>
    <td width="80%" nowrap>&nbsp;<c:out value="${resultVO.rqesterNo}"/></td>
  </tr>
  <tr> 
    <th width="20%" height="23" class="required_text" nowrap >프로그램파일명</th>
    <td width="80%" nowrap>&nbsp;<c:out value="${resultVO.progrmFileNm}"/></td>
  </tr>
  <tr> 
    <th width="20%" height="23" class="required_text" nowrap >요청자ID</th>
    <td width="80%" nowrap>&nbsp;<c:out value="${resultVO.rqesterPersonId}"/></td>
  </tr>
  <tr> 
    <th width="20%" height="23" class="required_text" nowrap >요청일자</th>
    <td width="80%" nowrap>&nbsp;<c:out value="${resultVO.rqesterDe}"/></td>
  </tr>
  <tr> 
    <th width="20%" height="23" class="required_text" nowrap >요청제목</th>
    <td width="80%" nowrap>&nbsp;<c:out value="${resultVO.rqesterSj}"/></td>
  </tr>
  <tr> 
    <th height="23" class="required_text" >변경요청내용</th>
    <td>
      &nbsp; <textarea name="changerqesterCn" class="textarea"  cols="75" rows="5" readOnly style="width:450px;border:0;background-color:transparent;filter: chroma(color=ffffff);" ><c:out value="${resultVO.changerqesterCn}"/></textarea> 
    </td>
  </tr> 
</table>
<table width="717" border="0" cellspacing="0" cellpadding="0">
  <tr> 
    <td height="10"></td>
  </tr>
</table>

<table width="717" cellpadding="8" class="table-search" border="0">
 <tr>
  <td width="100%" class="title_left">
   <img src="<%=imagePath_icon %>tit_icon_pop.gif" width="16" height="16" hspace="3" align="absmiddle">&nbsp;변경처리내역</td>
 </tr>
</table>
<table width="717" border="0" cellpadding="0" cellspacing="1" class="table-register">
  <tr> 
    <th width="20%" height="23" class="required_text" nowrap >변경처리일자</th>
    <td width="80%" nowrap>&nbsp;<c:out value="${resultVO.processDe}"/></td>
  </tr>
  <tr> 
    <th width="20%" height="23" class="required_text" nowrap >변경처리자</th>
    <td width="80%" nowrap>&nbsp;<c:out value="${resultVO.opetrId}"/></td>
  </tr>
  <tr> 
    <th width="20%" height="23" class="required_text" nowrap >변경처리상태</th>
    <td width="80%" nowrap>&nbsp;
      <c:if test="${empty resultVO.processSttus}">N/A</c:if> 
      <c:if test="${resultVO.processSttus == 'A'}">신청중</c:if>
      <c:if test="${resultVO.processSttus == 'P'}">진행중</c:if>
      <c:if test="${resultVO.processSttus == 'R'}">반려</c:if>
      <c:if test="${resultVO.processSttus == 'C'}">처리완료</c:if>
    </td>
  </tr>
  <tr> 
    <th height="23" class="required_text" >변경처리내용</th>
    <td>
      &nbsp; <textarea name="rqesterProcessCn" class="textarea"  cols="75" rows="5" readOnly style="width:450px;border:0;background-color:transparent;filter: chroma(color=ffffff);"><c:out value="${resultVO.rqesterProcessCn}"/></textarea> 
    </td>
  </tr> 
</table> 
<table width="717" border="0" cellspacing="0" cellpadding="0">
  <tr> 
    <td height="10"></td>
  </tr>
</table>

<table width="717" border="0" cellspacing="0" cellpadding="0" align="left">
<tr> 
  <td width="95%"></td>
  <td height="10"><img src="<%=imagePath_button %>bu2_left.gif" width="8" height="20"></td>
  <td background="/images/egovframework/cmm/sym/ccm/btn/bu2_bg.gif" class=text_left" nowrap><a href="javascript:selectList()">목록</a></td>
  <td><img src="/images/egovframework/cmm/sym/ccm/btn/bu2_right.gif" width="8" height="20"></td>      
  <td width="10">&nbsp;</td> 
</tr>
</table>
<br>


</DIV>
</form>
</body>
</html>