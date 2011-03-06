<%
 /**
  * @Class Name  : EgovCcmAdministCodeModify.jsp
  * @Description : EgovCcmAdministCodeModify 화면
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
<title>행정코드 수정</title>
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<link type="text/css" rel="stylesheet" href="/css/egovframework/cmm/sym/ccm/com.css" />
<script type="text/javascript" src="<c:url value="/validator.do"/>"></script>
<validator:javascript formName="administCode" staticJavascript="false" xhtml="true" cdata="false"/>
<script type="text/javascript" src="<c:url value='/js/egovframework/cmm/sym/cal/EgovCalPopup.js' />" ></script>
<script type="text/javaScript" language="javascript">
<!--
/* ********************************************************
 * 목록 으로 가기
 ******************************************************** */
function fn_egov_list_AdministCode(){
	location.href = "/sym/ccm/adc/EgovCcmAdministCodeList.do";
}
/* ********************************************************
 * 저장처리화면
 ******************************************************** */
 function fn_egov_modify_AdministCode(form){
		var creatDe = document.administCode.creatDe.value;
		var ablDe   = document.administCode.ablDe.value;

		if (creatDe > ablDe) {
			alert("생성일, 폐기일 전후가 잘못되었습니다.\n확인 후 처리하시오.");
			abort;
		}

		if(confirm("<spring:message code="common.save.msg" />")){
		if(!validateAdministCode(form)){ 			
			return;
		}else{
			form.submit();
		}
	}
}

/* ********************************************************
 * 행정코드 팝업 창 열기
 ******************************************************** */
function fn_egov_AdministCodePopup(upperAdministZoneCode,upperAdministZoneNm){

	var retVal;

	var url = "/sym/ccm/adc/EgovCcmAdministCodePopup.do";
 	
	var varParam = new Object();
	varParam.administZoneSe = administCode.administZoneSe.value;		

	// IE
	//var openParam = "dialogWidth:252px;dialogHeight:175px;scroll:no;status:no;center:yes;resizable:yes;";

	// FIREFOX
	var openParam = "dialogWidth:700px;dialogHeight:500px;scroll:no;status:no;center:yes;resizable:yes;";

 	retVal = window.showModalDialog(url, varParam, openParam);
 	if(retVal) {
		upperAdministZoneCode.value = retVal.administZoneCode;
		upperAdministZoneNm.value   = retVal.administZoneNm;
	}
}

function fnInit() {
	document.administCode.vcreatDe.value = '<c:out value='${fn:substring(administCode.creatDe, 0,4)}'/>-<c:out value='${fn:substring(administCode.creatDe, 4,6)}'/>-<c:out value='${fn:substring(administCode.creatDe, 6,8)}'/>';
	document.administCode.vablDe.value   = '<c:out value='${fn:substring(administCode.ablDe, 0,4)}'/>-<c:out value='${fn:substring(administCode.ablDe, 4,6)}'/>-<c:out value='${fn:substring(administCode.ablDe, 6,8)}'/>';
}
-->
</script>
</head>

<body onLoad="fnInit();">
<DIV id="content" style="width:712px">
<!-- ------------------------------------------------------------------ 상단타이틀 -->
<form:form commandName="administCode" name="administCode" method="post">
<input name="cmd" type="hidden" value="Modify">
<form:hidden path="administZoneSe"/>
<form:hidden path="administZoneCode"/>
<!-- ----------------- 상단 타이틀  영역 -->
<table width="700" cellpadding="8" class="table-search" border="0">
 <tr>
  <td width="100%"class="title_left">
   <img src="/images/egovframework/uss/olp/mgt/icon/tit_icon.gif" width="16" height="16" hspace="3" align="absmiddle" alt="제목">&nbsp;행정코드 수정</td>
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
    <th width="20%" height="23" class="required_text" nowrap >행정구역구분<img src="/images/egovframework/cmm/sym/ccm/icon/required.gif" alt="필수"  width="15" height="15"></th>
    <td>
		<select name="administZoneSe" disabled="true">
			<option value="1" <c:if test="${administCode.administZoneSe == '1'}">selected="selected"</c:if> >법정동</option>
			<option value="2" <c:if test="${administCode.administZoneSe == '2'}">selected="selected"</c:if> >행정동</option>				
		</select>
    </td>    
  </tr>     
  <tr>
    <th width="20%" height="23" class="required_text" nowrap >행정구역코드<img src="/images/egovframework/cmm/sym/ccm/icon/required.gif" alt="필수"  width="15" height="15"></th>          
    <td>${administCode.administZoneCode}</td>    
  </tr> 
  <tr>
    <th width="20%" height="23" class="required_text" nowrap >행정구역명<img src="/images/egovframework/cmm/sym/ccm/icon/required.gif" alt="필수"  width="15" height="15"></th>          
    <td width="80%" nowrap>
      <form:input  path="administZoneNm" size="60" maxlength="60"/>
      <form:errors path="administZoneNm"/>
    </td>    
  </tr> 
  <tr>
    <th width="20%" height="23" class="required_text" nowrap >생성일자<img src="/images/egovframework/cmm/sym/ccm/icon/required.gif" alt="필수"  width="15" height="15"></th>          
    <td width="80%" nowrap>
      <input name="vcreatDe" size="10" maxlength="10" readonly onClick="javascript:fn_egov_NormalCalendar(document.administCode, document.administCode.creatDe, document.administCode.vcreatDe);" />
		<a href="javascript:fn_egov_NormalCalendar(document.administCode, document.administCode.creatDe, document.administCode.vcreatDe);" style="selector-dummy:expression(this.hideFocus=false);"><img src="<c:url value='/images/egovframework/cmm/sym/cal/bu_icon_carlendar.gif' />" alt="달력"></a>
      <form:hidden path="creatDe"/>
      <form:errors path="creatDe"/>
    </td>    
  </tr> 
  <tr>
    <th width="20%" height="23" class="text" nowrap >폐기일자</th>          
    <td width="80%" nowrap>
      <input  name="vablDe" size="10" maxlength="10" readonly onClick="javascript:fn_egov_NormalCalendar(document.administCode, document.administCode.ablDe, document.administCode.vablDe);" />
		<a href="javascript:fn_egov_NormalCalendar(document.administCode, document.administCode.ablDe, document.administCode.vablDe);" style="selector-dummy:expression(this.hideFocus=false);"><img src="<c:url value='/images/egovframework/cmm/sym/cal/bu_icon_carlendar.gif' />" alt="달력"></a>
      <form:hidden path="ablDe"/>
      <form:errors path="ablDe"/>
    </td>    
  </tr> 
  <tr>
    <th width="20%" height="23" class="text" nowrap >상위행정구역코드</th>          
    <td width="80%" nowrap>
      <input  name="upperAdministZoneNm" size="60" maxlength="60" value="${administCode.upperAdministZoneNm}" readonly onClick="javascript:fn_egov_AdministCodePopup(administCode.upperAdministZoneCode,administCode.upperAdministZoneNm)"/>
		<a href="javascript:fn_egov_AdministCodePopup(administCode.upperAdministZoneCode,administCode.upperAdministZoneNm)" style="selector-dummy:expression(this.hideFocus=false);"><img src="<c:url value='/images/egovframework/cmm/sym/ccm/icon/search2.gif' />" alt="행정코드찾기"></a>
      <form:hidden  path="upperAdministZoneCode"/>
      <form:errors path="upperAdministZoneCode"/>
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
  <td background="/images/egovframework/cmm/sym/ccm/btn/bu2_bg.gif" class=text_left" nowrap><a href="javascript:fn_egov_list_AdministCode()">목록</a></td>
  <td><img src="/images/egovframework/cmm/sym/ccm/btn/bu2_right.gif" alt="목록" width="8" height="20"></td>      
  <td width="10"></td>

  <td><img src="/images/egovframework/cmm/sym/ccm/btn/bu2_left.gif" alt="저장" width="8" height="20"></td>
  <td background="/images/egovframework/cmm/sym/ccm/btn/bu2_bg.gif" class="text_left" nowrap><a href="JavaScript:fn_egov_modify_AdministCode(document.administCode);">저장</a></td>
  <td><img src="/images/egovframework/cmm/sym/ccm/btn/bu2_right.gif" alt="저장" width="8" height="20"></td>      
</tr>
</table>

</form:form>
</DIV>
</body>
</html>