<%--
  Class Name : EgovQustnrItemManageRegist.jsp
  Description : 설문항목 등록 페이지
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

<c:set var="ImgUrl" value="/images/egovframework/uss/olp/qim/"/>
<c:set var="CssUrl" value="/css/egovframework/uss/olp/qim/"/>
<html>
<head>
<title>회의정보 관리</title>
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<link type="text/css" rel="stylesheet" href="${CssUrl}com.css" />
<script type="text/javascript" src="<c:url value="/validator.do"/>"></script>
<validator:javascript formName="qustnrItemManageVO" staticJavascript="false" xhtml="true" cdata="false"/>
<script type="text/javaScript" language="javascript">
/* ********************************************************
 * 초기화
 ******************************************************** */
function fn_egov_init_QustnrItemManage(){

	document.getElementById("iemSn").value = "1";
	//document.getElementById("qestnrEndDe").value = "2008-01-30";
}
/* ********************************************************
 * 목록 으로 가기
 ******************************************************** */
function fn_egov_list_QustnrItemManage(){
	location.href = "/uss/olp/qim/EgovQustnrItemManageList.do";
}
/* ********************************************************
 * 저장처리화면
 ******************************************************** */
function fn_egov_save_QustnrItemManage(){
	var varFrom = document.getElementById("qustnrItemManageVO");

	if(confirm("<spring:message code="common.save.msg" />")){
		
		varFrom.action =  "/uss/olp/qim/EgovQustnrItemManageRegist.do";

		if(varFrom.qestnrCn.value == "" ||
				varFrom.qestnrTmplatId.value == "" ||
				varFrom.qestnrId.value == ""  
				){
			alert("설문지정보를  입력해주세요!");
			varFrom.qestnrCn.focus();
			return;
			
		}

		if(varFrom.qestnrQesitmCn.value == "" ||
				varFrom.qestnrQesitmId.value == "" 
				){
			alert("설문문항정보를  입력해주세요!");
			varFrom.qestnrQesitmCn.focus();
			return;
			
		}

		if(!validateQustnrItemManageVO(varFrom)){ 			
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
 /* ********************************************************
  * 설문지문항정보 팝업창열기
  ******************************************************** */
  function fn_egov_QustnrQestnManageListPopup_QustnrItemManage(){

	var sParam = "";
	sParam = sParam + "searchCondition=QESTNR_ID";
	sParam = sParam + "&searchKeyword=" + document.getElementById("qestnrId").value;

  	window.showModalDialog("/uss/olp/qqm/EgovQustnrQestnManageListPopup.do?" + sParam, self,"dialogWidth=800px;dialogHeight=500px;resizable=yes;center=yes");
  	
  }
</script>
</head>
<body onLoad="fn_egov_init_QustnrItemManage()">
<DIV id="content" style="width:712px">
<!-- ------------------------------------------------------------------ 상단타이틀 -->
<form:form commandName="qustnrItemManageVO"  action="" method="post">
<!-- ----------------- 상단 타이틀  영역 -->
<table width="100%" cellpadding="8" class="table-search" border="0">
 <tr>
  <td width="100%"class="title_left">
   <img src="${ImgUrl}icon/tit_icon.gif" width="16" height="16" hspace="3" align="absmiddle">&nbsp;설문항목 등록</td>
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
<th width="20%" height="23" class="required_text" nowrap>설문정보<img src="${ImgUrl}icon/required.gif" width="15" height="15"></th>
<td width="80%" nowrap>
  <input name="qestnrCn" id="qestnrCn" type="text" size="73" value="" maxlength="4000" style="width:300px;">
   <a href="javascript:fn_egov_QustnrManageListPopup_QustnrItemManage()">
   <img src="${ImgUrl}img/search2.gif" onClick=""align="absmiddle" style="border:0px" alt="설문정보" title="설문정보">
   </a>
  <input name="qestnrId" id="qestnrId" type="hidden" value="">
  <input name="qestnrTmplatId" id="qestnrTmplatId" type="hidden" value="">  
</td>
</tr>
<tr> 
<th width="20%" height="23" class="required_text" nowrap>설문문항정보<img src="${ImgUrl}icon/required.gif" width="15" height="15"></th>
<td width="80%" nowrap>
  <input name="qestnrQesitmCn" id="qestnrQesitmCn" type="text" size="73" value="" maxlength="4000" style="width:300px;">
   <a href="javascript:fn_egov_QustnrQestnManageListPopup_QustnrItemManage()">
  <img src="${ImgUrl}img/search2.gif" align="absmiddle" alt="설문문항정보" title="설문문항정보">
  </a>
  <input name="qestnrQesitmId" id="qestnrQesitmId" type="hidden" value="">
</td>
</tr>
<tr> 
<th height="23" class="required_text" >항목 순번<img src="${ImgUrl}icon/required.gif" width="15" height="15"></th>
<td>
  <input name="iemSn" type="text" size="5" value="" maxlength="5" style="width:100px;">
  <div><form:errors path="iemSn" cssClass="error" /></div>
</td>
</tr> 
<tr> 
<th height="23" class="required_text" >항목 내용<img src="${ImgUrl}icon/required.gif" width="15" height="15"></th>
<td>
  <textarea name="iemCn" class="textarea"  cols="75" rows="5"  style="width:100%;"></textarea>
  <div><form:errors path="iemCn" cssClass="error" /></div> 
</td>
</tr> 
<tr> 
<th width="20%" height="23" class="required_text" nowrap >기타답변여부<img src="${ImgUrl}icon/required.gif" width="15" height="15"></th>
<td width="80%" nowrap>
   <select name="etcAnswerAt">
   	<option value="N">N</option>
   	<option value="Y">Y</option>
  	</select>
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
  <td background="${ImgUrl}button/bu2_bg.gif" class="text_left" nowrap><a href="JavaScript:fn_egov_list_QustnrItemManage();"><spring:message code="button.list" /></a> 
  </td>
  <td><img src="${ImgUrl}button/bu2_right.gif" width="8" height="20"></td>      
  <td>&nbsp;</td>
  <td><img src="${ImgUrl}button/bu2_left.gif" width="8" height="20"></td>
  <td background="${ImgUrl}button/bu2_bg.gif" class="text_left" nowrap><a href="JavaScript:fn_egov_save_QustnrItemManage();"><spring:message code="button.save" /></a> 
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