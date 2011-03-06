<%--
  Class Name : EgovQustnrRespondInfoRegist.jsp
  Description : 설문조사 등록 페이지
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
<c:set var="ImgUrl" value="/images/egovframework/uss/olp/qnn/"/>
<c:set var="CssUrl" value="/css/egovframework/uss/olp/qnn/"/>
<%pageContext.setAttribute("crlf", "\r\n"); %>
<html>
<head>
<title>설문조사</title>
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<link type="text/css" rel="stylesheet" href="${CssUrl}com.css" />
<script type="text/javascript" src="<c:url value="/validator.do"/>"></script>
<script type="text/javaScript" language="javascript">
/* ********************************************************
 * 초기화
 ******************************************************** */
function fn_egov_init_QustnrRespondInfo(){
}
/* ********************************************************
 * 목록 으로 가기
 ******************************************************** */
function fn_egov_list_QustnrRespondInfo(){
	location.href = "/uss/olp/qnn/EgovQustnrRespondInfoManageList.do";
}
/* ********************************************************
 * 저장처리화면
 ******************************************************** */
function fn_egov_save_QustnrRespondInfo(){
	var varFrom = document.qustnrRespondInfoManage;

	//설문응답자  Validtation

	if(varFrom.sexdstnCode.selectedIndex == 0){
		alert('설문응답자정보 성별을  택해주세요!');
		varFrom.sexdstnCode.focus();
		return;
	}else if(varFrom.occpTyCode.selectedIndex == 0){
		alert('설문응답자정보 직업을 선택해주세요!');
		varFrom.occpTyCode.focus();
		return;
	}else if(varFrom.brthYYYY.selectedIndex == 0){
		alert('설문응답자정보 생년월일(년)을 선택해주세요!');
		varFrom.brthYYYY.focus();
		return;
	}else if(varFrom.brthMM.selectedIndex == 0){
		alert('설문응답자정보 생년월일(월)을 선택해주세요!');
		varFrom.brthMM.focus();
		return;
	}else if(varFrom.brthDD.selectedIndex == 0){
		alert('설문응답자정보 생년월일(일)을 선택해주세요!');
		varFrom.brthDD.focus();
		return;
	}else if(varFrom.respondNm.value == ""){
		alert('설문응답자정보 응답자명을 입력해주세요!');
		varFrom.respondNm.focus();
		return;
	}


	
	//설문정보 Validtation
	<c:forEach items="${Comtnqustnrqesitm}" var="QestmInfo" varStatus="status1">
	<c:if test="${QestmInfo.qestnTyCode ==  '1'}">	
	if((!fn_egov_selectBoxChecking("${QestmInfo.qestnrQesitmId}"))){
		alert('${status1.count}번 설문문항을 작성해 주세요!');
		document.getElementsByName("${QestmInfo.qestnrQesitmId}")[0].focus();
		return;
	}

		<c:forEach items="${Comtnqustnriem}" var="QestmItem" varStatus="status01">
		<c:if test="${QestmInfo.qestnrTmplatId eq QestmItem.qestnrTmplatId && QestmInfo.qestnrId eq QestmItem.qestnrId && QestmInfo.qestnrQesitmId eq QestmItem.qestnrQesitmId}">
		
			<c:if test="${QestmItem.etcAnswerAt eq  'Y'}">
			//기타답변을 선택했는체크
			if(fn_egov_RadioBoxValue("${QestmInfo.qestnrQesitmId}") == "${QestmItem.qustnrIemId}"){
				if(document.getElementById("ETC_${QestmItem.qustnrIemId}").value == ""){
					alert('${status1.count}번 설문문항 기타답변을 작성해주세요!');
					document.getElementById("ETC_${QestmItem.qustnrIemId}").focus();
					return;
				}
			}
			
			</c:if>
		</c:if>
		</c:forEach>
	</c:if>


	<c:if test="${QestmInfo.qestnTyCode ==  '2'}">
	if( document.getElementById("${QestmInfo.qestnrQesitmId}").value == "" ){ 
		//alert('${status1.count}. ${QestmInfo.qestnCn}       \n\n설문문항을 작성해 주세요!');
		alert('${status1.count}번 설문문항을 작성해 주세요!');
		document.getElementById("${QestmInfo.qestnrQesitmId}").focus();
		return;
	}
	</c:if>
	</c:forEach>
	
	
	if(confirm("<spring:message code="common.save.msg" />")){

		varFrom.brth.value = fn_egov_SelectBoxValue('brthYYYY') + "" + fn_egov_SelectBoxValue('brthMM') + "" + fn_egov_SelectBoxValue('brthDD');
		varFrom.action =  "/uss/olp/qnn/EgovQustnrRespondInfoManageRegist.do";
		varFrom.submit();
	}
}
/************************************************************************
//라디오박스 : 몇개선택했는데 체크해주는함수 
************************************************************************/
function fn_egov_checkbox_amout_max( sbName){
	var FLength= document.getElementsByName(sbName).length;

	var reuslt = false;
	var reusltCount = 0;
	for(var i=0; i < FLength; i++)
	{
		if(document.getElementsByName(sbName)[i].checked == true){
			reusltCount++;
		}
	}

	return reusltCount;
	
}
/************************************************************************
//라디오박스 : 최대선택건수 체크
************************************************************************/
function fn_egov_checkbox_amout( sbName, sbCount, sbObj){

	var FLength= document.getElementsByName(sbName).length;

	var reuslt = false;
	var reusltCount = 0;
	for(var i=0; i < FLength; i++)
	{
		if(document.getElementsByName(sbName)[i].checked == true){
			reusltCount++;
		}
	}

	if(reusltCount > sbCount){
	 	alert("최대선택건수 [" + sbCount + "]건을  초과하였습니다!" );
	 	sbObj.checked=false;
	 	return;
	}
}

/************************************************************************
//셀렉트 박스 선택했는 찾는 함수
************************************************************************/

function fn_egov_selectBoxChecking(sbName){

	var FLength= document.getElementsByName(sbName).length;

	var reuslt = false;
	for(var i=0; i < FLength; i++)
	{
		if(document.getElementsByName(sbName)[i].checked == true){
			reuslt=true;
		}
	}
	
	return reuslt;
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

/************************************************************************
//라디오박스 체크 박스
************************************************************************/
function fn_egov_RadioBoxValue(sbName)
{
	var FLength = document.getElementsByName(sbName).length;
	var FValue = "";
	for(var i=0; i < FLength; i++)
	{
		if(document.getElementsByName(sbName)[i].checked == true){
			FValue = document.getElementsByName(sbName)[i].value;
		}
	}
	
	return FValue;
}

</script>
</head>
<body onLoad="fn_egov_init_QustnrRespondInfo()">
<DIV id="content" style="width:712px">
<!-- ------------------------------------------------------------------ 상단타이틀 -->
<form name="qustnrRespondInfoManage"  action="" method="post">
<!-- ----------------- 상단 타이틀  영역 -->
<table width="100%" cellpadding="8" class="table-search" border="0">
 <tr>
  <td width="100%"class="title_left">
   <img src="${ImgUrl}icon/tit_icon.gif" width="16" height="16" hspace="3" align="absmiddle">&nbsp;설문참여</td>
 </tr>
</table>
<!-- ------------------------------------------------------------------ 줄간격조정  -->
<table width="100%" cellspacing="0" cellpadding="0" border="0">
<tr>
	<td height="3px"></td>
</tr>
</table>
<!-- ------------------------------------------------------------------ 서브타이틀  -->
<table width="100%" cellpadding="8" class="table-search" border="0">
 <tr>
  <td width="100%"class="title_left">
   <img src="/images/egovframework/cmm/mod/icon/icon_next.gif" align="absmiddle">&nbsp;설문응답자 정보</td>
 </tr>
</table>

<table width="100%" border="0" cellpadding="0" cellspacing="1" class="table-register">
  <tr> 
    <th width="20%" height="23" class="required_text" nowrap >성별<img src="${ImgUrl}icon/required.gif" width="15" height="15"></th>
    <td width="80%" nowrap>
       
<select name="sexdstnCode">
	<option value="">선택</option>
	<c:forEach items="${comCode014}" var="comCodeList" varStatus="status">
		<option value="${comCodeList.code}" <c:if test="${comCodeList.code eq Emplyrinfo.sexdstnCode}">selected</c:if>>${comCodeList.codeNm}</option>
	</c:forEach>  
</select>

    </td>
  </tr>
  <tr> 
    <th width="20%" height="23" class="required_text" nowrap >직업<img src="${ImgUrl}icon/required.gif" width="15" height="15"></th>
    <td width="80%" nowrap>

<select name="occpTyCode">
	<option value="">선택</option>
	<c:forEach items="${comCode034}" var="comCodeList" varStatus="status">
		<option value="${comCodeList.code}">${comCodeList.codeNm}</option>
	</c:forEach>  
</select>

    </td>
  </tr>
  <tr> 
    <th height="23" class="required_text" >생년월일<img src="${ImgUrl}icon/required.gif" width="15" height="15"></th>
    <td>
       <select name="brthYYYY" id="brthYYYY">
       	<option value="">선택</option>
	     <c:forEach var="h" begin="1960" end="2009" step="1">
	      	<option value="${h}" <c:if test="${fn:substring(Emplyrinfo.brth, 0, 4) ==  h}">selected</c:if>>${h}</option>
	      </c:forEach>
       </select>년
       
       <select name="brthMM" id="brthMM">
       <option value="">선택</option>
	     <c:forEach var="h" begin="1" end="12" step="1">
			<c:choose>
			    <c:when test="${h < 10}">
			 	<c:set var="brthMM" value="0${h}"/>
			    </c:when>
			    <c:otherwise>
			    <c:set var="brthMM" value="${h}"/>
			    </c:otherwise>
			</c:choose>
	      	<option value="<c:if test="${h < 10}">0</c:if>${h}" <c:if test="${fn:substring(Emplyrinfo.brth, 4, 6) ==  brthMM}">selected</c:if>><c:if test="${h < 10}">0</c:if>${h}</option>
	      </c:forEach>
	   </select>월
       <select name="brthDD" id="brthDD">
       <option value="">선택</option>
	     <c:forEach var="h" begin="1" end="31" step="1">
			<c:choose>
			    <c:when test="${h < 10}">
			 	<c:set var="brthDD" value="0${h}"/>
			    </c:when>
			    <c:otherwise>
			    <c:set var="brthDD" value="${h}"/>
			    </c:otherwise>
			</c:choose>
	      	<option value="<c:if test="${h < 10}">0</c:if>${h}" <c:if test="${fn:substring(Emplyrinfo.brth, 6, 8) ==  brthDD}">selected</c:if>><c:if test="${h < 10}">0</c:if>${h}</option>
	      </c:forEach>
       </select>일
       
       <input name="brth" id="brth" type="hidden" value="">
    </td>
  </tr> 
  
  <tr> 
    <th width="20%" height="23" class="required_text" nowrap >응답자명<img src="${ImgUrl}icon/required.gif" width="15" height="15"></th>
    <td width="80%" nowrap>
		<input name="respondNm" type="text" size="73" value="${Emplyrinfo.emplyrNm}" maxlength="50" style="width:120px;">
    </td>
  </tr>
</table>
<!-- ------------------------------------------------------------------ 등록  폼 영역  -->
<!-- ------------------------------------------------------------------ 서브타이틀  -->
<table width="100%" cellpadding="8" class="table-search" border="0">
 <tr>
  <td width="100%"class="title_left">
   <img src="/images/egovframework/cmm/mod/icon/icon_next.gif" align="absmiddle">&nbsp;설문정보</td>
 </tr>
</table>
<table width="100%" border="0" cellpadding="0" cellspacing="1" class="table-register">
<tr> 
    <td width="20%" height="35" class="required_text">설문제목 :</td>
    <td width="80%">
	<c:out value="${fn:replace(Comtnqestnrinfo[0].qestnrSj , crlf , '<br/>')}" escapeXml="false" />
    </td>
</tr>
<tr> 
    <td width="20%" height="35" class="required_text">설문목적 :</td>
    <td width="80%">
	<c:out value="${fn:replace(Comtnqestnrinfo[0].qestnrPurps , crlf , '<br/>')}" escapeXml="false" />
    </td>
</tr>
<tr> 
    <td width="20%" height="35" class="required_text"> 설문작성 안내내용 :</td>
    
    <td width="80%">
	<c:out value="${fn:replace(Comtnqestnrinfo[0].qestnrWritngGuidanceCn , crlf , '<br/>')}" escapeXml="false" />
    </td>
</tr>
<tr> 
    <td height="35" colspan="2">
    <table width="100%" border="0" cellpadding="0">
    <tr>
    	<td width="50%" align="center">
    	<b>설문대상  :</b>
			<c:if test="${Comtnqestnrinfo[0].qestnrTrget ==  '1'}">학생</c:if>
			<c:if test="${Comtnqestnrinfo[0].qestnrTrget ==  '2'}">대학생</c:if>
			<c:if test="${Comtnqestnrinfo[0].qestnrTrget ==  '3'}">직장인</c:if>
			<c:if test="${Comtnqestnrinfo[0].qestnrTrget ==  '4'}">군인</c:if>
			<c:if test="${Comtnqestnrinfo[0].qestnrTrget ==  '5'}">교사</c:if>
			<c:if test="${Comtnqestnrinfo[0].qestnrTrget ==  '6'}">기타</c:if>
    	</td>
    	<td width="50%" align="center">
    	<b>설문기간 :</b>
    	${Comtnqestnrinfo[0].qestnrBeginDe}~${Comtnqestnrinfo[0].qestnrEndDe}
    	</td>
    </tr>
    </table>
    
    </td>
</tr> 

<%-- 설문템플릿설정 --%>
<c:import charEncoding="utf-8" url="/uss/olp/qri/template/template.do" > 
<c:param name="templateUrl" value="${QustnrTmplatManage[0].qestnrTmplatCours}" /> 
</c:import>	 

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
  <td background="${ImgUrl}button/bu2_bg.gif" class="text_left" nowrap><a href="JavaScript:fn_egov_list_QustnrRespondInfo();"><spring:message code="button.list" /></a> 
  </td>
  <td><img src="${ImgUrl}button/bu2_right.gif" width="8" height="20"></td>      
  <td>&nbsp;</td>
  <td><img src="${ImgUrl}button/bu2_left.gif" width="8" height="20"></td>
  <td background="${ImgUrl}button/bu2_bg.gif" class="text_left" nowrap><a href="JavaScript:fn_egov_save_QustnrRespondInfo();"><spring:message code="button.save" /></a> 
  </td>
  <td><img src="${ImgUrl}button/bu2_right.gif" width="8" height="20"></td>      
</tr>
</table>
</center>
<input name="qestnrTmplatId" id="qestnrTmplatId" type="hidden" value="${qestnrTmplatId}">
<input name="qestnrId" id="qestnrId" type="hidden" value="${qestnrId}">
<input name="cmd" type="hidden" value="<c:out value='save'/>"/>
</form>

</DIV>

</body>
</html>