<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="validator" uri="http://www.springmodules.org/tags/commons-validator" %>
<%
 /**
  * @Class Name : EgovEntrprsMberSelectUpdt.jsp
  * @Description : 사용자상세조회, 수정 JSP
  * @Modification Information
  * @
  * @  수정일         수정자                   수정내용
  * @ -------    --------    ---------------------------
  * @ 2009.03.02    조재영          최초 생성
  *
  *  @author 공통서비스 개발팀 조재영
  *  @since 2009.03.12
  *  @version 1.0
  *  @see
  *  
  *  Copyright (C) 2009 by MOPAS  All right reserved.
  */
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link rel="stylesheet" href="/css/egovframework/cmm/uss/umt/com.css" type="text/css">
<title>User Detail, Update, Delete</title>
<script type="text/javascript" src="<c:url value="/validator.do"/>"></script>
<validator:javascript formName="entrprsManageVO" staticJavascript="false" xhtml="true" cdata="false"/>
<script type="text/javascript" src="<c:url value='/js/egovframework/cmm/sym/zip/EgovZipPopup.js' />" ></script>
<script type="text/javaScript" language="javascript" defer="defer">
<!--
function fnListPage(){
    document.entrprsManageVO.action = "<c:url value='/uss/umt/entrprs/EgovEntrprsMberManage.do'/>";
    document.entrprsManageVO.submit();
}
function fnDeleteEntrprs(checkedIds) {
	if(confirm("<spring:message code="common.delete.msg" />")){
		document.entrprsManageVO.checkedIdForDel.value=checkedIds;
	    document.entrprsManageVO.action = "<c:url value='/uss/umt/entrprs/EgovEntrprsMberDelete.do'/>";
	    document.entrprsManageVO.submit();
	}
}
function fnPasswordMove(){
    document.entrprsManageVO.action = "<c:url value='/uss/umt/entrprs/EgovEntrprsPasswordUpdtView.do'/>";
    document.entrprsManageVO.submit();
}
function fnUpdate(){
	if(validateEntrprsManageVO(document.entrprsManageVO)){
		document.entrprsManageVO.submit();
    }
}
//-->
</script>
</head>
<body>

        <!-- content start -->
        <form:form commandName="entrprsManageVO" action="/uss/umt/entrprs/EgovEntrprsMberSelectUpdt.do" name="entrprsManageVO" method="post" >
        
        <!-- <form name="detailForm" method="post" action="<c:url value="${'/uss/umt/entrprs/EgovEntrprsMberSelectUpdt.do'}"/>">  -->
             
        <!-- 상세정보 사용자 삭제시 prameter 전달용 input -->
        <input name="checkedIdForDel" type="hidden" />
        <!-- 검색조건 유지 -->
        <input type="hidden" name="searchCondition" value="<c:out value='${userSearchVO.searchCondition}'/>"/>
        <input type="hidden" name="searchKeyword" value="<c:out value='${userSearchVO.searchKeyword}'/>"/>
        <input type="hidden" name="sbscrbSttus" value="<c:out value='${userSearchVO.sbscrbSttus}'/>"/>
        <input type="hidden" name="pageIndex" value="<c:out value='${userSearchVO.pageIndex}'/>"/>
        <!-- 우편번호검색 -->
        <input type="hidden" name="zip_url" value="<c:url value='/sym/cmm/EgovCcmZipSearchPopup.do'/>" />
        <!-- 사용자유형정보 : password 수정화면으로 이동시 타겟 유형정보 확인용, 만약검색조건으로 유형이 포함될경우 혼란을 피하기위해 userTy명칭을 쓰지 않음-->
        <input type="hidden" name="userTyForPassword" value="<c:out value='${entrprsManageVO.userTy}'/>" />
        
        <table width="717" cellpadding="8" class="table-search" border="0">
            <tr>
            <td width="100%"class="title_left">
            <img src="/images/egovframework/cmm/uss/umt/icon/tit_icon.gif" width="16" height="16" hspace="3" align="absmiddle">&nbsp;기업회원 상세조회(수정)</td>
            </tr>
        </table>
        <table width="717" border="0" cellpadding="0" cellspacing="1" class="table-register">
            <tr> 
                <th width="20%" height="23" class="required_text" nowrap >
                    기업회원아이디<img src="/images/egovframework/cmm/uss/umt/icon/required.gif" width="15" height="15">
                </th>
                <td width="80%" nowrap>
                    <form:input path="entrprsmberId" size="20" cssClass="txaIpt" readonly="true" maxlength="20" />
                    <div><form:errors path="entrprsmberId" cssClass="error"/></div>
                    <form:hidden path="uniqId" />
                </td>
            </tr>
            <tr> 
                <th width="20%" height="23" class="required_text" nowrap >
                    회사명<img src="/images/egovframework/cmm/uss/umt/icon/required.gif" width="15" height="15">
                </th>
                <td width="80%" nowrap>
                    <!-- <input name="cmpnyNm" type="text" size="20" value="<c:out value='${entrprsManageVO.cmpnyNm}'/>"  maxlength="20" > -->
                    <form:input path="cmpnyNm" size="45" cssClass="txaIpt" readonly="false" maxlength="50" />
                    <div><form:errors path="cmpnyNm" cssClass="error"/></div>
                </td>
            </tr>
            <tr> 
                <th width="20%" height="23" class="required_text" nowrap >
                    비밀번호힌트<img src="/images/egovframework/cmm/uss/umt/icon/required.gif" width="15" height="15">
                </th>
                <td width="80%" nowrap>
                    <form:select path="entrprsMberPasswordHint">
                        <form:option value="" label="--선택하세요--"/>
                        <form:options items="${passwordHint_result}" itemValue="code" itemLabel="codeNm"/>
                    </form:select>
                    <div><form:errors path="entrprsMberPasswordHint" cssClass="error"/></div>
                    </td>
            </tr>
            <tr> 
                <th width="20%" height="23" class="required_text" nowrap >
                    비밀번호정답<img src="/images/egovframework/cmm/uss/umt/icon/required.gif" width="15" height="15">
                </th>
                <td width="80%" nowrap>
                    <form:input path="entrprsMberPasswordCnsr" cssClass="txaIpt" size="50" maxlength="100" />
                    <div><form:errors path="entrprsMberPasswordCnsr" cssClass="error"/></div>
                </td>
            </tr>
            <tr> 
                <th width="20%" height="23" class="required_text" nowrap >업종코드&nbsp;&nbsp;</th>
                <td width="80%" nowrap>
                    <form:select path="indutyCode">
                        <form:option value="" label="--선택하세요--"/>
                        <form:options items="${indutyCode_result}" itemValue="code" itemLabel="codeNm"/>
                    </form:select>
                    <div><form:errors path="indutyCode" cssClass="error"/></div>
                </td>
            </tr>
            <tr> 
                <th width="20%" height="23" class="required_text" nowrap >기업구분코드&nbsp;&nbsp;</th>
                <td width="80%" nowrap>
                    <form:select path="entrprsSeCode">
                        <form:option value="" label="--선택하세요--"/>
                        <form:options items="${entrprsSeCode_result}" itemValue="code" itemLabel="codeNm"/>
                    </form:select>
                    <div><form:errors path="entrprsSeCode" cssClass="error"/></div>
                </td>
            </tr>
            <tr> 
                <th width="20%" height="23" class="required_text" nowrap >대표이사이름&nbsp;&nbsp;</th>
                <td width="80%" nowrap>
                    <form:input path="cxfc" cssClass="txaIpt" size="20"  maxlength="8" />
                    <div><form:errors path="cxfc" cssClass="error"/></div>
                </td>
            </tr>
            <tr>
                <th width="20%" height="23" class="required_text" nowrap >
                    사업자등록번호<img src="/images/egovframework/cmm/uss/umt/icon/required.gif" width="15" height="15">
                </th>
                <td width="80%" nowrap>
                    <form:input path="bizrno" cssClass="txaIpt" size="20" maxlength="20" />
                    <div><form:errors path="bizrno" cssClass="error"/></div>
                </td>
            </tr>
            <tr> 
                <th width="20%" height="23" class="required_text" nowrap >법인등록번호&nbsp;&nbsp;</th>
                <td width="80%" nowrap>
                    <form:input path="jurirno" cssClass="txaIpt" size="20" maxlength="13" />
                    <div><form:errors path="jurirno" cssClass="error"/></div>
                </td>
            </tr>
            <tr> 
                <th width="20%" height="23" class="required_text" nowrap >
                    회사전화번호<img src="/images/egovframework/cmm/uss/umt/icon/required.gif" width="15" height="15">
                </th>
                <td width="80%" nowrap>
                    <form:input path="areaNo" cssClass="txaIpt" size="5" maxlength="20" />
                    - <form:input path="entrprsMiddleTelno" cssClass="txaIpt" size="5" maxlength="100" />
                    - <form:input path="entrprsEndTelno" cssClass="txaIpt" size="5" maxlength="5" />
                    <div><form:errors path="areaNo" cssClass="error"/></div>
                    <div><form:errors path="entrprsMiddleTelno" cssClass="error"/></div>
                    <div><form:errors path="entrprsEndTelno" cssClass="error"/></div>
                </td>
            </tr>
            <tr> 
                <th width="20%" height="23" class="required_text" nowrap >팩스번호&nbsp;&nbsp;</th>
                <td width="80%" nowrap>
                    <form:input path="fxnum" cssClass="txaIpt" size="20" maxlength="15" />
                    <div><form:errors path="fxnum" cssClass="error"/></div>
                </td>
            </tr>
            <tr> 
                <th width="20%" height="23" class="required_text" nowrap >
                    우편번호<img src="/images/egovframework/cmm/uss/umt/icon/required.gif" width="15" height="15">
                </th>
                <td width="80%" nowrap>
                    <input name="zip_view" type="text" size="20" value="<c:out value='${entrprsManageVO.zip}'/>"  maxlength="8" readonly>
                    <form:hidden path="zip" />
                        <a href="javascript:fn_egov_ZipSearch(document.entrprsManageVO, document.entrprsManageVO.zip, document.entrprsManageVO.zip_view, document.entrprsManageVO.adres);">
                            <img src="/images/egovframework/cmm/sym/zip/icon_zip_search.gif">(우편번호 검색)
                        </a>
                    <div><form:errors path="zip" cssClass="error"/></div>
                </td>
            </tr>
            <tr> 
                <th width="20%" height="23" class="required_text" nowrap >
                    주소<img src="/images/egovframework/cmm/uss/umt/icon/required.gif" width="15" height="15">
                </th>
                <td width="80%" nowrap>
                    <form:input path="adres" cssClass="txaIpt" size="70" maxlength="50" readonly="true" />
                    <div><form:errors path="adres" cssClass="error"/></div>
                </td>
            </tr>
            <tr> 
                <th width="20%" height="23" class="required_text" nowrap >상세주소&nbsp;&nbsp;</th>
                <td width="80%" nowrap>
                    <form:input path="detailAdres" cssClass="txaIpt" size="70"  maxlength="50" />
                    <div><form:errors path="detailAdres" cssClass="error"/></div>
                </td>
            </tr>
            <tr> 
                <th width="20%" height="23" class="required_text" nowrap >
                    신청자이름<img src="/images/egovframework/cmm/uss/umt/icon/required.gif" width="15" height="15">
                </th>
                <td width="80%" nowrap>
                    <form:input path="applcntNm" cssClass="txaIpt" size="20" maxlength="20" />
                    <div><form:errors path="applcntNm" cssClass="error"/></div>
                </td>
            </tr>
            <tr> 
                <th width="20%" height="23" class="required_text" nowrap >
                    신청자이메일주소<img src="/images/egovframework/cmm/uss/umt/icon/required.gif" width="15" height="15">
                </th>
                <td width="80%" nowrap>
                    <form:input path="applcntEmailAdres" cssClass="txaIpt" size="20" maxlength="20" />
                    <div><form:errors path="applcntEmailAdres" cssClass="error"/></div>
                </td>
            </tr>
            <tr> 
                <th width="20%" height="23" class="required_text" nowrap >
                    그룹아이디<img src="/images/egovframework/cmm/uss/umt/icon/required.gif" width="15" height="15">
                </th>
                <td width="80%" nowrap>
                    <form:select path="groupId">
                        <form:option value="" label="--선택하세요--"/>
                        <form:options items="${groupId_result}" itemValue="code" itemLabel="codeNm"/>
                    </form:select>
                    <div><form:errors path="groupId" cssClass="error"/></div>
                </td>
            </tr>
            <tr> 
                <th width="20%" height="23" class="required_text" nowrap >
                    기업회원상태코드<img src="/images/egovframework/cmm/uss/umt/icon/required.gif" width="15" height="15">
                </th>
                <td width="80%" nowrap>
                    <form:select path="entrprsMberSttus">
                        <form:option value="" label="--선택하세요--"/>
                        <form:options items="${entrprsMberSttus_result}" itemValue="code" itemLabel="codeNm"/>
                    </form:select>
                    <div><form:errors path="entrprsMberSttus" cssClass="error"/></div>
                </td>
            </tr>
            <form:hidden path="entrprsMberPassword" />
        </table>
        <table width="717" border="0" cellspacing="0" cellpadding="0">
            <tr> 
                <td height="10"></td>
            </tr>
            <tr>
                <td>
                <table border="0" cellspacing="0" cellpadding="0" align="center">
		            <tr>
		                <!-- 수정 -->
		                <td><img src="/images/egovframework/cmm/uss/umt/button/bu2_left.gif" width="8" height="20"></td>
		                <td background="/images/egovframework/cmm/uss/umt/button/bu2_bg.gif" class="text_left" nowrap>
		                <a href="javascript:fnUpdate()"><spring:message code="button.update" /></a></td>
		                <td><img src="/images/egovframework/cmm/uss/umt/button/bu2_right.gif" width="8" height="20"></td>
		                <td>&nbsp;</td>
		                <!-- 삭제 -->
		                <td><img src="/images/egovframework/cmm/uss/umt/button/bu2_left.gif" width="8" height="20"></td>
		                <td background="/images/egovframework/cmm/uss/umt/button/bu2_bg.gif" class="text_left" nowrap>
		                <a href="javascript:fnDeleteEntrprs('<c:out value='${entrprsManageVO.userTy}'/>:<c:out value='${entrprsManageVO.uniqId}'/>');"><spring:message code="button.delete" /></a></td>
		                <td><img src="/images/egovframework/cmm/uss/umt/button/bu2_right.gif" width="8" height="20"></td>
		                <td>&nbsp;</td>
		                <!-- 목록 -->
		                <td><img src="/images/egovframework/cmm/uss/umt/button/bu2_left.gif" width="8" height="20"></td>
		                <td background="/images/egovframework/cmm/uss/umt/button/bu2_bg.gif" class="text_left" nowrap>
		                <a href="javascript:fnListPage();"><spring:message code="button.list" /></a></td>
		                <td><img src="/images/egovframework/cmm/uss/umt/button/bu2_right.gif" width="8" height="20"></td>
		                <td>&nbsp;</td>
		                <!-- 암호변경 -->
		                <td><img src="/images/egovframework/cmm/uss/umt/button/bu2_left.gif" width="8" height="20"></td>
		                <td background="/images/egovframework/cmm/uss/umt/button/bu2_bg.gif" class="text_left" nowrap>
		                <a href="javascript:fnPasswordMove();"><spring:message code="button.passwordUpdate" /></a></td>
		                <td><img src="/images/egovframework/cmm/uss/umt/button/bu2_right.gif" width="8" height="20"></td>
		                <td>&nbsp;</td>
		                <!-- 취소 -->
		                <td><img src="/images/egovframework/cmm/uss/umt/button/bu2_left.gif" width="8" height="20"></td>
		                <td background="/images/egovframework/cmm/uss/umt/button/bu2_bg.gif" class="text_left" nowrap>
		                <a href="javascript:document.entrprsManageVO.reset();"><spring:message code="button.reset" /></a></td>
		                <td><img src="/images/egovframework/cmm/uss/umt/button/bu2_right.gif" width="8" height="20"></td>
		            </tr>
		        </table>
            
                </td>
            </tr>
        </table>
        
        </form:form>
        <!-- content end -->
</body>
</html>