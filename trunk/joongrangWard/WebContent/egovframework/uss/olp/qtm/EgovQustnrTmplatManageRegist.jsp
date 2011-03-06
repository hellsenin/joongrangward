<%--
  Class Name : EgovQustnrTmplatManageRegist.jsp
  Description : 설문템플릿 등록 페이지
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
<c:set var="ImgUrl" value="/images/egovframework/uss/olp/qtm/"/>
<c:set var="CssUrl" value="/css/egovframework/uss/olp/qtm/"/>
<html>
<head>
<title>회의정보 관리</title>
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<link type="text/css" rel="stylesheet" href="${CssUrl}com.css" />
<script type="text/javascript" src="<c:url value="/validator.do"/>"></script>
<validator:javascript formName="qustnrTmplatManageVO" staticJavascript="false" xhtml="true" cdata="false"/>
<script type="text/javaScript" language="javascript">


/* ********************************************************
 * 초기화
 ******************************************************** */
function fn_egov_init_QustnrTmplatManage(){

}
/* ********************************************************
 * 목록 으로 가기
 ******************************************************** */
function fn_egov_list_QustnrTmplatManage(){
	location.href = "/uss/olp/qtm/EgovQustnrTmplatManageList.do";
}
/* ********************************************************
 * 저장처리화면
 ******************************************************** */
function fn_egov_save_QustnrTmplatManage(form){
	if(confirm("<spring:message code="common.save.msg" />")){
		if(!validateQustnrTmplatManageVO(form)){ 			
			return;
		}else{

			if(form.qestnrTmplatImagepathnm.value == ""){
			 	alert("템플릿유형 이미지를 선택해주세요!");
				form.focus();
				return;
			}
			
			form.submit();
		}
	}
}
/* ********************************************************
 * 선택이미지 미리보기
 ******************************************************** */
function fnImgChange(obj){

	if(obj.value != "") {
		if(obj.value.search(/(gif)/)!=-1 || obj.value.search(/(jpg)/)!=-1 || obj.value.search(/(bmp)/)!=-1 || obj.value.search(/(GIF)/)!=-1 || obj.value.search(/(JPG)/)!=-1 ){
			document.getElementById("DIV_IMG_VIEW").style.display = "";
			document.getElementById("IMG_VIEW").src = obj.value;
		}else{
		   alert('GIF/JPG 형식의 이미지만 업로드 가능합니다!');
		   obj.select();
		   document.execCommand('Delete');
		   obj.focus();
		   return;
	 	}
	}{return;}
	
}
</script>
</head>
<body onLoad="fn_egov_init_QustnrTmplatManage();">
<DIV id="content" style="width:712px">
<!-- ------------------------------------------------------------------ 상단타이틀 -->
<form:form commandName="qustnrTmplatManageVO"  name="qustnrTmplatManageVO" action="/uss/olp/qtm/EgovQustnrTmplatManageRegistActor.do" method="post" enctype="multipart/form-data">
<!-- ----------------- 상단 타이틀  영역 -->
<table width="100%" cellpadding="8" class="table-search" border="0">
 <tr>
  <td width="100%"class="title_left">
   <img src="${ImgUrl}icon/tit_icon.gif" width="16" height="16" hspace="3" align="absmiddle">&nbsp;설문템플릿 등록</td>
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
    <th height="23" class="required_text" >템플릿유형<img src="${ImgUrl}icon/required.gif" width="15" height="15"></th>
    <td>
     <form:input path="qestnrTmplatTy" size="70" cssClass="txaIpt" maxlength="100" />
      <div><form:errors path="qestnrTmplatTy"/></div>
    </td>
  </tr> 
  
  <tr> 
    <th width="20%" height="23" class="required_text" nowrap >템플릿유형&nbsp;&nbsp;&nbsp;<br>이미지<img src="${ImgUrl}icon/required.gif" width="15" height="15"></th>
    <td width="80%" nowrap>
    	<table cellspacing="0" cellpadding="0" border="0">
    	<tr>
    	<td><input type="file" id="qestnrTmplatImagepathnm" name="qestnrTmplatImagepathnm" onChange="fnImgChange(this)"></td>
    	<td>
	     	<div id="DIV_IMG_VIEW" style="display:none;">
	     	<img src="" name="IMG_VIEW" align="absmiddle" onLoad="if(this.width>65){this.width=65}">
	     	</div>
	     </td>
	     </tr>
	     <tr>
	     	<td colspan="2"><font color="red">가로:65px 세로:50px 포멧:GIF/JPG 형식으로로 업로드 해주세요</font></td>
	     </tr>
	     </table>
    </td>
  </tr>
  
  <tr> 
    <th width="20%" height="23" class="required_text" nowrap >템플릿설명<img src="${ImgUrl}icon/required.gif" width="15" height="15"></th>
    <td width="80%" nowrap>
    	<form:textarea path="qestnrTmplatCn" rows="8" cols="75" cssClass="txaClass"/>
    	<div><form:errors path="qestnrTmplatCn"/></div>
    </td>
  </tr>
  <tr> 
    <th width="20%" height="23" class="required_text" nowrap >템플릿파일(경로)<img src="${ImgUrl}icon/required.gif" width="15" height="15"></th>
    <td width="80%" nowrap>
      <form:input path="qestnrTmplatCours" size="73" cssClass="txaIpt" maxlength="100"/>
      <div><form:errors path="qestnrTmplatCours"/></div>
    </td>
  </tr>
</table>

<!-- ------------------------------------------------------------------ 줄간격조정  -->
<table width="100%" cellspacing="0" cellpadding="0" border="0">
<tr>
	<td height="3px"></td>
</tr>
</table>
<!-- ------------------------------------------------------------------ 목록/저장버튼  -->
<center>
<table border="0" cellspacing="0" cellpadding="0" align="center">
<tr> 
  <td><img src="${ImgUrl}button/bu2_left.gif" width="8" height="20"></td>
  <td background="${ImgUrl}button/bu2_bg.gif" class="text_left" nowrap><a href="JavaScript:fn_egov_list_QustnrTmplatManage();"><spring:message code="button.list" /></a> 
  </td>
  <td><img src="${ImgUrl}button/bu2_right.gif" width="8" height="20"></td>      
  <td>&nbsp;</td>
  <td><img src="${ImgUrl}button/bu2_left.gif" width="8" height="20"></td>
  <td background="${ImgUrl}button/bu2_bg.gif" class="text_left" nowrap><a href="JavaScript:fn_egov_save_QustnrTmplatManage(document.forms[0]);"><spring:message code="button.save" /></a> 
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