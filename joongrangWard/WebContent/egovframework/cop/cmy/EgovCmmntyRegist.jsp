<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="validator" uri="http://www.springmodules.org/tags/commons-validator" %>
<% 
 /**
  * @Class Name : EgovCmmntyRegist.jsp
  * @Description : 커뮤니티 속성 등록화면
  * @Modification Information
  * @
  * @  수정일      수정자            수정내용
  * @ -------        --------    ---------------------------
  * @ 2009.04.02   이삼섭          최초 생성
  *
  *  @author 공통서비스 개발팀 이삼섭
  *  @since 2009.04.02
  *  @version 1.0 
  *  @see
  *  
  *  Copyright (C) 2009 by MOPAS  All right reserved.
  */
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/1999/REC-html401-19991224/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<link href="<c:url value='/css/egovframework/cop/cmy/com.css' />" rel="stylesheet" type="text/css">
<script type="text/javascript" src="<c:url value="/validator.do"/>"></script>
<validator:javascript formName="community" staticJavascript="false" xhtml="true" cdata="false"/>
<script type="text/javascript">
	function fn_egov_regist_cmmnty(){
		if (!validateCommunity(document.community)){
			return;
		}
		
		if (confirm('<spring:message code="common.regist.msg" />')) {
			document.community.action = "<c:url value='/cop/cmy/insertCmmntyInf.do'/>";
			document.community.submit();
		}
	}
	
	function fn_egov_select_cmmntyInfs(){
		document.community.action = "<c:url value='/cop/cmy/selectCmmntyInfs.do'/>";
		document.community.submit();
	}
	
	function fn_egov_inqire_tmplat(){
		var retVal;
		var url = "<c:url value='/cop/com/openPopup.do?requestUrl=/cop/com/selectTemplateInfsPop.do&typeFlag=CMY&width=850&height=360'/>";		
		var openParam = "dialogWidth: 850px; dialogHeight: 360px; resizable: 0, scroll: 1, center: 1";
		 
		retVal = window.showModalDialog(url,"p_tmplatInqire", openParam);
		if(retVal != null){
			var tmp = retVal.split("|");
			document.community.tmplatId.value = tmp[0];
			document.community.tmplatNm.value = tmp[1];
		}
	}
	
	function fn_egov_inqire_user(){
		var retVal;
		var url = "<c:url value='/cop/com/openPopup.do?requestUrl=/cop/com/selectUserList.do&width=850&height=360'/>";
		var openParam = "dialogWidth: 850px; dialogHeight: 360px; resizable: 0, scroll: 1, center: 1";

		retVal = window.showModalDialog(url,"p_userInqire", openParam);		

		if(retVal != null){
			var tmp = retVal.split("|");
			document.community.emplyrId.value = tmp[0];
			document.community.emplyrNm.value = tmp[1];
		}		
	}	
</script>
<title>커뮤니티 생성</title>
</head>
<body>
<form:form commandName="community" name="community" method="post" >
<input name="pageIndex" type="hidden" value="<c:out value='${searchVO.pageIndex}'/>"/>

<div id="border" style="width:730px">

	<table width="100%" cellpadding="8" class="table-search" border="0">
	 <tr>
	  <td width="100%"class="title_left">
	   <img src="<c:url value='/images/egovframework/cop/cmy/icon/tit_icon.gif' />" width="16" height="16" hspace="3" align="absmiddle" alt="title icon">
	   &nbsp;커뮤니티 생성</td>
	 </tr>
	</table>
	<table width="100%" border="0" cellpadding="0" cellspacing="1" class="table-register">
	  <tr> 
	    <th width="20%" height="23" class="required_text" nowrap >커뮤니티명
	    <img src="<c:url value='/images/egovframework/cop/cmy/icon/required.gif' />" width="15" height="15" alt="required"></th>
	    <td width="80%" nowrap colspan="3">
	      <input name="cmmntyNm" type="text" size="60" value="" maxlength="60" style="width:100%"> 
	      <br/><form:errors path="cmmntyNm" />
	    </td>
	  </tr>
	  <tr> 
	    <th height="23" class="required_text" >커뮤니티 소개
	    <img src="<c:url value='/images/egovframework/cop/cmy/icon/required.gif' />" width="15" height="15" alt="required"></th>
	    <td colspan="3">
	      <textarea name="cmmntyIntrcn" class="textarea"  cols="75" rows="4"  style="width:100%"" value=""></textarea>
	      <form:errors path="cmmntyIntrcn" />	 
	    </td>
	  </tr>
	  <tr> 
	    <th width="20%" height="23" class="required_text" nowrap >템플릿 정보
	    <img src="<c:url value='/images/egovframework/cop/cmy/icon/required.gif' />" width="15" height="15" alt="required"></th>
	    <td width="30%" nowrap colspan="3">
	     <input name="tmplatId" type="hidden" value="" >
	     <input name="tmplatNm" type="text" size="20" value=""  maxlength="20" readonly >
	     &nbsp;<a href="javascript:fn_egov_inqire_tmplat();" style="selector-dummy: expression(this.hideFocus=false);"><img src="<c:url value='/images/egovframework/cop/bbs/icon/search.gif' />"
	     			width="15" height="15" align="absmiddle" alt="search"></a>
		<br/><form:errors path="tmplatId" />	     			
	    </td>
	  </tr>         
	  <tr> 
	    <th width="20%" height="23" class="required_text" nowrap >커뮤니티 관리자
	    <img src="<c:url value='/images/egovframework/cop/cmy/icon/required.gif' />" width="15" height="15"></th>
	    <td width="30%" nowrap colspan="3">
	     <input name="emplyrId" type="hidden" value="" >
	     <input name="emplyrNm" type="text" size="20" value=""  maxlength="20" readonly >
	     &nbsp;<a href="javascript:javascript:fn_egov_inqire_user()" style="selector-dummy: expression(this.hideFocus=false);"><img src="<c:url value='/images/egovframework/cop/bbs/icon/search.gif' />"
	     			width="15" height="15" align="absmiddle" alt="search"></a>
		<br/><form:errors path="emplyrId" />
	    </td>
	  </tr>   
	</table>
	<table width="100%" border="0" cellspacing="0" cellpadding="0">
	  <tr> 
	    <td height="10"></td>
	  </tr>
	</table>
	<div align="center">
	<table border="0" cellspacing="0" cellpadding="0" align="center">
	<tr> 
      <td><img src="<c:url value='/images/egovframework/cop/cmy/btn/bu2_left.gif'/>" width="8" height="20" alt="button left"></td>
      <td background="<c:url value='/images/egovframework/cop/cmy/btn/bu2_bg.gif'/>" class="text_left" nowrap>
      <a href="javascript:fn_egov_regist_cmmnty();"><spring:message code="button.create" /></a> 
      </td>
      <td><img src="<c:url value='/images/egovframework/cop/cmy/btn/bu2_right.gif'/>" width="8" height="20" alt="button right"></td> 
      <td width="10"></td>
      <td><img src="<c:url value='/images/egovframework/cop/cmy/btn/bu2_left.gif'/>" width="8" height="20" alt="button left"></td>
      <td background="<c:url value='/images/egovframework/cop/cmy/btn/bu2_bg.gif'/>" class="text_left" nowrap>
      <a href="javascript:fn_egov_select_cmmntyInfs();"><spring:message code="button.list" /></a> 
      </td>
      <td><img src="<c:url value='/images/egovframework/cop/cmy/btn/bu2_right.gif'/>" width="8" height="20" alt="button right"></td>           
	</tr>
	</table>
	</div>
</div>
</form:form>
</body>
</html>