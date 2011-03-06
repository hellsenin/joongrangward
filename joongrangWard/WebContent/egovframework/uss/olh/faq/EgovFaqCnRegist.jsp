<%
 /**
  * @Class Name : EgovFaqCnRegist.jsp
  * @Description : EgovFaqCnRegist 화면
  * @Modification Information
  * @
  * @  수정일             수정자                   수정내용
  * @ -------    --------    ---------------------------
  * @ 2009.02.01   박정규              최초 생성
  *
  *  @author 공통서비스팀 
  *  @since 2009.02.01
  *  @version 1.0
  *  @see
  *  
  *  Copyright (C) 2009 by MOPAS  All right reserved.
  */
%>

<%@ page contentType="text/html; charset=utf-8"%>
<%@ page import="java.util.Date"  %>
<%@ taglib prefix="c"   uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"  %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="validator" uri="http://www.springmodules.org/tags/commons-validator" %>

<html>
<head>
<title>FAQ 등록</title>
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<link type="text/css" rel="stylesheet" href="/css/egovframework/uss/olh/faq/com.css" />
<script type="text/javascript" src="<c:url value='/js/egovframework/cmm/fms/EgovMultiFile.js'/>" ></script>

<script type="text/javascript" src="<c:url value="/validator.do"/>"></script>
<validator:javascript formName="faqManageVO" staticJavascript="false" xhtml="true" cdata="false"/>

<script type="text/javaScript" language="javascript">

/* ********************************************************
 * 초기화
 ******************************************************** */
function fn_egov_initl_faqcn(){

	// 첫 입력란에 포커스..
	faqManageVO.qestnSj.focus();

}

/* ********************************************************
 * 저장처리화면
 ******************************************************** */
function fn_egov_regist_faqcn(form){

	// 서버사이드 테스트용
	/*	
		form.action = "<c:url value='/uss/olh/faq/FaqCnRegist.do'/>";
		form.submit(); 
		return;
	*/

	
	if (!validateFaqManageVO(form)) {
			 			
		return;
			
	} else {

		form.action = "<c:url value='/uss/olh/faq/FaqCnRegist.do'/>";
		form.submit();
			
	} 		
		
}

/* ********************************************************
 * 목록 으로 가기
 ******************************************************** */
function fn_egov_inqire_faqcnlist() {

	faqManageVO.action = "<c:url value='/uss/olh/faq/FaqListInqire.do'/>";
	faqManageVO.submit();
		
}

</script>

</head>
<body onLoad="fn_egov_initl_faqcn();">
<DIV id="content" style="width:712px">
<!-- ------------------------------------ 상단타이틀(파일첨부를 위한 폼명 및 Enctype 설정 ---------------------------->
<form:form commandName="faqManageVO" action="" method="post" enctype="multipart/form-data"> 

<!-- ------------------------------------ 첨부파일을 위한 NAME 설정 ---------------------------->	
<input type="hidden" name="posblAtchFileNumber" value="3" />  
	  
<!-- ----------------- 상단 타이틀  영역 -->
<table width="100%" cellpadding="8" class="table-search" border="0">
 <tr>
  <td width="100%"class="title_left">
   <img src="/images/egovframework/uss/olh/faq/icon/tit_icon.gif" width="16" height="16" hspace="3" align="left">&nbsp;FAQ내용등록</td>
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
    <th width="20%" height="23" class="required_text" nowrap >질문제목<img src="/images/egovframework/uss/olh/faq/icon/required.gif" width="15" height="15"></th>
    <td width="80%" nowrap>
        <form:input path="qestnSj" size="70" maxlength="70" />
    	<div><form:errors path="qestnSj"/></div>      	  	      	      	  
    </td>
  </tr>


  <tr> 
    <th height="23" class="required_text" >질문내용<img src="/images/egovframework/uss/olh/faq/icon/required.gif" width="15" height="15"></th>
    <td> 
      <form:textarea path="qestnCn" cols="300" rows="15" cssClass="txaClass" />   
      <div><form:errors path="qestnCn"/></div>                                                                       
    </td>
  </tr> 

  <tr> 
    <th height="23" class="required_text" >답변내용<img src="/images/egovframework/uss/olh/faq/icon/required.gif" width="15" height="15"></th>
    <td> 
      <form:textarea path="answerCn" cols="300" rows="15" cssClass="txaClass" />   
      <div><form:errors path="answerCn"/></div>                                                                       
    </td>
  </tr> 


<!-------------------- 첨부파일 테이블 레이아웃 설정 Start..-------------------------------------------->
  <tr>
	<th height="23">파일첨부</th>
	<td>
    	<table width="580px" cellspacing="0" cellpadding="0" border="0" align="center" class="UseTable">
			<tr>
				<td><input name="file_1" id="egovComFileUploader" type="file"  /></td>
			</tr>
			<tr>
				<td>
			    	<div id="egovComFileList"></div>
			    </td>
			</tr>
   	    </table>		      
	 </td>
  </tr>
<!-------------------- 첨부파일 테이블 레이아웃 End.--------------------------------------------------->
     

   
</table>

<!-------------------- 첨부파일 업로드 가능화일 설정 Start..-------------------------------------------->  
<script type="text/javascript">
var maxFileNum = document.getElementById('posblAtchFileNumber').value;
   
   if(maxFileNum==null || maxFileNum==""){
	   
     maxFileNum = 3;
     
    }
        
   var multi_selector = new MultiSelector( document.getElementById( 'egovComFileList' ), maxFileNum );
   
   multi_selector.addElement( document.getElementById( 'egovComFileUploader' ) );
   			
</script> 
<!-------------------- 첨부파일 업로드 가능화일 설정 End.----------------------------------------------->
  
<!-- ------------------------------------------------------------------ 줄간격조정  -->
<table width="100%" cellspacing="0" cellpadding="0" border="0">
<tr>
	<td height="5px"></td>
</tr>
</table>

<!-- ------------------------------------------------------------------ 목록/저장버튼  -->
<table border="0" cellspacing="0" cellpadding="0" align="center">
<tr> 
  <td><img src="/images/egovframework/uss/olh/faq/button/bu2_left.gif" width="8" height="20"></td>
  <td background="/images/egovframework/uss/olh/faq/button/bu2_bg.gif" class="text_left" nowrap>
  		<a href="javascript:fn_egov_inqire_faqcnlist();">목록</a> 
  </td>
  <td><img src="/images/egovframework/uss/olh/faq/button/bu2_right.gif" width="8" height="20"></td>      
  <td>&nbsp;</td>
  <td><img src="/images/egovframework/uss/olh/faq/button/bu2_left.gif" width="8" height="20"></td>
  <td background="/images/egovframework/uss/olh/faq/button/bu2_bg.gif" class="text_left" nowrap>
  		<a href="JavaScript:fn_egov_regist_faqcn(document.forms[0]);">저장</a> 
  </td>
  <td><img src="/images/egovframework/uss/olh/faq/button/bu2_right.gif" width="8" height="20"></td>      
</tr>
</table>
    
</form:form>
</DIV>

</body>
</html>