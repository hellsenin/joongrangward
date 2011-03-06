<%
 /**
  * @Class Name : EgovSiteDetailInqure.jsp
  * @Description : EgovSiteDetailInqure 화면
  * @Modification Information
  * @
  * @  수정일             수정자                   수정내용
  * @ -------    --------    ---------------------------
  * @ 2009.02.01   박정규              최초 생성
  *
  *  @author 공통서비스팀 
  *  @since 2009.02.01
  *  @version 1.0
  *  @see
  *  
  *  Copyright (C) 2009 by MOPAS  All right reserved.
  */
%>

<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"  %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<html>
<head>
<title>사이트목록</title>
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<link type="text/css" rel="stylesheet" href="/css/egovframework/uss/ion/sit/com.css" />
<script type="text/javaScript" language="javascript">
/* ********************************************************
 * 초기화
 ******************************************************** */
function fn_egov_initl_siteinfo(){



}

/* ********************************************************
 * 목록 으로 가기
 ******************************************************** */
function fn_egov_inqire_sitelist() {

	document.SiteManageForm.action = "<c:url value='/uss/ion/sit/SiteListInqire.do'/>";
	document.SiteManageForm.submit();
		
}

/* ********************************************************
 * 수정처리화면
 ******************************************************** */
function fn_egov_updt_siteinfo(siteId){

	// Update하기 위한 키값(siteId)을 셋팅
	document.SiteManageForm.siteId.value = siteId;	
	document.SiteManageForm.action = "<c:url value='/uss/ion/sit/SiteInfoUpdtView.do'/>";
	document.SiteManageForm.submit();	
	
}

/* ********************************************************
 * 삭제처리화면
 ******************************************************** */
function fn_egov_delete_siteinfo(siteId){	

	if	(confirm("<spring:message code="common.delete.msg" />"))	{ 
			
		// Delete하기 위한 키값(wordId)을 셋팅
		document.SiteManageForm.siteId.value = siteId;	
		document.SiteManageForm.action = "<c:url value='/uss/ion/sit/SiteInfoDelete.do'/>";
		document.SiteManageForm.submit();	
	}		
	
}
</script>
</head>

<body onLoad="fn_egov_initl_siteinfo();">
<DIV id="content" style="width:700px">
<!-- ------------------------------------------------------------------ 상단타이틀 -->
<form name="SiteManageForm" action="<c:url value='/uss/olh/wor/WordDicaryDetailInqire.do'/>" method="post">

<!-- ----------------- 상단 타이틀  영역 -->
<table width="100%" cellpadding="8" class="table-search" border="0">
 <tr>
  <td width="100%"class="title_left">
   <img src="/images/egovframework/uss/ion/sit/icon/tit_icon.gif" width="16" height="16" hspace="3" align="absmiddle">&nbsp;사이트 상세조회</td>
 </tr>
</table>

<!-- ------------------------------------------------------------------ 줄간격조정  -->
<table width="100%" cellspacing="0" cellpadding="0" border="0">
<tr>
	<td height="3px"></td>
</tr>
</table>

<!-- ------------------------------------------------------------------ 등록  폼 영역  -->
<table width="98%" border="0" cellpadding="0" cellspacing="1" class="table-register">

  <tr> 
    <th width="20%" height="23" class="required_text" nowrap >사이트명&nbsp;&nbsp;</th>
    <td width="80%" nowrap>
    	<c:out value="${result.siteNm}"/>  
    </td>
  </tr>

  <tr> 
    <th width="20%" height="23" class="required_text" nowrap >사이트 URL&nbsp;&nbsp;</th>
    <td width="80%" nowrap>
    	<c:out value="${result.siteUrl}"/>  
    </td>
  </tr>
  
  <tr> 
    <th height="23" class="required_text" >사이트설명&nbsp;&nbsp;</th>
    <td width="80%" nowrap>    
      <textarea name="siteDc" class="textarea"  cols="300" rows="10"  style="width:450px;" readonly value=''><c:out value="${result.siteDc}"/>
      </textarea>                 
    </td>
  </tr> 

  <tr> 
    <th height="23" class="required_text" >사이트주제분류&nbsp;&nbsp;</th>
    <td width="80%" nowrap>    
    	<c:out value="${result.siteThemaClNm}"/> 
    </td>
  </tr>  

  <tr> 
    <th height="23" class="required_text" >활성여부&nbsp;&nbsp;</th>
    <td width="80%" nowrap>
    	<c:out value="${result.actvtyAtNm}"/>  
    </td>
  </tr> 

  <tr> 
    <th height="23" class="required_text" >사용여부&nbsp;&nbsp;</th>
    <td width="80%" nowrap>
    	<c:out value="${result.useAtNm}"/>  
    </td>
  </tr> 

  <tr> 
    <th height="23" class="required_text" >등록일자&nbsp;&nbsp;</th>
    <td width="80%" nowrap>
    	<c:out value="${result.lastUpdusrPnttm}"/>  
    </td>
  </tr> 

  <tr> 
    <th height="23" class="required_text" >등록자&nbsp;&nbsp;</th>
    <td width="80%" nowrap>
    	<c:out value="${result.emplyrNm}"/>  
    </td>
  </tr> 
   
</table>

<!-- ------------------------------------------------------------------ 줄간격조정  -->
<table width="100%" cellspacing="0" cellpadding="0" border="0">
<tr>
	<td height="10px"></td>
</tr>
</table>

<!-- ------------------------------------------------------------------ 목록/저장버튼  -->
<table border="0" cellspacing="0" cellpadding="0" align="center">
<tr> 

  <td><img src="/images/egovframework/uss/ion/sit/button/bu2_left.gif" width="8" height="20"></td>
  <td background="/images/egovframework/uss/ion/sit/button/bu2_bg.gif" class="text_left" nowrap>
  		<a href="JavaScript:fn_egov_updt_siteinfo('<c:out value="${result.siteId}"/>');">수정</a> 
  </td>
  <td><img src="/images/egovframework/uss/ion/sit/button/bu2_right.gif" width="8" height="20"></td>
  <td>&nbsp;</td>
  
  <td><img src="/images/egovframework/uss/ion/sit/button/bu2_left.gif" width="8" height="20"></td>
  <td background="/images/egovframework/uss/ion/sit/button/bu2_bg.gif" class="text_left" nowrap>
  		<a href="JavaScript:fn_egov_delete_siteinfo('<c:out value="${result.siteId}"/>');">삭제</a> 
  </td>
  <td><img src="/images/egovframework/uss/ion/sit/button/bu2_right.gif" width="8" height="20"></td>
  <td>&nbsp;</td>
  
  <td><img src="/images/egovframework/uss/ion/sit/button/bu2_left.gif" width="8" height="20"></td>
  <td background="/images/egovframework/uss/ion/sit/button/bu2_bg.gif" class="text_left" nowrap>
  		<a href="javascript:fn_egov_inqire_sitelist();">목록</a> 
  </td>
  <td><img src="/images/egovframework/uss/ion/sit/button/bu2_right.gif" width="8" height="20"></td>      
  <td>&nbsp;</td>
  
        
</tr>
</table>

<input name="siteId" type="hidden" value="">
</form>
</DIV>

</body>
</html>