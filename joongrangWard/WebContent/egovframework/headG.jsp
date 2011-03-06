<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ page import="egovframework.com.sec.ram.security.userdetails.util.EgovUserDetailsHelper" %>

<script language="javascript" src="/js/egovframework/main.js"></script>
<script type="text/javascript">
	function fn_egov_headPageMove(menuNo, url){
		document.selectOne.menuNo.value=menuNo;
		document.selectOne.chkURL.value=url;
	    document.selectOne.action = "<c:url value='/sym/mms/EgovMainMenuIndex.do'/>";
	    document.selectOne.submit();
	}

	function actionLogout()
	{
		document.selectOne.action = "<c:url value='/uat/uia/actionLogout.do'/>";
		document.selectOne.submit();
		//top.document.location.href = "<c:url value='/j_spring_security_logout'/>";
	}
</script>

<form name="selectOne">
<input name="menuNo" type="hidden" />
<input name="chkURL" type="hidden" />
<table width="900" border="0" cellspacing="0" cellpadding="0">
<tr>
<!-- logo -->
<td width="176" height="112"><img src="/images/egovframework/logo.gif" width="176" height="112"></td>
<td width="724">
    <table width="100%" border="0" cellspacing="0" cellpadding="0">
    <tr>
       <td width="724" height="68" class="t_strong">공통서비스 테스트 사이트(일반사용자용)</td>
    </tr>
    
    <% 
      if(EgovUserDetailsHelper.isAuthenticated()) { %>
    <tr>
        <td align="right" conspan="2"><a href="javascript:actionLogout();">로그아웃</a></td>
    </tr>
    <%} %>
    
    <!-- top menu background -->
    <tr class="TopMenuBg">
       <td height="44">
        <!-- top menu start -->
        <table width="700px" border="0" cellspacing="0" cellpadding="0" style="padding-top:6px;">
            <tr>
                <td align="right" width="76"><a href="/sym/mms/EgovMainMenuHome.do" target="_top">HOME</a></td>
             <c:forEach var="result" items="${list_headmenu}" varStatus="status">
                <td align="center" width="100"><a href="javascript:fn_egov_headPageMove('<c:out value="${result.menuNo}"/>','<c:out value="${result.chkURL}"/>')"><c:out value="${result.menuNm}"/></a></td>
             </c:forEach>
            </tr>
        </table>
       <!-- top menu end -->
    </td>
    </tr>
    </table>
</td>
</tr>
</table>
</form>