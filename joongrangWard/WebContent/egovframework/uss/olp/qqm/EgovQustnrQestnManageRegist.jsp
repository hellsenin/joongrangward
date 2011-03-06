<%--
  Class Name : EgovQustnrQestnManageRegist.jsp
  Description : 설문문항 등록 페이지
  Modification Information
 
      수정일         수정자                   수정내용
    -------    --------    ---------------------------
     2008.03.09    장동한          최초 생성
 
    author   : 공통서비스 개발팀 장동한
    since    : 2009.03.19
   
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

<c:set var="ImgUrl" value="/images/egovframework/uss/olp/qqm/"/>
<c:set var="CssUrl" value="/css/egovframework/uss/olp/qqm/"/>

<html>
<head>
<title>회의정보 관리</title>
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<link type="text/css" rel="stylesheet" href="${CssUrl}com.css" />
<script type="text/javascript" src="<c:url value="/validator.do"/>"></script>
<validator:javascript formName="qustnrQestnManageVO" staticJavascript="false" xhtml="true" cdata="false"/>
<script type="text/javaScript" language="javascript">


/* ********************************************************
 * 초기화
 ******************************************************** */
function fn_egov_init_QustnrQestnManage(){

	//document.getElementById("qestnrBeginDe").value = "2008-01-01";
	//document.getElementById("qestnrEndDe").value = "2008-01-30";
}
/* ********************************************************
 * 목록 으로 가기
 ******************************************************** */
function fn_egov_list_QustnrQestnManage(){
	var varFrom = document.getElementById("qustnrQestnManageVO");
	varFrom.action =  "/uss/olp/qqm/EgovQustnrQestnManageList.do";
	varFrom.submit();
	
}
/* ********************************************************
 * 저장처리화면
 ******************************************************** */
function fn_egov_save_QustnrQestnManage(form){
	if(confirm("<spring:message code="common.save.msg" />")){

		if(form.qestnrCn.value == "" ||
				form.qestnrTmplatId.value == "" ||
				form.qestnrId.value == ""  
				){
			alert("설문지정보를  입력해주세요!");
			form.qestnrCn.focus();
			return;
			
		}
		
		if(!validateQustnrQestnManageVO(form)){ 			
			return;
		}else{
			form.submit();
		} 
	}
}
/* ********************************************************
 * 설문지정보 팝업창열기
 ******************************************************** */
 function fn_egov_QustnrManageListPopup_QustnrQestnManage(){

 	window.showModalDialog("/uss/olp/qmc/EgovQustnrManageListPopup.do", self,"dialogWidth=800px;dialogHeight=500px;resizable=yes;center=yes");
 	
 }
</script>
</head>
<body onLoad="fn_egov_init_QustnrQestnManage()">
<DIV id="content" style="width:712px">
<!-- ------------------------------------------------------------------ 상단타이틀 -->
<form name="qustnrQestnManageVO"  id="qustnrQestnManageVO" action="/uss/olp/qqm/EgovQustnrQestnManageRegist.do" method="post">
<!-- ----------------- 상단 타이틀  영역 -->
<table width="100%" cellpadding="8" class="table-search" border="0">
 <tr>
  <td width="100%"class="title_left">
   <img src="${ImgUrl}icon/tit_icon.gif" width="16" height="16" hspace="3" align="absmiddle">&nbsp;설문문항 등록</td>
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
    <th width="20%" height="23" class="required_text" nowrap>설문지정보(제목)<img src="${ImgUrl}icon/required.gif" width="15" height="15"></th>
    <td width="80%" nowrap>
      <input name="qestnrCn" id="qestnrCn" type="text" size="73" value="${qestnrInfo.qestnrSj}" maxlength="2000" style="width:300px;">
      <a href="javascript:fn_egov_QustnrManageListPopup_QustnrQestnManage()">
      <img src="${ImgUrl}img/search2.gif" align="absmiddle" style="border:0px" alt="설문지정보" title="설문지정보">
      </a>
      <input name="qestnrTmplatId" id="qestnrTmplatId" type="hidden" value="${qustnrQestnManageVO.qestnrTmplatId}">
      <input name="qestnrId" id="qestnrId" type="hidden" value="${qustnrQestnManageVO.qestnrId}">
      <input name="searchMode" id="searchMode" type="hidden" value="${qustnrQestnManageVO.searchMode}">
    </td>
  </tr>
  <tr> 
    <th width="20%" height="23" class="required_text" nowrap>질문순번<img src="${ImgUrl}icon/required.gif" width="15" height="15"></th>
    <td width="80%" nowrap>
      <input name="qestnSn" id="qestnSn" type="text" size="50" value="1" maxlength="10" style="width:60px;">
      <div><form:errors path="qestnSn"/></div>
    </td>
  </tr>
  <tr> 
    <th width="20%" height="23" class="required_text" nowrap >질문유형<img src="${ImgUrl}icon/required.gif" width="15" height="15"></th>
    <td width="80%" nowrap>

<select name="qestnTyCode">
	<option value="">선택</option>
	<c:forEach items="${cmmCode018}" var="comCodeList" varStatus="status">
		<option value="${comCodeList.code}">${comCodeList.codeNm}</option>
	</c:forEach>  
</select>

    </td>
  </tr>
  <tr> 
    <th height="23" class="required_text" >질문 내용<img src="${ImgUrl}icon/required.gif" width="15" height="15"></th>
    <td>
      <textarea name="qestnCn" id="qestnCn" class="textarea"  cols="75" rows="10"  style="width:100%;" value=""></textarea>
      <div><form:errors path="qestnCn"/></div> 
    </td>
  </tr> 
  <tr> 
    <th width="20%" height="23" class="required_text" nowrap >최대선택건수<img src="${ImgUrl}icon/required.gif" width="15" height="15"></th>
    <td width="80%" nowrap>
       <select name="mxmmChoiseCo">
       	<option value="1">1</option>
       	<option value="2">2</option>
       	<option value="3">3</option>
       	<option value="4">4</option>
       	<option value="5">5</option>
       	<option value="6">6</option>
       	<option value="7">7</option>
       	<option value="8">8</option>
       	<option value="9">9</option>
       	<option value="10">10</option>
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
  <td background="${ImgUrl}button/bu2_bg.gif" class="text_left" nowrap><a href="JavaScript:fn_egov_list_QustnrQestnManage();"><spring:message code="button.list" /></a> 
  </td>
  <td><img src="${ImgUrl}button/bu2_right.gif" width="8" height="20"></td>      
  <td>&nbsp;</td>
  <td><img src="${ImgUrl}button/bu2_left.gif" width="8" height="20"></td>
  <td background="${ImgUrl}button/bu2_bg.gif" class="text_left" nowrap><a href="JavaScript:fn_egov_save_QustnrQestnManage(document.forms[0]);"><spring:message code="button.save" /></a> 
  </td>
  <td><img src="${ImgUrl}button/bu2_right.gif" width="8" height="20"></td>      
</tr>
</table>
</center>

<input name="cmd" type="hidden" value="<c:out value='save'/>"/>
</form>
</DIV>

</body>
</html>