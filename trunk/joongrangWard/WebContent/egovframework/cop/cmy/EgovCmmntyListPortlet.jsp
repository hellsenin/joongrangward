<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<% 
 /**
  * @Class Name : EgovCmmntyListPortlet.jsp
  * @Description : 커뮤니티 목록 조회 포틀릿화면
  * @Modification Information
  * @
  * @  수정일      수정자            수정내용
  * @ -------        --------    ---------------------------
  * @ 2009.04.07   이삼섭          최초 생성
  *
  *  @author 공통서비스 개발팀 이삼섭
  *  @since 2009.04.07
  *  @version 1.0 
  *  @see
  *  
  *  Copyright (C) 2009 by MOPAS  All right reserved.
  */
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/1999/REC-html401-19991224/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<link href="<c:url value='/css/egovframework/cop/cmy/com.css' />" rel="stylesheet" type="text/css">
<script type="text/javascript">
	function fn_egov_selectCmmnty(cmmntyId, cmmntyNm) {
		document.cmmntyForm.target = cmmntyNm;
		
		document.cmmntyForm.cmmntyId.value = cmmntyId;
		document.cmmntyForm.cmmntyNm.value = cmmntyNm;
		document.cmmntyForm.action = "<c:url value='/cop/cmy/CmmntyMainPage.do'/>";
		document.cmmntyForm.submit();
	}

</script>
<title>커뮤니티 목록 조회</title>
</head>
<body>
<form name="cmmntyForm" method="post"  action="<c:url value='/cop/cmy/CmmntyListPortlet.do'/>" >
<input type="hidden" name="cmmntyId" />
<input type="hidden" name="cmmntyNm" />

	<c:forEach var="result" items="${resultList}" varStatus="status">
	
	   	<li style="padding-top:5px"><a href="javascript:fn_egov_selectCmmnty('<c:out value="${result.cmmntyId}"/>','<c:out value="${result.cmmntyNm}"/>')">
	   	<c:out value="${result.cmmntyNm}"/></a></li>
	
	</c:forEach>

</form>
</body>
</html>