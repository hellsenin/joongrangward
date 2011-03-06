<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link rel="stylesheet" href="/css/egovframework/sym/mpm/mpm.css" type="text/css">
<title>HeadMenu</title>
<script language="javascript" src="/js/egovframework/main.js"></script>
<script type="text/javascript">
	function fn_main_headPageMove(menuNo, url){
		document.selectOne.vStartP.value=menuNo;
		document.selectOne.chkURL.value=url;
	    document.selectOne.action = "<c:url value='/sym/mms/EgovMainMenuLeft.do'/>";
	    document.selectOne.target = "main_left";
	    document.selectOne.submit();
 	    document.selectOne.action = "<c:url value='/sym/mms/EgovMainMenuRight.do'/>";
	    document.selectOne.target = "main_right";
	    document.selectOne.submit();
	}
</script>
</head> 
<body leftmargin="0" topmargin="0" marginwidth="0" marginheight= "0"> 

<link rel="stylesheet" href="/css/com.css" type="text/css">
<form name="selectOne">
<input name="vStartP" type="hidden" />
<input name="chkURL" type="hidden" />
<table width="900" border="0" cellspacing="0" cellpadding="0">
<tr>
<!-- logo -->
<td width="176" height="112"><a href="/sym/mms/EgovMainMenuHome.do" target=_top><img src="/images/egovframework/logo.gif" width="176" height="112"></a></td>
<td width="724">
    <table width="100%" border="0" cellspacing="0" cellpadding="0">
    <tr>
    <td width="560" height="68" class="t_strong">공통서비스 테스트 사이트(일반사용자용)</td></tr>
    <tr class="TopMenuBg">
    <td height="44" colspan="2">
        <!-- top menu start -->
        <table width="700px" border="0" cellspacing="0" cellpadding="0" style="padding-top:6px;">
            <tr>
                <td align="right" width="76"><a href="/sym/mms/EgovMainMenuHome.do" target="_top">HOME</a></td>
             <c:forEach var="result" items="${list_headmenu}" varStatus="status">
                <td align="center" width="100"><a href="javascript:fn_main_headPageMove('<c:out value="${result.menuNo}"/>','<c:out value="${result.chkURL}"/>')"><c:out value="${result.menuNm}"/></a></td>
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
</body>
</html>

                <!--  td align="right" width="76"><a href="#">HOME</a></td>
                <td align="center" width="100"><a href="#">보안관리</a></td>
                <td align="center" width="88"><a href="#">사용자지원</a></td>
                <td align="center" width="85"><a href="#">사용자인증</a></td>
                <td align="center" width="86"><a href="#">시스템관리</a></td>
                <td align="center" width="66"><a href="#" onClick='javascript:fn_egov_mainPageMove("<c:url value='/cop/mainView.do'/>")'>협업</a></td>
                <td align="center" width="94"><a href="#">통계/리포팅</a></td>
                <td align="center" width="105"><a href="#">전자우편연계</a></td -->
