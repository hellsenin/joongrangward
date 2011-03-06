<%--
 /** 
  * @Class Name : EgovProgramListRegist.jsp
  * @Description : 프로그램목록 등록 화면
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
  //String imagePath_icon   = "/images/egovframework/sym/mpm/icon/";
 // String imagePath_button = "/images/egovframework/sym/mpm/button/";
--%>
<%@ page contentType="text/html; charset=utf-8"%> 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="validator" uri="http://www.springmodules.org/tags/commons-validator" %>
<c:set var="ImgUrl" value="/images/egovframework/sym/mpm/"/>
<c:set var="CssUrl" value="/css/egovframework/sym/mpm/"/>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link rel="stylesheet" href="${CssUrl}mpm.css" type="text/css" />
<title>프로그램목록등록</title>
<script type="text/javascript" src="<c:url value="/validator.do" />"></script>
<validator:javascript formName="progrmManageVO" staticJavascript="false" xhtml="true" cdata="false"/>
<script language="javascript1.2">
<!--
/* ********************************************************
 * 입력 처리 함수
 ******************************************************** */
function insertProgramListManage(form) {
	if(confirm("<spring:message code="common.save.msg" />")){
		if(!validateProgrmManageVO(form)){ 			
			return;
		}else{

			form.submit();
		}
	}
//	progrmListRegistForm.submit();
}
/* ********************************************************
 * 목록조회 함수
 ******************************************************** */
function selectList(){
	location.href = "/sym/mpm/EgovProgramListManageSelect.do";
}

/* ********************************************************
 * focus 시작점 지정함수
 ******************************************************** */
 function fn_FocusStart(){
		var objFocus = document.getElementById('F1');
		objFocus.focus();
	}

 
<c:if test="${!empty resultMsg}">alert("${resultMsg}");</c:if>
-->
</script>
</head>
<body onfocus="fn_FocusStart()"> 
<form:form commandName="progrmManageVO"  >
<!-- form name="progrmListRegistForm" action ="sym/mpm/EgovProgramListRegist.do" method="post" -->
<DIV id="main" style="display:"> 

<table width="717" cellpadding="8" class="table-search" border="0">
 <tr>
  <td width="100%" class="title_left">
   <img src="${ImgUrl}icon/tit_icon.gif" width="16" height="16" hspace="3" align="absmiddle">&nbsp;프로그램목록 등록</td>
 </tr>
</table>
<table width="717" border="0" cellpadding="0" cellspacing="1" class="table-register">
  <tr> 
    <th width="20%" height="23" class="required_text" nowrap >프로그램파일명<img src="${ImgUrl}icon/required.gif" width="15" height="15"></th>
    <td width="80%" nowrap>
      &nbsp; 
      <form:input path="progrmFileNm" size="50" cssClass="txaIpt" maxlength="50" id="F1"/>
      <form:errors path="progrmFileNm" />
    </td>
  </tr> 
  <tr> 
    <th width="20%" height="23" class="required_text" nowrap >저장경로<img src="${ImgUrl}icon/required.gif" width="15" height="15"></th>
    <td width="80%" nowrap>
      &nbsp; <form:input path="progrmStrePath"  size="60"  cssClass="txaIpt" maxlength="60" /> 
      <form:errors path="progrmStrePath" />
    </td>
  </tr>
  <tr> 
    <th width="20%" height="23" class="required_text" nowrap >한글명<img src="${ImgUrl}icon/required.gif" width="15" height="15"></th>
    <td width="80%" nowrap>
      &nbsp; <form:input path="progrmKoreanNm" size="60"  maxlength="60" /> 
      <form:errors path="progrmKoreanNm"/>
    </td>
  </tr>
  <tr> 
    <th width="20%" height="23" class="required_text" nowrap >URL<img src="${ImgUrl}icon/required.gif" width="15" height="15"></th>
    <td width="80%" nowrap>
      &nbsp; <form:input path="URL" size="60"  cssClass="txaIpt"  maxlength="60" /> 
      <form:errors path="URL"/>
    </td>
  </tr>
  <tr> 
    <th height="23" class="required_text" >프로그램설명</th>
    <td>&nbsp;
      <form:textarea path="progrmDc" rows="14" cols="75" cssClass="txaClass"/>
      <form:errors path="progrmDc"/>
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
  <td width="90%"></td>
  <td height="10"><img src="${ImgUrl}button/bu2_left.gif" width="8" height="20"></td>
  <td background="/images/egovframework/cmm/sym/ccm/btn/bu2_bg.gif" class=text_left" nowrap><a href="javascript:selectList()"><spring:message code="button.list" /></a></td>
  <td><img src="/images/egovframework/cmm/sym/ccm/btn/bu2_right.gif" width="8" height="20"></td>      
  <td width="10">&nbsp;</td>
  <td height="10"><img src="${ImgUrl}button/bu2_left.gif" width="8" height="20"></td>
  <td background="${ImgUrl}button/bu2_bg.gif" class="text_left" nowrap><a href="javascript:insertProgramListManage(document.forms[0])"><spring:message code="button.save" /></a></td>
  <td><img src="${ImgUrl}button/bu2_right.gif" width="8" height="20"></td>      
</tr>
</table>
<br>

</DIV>
<input name="cmd" type="hidden" value="<c:out value='insert'/>"/>
</form:form>
</body>
</html>

