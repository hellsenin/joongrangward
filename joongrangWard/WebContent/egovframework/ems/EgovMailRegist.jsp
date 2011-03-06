<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="validator" uri="http://www.springmodules.org/tags/commons-validator" %>
<%--
 /**
  * @Class Name : EgovMailRegist.jsp
  * @Description : 발송메일 등록 화면
  * @Modification Information
  * @
  * @  수정일         수정자                   수정내용
  * @ -------    --------    ---------------------------
  * @ 2009.03.11    박지욱          최초 생성
  *
  *  @author 공통서비스 개발팀 박지욱
  *  @since 2009.03.11
  *  @version 1.0
  *  @see
  *  
  *  Copyright (C) 2009 by MOPAS  All right reserved.
  */
--%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link rel="stylesheet" href="/css/egovframework/ems/com.css" type="text/css">
<title>MOPAS 발송메일 등록</title>
<!-- <script type="text/javascript" src="<c:url value='/js/egovframework/cmm/utl/EgovWebEditor.js'/>"></script>-->
<script type="text/javascript">
_editor_area = "emailCn";
</script>
<script type="text/javascript" src="<c:url value='/html/egovframework/cmm/utl/htmlarea3.0/htmlarea.js'/>"></script>
<script type="text/javascript" src="<c:url value='/js/egovframework/cmm/fms/EgovMultiFile.js'/>"></script>
<script type="text/javascript" src="<c:url value="/validator.do"/>"></script>
<validator:javascript formName="sndngMailVO" staticJavascript="false" xhtml="true" cdata="false"/>

<script type="text/javaScript" language="javascript">
/* ********************************************************
 * 등록 처리 함수
 ******************************************************** */
function insertSndngMail(form) {

	document.sndngMailVO.onsubmit();
	if(confirm('<spring:message code="common.save.msg" />')){
		if(!validateSndngMailVO(form)){ 		
			return;
		}else{
			form.action = "<c:url value='/ems/insertSndngMail.action'/>";
			form.submit();
		}
	}
}
/* ********************************************************
 * 뒤로 처리 함수
 ******************************************************** */
function fnBack(){
	document.sndngMailVO.action = "<c:url value='/ems/backSndngMailRegist.do'/>";
	document.sndngMailVO.submit();
}
/* ********************************************************
 * 초기화
 ******************************************************** */
function fnInit(){
	var closeYn = document.sndngMailVO.closeYn.value;
	if (closeYn == "Y") {
		window.close();
	}
	HTMLArea.init(); 
	HTMLArea.onload = initEditor;
	document.sndngMailVO.recptnPerson.focus();
}
</script>
</head>
<body onLoad="fnInit();">
  <form:form name="sndngMailVO" method="post" enctype="multipart/form-data">
  	  <input type="hidden" name="posblAtchFileNumber" value="10" />
  	  <input type="hidden" name="link" value="${resultInfo.link}" />
  	  <input type="hidden" name="closeYn" value="${closeYn}" />
	  <table width="700">
	    <tr>
	      <td>
			<table width="700" cellpadding="8" class="table-search" border="0">
			 <tr>
			  <td width="700"class="title_left">
			   <img src="/images/egovframework/ems/tit_icon.gif" width="16" height="16" hspace="3" align="absmiddle">&nbsp;발송메일 등록</td>
			 </tr>
			</table>
		  </td>
		</tr>  	
		<tr>
		  <td>	
			<table width="700" border="0" cellpadding="0" cellspacing="1" class="table-register">
			  <tr> 
			    <th width="100" height="23" class="required_text" nowrap >받는사람<img src="/images/egovframework/ems/required.gif" width="15" height="15"></th>
			    <td width="600" nowrap>
			      <input name="recptnPerson" type="text" size="74" value="${resultInfo.recptnPerson}"  maxlength="60" style="ime-mode: disabled;" tabindex="1"> 
			    </td>
			  </tr>
			  <tr> 
			    <th width="100" height="23" class="required_text" nowrap >제목<img src="/images/egovframework/ems/required.gif" width="15" height="15"></th>
			    <td width="600" nowrap>
			      <input name="sj" type="text" size="74" value="${resultInfo.sj}"  maxlength="250" tabindex="2"> 
			    </td>
			  </tr>
			  <tr> 
			    <th width="100" height="23" class="required_text">파일첨부&nbsp;&nbsp;&nbsp;</th>
			    <td width="600">
			      <table width="600" cellspacing="0" cellpadding="0" border="0" align="center" class="UseTable">
				    <tr>
				      <td width="600"><input name="file_1" id="egovComFileUploader" type="file" tabindex="3"/></td>
				    </tr>
				    <tr>
				      <td width="600">
				        <div id="egovComFileList"></div>
				      </td>
				    </tr>
				  </table>
			    </td>
			  </tr>
			  <script type="text/javascript">
				   var maxFileNum = document.sndngMailVO.posblAtchFileNumber.value;
				   if(maxFileNum==null || maxFileNum==""){
				       maxFileNum = 3;
				   }  
				   var multi_selector = new MultiSelector( document.getElementById( 'egovComFileList' ), maxFileNum );
				   multi_selector.addElement( document.getElementById( 'egovComFileUploader' ) );	
			  </script> 
			  <tr> 
			    <th width="100" height="23" class="required_text" >발신 내용&nbsp;&nbsp;&nbsp;</th>
			    <td width="600">
			      <textarea id="emailCn" name="emailCn" cols="75" rows="25" tabindex="4">
			      </textarea> 
			    </td>
			  </tr> 
			</table>
		  </td>
		</tr>
		<tr>
		  <td>
			<table border="0" cellspacing="0" cellpadding="0" align="right">
			  <tr> 
			    <td><img src="/images/egovframework/ems/bu2_left.gif" width="8" height="20"></td>
			    <td background="/images/egovframework/ems/bu2_bg.gif" class="text_left" nowrap><a href="javascript:fnBack();">뒤로</a> 
			    </td>
			    <td><img src="/images/egovframework/ems/bu2_right.gif" width="8" height="20"></td>    
			    <td>&nbsp;&nbsp;</td>
			    <td><img src="/images/egovframework/ems/bu2_left.gif" width="8" height="20"></td>
			    <td background="/images/egovframework/ems/bu2_bg.gif" class="text_left" nowrap><a href="javascript:insertSndngMail(document.sndngMailVO);">등록</a> 
			    </td>
			    <td><img src="/images/egovframework/ems/bu2_right.gif" width="8" height="20"></td>      
			  </tr>
			</table>
		  </td>
		</tr>
	  </table>
  </form:form>	 
</body>	  
</html>


