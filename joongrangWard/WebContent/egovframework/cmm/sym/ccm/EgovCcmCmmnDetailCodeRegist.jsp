<%
 /**
  * @Class Name  : EgovCcmCmmnDetailCodeRegist.jsp
  * @Description : EgovCcmCmmnDetailCodeRegist 화면
  * @Modification Information
  * @
  * @  수정일             수정자                   수정내용
  * @ -------    --------    ---------------------------
  * @ 2009.04.01   이중호              최초 생성
  *
  *  @author 공통서비스팀 
  *  @since 2009.04.01
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
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="validator" uri="http://www.springmodules.org/tags/commons-validator" %>
<html>
<head>
<title>공통상세코드 등록</title>
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<link type="text/css" rel="stylesheet" href="/css/egovframework/cmm/sym/ccm/com.css" />
<script type="text/javascript" src="<c:url value="/validator.do"/>"></script>
<validator:javascript formName="cmmnDetailCode" staticJavascript="false" xhtml="true" cdata="false"/>
<script type="text/javaScript" language="javascript">
<!--
/* ********************************************************
 * 목록 으로 가기
 ******************************************************** */
function fn_egov_list_CmmnDetailCode(){
	location.href = "/sym/ccm/cde/EgovCcmCmmnDetailCodeList.do";
}
/* ********************************************************
 * 저장처리화면
 ******************************************************** */
function fn_egov_regist_CmmnDetailCode(form){
	if(confirm("<spring:message code="common.save.msg" />")){
		if(!validateCmmnDetailCode(form)){ 			
			return;
		}else{
			form.cmd.value = "Regist";
			form.submit();
		}
	}
}
/* ********************************************************
 * CodeId 가져오기
 ******************************************************** */
function fn_egov_get_CodeId(form){
	form.cmd.value = "";
	form.submit();
}
-->
</script>
</head>

<body>
<DIV id="content" style="width:712px">
<!-- ------------------------------------------------------------------ 상단타이틀 -->
<form:form commandName="cmmnDetailCode" name="cmmnDetailCode" method="post">
<input name="cmd" type="hidden" value="<c:out value='Regist'/>"/>
<!-- ----------------- 상단 타이틀  영역 -->
<table width="700" cellpadding="8" class="table-search" border="0">
 <tr>
  <td width="100%"class="title_left">
   <img src="/images/egovframework/cmm/sym/ccm/icon/tit_icon.gif" width="16" height="16" hspace="3" align="absmiddle" alt="제목">&nbsp;공통상세코드 등록</td>
 </tr>
</table>
<!-- ------------------------------------------------------------------ 줄간격조정  -->
<table width="700" cellspacing="0" cellpadding="0" border="0">
<tr>
	<td height="3px"></td>
</tr>
</table>

<!-- ------------------------------------------------------------------ 등록  폼 영역  -->
<table width="700" border="0" cellpadding="0" cellspacing="1" class="table-register">
  <tr>
    <th width="20%" height="23" class="required_text" nowrap >코드ID<img src="/images/egovframework/cmm/sym/ccm/icon/required.gif" alt="필수"  width="15" height="15"></th>          
    <td width="80%" nowrap colspan="3">
		<select name="clCode" class="select" onChange="javascript:fn_egov_get_CodeId(document.cmmnDetailCode)">
			<c:forEach var="result" items="${cmmnClCodeList}" varStatus="status">
				<option value='<c:out value="${result.clCode}"/>' <c:if test="${result.clCode == cmmnCode.clCode}">selected="selected"</c:if> ><c:out value="${result.clCodeNm}"/></option>
			</c:forEach>			  		   
		</select>
		<select name="codeId" class="select">
			<c:forEach var="result" items="${cmmnCodeList}" varStatus="status">
				<option value='<c:out value="${result.codeId}"/>'><c:out value="${result.codeIdNm}"/></option>
			</c:forEach>			  		   
		</select>
    </td>
  </tr> 
  <tr> 
    <th width="20%" height="23" class="required_text" nowrap >코드<img src="/images/egovframework/cmm/sym/ccm/icon/required.gif" alt="필수"  width="15" height="15"></th>
    <td width="80%" nowrap>
      <form:input  path="code" size="15" maxlength="15"/>
      <form:errors path="code"/>
    </td>
  </tr>
  <tr>
    <th width="20%" height="23" class="required_text" nowrap >코드명<img src="/images/egovframework/cmm/sym/ccm/icon/required.gif" alt="필수"  width="15" height="15"></th>          
    <td width="80%" nowrap>
      <form:input  path="codeNm" size="60" maxlength="60"/>
      <form:errors path="codeNm"/>
    </td>    
  </tr> 
  <tr> 
    <th height="23" class="required_text" >코드설명<img src="/images/egovframework/cmm/sym/ccm/icon/required.gif" alt="필수"  width="15" height="15"></th>
    <td>
      <form:textarea path="codeDc" rows="3" cols="60"/>
      <form:errors   path="codeDc"/>
    </td>
  </tr> 
  <tr> 
    <th width="20%" height="23" class="required_text" nowrap >사용여부<img src="/images/egovframework/cmm/sym/ccm/icon/required.gif" alt="필수"  width="15" height="15"></th>
    <td width="30%" nowrap class="title_left" colspan="3">
      <form:select path="useAt">
	      <form:option value="Y" label="Yes"/>
	      <form:option value="N" label="No"/>
      </form:select>
    </td>    
  </tr>     
</table>
<table width="700" border="0" cellspacing="0" cellpadding="0">
  <tr> 
    <td height="10"></td>
  </tr>
</table>

<!-- ------------------------------------------------------------------ 줄간격조정  -->
<table width="700" cellspacing="0" cellpadding="0" border="0">
<tr>
	<td height="3px"></td>
</tr>
</table>
<!-- ------------------------------------------------------------------ 목록/저장버튼  -->
<table border="0" cellspacing="0" cellpadding="0" align="center">
<tr> 
  <td><img src="/images/egovframework/cmm/sym/ccm/btn/bu2_left.gif" alt="목록" width="8" height="20"></td>
  <td background="/images/egovframework/cmm/sym/ccm/btn/bu2_bg.gif" class=text_left" nowrap><a href="javascript:fn_egov_list_CmmnDetailCode()">목록</a></td>
  <td><img src="/images/egovframework/cmm/sym/ccm/btn/bu2_right.gif" alt="목록" width="8" height="20"></td>      
  <td width="10"></td>

  <td><img src="/images/egovframework/cmm/sym/ccm/btn/bu2_left.gif" alt="저장" width="8" height="20"></td>
  <td background="/images/egovframework/cmm/sym/ccm/btn/bu2_bg.gif" class="text_left" nowrap><a href="JavaScript:javascript:fn_egov_regist_CmmnDetailCode(document.cmmnDetailCode);">저장</a></td>
  <td><img src="/images/egovframework/cmm/sym/ccm/btn/bu2_right.gif" alt="저장" width="8" height="20"></td>      
</tr>
</table>

</form:form>
</DIV>
</body>
</html>