<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%pageContext.setAttribute("crlf", "\r\n"); %>
<%
 /**
  * @Class Name : EgovStplatCnfirm.jsp
  * @Description : 약관확인 JSP
  * @Modification Information
  * @
  * @  수정일         수정자                   수정내용
  * @ -------    --------    ---------------------------
  * @ 2009.03.31    조재영          최초 생성
  *
  *  @author 공통서비스 개발팀 조재영
  *  @since 2009.03.31
  *  @version 1.0
  *  @see
  *  
  *  Copyright (C) 2009 by MOPAS  All right reserved.
  */
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>약관확인</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<base target="_self" />
<link rel="stylesheet" href="/css/egovframework/cmm/uss/umt/com.css" type="text/css">
<script type="text/javaScript" language="javascript" defer="defer">
<!--
function fnAgree(){
	var checkField = document.stplatForm.checkField;
    if(checkField) {
        if(checkField.length > 1) {
            for(var i=0; i < checkField.length; i++) {
                if(checkField[i].checked) {
                }else{
                    alert("약관에 동의하지 않으면 회원으로 가입할 수 없습니다.");
                    checkField[i].focus();
                    return;
                }
            }
        } else {
            if(checkField.checked) {
            }else{
            	alert("약관에 동의하지 않으면 회원으로 가입할 수 없습니다.");
                checkField[i].focus();
                return;
            }
        }
    }
    
    //실명인증 기본페이지는 주민번호 실명확인으로 한다.
    //패키지 변경 document.stplatForm.action = "<c:url value='/uss/umt/cmm/EgovRlnmCnfirm.do'/>";
    document.stplatForm.action = "<c:url value='/sec/rnc/EgovRlnmCnfirm.do'/>";
    document.stplatForm.submit();
}

function fnDisAgree(){
	alert("약관에 동의하지 않으면 회원가입을 하실수 없습니다.");
	return;
}
-->
</script>
</head>
<body>
        <!-- content start -->
        <form name="stplatForm" method="post" >
        <input type="hidden" name="sbscrbTy" value="${sbscrbTy}">
        <!-- 실명인증의 기본옵션은 주민번호 실명확인임 : 주민번호 실명인증 으로 가기위한 초기화값 -->
        <input type="hidden" name="ihidnum" value="">
        <input type="hidden" name="realname" value="">
        <!-- 실명인증후 다음단계에 대한 셋팅정보 -->
        <input type="hidden" name ="nextUrlName" value="button.subscribe">
        <input type="hidden" name ="nextUrl" value=
        <c:if test="${sbscrbTy == 'USR01'}">"/uss/umt/cmm/EgovMberSbscrbView.do"</c:if>
        <c:if test="${sbscrbTy == 'USR02'}">"/uss/umt/cmm/EgovEntrprsMberSbscrbView.do"</c:if>
        <c:if test="${empty sbscrbTy}">""</c:if>
        >
        <table width="100%" cellpadding="8" class="table-search" border="0">
            <tr>
            <td width="100%"class="title_left">
            <img src="/images/egovframework/cmm/uss/umt/icon/tit_icon.gif" width="16" height="16" hspace="3" align="absmiddle">&nbsp;약관확인</td>
            </tr>
        </table>
        <c:forEach var="result" items="${stplatList}" varStatus="status">
        <table class="table-line">
	        <tr><th>약관내용</th></tr>
            
            <tr>
                <td>
                <textarea cols="120" rows="15">
                <c:out value="${result.useStplatCn}" escapeXml="false" />
                </textarea>
                </td>
            </tr>
            <tr>
                <td>
                    <input name="checkField" type="checkbox"/>약관내용에 동의합니다.
                    <input name="checkuseStplatCn" type="hidden" value="<c:out value='${result.useStplatId}'/>"/>
                </td>
            </tr>
        </table>
        <table class="table-line">
            <tr><th>정보동의내용</th></tr>
            <tr>
                <td>
                <textarea cols="120" rows="15">
                <c:out value="${result.infoProvdAgeCn}" escapeXml="false" />
                </textarea>
                <!-- <c:out value="${fn:replace(result.infoProvdAgeCn , crlf , '<br/>')}" escapeXml="false" /> -->
                </td>
            </tr>
            <tr>
                <td>
                    <input name="checkField" type="checkbox"/>정보이용내용에 동의합니다.
                    <input name="checkinfoProvdAgeCn" type="hidden" value="<c:out value='${result.useStplatId}'/>"/>
                </td>
            </tr>
        </table>    
        </c:forEach>
        <table width="717">
        <tr>
        <td>
	        <table border="0"  cellspacing="0" cellpadding="0" align="center">
	            <tr>
	                <!-- 동의 -->
	                <td align="right"><img src="/images/egovframework/cmm/uss/umt/button/bu2_left.gif" width="8" height="20"></td>
	                <td background="/images/egovframework/cmm/uss/umt/button/bu2_bg.gif" class="text_left" nowrap>
	                <a href="javascript:fnAgree();"><spring:message code="button.agree" /></a></td>
	                <td align="left"><img src="/images/egovframework/cmm/uss/umt/button/bu2_right.gif" width="8" height="20"></td>
	                <td>&nbsp;</td>
	                <!-- 비동의 -->
	                <td align="right"><img src="/images/egovframework/cmm/uss/umt/button/bu2_left.gif" width="8" height="20"></td>
	                <td background="/images/egovframework/cmm/uss/umt/button/bu2_bg.gif" class="text_left" nowrap>
	                <a href="javascript:fnDisAgree();"><spring:message code="button.disagree" /></a></td>
	                <td align="left"><img src="/images/egovframework/cmm/uss/umt/button/bu2_right.gif" width="8" height="20"></td>
	            </tr>
	        </table>
	    </td>
	    </tr>
	    </table>
        </form>
        <!-- content end -->
</body>
</html>