<%
 /**
  * @Class Name : EgovSiteInfoRegist.jsp
  * @Description : EgovSiteInfoRegist 화면
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
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="validator" uri="http://www.springmodules.org/tags/commons-validator" %>


<html>
<head>
<title>추천사이트등록</title>
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<link type="text/css" rel="stylesheet" href="/css/egovframework/uss/ion/rec/com.css" />
<script type="text/javascript" src="/js/egovframework/uss/ion/rec/EgovRecomendSite.js"></script>
<script type="text/javascript" src="<c:url value='/js/egovframework/cmm/sym/cal/EgovCalPopup.js' />" ></script>

<script type="text/javascript" src="<c:url value="/validator.do"/>"></script>
<validator:javascript formName="recomendSiteManageVO" staticJavascript="false" xhtml="true" cdata="false"/>

<script type="text/javaScript" language="javascript">

/* ********************************************************
 * 초기화
 ******************************************************** */
function fn_egov_initl_recomendsiteinfo(){

	// 첫 입력란에 포커스..
	recomendSiteManageVO.recomendSiteNm.focus();

	// 게시일자에 현재날짜 세팅  	
	recomendSiteManageVO.confmDe.value = fn_egov_getToday();
	
	document.getElementsByName('recomendConfmAt')[0].checked = true;

}

	
/* ********************************************************
 * 저장처리화면
 ******************************************************** */
function fn_egov_regist_recomendsiteinfo(form){

	// 서버사이드 테스트용
	/*	
		form.action = "<c:url value='/uss/ion/rec/RecomendSiteInfoRegist.do'/>";
		form.submit(); 
		return;
	*/
	
	if (form.confmDe.value != "")	{
		var ls_confmDe = form.confmDe.value;		
		ls_confmDe = fn_egov_remove_string(ls_confmDe,"-");
		form.confmDe.value = ls_confmDe;
	}
	
	if (!validateRecomendSiteManageVO(form)) {
				
		return;
			
	} else {

		if (document.getElementsByName('recomendConfmAt')[0].checked == true 
			&& recomendSiteManageVO.confmDe.value == "") {	
			alert("<spring:message code="common.isConfmDe.msg" />");
			return;
		}
										
		form.action = "<c:url value='/uss/ion/rec/RecomendSiteRegist.do'/>";
		form.submit();
			
	} 
	
}

/* ********************************************************
 * 목록 으로 가기
 ******************************************************** */
function fn_egov_inqire_recomendsitelist() {

	recomendSiteManageVO.action = "<c:url value='/uss/ion/rec/RecomendSiteListInqire.do'/>";
	recomendSiteManageVO.submit();

		
}

/* ********************************************************
 * 현재날짜 가져오기
 ******************************************************** */
function fn_egov_getToday(){

	var today = new	Date(); 
	var currentYear  = today.getYear();
	var currentMonth = (today.getMonth()+1).toString();				
	var currentDay = today.getDate().toString();
	
	var	currentToday = currentYear + "-" + fn_egov_getLpad(2,currentMonth) + "-" + fn_egov_getLpad(2,currentDay);

	return	currentToday;
}

/* ********************************************************
 * LPAD 처리
 ******************************************************** */
function fn_egov_getLpad(rtnSize, sourceStr)
{
    rtnStr = sourceStr;
    
    for( i= sourceStr.length; i<parseInt(rtnSize); i++) 
        rtnStr =  "0" + rtnStr;
    
    return rtnStr;
}

/* ********************************************************
 * 입력받은문자열중에서 제거 문자열을 제외 문자열을 리턴한다.
 ******************************************************** */
function fn_egov_remove_string(srcStr, cndStr) {
	
    var	result = null;
	var rtnStr = null;
    
    for (var i = 0; i < srcStr.length; i++) {
    	
        if (srcStr.charAt(i) == cndStr) {
            result = srcStr.substring(0, i);
            
            // 첫번째 제거 문자열을 제외한 전체 문자열
            srcStr = result + srcStr.substring(i+1, srcStr.length);
            
            // 최종변환 문자열
            rtnStr = srcStr;
        }
    }
    
    return rtnStr;
}

/* ********************************************************
 * 승인 클릭 시...
 ******************************************************** */
function fn_egov_recomendConfirm() {
	
	// 승인일자에 널 처리..  		
	recomendSiteManageVO.calendarImg.disabled = false;
	    
}

/* ********************************************************
 * 미승인 클릭 시...
 ******************************************************** */
function fn_egov_recomendCancel() {
	
	// 승인일자에 널 처리..  	
	recomendSiteManageVO.confmDe.value = "";
	recomendSiteManageVO.calendarImg.disabled = true;
	
	    
}

</script>

</head>
<body onLoad="fn_egov_initl_recomendsiteinfo();">
<DIV id="content" style="width:700px">
<!-- ------------------------------------------------------------------ 상단타이틀 -->
<form:form commandName="recomendSiteManageVO" action="" method="post"> 

	  
<!-- ----------------- 상단 타이틀  영역 -->
<table width="100%" cellpadding="8" class="table-search" border="0">
 <tr>
  <td width="100%"class="title_left">
   <img src="/images/egovframework/uss/ion/rec/icon/tit_icon.gif" width="16" height="16" hspace="3" align="absmiddle">&nbsp;추천사이트등록</td>
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
    <th width="20%" height="23" class="required_text" nowrap >추천사이트명<img src="/images/egovframework/uss/ion/rec/icon/required.gif" width="15" height="15"></th>
    <td width="80%" nowrap>
      <form:input path="recomendSiteNm" size="70" maxlength="70" />
      <div><form:errors path="recomendSiteNm"/></div>      	                 	  
    </td>
  </tr>
  
  <tr> 
    <th height="23" class="required_text" >추천사이트 URL<img src="/images/egovframework/uss/ion/rec/icon/required.gif" width="15" height="15"></th>
    <td> 
      <form:input path="recomendSiteUrl" size="70" maxlength="70" />
      <div><form:errors path="recomendSiteUrl"/></div>      	             
    </td>
  </tr> 
  
  <tr> 
    <th height="23" class="required_text" >추천사이트 설명<img src="/images/egovframework/uss/ion/rec/icon/required.gif" width="15" height="15"></th>
    <td>  
      <form:textarea path="recomendSiteDc" cols="200" rows="10" cssClass="txaClass" />   
      <div><form:errors path="recomendSiteDc"/></div>                                                    
    </td>
  </tr> 

  <tr> 
    <th height="23" class="required_text" >추천사유내용<img src="/images/egovframework/uss/ion/rec/icon/required.gif" width="15" height="15"></th>
    <td> 
      <form:textarea path="recomendResnCn" cols="200" rows="10" cssClass="txaClass" />   
      <div><form:errors path="recomendResnCn"/></div>                                                                   
    </td>
  </tr> 

  <tr> 
    <th height="23" class="required_text" >추천승인여부&nbsp;&nbsp;</th>
    <td>
     	승인:   <input type="radio" name="recomendConfmAt" class="radio1" value="Y" onClick="javascript:fn_egov_recomendConfirm();" />&nbsp;
     	미승인: <input type="radio" name="recomendConfmAt" class="radio1" value="N" onClick="javascript:fn_egov_recomendCancel();" />     
    </td>
  </tr> 

  <tr> 
    <th height="23" class="required_text" >승인일자</th>
    <td>	  
	  <input type="hidden" name="cal_url" value="<c:url value='/sym/cmm/EgovNormalCalPopup.do'/>" />	  
	  <input name="confmDe" type="text" size="10" value=""  readonly />	  
	  <a href="#" onClick="javascript:fn_egov_NormalCalendar(recomendSiteManageVO,'', recomendSiteManageVO.confmDe);">  
      <img name="calendarImg" src="<c:url value='/images/egovframework/cmm/sym/cal/bu_icon_carlendar.gif' />"  align="absmiddle" style="border:0px" alt="승인일달력" title="승인일달력">
      </a>	  
   	  <div><form:errors path="confmDe"/></div>   
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
<table border="0" cellspacing="0" cellpadding="0" align="center">
<tr> 

  <td><img src="/images/egovframework/uss/ion/rec/button/bu2_left.gif" width="8" height="20"></td>
  <td background="/images/egovframework/uss/ion/rec/button/bu2_bg.gif" class="text_left" nowrap>
  		<a href="JavaScript:fn_egov_regist_recomendsiteinfo(document.forms[0]);">저장</a> 
  </td>
  <td><img src="/images/egovframework/uss/ion/rec/button/bu2_right.gif" width="8" height="20"></td>
  <td>&nbsp;</td>
  <td><img src="/images/egovframework/uss/ion/rec/button/bu2_left.gif" width="8" height="20"></td>
  <td background="/images/egovframework/uss/ion/rec/button/bu2_bg.gif" class="text_left" nowrap>
  		<a href="javascript:fn_egov_inqire_recomendsitelist();">목록</a> 
  </td>
  <td><img src="/images/egovframework/uss/ion/rec/button/bu2_right.gif" width="8" height="20"></td>      
        
</tr>
</table>

</form:form>
</DIV>

</body>
</html>