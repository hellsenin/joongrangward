<%
 /**
  * @Class Name : EgovFaqDetailInqure.jsp
  * @Description : EgovFaqDetailInqure 화면
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
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<html>
<head>
<title>FAQ 상세조회</title>
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<link type="text/css" rel="stylesheet" href="/css/egovframework/uss/olh/faq/com.css" />
<script type="text/javascript" src="<c:url value='/js/egovframework/cmm/fms/EgovMultiFile.js'/>" ></script>
<script type="text/javaScript" language="javascript">
/* ********************************************************
 * 초기화
 ******************************************************** */
function fn_egov_initl_faq(){



}

/* ********************************************************
 * 목록 으로 가기
 ******************************************************** */
function fn_egov_inqire_faqlist() {

	document.FaqManageForm.action = "<c:url value='/uss/olh/faq/FaqListInqire.do'/>";
	document.FaqManageForm.submit();
		
}

/* ********************************************************
 * 수정처리화면
 ******************************************************** */
function fn_egov_updt_faq(faqId){

	// Update하기 위한 키값(faqId)을 셋팅
	document.FaqManageForm.faqId.value = faqId;	
	document.FaqManageForm.action = "<c:url value='/uss/olh/faq/FaqCnUpdtView.do'/>";
	document.FaqManageForm.submit();	
	
}


function fn_egov_delete_faq(faqId){

	if	(confirm("<spring:message code="common.delete.msg" />"))	{	

		// Delete하기 위한 키값(faqId)을 셋팅
		document.FaqManageForm.faqId.value = faqId;	
		document.FaqManageForm.action = "<c:url value='/uss/olh/faq/FaqCnDelete.do'/>";
		document.FaqManageForm.submit();
			
	}
	
	
}

</script>
</head>

<body onLoad="fn_egov_initl_faq();">
<DIV id="content" style="width:712px">
<!-- ------------------------------------------------------------------ 상단타이틀 -->
<form name="FaqManageForm" action="<c:url value='/uss/olh/faq/FaqDetailInqire.do'/>" method="post">

<!-- ----------------- 상단 타이틀  영역 -->
<table width="100%" cellpadding="8" class="table-search" border="0">
 <tr>
  <td width="100%"class="title_left">
   <img src="/images/egovframework/uss/olh/faq/icon/tit_icon.gif" width="16" height="16" hspace="3" align="left">&nbsp;FAQ 상세조회</td>
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
    <th width="20%" height="23" class="required_text" nowrap >질문제목&nbsp;&nbsp;</th>
    <td width="80%" nowrap>
    	<c:out value="${result.qestnSj}"/>  
    </td>
  </tr>

  <tr> 
    <th width="20%" height="23" class="required_text" nowrap >질문내용&nbsp;&nbsp;</th>
    <td width="80%" nowrap>
      <textarea name="qestnCn" class="textarea"  cols="300" rows="15"  style="width:450px;" readonly><c:out value="${result.qestnCn}"/>
      </textarea>                   
    </td>
  </tr>
  
  <tr> 
    <th width="20%" height="23" class="required_text" nowrap >답변내용&nbsp;&nbsp;</th>
    <td width="80%" nowrap>
      <textarea name="answerCn" class="textarea"  cols="300" rows="15"  style="width:450px;" readonly><c:out value="${result.answerCn}"/>
      </textarea>                   
    </td>
  </tr>

  <tr> 
    <th width="20%" height="23" class="required_text" nowrap >조회수<img src="/images/egovframework/uss/olh/faq/icon/required.gif" width="15" height="15"></th>
    <td width="80%" nowrap>
    	<c:out value="${result.inqireCo}"/>
    </td>
  </tr>
  
  <c:if test="${result.atchFileId != ''}">
	<tr> 
		<th height="23">첨부파일 목록</th>
		    <td colspan="6">
				<c:import charEncoding="utf-8" url="/cmm/fms/selectFileInfs.do" >
					<c:param name="param_atchFileId" value="${result.atchFileId}" />
				</c:import>								
		    </td>
	</tr>
  </c:if>	   
  
  <tr> 
    <th height="23" class="required_text" >등록일자<img src="/images/egovframework/uss/olh/faq/icon/required.gif" width="15" height="15"></th>
    <td width="80%" nowrap>
    	<c:out value="${result.lastUpdusrPnttm}"/>
    </td>
  </tr> 
   
</table>

<!-- ------------------------------------------------------------------ 줄간격조정  -->
<table width="100%" cellspacing="0" cellpadding="0" border="0">
<tr>
	<td height="5px"></td>
</tr>
</table>

<!-- ------------------------------------------------------------------ 목록/저장버튼  -->
<table border="0" cellspacing="0" cellpadding="0" align="center">
<tr> 

  <td><img src="/images/egovframework/uss/olh/faq/button/bu2_left.gif" width="8" height="20"></td>
  <td background="/images/egovframework/uss/olh/faq/button/bu2_bg.gif" class="text_left" nowrap>
  		<a href="JavaScript:fn_egov_updt_faq('<c:out value="${result.faqId}"/>');">수정</a> 
  </td>
  <td><img src="/images/egovframework/uss/olh/faq/button/bu2_right.gif" width="8" height="20"></td>
  <td>&nbsp;</td>
 
  <td><img src="/images/egovframework/uss/olh/faq/button/bu2_left.gif" width="8" height="20"></td>
  <td background="/images/egovframework/uss/olh/faq/button/bu2_bg.gif" class="text_left" nowrap>
  		<a href="JavaScript:fn_egov_delete_faq('<c:out value="${result.faqId}"/>');">삭제</a> 
  </td>
  <td><img src="/images/egovframework/uss/olh/faq/button/bu2_right.gif" width="8" height="20"></td>
  <td>&nbsp;</td>
  
  <td><img src="/images/egovframework/uss/olh/faq/button/bu2_left.gif" width="8" height="20"></td>
  <td background="/images/egovframework/uss/olh/faq/button/bu2_bg.gif" class="text_left" nowrap>
  		<a href="javascript:fn_egov_inqire_faqlist();">목록</a> 
  </td>
  <td><img src="/images/egovframework/uss/olh/faq/button/bu2_right.gif" width="8" height="20"></td>      
  <td>&nbsp;</td>
  
        
</tr>
</table>

<input name="faqId" type="hidden" value="">
</form>
</DIV>

</body>
</html>