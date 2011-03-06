<%--
 /** 
  * @Class Name : EgovProgramChangRequstStre.jsp
  * @Description : 프로그램변경요청 등록 화면
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
  //String imagePath_button = "/images/egovframework/sym/mpm/button/";
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
<title>프로그램변경요청 등록</title>
<script type="text/javascript" src="<c:url value="/validator.do" />"></script>
<validator:javascript formName="progrmManageDtlVO" staticJavascript="false" xhtml="true" cdata="false"/>
<script type="text/javascript" src="<c:url value='/js/egovframework/cmm/sym/cal/EgovCalPopup.js' />"></script>
<script language="javascript1.2">
<!--
/* ********************************************************
 * 파일목록조회  함수
 ******************************************************** */
function searchFileNm() {
	document.all.tmp_SearchElementName.value = "progrmFileNm";
	window.open('/sym/mpm/EgovProgramListSearch.do','','width=500,height=400');
}

/* ********************************************************
 * 입력 처리 함수
 ******************************************************** */
function insertProgrmChangeRequst(form) {
	if(confirm("<spring:message code="common.save.msg" />")){

		if(!validateProgrmManageDtlVO(form)){ 			
			return;
		}else{
            form.action = "<c:url value='/sym/mpm/EgovProgramChangRequstStre.do'/>";
			form.submit();
		}
	}
//	progrmListRegistForm.submit();
}

/* ********************************************************
 * 목록조회 처리 함수
 ******************************************************** */
function selectList(){
	location.href = "/sym/mpm/EgovProgramChangeRequstSelect.do";
}
<c:if test="${!empty resultMsg}">alert("${resultMsg}");</c:if>
-->
</script>
</head>
<body> 
<form:form commandName="progrmManageDtlVO" >
<DIV id="main" style="display:"> 

<table width="717" cellpadding="8" class="table-search" border="0">
 <tr>
  <td width="100%" class="title_left">
   <img src="${ImgUrl}icon/tit_icon.gif" width="16" height="16" hspace="3" align="absmiddle">&nbsp;프로그램변경요청 등록</td>
 </tr>
</table>

<table width="717" border="0" cellpadding="0" cellspacing="1" class="table-register">
  <tr> 
    <th width="145" height="23" class="required_text" nowrap >요청번호<img src="${ImgUrl}icon/required.gif" width="15" height="15"></th>
    <td width="527" nowrap>&nbsp;
		<form:input path="rqesterNo" size="50" cssClass="txaIpt" maxlength="50" />
		<form:errors path="rqesterNo" />
    </td>
  </tr>
  <tr> 
    <th width="145" height="23" class="required_text" nowrap >프로그램파일명<img src="${ImgUrl}icon/required.gif" width="15" height="15"></th>
    <td width="527" nowrap>&nbsp; 
    	<form:input path="progrmFileNm" size="50" cssClass="txaIpt" maxlength="50" />
	    <form:errors path="progrmFileNm" />
        <a href="javascript:searchFileNm();" style="selector-dummy:expression(this.hideFocus=false);"><img src="<c:url value='${ImgUrl}icon/search2.gif' />"
         alt='(프로그램파일명 검색)' width="15" height="15" /></a>(프로그램파일명 검색)
    </td>
  </tr>
  <tr> 
    <th width="20%" height="23" class="required_text" nowrap >요청자<img src="${ImgUrl}icon/required.gif" width="15" height="15"></th>
    <td width="80%" nowrap>&nbsp;
		<form:input path="rqesterPersonId" size="20" cssClass="txaIpt" maxlength="20" />
		<form:errors path="rqesterPersonId" />
    </td>
  </tr>
  <tr> 
    <th width="20%" height="23" class="required_text" nowrap >요청일자<img src="${ImgUrl}icon/required.gif" width="15" height="15"></th>
    <td width="80%" nowrap>&nbsp; 
	  <input type="hidden" name="cal_url" value="<c:url value='/sym/cmm/EgovNormalCalPopup.do'/>" />	
	  <form:input path="rqesterDe" size="50" cssClass="txaIpt" maxlength="50" />  
   	  <form:errors path="rqesterDe"/> 
      <a href="javascript:fn_egov_NormalCalendar(progrmManageDtlVO,'', progrmManageDtlVO.rqesterDe);" style="selector-dummy:expression(this.hideFocus=false);">
	  <img name="calendarImg" src="<c:url value='/images/egovframework/cmm/sym/cal/bu_icon_carlendar.gif'/>" alt='달력'></a>

    </td>
  </tr>
  <tr> 
    <th width="20%" height="23" class="required_text" nowrap >요청제목<img src="${ImgUrl}icon/required.gif" width="15" height="15"></th>
    <td width="80%" nowrap>&nbsp; 
    	<form:input path="rqesterSj" size="50" cssClass="txaIpt" maxlength="50" />
		<form:errors path="rqesterSj" />
    </td>
  </tr>
  <tr> 
    <th height="23" class="required_text" >변경요청내용</th>
    <td>&nbsp; 
      <form:textarea path="changerqesterCn" rows="14" cols="75" cssClass="txaClass"/>
      <form:errors path="changerqesterCn"/>
    </td>
  </tr> 
</table>
<table width="717" border="0" cellspacing="0" cellpadding="0">
  <tr> 
    <td height="10"></td>
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
  <td background="/images/egovframework/cmm/sym/ccm/btn/bu2_bg.gif" class=text_left" nowrap><a href="javascript:selectList()">목록</a></td>
  <td><img src="/images/egovframework/cmm/sym/ccm/btn/bu2_right.gif" width="8" height="20"></td>      
  <td width="10">&nbsp;</td>
  <td height="10"><img src="${ImgUrl}button/bu2_left.gif" width="8" height="20"></td>
  <td background="${ImgUrl}button/bu2_bg.gif" class="text_left" nowrap><a href="javascript:insertProgrmChangeRequst(document.forms[0])">등록</a></td>
  <td><img src="${ImgUrl}button/bu2_right.gif" width="8" height="20"></td>
</tr>
</table>
<br>
</DIV>
      	<form:hidden path="rqesterProcessCn" />
      	<form:hidden path="opetrId" />
      	<form:hidden path="processSttus" />
      	<form:hidden path="processDe" />
      	<input name="cmd" type="hidden" value="insert">
</form:form>
    <input type="hidden" name="tmp_SearchElementName">
    <input type="hidden" name="tmp_SearchElementVal">

</body>
</html>