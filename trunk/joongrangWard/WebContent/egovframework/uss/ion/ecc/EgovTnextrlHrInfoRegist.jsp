<%--
  Class Name : EgovEventCmpgnRegist.jsp
  Description : 행사/이벤트/캠페인 등록
  Modification Information
 
      수정일         수정자                   수정내용
    -------    --------    ---------------------------
     2008.03.12    장동한          최초 생성
 
    author   : 공통서비스 개발팀 장동한
    since    : 2009.03.12
   
    Copyright (C) 2009 by MOPAS  All right reserved.
--%>
<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="validator" uri="http://www.springmodules.org/tags/commons-validator" %>
<c:set var="ImgUrl" value="/images/egovframework/uss/ion/ecc/"/>
<c:set var="CssUrl" value="/css/egovframework/uss/ion/ecc/com.css"/>

<html>
<head>
<title>외부인사정보</title>
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<link type="text/css" rel="stylesheet" href="<c:out value="${CssUrl}"/>" />
<script type="text/javascript" src="<c:url value="/validator.do"/>"></script>
<validator:javascript formName="tnextrlHrInfoVO" staticJavascript="false" xhtml="true" cdata="false" />
<script type="text/javaScript" language="javascript">
/* ********************************************************
 * 초기화
 ******************************************************** */
function fn_egov_init_TnextrlHrInfo(){

//	document.getElementById("bsnsYear").value = "2009";

}
/* ********************************************************
 * 목록 으로 가기
 ******************************************************** */
function fn_egov_list_TnextrlHrInfo(){
	location.href = "/uss/ion/ecc/EgovTnextrlHrInfoList.do";
}
/* ********************************************************
 * 저장처리화면
 ******************************************************** */
function fn_egov_save_TnextrlHrInfo(){
	var varFrom = document.getElementById("tnextrlHrInfoVO");

	if(confirm("저장 하시겠습니까?")){
		varFrom.action =  "/uss/ion/ecc/EgovTnextrlHrInfoRegist.do";

		varFrom.brth.value = fn_egov_SelectBoxValue('brthYYYY') + "" + fn_egov_SelectBoxValue('brthMM') + "" + fn_egov_SelectBoxValue('brthDD');
		
		if(varFrom.eventCn.value == "" ||
				varFrom.eventId.value == ""
				){
			alert("행사/이벤트/캠페인 정보를  선택 해주세요!");
			varFrom.eventCn.focus();
			return;
			
		}
		
		if(!validateTnextrlHrInfoVO(varFrom)){ 			
			return;
		}else{
			varFrom.submit();
		} 
	}
}
/* ********************************************************
 * 이벤트 조회 팝업
 ******************************************************** */
function fn_egov_EventCmpgnListPopup_TnextrlHrInfo(){

	window.showModalDialog("/uss/ion/ecc/EgovEventCmpgnListPopup.do", self,"dialogWidth=800px;dialogHeight=500px;resizable=yes;center=yes");
	
}

/************************************************************************
//                            
************************************************************************/
function fn_egov_SelectBoxValue(sbName)
{
	var FValue = "";
	for(var i=0; i < document.getElementById(sbName).length; i++)
	{
		if(document.getElementById(sbName).options[i].selected == true){
			
			FValue=document.getElementById(sbName).options[i].value;
		}
	}
	
	return  FValue;
}
</script>
</head>
<body onLoad="fn_egov_init_TnextrlHrInfo();">
<DIV id="content" style="width:712px">
<!-- ------------------------------------------------------------------ 상단타이틀 -->
<form:form commandName="tnextrlHrInfoVO" name="tnextrlHrInfoVO" action="" method="post">
<!-- ----------------- 상단 타이틀  영역 -->
<table width="100%" cellpadding="8" class="table-search" border="0">
 <tr>
  <td width="100%"class="title_left">
   <img src="<c:out value="${ImgUrl}"/>icon/tit_icon.gif" width="16" height="16" hspace="3" align="absmiddle">&nbsp;외부인사정보 등록</td>
 </tr>
</table>
<!-- ------------------------------------------------------------------ 줄간격조정  -->
<table width="100%" cellspacing="0" cellpadding="0" border="0">
<tr>
	<td height="3px"></td>
</tr>
</table>
<!-- ------------------------------------------------------------------ 등록  폼 영역  -->
<table width="100%" border="0" cellpadding="0" cellspacing="1" class="table-register">
  <tr> 
    <th width="20%" height="23" class="required_text" nowrap>행사/이벤트/캠페인 정보<img src="${ImgUrl}icon/required.gif" width="15" height="15"></th>
    <td width="80%" nowrap>
      <input name="eventCn" id="eventCn" type="text" size="73" value="" maxlength="70" style="width:300px;" readonly="readonly">
      <a href="#" onClick="fn_egov_EventCmpgnListPopup_TnextrlHrInfo()">
      <img src="<c:out value="${ImgUrl}"/>img/search2.gif" align="absmiddle" style="border:0px" alt="행사/이벤트/캠페인 정보" title="행사/이벤트/캠페인 정보">
      </a>
      <input name="eventId" id="eventId" type="hidden" value="5">
    </td>
  </tr>
  <tr> 
    <th height="23" class="required_text">성별<img src="${ImgUrl}icon/required.gif" width="15" height="15"></th>
    <td>
		<select name="sexdstnCode">
			<option value="">선택</option>
			<c:forEach items="${comCode014}" var="comCodeList" varStatus="status">
				<option value="${comCodeList.code}">${comCodeList.codeNm}</option>
			</c:forEach>
		</select>
      	<div><form:errors path="sexdstnCode" cssClass="error" /></div>
    </td>
  </tr> 
  
  <tr> 
    <th width="20%" height="23" class="required_text" nowrap >외부인사명<img src="${ImgUrl}icon/required.gif" width="15" height="15"></th>
    <td width="80%" nowrap>
       <input name="extrlHrNm" type="text" size="73" value="" maxlength="50" style="width:300px;">
       <div><form:errors path="extrlHrNm" cssClass="error" /></div>
    </td>
  </tr>
  
  <tr> 
    <th width="20%" height="23" class="required_text" nowrap >생년월일<img src="${ImgUrl}icon/required.gif" width="15" height="15"></th>
    <td width="80%" nowrap>
       <select name="brthYYYY" id="brthYYYY">
       	<option value="">선택</option>
	     <c:forEach var="h" begin="1960" end="2009" step="1">
	      	<option value="${h}">${h}</option>
	      </c:forEach>
       </select>년
       <select name="brthMM" id="brthMM">
       	<option value="">선택</option>
	     <c:forEach var="h" begin="1" end="12" step="1">
	      	<option value="<c:if test="${h < 10}">0</c:if>${h}"><c:if test="${h < 10}">0</c:if>${h}</option>
	      </c:forEach>
       </select>월
       <select name="brthDD" id="brthDD">
       <option value="">선택</option>
	     <c:forEach var="h" begin="1" end="31" step="1">
	      	<option value="<c:if test="${h < 10}">0</c:if>${h}"><c:if test="${h < 10}">0</c:if>${h}</option>
	      </c:forEach>
       </select>일
       <input name="brth" id="brth" type="hidden" value="">
       <div><form:errors path="brthYYYY" cssClass="error" /></div>
       <div><form:errors path="brthMM" cssClass="error" /></div>
       <div><form:errors path="brthDD" cssClass="error" /></div>
    </td>
  </tr> 
        
  <tr>  
    <th width="20%" height="23" class="required_text" nowrap >직업유형<img src="${ImgUrl}icon/required.gif" width="15" height="15"></th>
    <td width="80%" nowrap>
		<select name="occpTyCode">
			<option value="">선택</option>
			<c:forEach items="${comCode034}" var="comCodeList" varStatus="status">
				<option value="${comCodeList.code}">${comCodeList.codeNm}</option>
			</c:forEach>
		</select>
      	<div><form:errors path="occpTyCode" cssClass="error" /></div>
    </td>
  </tr>
  
  <tr> 
    <th width="20%" height="23" class="required_text" nowrap >소속기관</th>
    <td width="80%" nowrap>
       <input name="psitnInsttNm" type="text" size="73" value="" maxlength="70" style="width:300px;">
    </td>
  </tr>
  
  <tr> 
    <th width="20%" height="23" class="required_text" nowrap >전화번호<img src="${ImgUrl}icon/required.gif" width="15" height="15"></th>
    <td width="80%" nowrap>
	    <input name="areaNo" type="text" size="4" value="" maxlength="4">-
	    <input name="middleTelno" type="text" size="4" value="" maxlength="4">-
	    <input name="endTelno" type="text" size="4" value="" maxlength="4">
		<div><form:errors path="areaNo" cssClass="error" /></div>
		<div><form:errors path="middleTelno" cssClass="error" /></div>
		<div><form:errors path="endTelno" cssClass="error" /></div>
    </td>
  </tr>
  <tr> 
    <th width="20%" height="23" class="required_text" nowrap >이메일주소<img src="${ImgUrl}icon/required.gif" width="15" height="15"></th>
    <td width="80%" nowrap>
       <input name="emailAdres" type="text" size="73" value="" maxlength="50" style="width:300px;">
       <div><form:errors path="endTelno" cssClass="error" /></div>
    </td>
  </tr> 
</table>
<!-- ------------------------------------------------------------------ 줄간격조정  -->
<table width="100%" cellspacing="0" cellpadding="0" border="0">
<tr>
	<td height="3px"></td>
</tr>
</table>
<center>
<!-- ------------------------------------------------------------------ 목록/저장버튼  -->
<table border="0" cellspacing="0" cellpadding="0" align="center">
<tr> 
  <td><img src="<c:out value="${ImgUrl}"/>button/bu2_left.gif" width="8" height="20"></td>
  <td background="<c:out value="${ImgUrl}"/>button/bu2_bg.gif" class="text_left" nowrap><a href="JavaScript:fn_egov_list_TnextrlHrInfo();">목록</a> 
  </td>
  <td><img src="<c:out value="${ImgUrl}"/>button/bu2_right.gif" width="8" height="20"></td>      
  <td>&nbsp;</td>
  <td><img src="<c:out value="${ImgUrl}"/>button/bu2_left.gif" width="8" height="20"></td>
  <td background="<c:out value="${ImgUrl}"/>button/bu2_bg.gif" class="text_left" nowrap><a href="JavaScript:fn_egov_save_TnextrlHrInfo();">저장</a> 
  </td>
  <td><img src="<c:out value="${ImgUrl}"/>button/bu2_right.gif" width="8" height="20"></td>      
</tr>
</table>
</center>
<input name="cmd" type="hidden" value="<c:out value='save'/>"/>
</form:form>
</DIV>

</body>
</html>