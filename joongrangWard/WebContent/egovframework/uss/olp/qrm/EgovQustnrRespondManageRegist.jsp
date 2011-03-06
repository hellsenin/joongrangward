<%--
  Class Name : EgovQustnrRespondManageRegist.jsp
  Description : 응답자정보 등록 페이지
  Modification Information
 
      수정일         수정자                   수정내용
    -------    --------    ---------------------------
     2008.03.09    장동한          최초 생성
 
    author   : 공통서비스 개발팀 장동한
    since    : 2009.03.09
   
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
<c:set var="ImgUrl" value="/images/egovframework/uss/olp/qrm/"/>
<c:set var="CssUrl" value="/css/egovframework/uss/olp/qrm/"/>
<html>
<head>
<title>회의정보 관리</title>
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<link type="text/css" rel="stylesheet" href="${CssUrl}com.css" />
<script type="text/javascript" src="<c:url value="/validator.do"/>"></script>
<validator:javascript formName="qustnrRespondManageVO" staticJavascript="false" xhtml="true" cdata="false"/>
<script type="text/javaScript" language="javascript">
/* ********************************************************
 * 초기화
 ******************************************************** */
function fn_egov_init_QustnrRespondManage(){

}
/* ********************************************************
 * 목록 으로 가기
 ******************************************************** */
function fn_egov_list_QustnrRespondManage(){
	location.href = "/uss/olp/qrm/EgovQustnrRespondManageList.do";
}
/* ********************************************************
 * 저장처리화면
 ******************************************************** */
function fn_egov_save_QustnrRespondManage(){
	var varFrom = document.qustnrRespondManageVO;

	if(confirm("<spring:message code="common.save.msg" />")){
		varFrom.action =  "/uss/olp/qrm/EgovQustnrRespondManageRegist.do";
		varFrom.brth.value = fn_egov_SelectBoxValue('brthYYYY') + "" + fn_egov_SelectBoxValue('brthMM') + "" + fn_egov_SelectBoxValue('brthDD');
		
		if(varFrom.qestnrCn.value == "" ||
				varFrom.qestnrTmplatId.value == "" ||
				varFrom.qestnrId.value == ""  
				){
			alert("설문지정보를  입력해주세요!");
			varFrom.qestnrCn.focus();
			return;
		}
		
		if(!validateQustnrRespondManageVO(varFrom)){ 			
			return;
		}else{
			varFrom.submit();
		} 
	}
}

/* ********************************************************
 * 설문지정보 팝업창열기
 ******************************************************** */
 function fn_egov_QustnrManageListPopup_QustnrItemManage(){

 	window.showModalDialog("/uss/olp/qmc/EgovQustnrManageListPopup.do", self,"dialogWidth=800px;dialogHeight=500px;resizable=yes;center=yes");
 	
 }
/************************************************************************
//셀렉트박스 값 컨트롤 함수
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
<body onLoad="fn_egov_init_QustnrRespondManage()">
<DIV id="content" style="width:712px">
<!-- ------------------------------------------------------------------ 상단타이틀 -->
<form:form commandName="qustnrRespondManageVO" name="qustnrRespondManageVO" action="" method="post">
<!-- ----------------- 상단 타이틀  영역 -->
<table width="100%" cellpadding="8" class="table-search" border="0">
 <tr>
  <td width="100%"class="title_left">
   <img src="${ImgUrl}icon/tit_icon.gif" width="16" height="16" hspace="3" align="absmiddle">&nbsp;응답자정보 등록</td>
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
    <th width="20%" height="23" class="required_text" nowrap >설문지정보<img src="${ImgUrl}icon/required.gif" width="15" height="15"></th>
    <td width="80%" nowrap>
	<input name="qestnrCn" id="qestnrCn" type="text" size="73" value="" maxlength="4000" style="width:300px;">
	<a href="javascript:fn_egov_QustnrManageListPopup_QustnrItemManage()">
	<img src="${ImgUrl}img/search2.gif" onClick=""align="absmiddle" style="border:0px" alt="설문지정보" title="설문지정보">
	</a>
	<input name="qestnrId" id="qestnrId" type="hidden" value="">
	<input name="qestnrTmplatId" id="qestnrTmplatId" type="hidden" value="">  
    </td>
  </tr>
  <tr> 
    <th width="20%" height="23" class="required_text" nowrap >성별<img src="${ImgUrl}icon/required.gif" width="15" height="15"></th>
    <td width="80%" nowrap>


<form:select path="sexdstnCode">
	<option value="">선택</option>
	<form:options items="${comCode014}" itemValue="code" itemLabel="codeNm"/>
</form:select>
<div><form:errors path="sexdstnCode"/></div> 

      	
    </td>
  </tr>
  <tr> 
    <th width="20%" height="23" class="required_text" nowrap >직업<img src="${ImgUrl}icon/required.gif" width="15" height="15"></th>
    <td width="80%" nowrap>

<form:select path="occpTyCode">
	<option value="">선택</option>
	<form:options items="${comCode034}" itemValue="code" itemLabel="codeNm"/>
</form:select>
<div><form:errors path="occpTyCode"/></div> 

    </td>
  </tr>
  <tr> 
    <th height="23" class="required_text" >생년월일<img src="${ImgUrl}icon/required.gif" width="15" height="15"></th>
    <td>
       <select name="brthYYYY" id="brthYYYY">
	     <c:forEach var="h" begin="1960" end="2009" step="1">
	      	<option value="${h}">${h}</option>
	      </c:forEach>
       </select>년
       <select name="brthMM" id="brthMM">
	     <c:forEach var="h" begin="1" end="12" step="1">
	      	<option value="<c:if test="${h < 10}">0</c:if>${h}"><c:if test="${h < 10}">0</c:if>${h}</option>
	      </c:forEach>
       </select>월
       <select name="brthDD" id="brthDD">
	     <c:forEach var="h" begin="1" end="31" step="1">
	      	<option value="<c:if test="${h < 10}">0</c:if>${h}"><c:if test="${h < 10}">0</c:if>${h}</option>
	      </c:forEach>
       </select>일
       <input name="brth" id="brth" type="hidden" value="">
    </td>
  </tr> 
  
  <tr> 
    <th width="20%" height="23" class="required_text" nowrap >응답자명<img src="${ImgUrl}icon/required.gif" width="15" height="15"></th>
    <td width="80%" nowrap>
		<input name="respondNm" type="text" size="73" value="" maxlength="50" style="width:120px;">
		<div><form:errors path="respondNm" cssClass="error" /></div>
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
  <td><img src="${ImgUrl}button/bu2_left.gif" width="8" height="20"></td>
  <td background="${ImgUrl}button/bu2_bg.gif" class="text_left" nowrap><a href="JavaScript:fn_egov_list_QustnrRespondManage();"><spring:message code="button.list" /></a> 
  </td>
  <td><img src="${ImgUrl}button/bu2_right.gif" width="8" height="20"></td>      
  <td>&nbsp;</td>
  <td><img src="${ImgUrl}button/bu2_left.gif" width="8" height="20"></td>
  <td background="${ImgUrl}button/bu2_bg.gif" class="text_left" nowrap><a href="JavaScript:fn_egov_save_QustnrRespondManage();"><spring:message code="button.save" /></a> 
  </td>
  <td><img src="${ImgUrl}button/bu2_right.gif" width="8" height="20"></td>      
</tr>
</table>
</center>

<input name="cmd" type="hidden" value="<c:out value='save'/>"/>
</form:form>
</DIV>

</body>
</html>