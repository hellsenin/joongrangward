<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<% 
 /**
  * @Class Name : EgovCmmntyMsg.jsp
  * @Description : 커뮤니티 관리 공통 메시지 처리화면
  * @Modification Information
  * @
  * @  수정일      수정자            수정내용
  * @ -------        --------    ---------------------------
  * @ 2009.04.08   이삼섭          최초 생성
  *
  *  @author 공통서비스 개발팀 이삼섭
  *  @since 2009.04.08
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
<title>승인(탈퇴) 요청</title>
</head>
<body>
	<br/>
	<div align="center">
	<table>
		<tr>
			<td>
				<c:choose>
					<c:when test="${returnMsg==''}">
						<spring:message code="cop.request.msg" />
					</c:when>
					<c:when test="${returnMsg=='DEL_REQ_SUCCESS'}">
						<spring:message code="success.request.msg" />
					</c:when>
					<c:when test="${returnMsg=='ING'}">
						<spring:message code="cop.ing.msg" />
					</c:when>
					<c:otherwise>
						<spring:message code="common.isExist.msg" />
					</c:otherwise>
				</c:choose>
			</td>
		</tr>
	</table>
	<table border="0" cellspacing="0" cellpadding="0" align="center">
	<tr> 
      <td><img src="<c:url value='/images/egovframework/cop/bbs/btn/bu2_left.gif'/>" width="8" height="20" alt="button left"></td>
      <td background="<c:url value='/images/egovframework/cop/bbs/btn/bu2_bg.gif'/>" class="text_left" nowrap>
      <a href="javascript:window.close()">닫기</a> 
      </td>
      <td><img src="<c:url value='/images/egovframework/cop/bbs/btn/bu2_right.gif'/>" width="8" height="20" alt="button right"></td> 
	</tr>
	</table>	
	</div>	
</body>
</html>