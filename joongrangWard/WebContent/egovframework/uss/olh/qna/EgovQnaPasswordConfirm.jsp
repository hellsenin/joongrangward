<%
 /**
  * @Class Name : EgovQnaPasswordConfirm.jsp
  * @Description : EgovQnaPasswordConfirm 화면
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
<base target="_self" />
<title>작성비밀번호 확인</title>
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<link type="text/css" rel="stylesheet" href="/css/egovframework/uss/olh/qna/com.css" />
<script type="text/javaScript" language="javascript">

/* ********************************************************
 * 초기화
 ******************************************************** */
function fn_egov_initl_qnacn(){

	// 작성글 비밀번호 입력란에 포커스..
	document.QnaManageForm.writngPassword.focus();

}

/* ********************************************************
 * 확인처리
 ******************************************************** */
function fn_egov_confirm_qnapassword(){

	var opener = window.dialogArguments;

	//  현재화면의 작성 비밀번호
	var	ls_writngPassword = document.QnaManageForm.writngPassword.value;
	
	// 부모화면으로 작성비밀번호를 넘긴다.
	opener.document.QnaManageForm.writngPassword.value = ls_writngPassword;	
	
	// 부모화면으로 결과값을 True 넘긴다.
	window.returnValue = true;	
	window.close();	

		
}

/* ********************************************************
 * 취소처리
 ******************************************************** */
function fn_egov_cancel_qnapassword() {
	
	self.close();
			
}

</script>

</head>
<body onLoad="fn_egov_initl_qnacn();">
<DIV id="content" style="width:270px">
<!-- ------------------------------------------------------------------ 상단타이틀 -->
<form name="QnaManageForm" method="post" onsubmit="fn_egov_confirm_qnapassword();">  

<!-- ------------------------------------ 작성 비밀번호를 확인하기 위한. ---------------------------->
	  	  
<!-- ----------------- 상단 타이틀  영역 -->
<table width="100%" cellpadding="8" class="table-search" border="0">
 <tr>
  <td width="100%"class="title_left">
   <img src="/images/egovframework/uss/olh/qna/icon/tit_icon.gif" width="16" height="16" hspace="3" align="absmiddle">&nbsp;작성 비밀번호 확인</td>
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
    <th width="20%" height="23" class="required_text" nowrap >작성글 비밀번호
    	<img src="/images/egovframework/uss/olh/qna/icon/required.gif" width="15" height="15"></th>
    <td width="80%" nowrap>
    	<input name="writngPassword" type="password" size="20" value="" maxlength="20" >  
    </td>
  </tr>
      
</table>

<!-- ------------------------------------------------------------------ 줄간격조정  -->
<table width="100%" cellspacing="0" cellpadding="0" border="0">
<tr>
	<td height="10px"></td>
</tr>
</table>

<!-- ------------------------------------------------------------------ 확인/취소버튼  -->
<table border="0" cellspacing="0" cellpadding="0" align="center">
<tr> 
  <td><img src="/images/egovframework/uss/olh/qna/button/bu2_left.gif" width="8" height="20"></td>
  <td background="/images/egovframework/uss/olh/qna/button/bu2_bg.gif" class="text_left" nowrap>
  		<a href="javascript:fn_egov_confirm_qnapassword();">확인</a> 
  </td>
  <td><img src="/images/egovframework/uss/olh/qna/button/bu2_right.gif" width="8" height="20"></td>      
  <td>&nbsp;</td>  
  <td><img src="/images/egovframework/uss/olh/qna/button/bu2_left.gif" width="8" height="20"></td>
  <td background="/images/egovframework/uss/olh/qna/button/bu2_bg.gif" class="text_left" nowrap>
  		<a href="JavaScript:fn_egov_cancel_qnapassword();">취소</a> 
  </td>
  <td><img src="/images/egovframework/uss/olh/qna/button/bu2_right.gif" width="8" height="20"></td>      
</tr>
</table>

</form>
</DIV>

</body>
</html>