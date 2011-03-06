<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%
 /**
  * @Class Name : EgovMenuCreatManage.jsp
  * @Description : 메뉴생성관리 조회 화면
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
<title>메뉴생성관리</title>
<script  language="javascript1.2">
<!--
/* ********************************************************
 * 최초조회 함수
 ******************************************************** */
function fMenuCreatManageSelect(){ 
    document.menuCreatManageForm.action = "<c:url value='/sym/mpm/EgovMenuCreatManageSelect.do'/>";
    document.menuCreatManageForm.submit();
}

/* ********************************************************
 * 페이징 처리 함수
 ******************************************************** */
function linkPage(pageNo){
	document.menuCreatManageForm.pageIndex.value = pageNo;
	document.menuCreatManageForm.action = "<c:url value='/sym/mpm/EgovMenuCreatManageSelect.do'/>";
   	document.menuCreatManageForm.submit();
}

/* ********************************************************
 * 조회 처리 함수
 ******************************************************** */
function selectMenuCreatManageList() { 
	document.menuCreatManageForm.pageIndex.value = 1;
    document.menuCreatManageForm.action = "<c:url value='/sym/mpm/EgovMenuCreatManageSelect.do'/>";
    document.menuCreatManageForm.submit();
}

/* ********************************************************
 * 메뉴생성 화면 호출
 ******************************************************** */
function selectMenuCreat(vAuthorCode) {
	document.menuCreatManageForm.authorCode.value = vAuthorCode;
   	document.menuCreatManageForm.action = "<c:url value='/sym/mpm/EgovMenuCreatSelect.do'/>";
   	document.menuCreatManageForm.submit();	
}
<c:if test="${!empty resultMsg}">alert("${resultMsg}");</c:if>
-->
</script>
</head>
<body> 
<form name="menuCreatManageForm" action ="javascript:fMenuCreatManageSelect();" method="post">
<input name="checkedMenuNoForDel" type="hidden" />
<input name="authorCode"          type="hidden" />
<input name="pageIndex" type="hidden" value="<c:out value='${searchVO.pageIndex}'/>"/>
<DIV id="main" style="display:"> 

<table width="717" cellpadding="8" class="table-search" border="0">
 <tr>
  <td width="40%"class="title_left">
   <img src="<%=imagePath_icon %>tit_icon.gif" width="16" height="16" hspace="3" align="absmiddle">&nbsp;메뉴생성관리</td>
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
        <th width="20%" height="40" class="" >권한명&nbsp;</th>
        <td width="80%">
          <table border="0" cellspacing="0" cellpadding="0" align="left">
            <tr> 
              <td >&nbsp;<input name="searchKeyword" type="text" size="80" value="${param.searchKeyword}"  maxlength="60" ></td>
              <td width="5%"></td>
              <td><img src="<%=imagePath_button %>bu2_left.gif" width="8" height="20"></td>
              <td background="<%=imagePath_button %>bu2_bg.gif" nowrap><a href="javascript:selectMenuCreatManageList()">조회</a></td>
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
    <td height="10">&nbsp; </td>
  </tr>
</table>
<table width="717" cellpadding="8" class="table-line">
 <thead>
  <tr>
    <th class="title" width="20%" nowrap>권한코드</th>
    <th class="title" width="20%" nowrap>권한명</th>
    <th class="title" width="20%" nowrap>권한 설명</th>   
    <th class="title" width="20%" nowrap>메뉴생성여부</th> 
    <th class="title" width="20%" nowrap>메뉴생성</th> 
</tr>
 </thead>    
 <tbody>


 <c:forEach var="result" items="${list_menumanage}" varStatus="status">
  <tr> 
    <td class="lt_text3" style="cursor:hand;" nowrap><c:out value="${result.authorCode}"/></td>
    <td class="lt_text3" style="cursor:hand;" nowrap><c:out value="${result.authorNm}"/></td>
    <td class="lt_text3" style="cursor:hand;" nowrap><c:out value="${result.authorDc}"/></td>
    <td class="lt_text3" style="cursor:hand;" nowrap>
          <c:if test="${result.chkYeoBu > 0}">Y</c:if>
          <c:if test="${result.chkYeoBu == 0}">N</c:if>
    </td>
    <td class="lt_text3" nowrap>
       <table border="0" cellspacing="0" cellpadding="0" align="center">
         <tr> 
           <td width="10"></td>     
           <td><img src="<%=imagePath_button %>bu2_left.gif" width="8" height="20"></td>
           <td background="<%=imagePath_button %>bu2_bg.gif" nowrap><a href="javascript:selectMenuCreat('<c:out value="${result.authorCode}"/>')">메뉴생성</a></td>
           <td><img src="<%=imagePath_button %>bu2_right.gif" width="8" height="20"></td>
           <td width="10"></td>     
         </tr>
       </table>
    </td>
  </tr>
 </c:forEach>
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
<input type="hidden" name="req_menuNo">
</form>
</body>
</html>

