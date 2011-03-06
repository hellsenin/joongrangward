<%--
 /** 
  * @Class Name : EgovMenuRegist.jsp
  * @Description : 메뉴정보 등록 화면
  * @Modification Information
  * @
  * @  수정일         수정자                   수정내용
  * @ -------    --------    ---------------------------
  * @ 2009.03.10    이용          최초 생성
  *
  *  @author 공통서비스 개발팀 이용
  *  @since 2009.03.10
  *  @version 1.0
  *  @see
  *  
  *  Copyright (C) 2009 by MOPAS  All right reserved.
  */
  /* Image Path 설정 */
  //String imagePath_icon   = "/images/egovframework/sym/mpm/icon/";
  //String imagePath_button = "/images/egovframework/sym/mpm/button/";
--%>
<%@ page contentType="text/html; charset=utf-8"%> 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="validator" uri="http://www.springmodules.org/tags/commons-validator" %>
<c:set var="ImgUrl" value="/images/egovframework/sym/mpm/"/>
<c:set var="CssUrl" value="/css/egovframework/sym/mpm/"/>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link rel="stylesheet" href="${CssUrl}mpm.css" type="text/css" />
<title>메뉴정보등록</title>
<script type="text/javascript" src="<c:url value="/validator.do" />"></script>
<validator:javascript formName="menuManageVO" staticJavascript="false" xhtml="true" cdata="false"/>
<script language="javascript1.2">
<!--
/* ********************************************************
 * 입력처리 함수
 ******************************************************** */
function insertMenuManage(form) {
	if(confirm("<spring:message code="common.save.msg" />")){
		if(!validateMenuManageVO(form)){ 			
			return;
		}else{

			form.submit();
		}
	}
}

/* ********************************************************
 * 파일목록조회  함수
 ******************************************************** */
function searchFileNm() {
	document.all.tmp_SearchElementName.value = "progrmFileNm";
	window.open('/sym/mpm/EgovProgramListSearch.do','','width=500,height=400');
}

/* ********************************************************
 * 목록조회  함수
 ******************************************************** */
function selectList(){
	location.href = "/sym/mpm/EgovMenuManageSelect.do";
}
/* ********************************************************
 * 파일명 엔터key 목록조회  함수
 ******************************************************** */
function press() {
    if (event.keyCode==13) {
    	searchFileNm();    // 원래 검색 function 호출
    }
}

function fncSelectDeptAuthorPop() {


    //var url = "/cmm/sec/ram/EgovDeptSearchList.do";
    //var openParam = "dialogWidth:500px;dialogHeight:485px;scroll:no;status:no;center:yes;resizable:yes;";
    /*
    var retVal = window.showModalDialog(url, varParam, openParam);
    if(retVal) {
        document.listForm.deptCode.value = retVal.substring(0, retVal.indexOf("|"));
        document.listForm.deptNm.value = retVal.substring(retVal.indexOf("|")+1, retVal.length);
    }
    */
	var retVal;
	var url = "/admin/member/searchEmployeeList.do";
	var varParam = new Object();
	// IE
	//var openParam = "dialogWidth:500px;dialogHeight:325px;scroll:no;status:no;center:yes;resizable:yes;";
	// FIREFOX
	var openParam = "dialogWidth:520px;dialogHeight:600px;scroll:no;status:no;center:yes;resizable:no;";
	retVal = window.showModalDialog(url, varParam, openParam);
	if(retVal) {
		//alert(retVal.userId + "," + retVal.userName);
        document.frm.userId.value = retVal.userId;
        document.frm.userName.value = retVal.userName;
    }

    //window.open(url,"부서검색",'width=500,height=485,scrollbars=no,resizable=no,status=no,center:yes');

}
<c:if test="${!empty resultMsg}">alert("${resultMsg}");</c:if>
-->
</script>

</head>
<body> 
<form:form commandName="menuManageVO" >
<DIV id="main" style="display:"> 

<table width="717" cellpadding="8" class="table-search" border="0">
 <tr>
  <td width="100%" class="title_left">
   <img src="${ImgUrl}icon/tit_icon.gif" width="16" height="16" hspace="3" align="absmiddle">&nbsp;메뉴 등록</td>
 </tr>
</table>
<table width="717" border="0" cellpadding="0" cellspacing="1" class="table-register">
  <tr> 
    <th width="15%" height="23" class="required_text" nowrap >컨텐츠경로</th>
    <td width="35%" nowrap>&nbsp;
      <form:input path="contentsPath" size="30" cssClass="txaIpt" maxlength="400" />
      <form:errors path="contentsPath" />
    </td>
    <th width="15%" height="23" class="required_text" nowrap >메뉴순서<img src="${ImgUrl}icon/required.gif" width="15" height="15"></th>
    <td width="35%" nowrap>
      &nbsp;
      <form:input path="menuOrdr" size="10" cssClass="txaIpt" maxlength="10" />
      <form:errors path="menuOrdr" />
    </td>
  </tr> 
  <tr> 
    <th width="15%" height="23" class="required_text" nowrap >메뉴명<img src="${ImgUrl}icon/required.gif" width="15" height="15"></th>
    <td width="35%" nowrap>
      &nbsp;
      <form:input path="menuNm" size="30" cssClass="txaIpt" maxlength="100" />
      <form:errors path="menuNm" />
    </td>
    <th width="15%" height="23" class="required_text" nowrap >상위메뉴No<img src="${ImgUrl}icon/required.gif" width="15" height="15"></th>
    <td width="35%" nowrap>
      &nbsp;
      <form:input path="upperMenuId" size="10" cssClass="txaIpt" maxlength="10" />
      <form:errors path="upperMenuId" />
    </td>
  </tr>
  <tr> 
    <th width="15%" height="23" class="required_text" nowrap >사이트ID<img src="${ImgUrl}icon/required.gif" width="15" height="15"></th>
    <td width="35%" nowrap><input type="hidden" name="siteId" value="${param.siteId}" />
		  &nbsp;${param.siteId}
    </td>
    <th width="15%" height="23" class="required_text" nowrap >메뉴링크<img src="${ImgUrl}icon/required.gif" width="15" height="15"></th>
    <td width="35%" nowrap>
		  &nbsp;
	      <form:input path="menuLink" size="30" cssClass="txaIpt" maxlength="255" />
	      <form:errors path="menuLink" />
    </td>
  </tr>
  <tr> 
    <th width="15%" height="23" class="required_text" nowrap >메뉴팝업유무<img src="${ImgUrl}icon/required.gif" width="15" height="15"></th>
    <td width="35%" nowrap>
		  &nbsp;
	      <form:input path="menuPopupYn" size="30" cssClass="txaIpt" maxlength="30" />
	      <form:errors path="menuPopupYn" />
    </td>
    <th width="15%" height="23" class="required_text" nowrap >담당자명<img src="${ImgUrl}icon/required.gif" width="15" height="15"></th>
    <td width="35%" nowrap>&nbsp;
      <input type="text" name="userName" value="${menuManageVO.userName}" size="30" cssClass="txaIpt" maxlength="30" readonly="readonly" />
      <input type="hidden" name="userId" value="" />
      <input type="button" name="user" value="선택" onclick="fncSelectDeptAuthorPop()" />
    </td>
  </tr>
  <tr> 
    <th width="15%" height="23" class="required_text" nowrap >메뉴사용유무<img src="${ImgUrl}icon/required.gif" width="15" height="15"></th>
    <td width="35%" nowrap>&nbsp;
      <form:input path="useYn" size="30" cssClass="txaIpt" maxlength="30" />
      <form:errors path="useYn" />
    </td>
  </tr>
  <tr> 
    <th width="15%" height="23" class="required_text" >메뉴설명</th>
    <td colspan=3>&nbsp;
      <form:textarea path="menuDc" rows="14" cols="75" cssClass="txaClass"/>
      <form:errors path="menuDc"/>
    </td>
  </tr> 
</table>
<table width="717" border="0" cellspacing="0" cellpadding="0">
  <tr> 
    <td height="10"></td>
  </tr>
</table>

<table width="717" border="0" cellspacing="0" cellpadding="0" align="left">
<tr> 
  <td width="90%"></td>
  <td height="10"><img src="${ImgUrl}button/bu2_left.gif" width="8" height="20"></td>
  <td background="/images/egovframework/cmm/sym/ccm/btn/bu2_bg.gif" class=text_left" nowrap><a href="javascript:selectList()">목록</a></td>
  <td><img src="/images/egovframework/cmm/sym/ccm/btn/bu2_right.gif" width="8" height="20"></td>      
  <td width="10">&nbsp;</td>
  <td height="10"><img src="${ImgUrl}button/bu2_left.gif" width="8" height="20"></td>
  <td background="${ImgUrl}button/bu2_bg.gif" class="text_left" nowrap><a href="javascript:insertMenuManage(document.forms[0])">등록</a></td>
  <td><img src="${ImgUrl}button/bu2_right.gif" width="8" height="20"></td>      
</tr>
</table>
<br>
    <input type="hidden" name="tmp_SearchElementName" value="">
    <input type="hidden" name="tmp_SearchElementVal" value="">
</DIV>
<input name="cmd" type="hidden" value="<c:out value='insert'/>"/>
</form:form>
</body>
</html>

