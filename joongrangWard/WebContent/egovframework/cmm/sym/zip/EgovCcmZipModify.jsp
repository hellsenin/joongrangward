<%
 /**
  * @Class Name  : EgovCcmZipModify.jsp
  * @Description : EgovCcmZipModify 화면
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
<title>우편번호 수정</title>
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<link type="text/css" rel="stylesheet" href="/css/egovframework/cmm/sym/zip/com.css" />
<script type="text/javascript" src="<c:url value="/validator.do"/>"></script>
<validator:javascript formName="zip" staticJavascript="false" xhtml="true" cdata="false"/>
<script type="text/javaScript" language="javascript">
<!--
/* ********************************************************
 * 목록 으로 가기
 ******************************************************** */
function fn_egov_list_Zip(){
	location.href = "/sym/ccm/zip/EgovCcmZipList.do";
}
/* ********************************************************
 * 저장처리화면
 ******************************************************** */
function fn_egov_modify_Zip(form){
	if(confirm("<spring:message code="common.save.msg" />")){
		if(!validateZip(form)){ 			
			return;
		}else{
			form.submit();
		}
	}
}
-->
</script>
</head>

<body>
<DIV id="content" style="width:712px">
<!-- ------------------------------------------------------------------ 상단타이틀 -->
<form:form commandName="zip" name="zip" method="post">

<input name="cmd" type="hidden" value="Modify">
<form:hidden path="zip"/>
<form:hidden path="sn"/>
<form:hidden path="ctprvnNm"/>
<form:hidden path="signguNm"/>
<form:hidden path="emdNm"/>
<!-- ----------------- 상단 타이틀  영역 -->
<table width="700" cellpadding="8" class="table-search" border="0">
 <tr>
  <td width="100%"class="title_left">
   <img src="/images/egovframework/cmm/sym/ccm/icon/tit_icon.gif" width="16" height="16" hspace="3" align="absmiddle" alt="제목">&nbsp;우편번호 수정</td>
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
    <th width="20%" height="23" class="required_text" nowrap >우편번호<img src="/images/egovframework/cmm/sym/ccm/icon/required.gif" alt="필수"  width="15" height="15"></th>          
    <td width="80%" nowrap colspan="3">
    	<c:out value='${fn:substring(zip.zip, 0,3)}'/>-<c:out value='${fn:substring(zip.zip, 3,6)}'/>
    </td>
  </tr> 
  <tr> 
    <th width="20%" height="23" class="required_text" nowrap >시도명<img src="/images/egovframework/cmm/sym/ccm/icon/required.gif" alt="필수"  width="15" height="15"></th>
    <td width="80%" nowrap>
    	<c:out value='${zip.ctprvnNm}'/>
    </td>    
  </tr>
  <tr>
    <th width="20%" height="23" class="required_text" nowrap >시군구명<img src="/images/egovframework/cmm/sym/ccm/icon/required.gif" alt="필수"  width="15" height="15"></th>          
    <td width="80%" nowrap>
    	<c:out value='${zip.signguNm}'/>
    </td>    
  </tr> 
  <tr>
    <th width="20%" height="23" class="required_text" nowrap >읍면동명<img src="/images/egovframework/cmm/sym/ccm/icon/required.gif" alt="필수"  width="15" height="15"></th>          
    <td width="80%" nowrap>
		<c:out value='${zip.emdNm}'/>    
    </td>    
  </tr> 
  <tr>
    <th width="20%" height="23" nowrap >리건물명</th>          
    <td width="80%" nowrap>
    	<input name="liBuldNm" type="text" size="60" value="<c:out value='${zip.liBuldNm}'/>"  maxlength="60" >
    </td>    
  </tr> 
  <tr>
    <th width="20%" height="23" nowrap >번지동호</th>          
    <td width="80%" nowrap>
    	<input name="lnbrDongHo" type="text" size="20" value="<c:out value='${zip.lnbrDongHo}'/>"  maxlength="20" >
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
  <td background="/images/egovframework/cmm/sym/ccm/btn/bu2_bg.gif" class=text_left" nowrap><a href="javascript:fn_egov_list_Zip()">목록</a></td>
  <td><img src="/images/egovframework/cmm/sym/ccm/btn/bu2_right.gif" alt="목록" width="8" height="20"></td>      
  <td width="10"></td>

  <td><img src="/images/egovframework/cmm/sym/ccm/btn/bu2_left.gif" alt="저장" width="8" height="20"></td>
  <td background="/images/egovframework/cmm/sym/ccm/btn/bu2_bg.gif" class="text_left" nowrap><a href="JavaScript:fn_egov_modify_Zip(document.zip);">저장</a></td>
  <td><img src="/images/egovframework/cmm/sym/ccm/btn/bu2_right.gif" alt="저장" width="8" height="20"></td>      
</tr>
</table>

</form:form>
</DIV>
</body>
</html>