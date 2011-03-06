<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<% 
 /**
  * @Class Name : EgovClubListPortlet.jsp
  * @Description : 동호회 목록 조회 포틀릿화면
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
<script type="text/javascript">
	function fn_egov_selectClub(clbId, cmmntyId) {
		document.clubForm.target = clbId;
		
		document.clubForm.clbId.value = clbId;
		document.clubForm.param_clbId.value = clbId;
		document.clubForm.cmmntyId.value = cmmntyId;
		document.clubForm.action = "<c:url value='/cop/cus/ClubMainPage.do'/>";
		document.clubForm.submit();
	}
</script>
<title>동호회 목록 조회</title>
</head>
<body>
<form name="clubForm" method="post"  action="<c:url value='/cop/cus/ClubListPortlet.do'/>" >
<input type="hidden" name="clbId" />
<input type="hidden" name="cmmntyId"/>
<input type="hidden" name="param_clbId"/>
 
<c:forEach var="result" items="${resultList}" varStatus="status">
	<li style="padding-top:5px"><a href="javascript:fn_egov_selectClub('<c:out value="${result.clbId}"/>','<c:out value="${result.cmmntyId}"/>')">
   		<c:out value="${result.clbNm}"/></a>
	</li>
</c:forEach>
	
</form>
</body>
</html>