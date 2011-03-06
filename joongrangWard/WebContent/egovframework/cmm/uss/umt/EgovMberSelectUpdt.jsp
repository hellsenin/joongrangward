<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="validator" uri="http://www.springmodules.org/tags/commons-validator" %>
<%
 /**
  * @Class Name : EgovMberSelectUpdt.jsp
  * @Description : 일반회원상세조회, 수정 JSP
  * @Modification Information
  * @
  * @  수정일         수정자                   수정내용
  * @ -------    --------    ---------------------------
  * @ 2009.03.02    조재영          최초 생성
  *
  *  @author 공통서비스 개발팀 조재영
  *  @since 2009.03.02
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
<title>Mber Detail, Update, Delete</title>
<script type="text/javascript" src="<c:url value="/validator.do"/>"></script>
<validator:javascript formName="mberManageVO" staticJavascript="false" xhtml="true" cdata="false"/>
<script type="text/javascript" src="<c:url value='/js/egovframework/cmm/sym/zip/EgovZipPopup.js' />" ></script>
<script type="text/javaScript" language="javascript" defer="defer">
<!--
function fnListPage(){
    document.mberManageVO.action = "<c:url value='/uss/umt/mber/EgovMberManage.do'/>";
    document.mberManageVO.submit();
}
function fnDeleteMber(checkedIds) {
	if(confirm("<spring:message code="common.delete.msg" />")){
	    document.mberManageVO.checkedIdForDel.value=checkedIds;
	    document.mberManageVO.action = "<c:url value='/uss/umt/mber/EgovMberDelete.do'/>";
	    document.mberManageVO.submit(); 
	}
}
function fnPasswordMove(){
    document.mberManageVO.action = "<c:url value='/uss/umt/mber/EgovMberPasswordUpdtView.do'/>";
    document.mberManageVO.submit();
}
function fnUpdate(){
	if(validateMberManageVO(document.mberManageVO)){
		document.mberManageVO.submit();
    }
}
//-->
</script>
</head>
<body>
        <!-- content start -->
        <form:form commandName="mberManageVO" action="/uss/umt/mber/EgovMberSelectUpdt.do" name="mberManageVO"  method="post" >
        
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
        <input type="hidden" name="userTyForPassword" value="<c:out value='${mberManageVO.userTy}'/>" />
        
        <table width="717" cellpadding="8" class="table-search" border="0">
            <tr>
            <td width="100%"class="title_left">
            <img src="/images/egovframework/cmm/uss/umt/icon/tit_icon.gif" width="16" height="16" hspace="3" align="absmiddle">&nbsp;일반회원 상세조회(수정)</td>
            </tr>
        </table>
        <table width="717" border="0" cellpadding="0" cellspacing="1" class="table-register">
            <tr> 
                <th width="20%" height="23" class="required_text" nowrap >
                    일반회원아이디<img src="/images/egovframework/cmm/uss/umt/icon/required.gif" width="15" height="15">
                </th>
                <td width="80%" nowrap>
                    <form:input path="mberId" size="20" cssClass="txaIpt" readonly="true" maxlength="20" />
                    <div><form:errors path="mberId" cssClass="error" /></div>
                    <form:hidden path="uniqId" />
                </td>
            </tr>
            <tr> 
                <th width="20%" height="23" class="required_text" nowrap >
                    일반회원이름<img src="/images/egovframework/cmm/uss/umt/icon/required.gif" width="15" height="15">
                </th>
                <td width="80%" nowrap>
                    <form:input path="mberNm" cssClass="txaIpt" size="20" maxlength="60" />
                    <div><form:errors path="password" cssClass="error" /></div>
                </td>
            </tr>
            <tr> 
                <th width="20%" height="23" class="required_text" nowrap >
                    비밀번호힌트<img src="/images/egovframework/cmm/uss/umt/icon/required.gif" width="15" height="15">
                </th>
                <td width="80%" nowrap>
                    <form:select path="passwordHint">
                        <form:option value="" label="--선택하세요--"/>
                        <form:options items="${passwordHint_result}" itemValue="code" itemLabel="codeNm"/>
                    </form:select>
                    <div><form:errors path="passwordHint" cssClass="error"/></div>
                    </td>
            </tr>
            <tr> 
                <th width="20%" height="23" class="required_text" nowrap >
                    비밀번호정답<img src="/images/egovframework/cmm/uss/umt/icon/required.gif" width="15" height="15">
                </th>
                <td width="80%" nowrap>
                    <form:input path="passwordCnsr" cssClass="txaIpt" size="50" maxlength="100" />
                    <div><form:errors path="passwordCnsr" cssClass="error"/></div>
                </td>
            </tr>
            <tr>
                <th width="20%" height="23" class="required_text" nowrap >성별구분코드&nbsp;&nbsp;</th>
                <td width="80%" nowrap>
                    <form:select path="sexdstnCode">
                        <form:option value="" label="--선택하세요--"/>
                        <form:options items="${sexdstnCode_result}" itemValue="code" itemLabel="codeNm"/>
                    </form:select>
                </td>
            </tr>
            <tr> 
                <th width="20%" height="23" class="required_text" nowrap >
                    전화번호<img src="/images/egovframework/cmm/uss/umt/icon/required.gif" width="15" height="15">
                </th>
                <td width="80%" nowrap>
                    <form:input path="areaNo" cssClass="txaIpt" size="5" maxlength="5" />
                    - <form:input path="middleTelno" cssClass="txaIpt" size="5" maxlength="5" />
                    - <form:input path="endTelno" cssClass="txaIpt" size="5" maxlength="5" />
                    <div><form:errors path="areaNo" cssClass="error" /></div>
                    <div><form:errors path="middleTelno" cssClass="error" /></div>
                    <div><form:errors path="endTelno" cssClass="error" /></div>
                </td>
            </tr>
            <tr> 
                <th width="20%" height="23" class="required_text" nowrap >팩스번호&nbsp;&nbsp;</th>
                <td width="80%" nowrap>
                    <form:input path="mberFxnum" cssClass="txaIpt" size="20"  maxlength="15" />
                    <div><form:errors path="mberFxnum" cssClass="error" /></div>
                </td>
            </tr>
            <tr> 
                <th width="20%" height="23" class="required_text" nowrap >
                    핸드폰번호<img src="/images/egovframework/cmm/uss/umt/icon/required.gif" width="15" height="15">
                </th>
                <td width="80%" nowrap>
                    <form:input path="moblphonNo" cssClass="txaIpt" size="20" maxlength="15" />
                    <div><form:errors path="moblphonNo" cssClass="error" /></div>
                </td>
            </tr>
            <tr>
                <th width="20%" height="23" class="required_text" nowrap >
                    이메일주소<img src="/images/egovframework/cmm/uss/umt/icon/required.gif" width="15" height="15">
                </th>
                <td width="80%" nowrap>
                    <form:input path="mberEmailAdres" cssClass="txaIpt" size="30" maxlength="50" />
                    <div><form:errors path="mberEmailAdres" cssClass="error" /></div>
                </td>
            </tr>
            <tr> 
                <th width="20%" height="23" class="required_text" nowrap >
                    우편번호<img src="/images/egovframework/cmm/uss/umt/icon/required.gif" width="15" height="15">
                </th>
                <td width="80%" nowrap>
                    <input name="zip_view" type="text" size="20" value="<c:out value='${mberManageVO.zip}'/>" maxlength="8" readonly>
                    <form:hidden path="zip" />
                        <a href="javascript:fn_egov_ZipSearch(document.mberManageVO, document.mberManageVO.zip, document.mberManageVO.zip_view, document.mberManageVO.adres);">
                            <img src="/images/egovframework/cmm/sym/zip/icon_zip_search.gif">(우편번호 검색)
                        </a>
                    <div><form:errors path="zip" cssClass="error" /></div>
                </td>
            </tr>
            <tr>
                <th width="20%" height="23" class="required_text" nowrap >
                    주소<img src="/images/egovframework/cmm/uss/umt/icon/required.gif" width="15" height="15">
                </th>
                <td width="80%" nowrap>
                    <form:input path="adres" cssClass="txaIpt" size="70" maxlength="100" readonly="true" />
                    <div><form:errors path="adres" cssClass="error" /></div>
                </td>
            </tr>
            <tr> 
                <th width="20%" height="23" class="required_text" nowrap >상세주소&nbsp;&nbsp;</th>
                <td width="80%" nowrap>
                    <form:input path="detailAdres" cssClass="txaIpt" size="70" maxlength="100" />
                    <div><form:errors path="detailAdres" cssClass="error" /></div>
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
                    일반회원상태코드<img src="/images/egovframework/cmm/uss/umt/icon/required.gif" width="15" height="15">
                </th>
                <td width="80%" nowrap>
                    <form:select path="mberSttus">
                        <form:option value="" label="--선택하세요--"/>
                        <form:options items="${mberSttus_result}" itemValue="code" itemLabel="codeNm"/>
                    </form:select>
                    <div><form:errors path="mberSttus" cssClass="error"/></div>
                </td>
            </tr>
            <form:hidden path="password" />
        </table>
            
        <table width="717">
            <tr> 
                <td colspan="2" height="10"></td>
            </tr>
            <tr> 
                <td height="10" align="center">
                <table border="0" cellspacing="0" cellpadding="0" align="center">
                    <tr> 
                        <!-- 수정 -->
                        <td><img src="/images/egovframework/cmm/uss/umt/button/bu2_left.gif" width="8" height="20"></td>
                        <td background="/images/egovframework/cmm/uss/umt/button/bu2_bg.gif" class="text_left" nowrap>
                        <a href="javascript:fnUpdate();"><spring:message code="button.update" /></a></td>
                        <td><img src="/images/egovframework/cmm/uss/umt/button/bu2_right.gif" width="8" height="20"></td>
                        <td>&nbsp;</td>
                        <!-- 삭제 -->
                        <td><img src="/images/egovframework/cmm/uss/umt/button/bu2_left.gif" width="8" height="20"></td>
                        <td background="/images/egovframework/cmm/uss/umt/button/bu2_bg.gif" class="text_left" nowrap>
                        <a href="javascript:fnDeleteMber('<c:out value='${mberManageVO.userTy}'/>:<c:out value='${mberManageVO.uniqId}'/>');"><spring:message code="button.delete" /></a></td>
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
                        <a href="javascript:document.mberManageVO.reset();"><spring:message code="button.reset" /></a></td>
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