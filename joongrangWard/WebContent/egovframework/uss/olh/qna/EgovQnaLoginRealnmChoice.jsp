<%
 /**
  * @Class Name : EgovLoginRealnmConfirm.jsp
  * @Description : EgovLoginRealnmConfirm 화면
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
<%@ taglib prefix="c"   uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"  %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<html>
<head>
<title>로그인 Or 실명확인</title>
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<link type="text/css" rel="stylesheet" href="/css/egovframework/uss/olp/cns/com.css" />
<script type="text/javaScript" language="javascript">

/* ********************************************************
 * 초기화
 ******************************************************** */
function fn_egov_initl_loginrealnm(){


}

/* ********************************************************
 * 로그인 처리
 ******************************************************** */
function fn_egov_confirm_login(){

	fn_egov_confirm_callback("L");
					
}

/* ********************************************************
 * 실명확인처리
 ******************************************************** */
function fn_egov_confirm_realname() {

	fn_egov_confirm_callback("R");
	
/*	
	var url 	= "<c:url value='/uss/umt/cmm/EgovRlnmCnfirm.do?nextUrlName=Q&A&nextUrl=/uss/olp/cns/CnsltDtlsRegistView.do'/>";
	
	var	status 	= "dialogWidth=740px;dialogHeight=180px;resizable=no;center=yes";

		
	var returnValue = window.showModalDialog(url, self, status);

	returnValue = false;
		

	if	(returnValue)	{

	 	document.LoginRealnmForm.action = "<c:url value='/uss/olp/cns/CnsltDtlsRegistView.do'/>";
	 	document.LoginRealnmForm.submit();	
	 		 				
	}

	window.close();
*/
	
						
}

/* ********************************************************
 * 결과값 리턴
 ******************************************************** */
function fn_egov_confirm_callback(ls_loginRealnmAt){

	
	var opener = window.dialogArguments;
	
	// 부모화면으로 로그인이지 실명인지 넘긴다.
	opener.document.QnaListForm.loginRealnmAt.value = ls_loginRealnmAt;	
	
	// 부모화면으로 결과값을 True 넘긴다.
	window.returnValue = true;	
	window.close();	
	
		
}


/* ********************************************************
 * 취소처리
 ******************************************************** */
function fn_egov_cancel_loginrealnm() {
	
	self.close();
			
}


</script>

</head>
<body onLoad="fn_egov_initl_loginrealnm();">
<DIV id="content" style="width:270px">
<!-- ------------------------------------------------------------------ 상단타이틀 -->
<form name="LoginRealnmForm"  method="post" >


	 	  
<!-- ----------------- 상단 타이틀  영역 -->
<table width="100%" cellpadding="8" class="table-search" border="0">
 <tr>
  <td width="100%"class="title_left">
   <img src="/images/egovframework/uss/olp/cns/icon/tit_icon.gif" width="16" height="16" hspace="3" align="absmiddle">&nbsp;로그인 & 실명확인 선택</td>
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
    <th width="100%" height="23" class="required_text" nowrap >로그인 혹은 실명확인을 선택하시기 바랍니다...</th>
  </tr>
      
</table>
<!-- ------------------------------------------------------------------ 줄간격조정  -->
<table width="100%" cellspacing="0" cellpadding="0" border="0">
<tr>
	<td height="10px"></td>
</tr>
</table>

<!-- ------------------------------------------------------------------ 로그인/실명확인 버튼  -->
<table border="0" cellspacing="0" cellpadding="0" align="center">
<tr> 
  <td><img src="/images/egovframework/uss/olp/cns/button/bu2_left.gif" width="8" height="20"></td>
  <td background="/images/egovframework/uss/olp/cns/button/bu2_bg.gif" class="text_left" nowrap>
  		<a href="javascript:fn_egov_confirm_login();">로그인</a> 
  </td>
  <td><img src="/images/egovframework/uss/olp/cns/button/bu2_right.gif" width="8" height="20"></td>      
  <td>&nbsp;&nbsp;</td>
  <td><img src="/images/egovframework/uss/olp/cns/button/bu2_left.gif" width="8" height="20"></td>
  <td background="/images/egovframework/uss/olp/cns/button/bu2_bg.gif" class="text_left" nowrap>
  		<a href="JavaScript:fn_egov_confirm_realname();">실명확인</a> 
  </td>
  <td><img src="/images/egovframework/uss/olp/cns/button/bu2_right.gif" width="8" height="20"></td>
  
  <td>&nbsp;&nbsp;&nbsp;</td>
  <td><img src="/images/egovframework/uss/olh/qna/button/bu2_left.gif" width="8" height="20"></td>
  <td background="/images/egovframework/uss/olh/qna/button/bu2_bg.gif" class="text_left" nowrap>
  		<a href="JavaScript:fn_egov_cancel_loginrealnm();">취소</a> 
  </td>
  <td><img src="/images/egovframework/uss/olh/qna/button/bu2_right.gif" width="8" height="20"></td>      
        
</tr>
</table>

</form>
</DIV>

</body>
</html>