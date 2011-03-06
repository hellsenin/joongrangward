<%
 /**
  * @Class Name  : EgovCcmAdministCodeDetail.jsp
  * @Description : EgovCcmAdministCodeDetail 화면
  * @Modification Information
  * @
  * @  수정일             수정자                   수정내용
  * @ -------    --------    ---------------------------
  * @ 2009.04.01   이중호              최초 생성
  *
  *  @author 공통서비스팀 
  *  @since 2009.04.01
  *  @version 1.0
  *  @see
  *  
  *  Copyright (C) 2009 by MOPAS  All right reserved.
  */
%>

<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<html>
<head>
<title>행정코드 상세조회</title>
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<link type="text/css" rel="stylesheet" href="/css/egovframework/cmm/sym/ccm/com.css" />
<script type="text/javaScript" language="javascript">
<!--
/* ********************************************************
 * 초기화
 ******************************************************** */
function fnInit(){
}
/* ********************************************************
 * 목록 으로 가기
 ******************************************************** */
function fnList(){
	location.href = "/sym/ccm/adc/EgovCcmAdministCodeList.do";
}
/* ********************************************************
 * 수정화면으로  바로가기
 ******************************************************** */
function fnModify(){
	var varForm				       = document.all["Form"];
	varForm.action                 = "<c:url value='/sym/ccm/adc/EgovCcmAdministCodeModify.do'/>";
	varForm.administZoneSe.value   = "${result.administZoneSe}";
	varForm.administZoneCode.value = "${result.administZoneCode}";
	varForm.submit();
}
/* ********************************************************
 * 삭제 처리 함수
 ******************************************************** */
function fnDelete(){
	if (confirm("<spring:message code="common.delete.msg" />")) {
		var varForm				       = document.all["Form"];
		varForm.action                 = "<c:url value='/sym/ccm/adc/EgovCcmAdministCodeRemove.do'/>";
		varForm.administZoneSe.value   = "${result.administZoneSe}";
		varForm.administZoneCode.value = "${result.administZoneCode}";
		varForm.submit();
	}
}
-->
</script>
</head>
<form name="Form" action="" method="post">
	<input type=hidden name="administZoneSe">
	<input type=hidden name="administZoneCode">
</form>
<table width="700" cellpadding="8" class="table-search" border="0">
 <tr>
  <td width="100%" class="title_left">
   <img src="/images/egovframework/cmm/sym/ccm/icon/tit_icon.gif" width="16" height="16" hspace="3" align="absmiddle" alt="제목">&nbsp;행정코드 상세조회</td>
 </tr>
</table>
<table width="700" border="0" cellpadding="0" cellspacing="1" class="table-register">
  <tr> 
    <th width="20%" height="23" class="required_text" nowrap >행정구역구분<img src="/images/egovframework/cmm/sym/ccm/icon/required.gif" alt="필수"  width="15" height="15"></th>
    <td>
		<select name="administZoneSe" disabled="true">
			<option value="1" <c:if test="${result.administZoneSe == '1'}">selected="selected"</c:if> >법정동</option>
			<option value="2" <c:if test="${result.administZoneSe == '2'}">selected="selected"</c:if> >행정동</option>				
		</select>
    </td>    
  </tr>     
  <tr>
    <th width="20%" height="23" class="required_text" nowrap >행정구역코드<img src="/images/egovframework/cmm/sym/ccm/icon/required.gif" alt="필수"  width="15" height="15"></th>          
    <td>${result.administZoneCode}</td>    
  </tr> 
  <tr>
    <th width="20%" height="23" class="required_text" nowrap >행정구역명<img src="/images/egovframework/cmm/sym/ccm/icon/required.gif" alt="필수"  width="15" height="15"></th>          
    <td>${result.administZoneNm}</td>    
  </tr> 
  <tr>
    <th width="20%" height="23" class="required_text" nowrap >생성일자<img src="/images/egovframework/cmm/sym/ccm/icon/required.gif" alt="필수"  width="15" height="15"></th>          
    <td><c:out value='${fn:substring(result.creatDe, 0,4)}'/>-<c:out value='${fn:substring(result.creatDe, 4,6)}'/>-<c:out value='${fn:substring(result.creatDe, 6,8)}'/></td>
  </tr> 
  <tr>
    <th width="20%" height="23" class="text" nowrap >폐기일자</th>          
    <td><c:out value='${fn:substring(result.ablDe, 0,4)}'/>-<c:out value='${fn:substring(result.ablDe, 4,6)}'/>-<c:out value='${fn:substring(result.ablDe, 6,8)}'/></td>
  </tr> 
  <tr>
    <th width="20%" height="23" class="text" nowrap >상위행정구역코드</th>          
    <td>${result.upperAdministZoneNm}</td>    
  </tr> 
  <tr> 
    <th width="20%" height="23" class="required_text" nowrap >사용여부<img src="/images/egovframework/cmm/sym/ccm/icon/required.gif" alt="필수"  width="15" height="15"></th>
    <td>
		<select name="useAt" disabled="true">
			<option value="Y" <c:if test="${result.useAt == 'Y'}">selected="selected"</c:if> >Yes</option>
			<option value="N" <c:if test="${result.useAt == 'N'}">selected="selected"</c:if> >No</option>				
		</select>
    </td>    
  </tr>     
</table>
<table width="700" border="0" cellspacing="0" cellpadding="0">
  <tr> 
    <td height="10"></td>
  </tr>
</table>
<table border="0" cellspacing="0" cellpadding="0" align="center">
<tr> 
  <td><img src="/images/egovframework/cmm/sym/ccm/btn/bu2_left.gif" alt="수정" width="8" height="20"></td>
  <td background="/images/egovframework/cmm/sym/ccm/btn/bu2_bg.gif" class="text_left" nowrap><a href="javascript:fnModify();">수정</a></td>
  <td><img src="/images/egovframework/cmm/sym/ccm/btn/bu2_right.gif" alt="수정" width="8" height="20"></td>
  <td width="10"></td>

  <c:if test="${result.useAt == 'Y'}">
  <td><img src="/images/egovframework/cmm/sym/ccm/btn/bu2_left.gif" alt="삭제" width="8" height="20"></td>  
  <td background="/images/egovframework/cmm/sym/ccm/btn/bu2_bg.gif" class="text_left" nowrap><a href="javascript:fnDelete();">삭제</a></td>  
  <td><img src="/images/egovframework/cmm/sym/ccm/btn/bu2_right.gif" alt="삭제" width="8" height="20"></td>
  <td width="10"></td>
  </c:if>

  <td><img src="/images/egovframework/cmm/sym/ccm/btn/bu2_left.gif" alt="목록" width="8" height="20"></td>
  <td background="/images/egovframework/cmm/sym/ccm/btn/bu2_bg.gif" class="text_left" nowrap><a href="javascript:fnList();">목록</a></td>
  <td><img src="/images/egovframework/cmm/sym/ccm/btn/bu2_right.gif" alt="목록" width="8" height="20"></td>           
</tr>
</table>
