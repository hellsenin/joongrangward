<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<% 
 /**
  * @Class Name : EgovClubInqire.jsp
  * @Description : 동호회 조회화면
  * @Modification Information
  * @
  * @  수정일      수정자            수정내용
  * @ -------        --------    ---------------------------
  * @ 2009.04.06   이삼섭          최초 생성
  *
  *  @author 공통서비스 개발팀 이삼섭
  *  @since 2009.04.06
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
<link href="<c:url value='/css/egovframework/cop/clb/com.css' />" rel="stylesheet" type="text/css" >
<script type="text/javascript">
	function fn_egov_updtClb(){
		document.frm.action = "<c:url value='/cop/clb/forUpdateClbInf.do'/>";
		document.frm.submit();	
	}
	function fn_egov_select_clbInfs(){
		document.frm.action = "<c:url value='/cop/clb/selectClubInfs.do'/>";
		document.frm.submit();		
	}	
</script>
<title>동호회 정보조회</title>
</head>
<body>
<form name="frm" method="post">
<input name="pageIndex" type="hidden" value="<c:out value='${searchVO.pageIndex}'/>"/>
<input type="hidden" name="clbId"  value='<c:out value="${clubVO.clbId}" />'/>

<div id="border" style="width:730px">
	<table width="100%" cellpadding="8" class="table-search" border="0">
	 <tr>
	  <td width="100%"class="title_left">
	  <img src="<c:url value='/images/egovframework/cop/clb/icon/tit_icon.gif' />" width="16" height="16" hspace="3" align="absmiddle" alt="title icon">
	   &nbsp;동호회 정보조회</td>
	 </tr>
	</table>
	<table width="100%" border="0" cellpadding="0" cellspacing="1" class="table-register">
	  <tr> 
	    <th width="20%" height="23" class="" nowrap >동호회 명</th>
	    <td width="80%" nowrap colspan="3">
	      <c:out value="${clubVO.clbNm}" />
	    </td>
	  </tr>
	  <tr> 
	    <th height="23" class="" >동호회 소개</th>
	    <td colspan="3">
	      <c:out value="${clubVO.clbIntrcn}" /> 
	    </td>
	  </tr>
	  <tr> 
	    <th width="20%" height="23" class="" nowrap >템플릿 정보</th>
	    <td width="30%" nowrap colspan="3">
	     <c:out value="${clubVO.tmplatNm}" />
	    </td>
	  </tr>
	  <tr> 
	    <th width="20%" height="23" class="" nowrap >게시판 정보</th>
	    <td width="30%" nowrap colspan="3">
	    	<c:forEach var="result" items="${result}" varStatus="status">
	     		<c:out value="${result.bbsNm}" /> / 
	     	</c:forEach>	    
	    </td>
	  </tr>  
	  <tr> 
	    <th width="20%" height="23" class="" nowrap >사용여부</th>
	    <td width="80%" nowrap class="" colspan="3"> 
	    <c:if test="${clubVO.useAt == 'Y'}"><spring:message code="button.use" /></c:if>
	    <c:if test="${clubVO.useAt == 'N'}"><spring:message code="button.notUsed" /></c:if>
	    </td> 
	  </tr> 
	  <tr> 
	    <th width="20%" height="23" class="" nowrap >생성자</th>
	    <td width="30%" nowrap>
	     <c:out value="${clubVO.frstRegisterNm}" />
	    </td>
	    <th width="20%" height="23" class="" nowrap >생성일시</th>
	    <td width="30%" nowrap>
	     <c:out value="${clubVO.frstRegisterPnttm}" />
	    </td>    
	  </tr>
	  <tr> 
	    <th width="20%" height="23" class="" nowrap >제공 URL</th>
	    <td width="80%" nowrap colspan="3">
			<a href="<c:out value="${clubVO.provdUrl}" />" target="_new">
	    	   	<c:out value="${clubVO.provdUrl}" />
			</a>
	    </td>
	  </tr>           
	</table>
	<table width="100%" border="0" cellspacing="0" cellpadding="0">
	  <tr> 
	    <td height="10"></td>
	  </tr>
	</table>
	<div align="center">
	<table border="0" cellspacing="0" cellpadding="0" align="center">
	<tr>
	  <c:if test="${clubVO.useAt == 'Y'}">
      <td><img src="<c:url value='/images/egovframework/cop/cmy/btn/bu2_left.gif'/>" width="8" height="20" alt="button left"></td>
      <td background="<c:url value='/images/egovframework/cop/cmy/btn/bu2_bg.gif'/>" class="text_left" nowrap>
      <a href="javascript:fn_egov_updtClb()">수정</a> 
      </td>
      <td><img src="<c:url value='/images/egovframework/cop/cmy/btn/bu2_right.gif'/>" width="8" height="20" alt="button right"></td> 
      <td width="10"></td>
      </c:if>
      <td><img src="<c:url value='/images/egovframework/cop/cmy/btn/bu2_left.gif'/>" width="8" height="20" alt="button left"></td>
      <td background="<c:url value='/images/egovframework/cop/cmy/btn/bu2_bg.gif'/>" class="text_left" nowrap>
      <a href="javascript:fn_egov_select_clbInfs()">목록</a> 
      </td>
      <td><img src="<c:url value='/images/egovframework/cop/cmy/btn/bu2_right.gif'/>" width="8" height="20" alt="button right"></td>  
	</tr>
	</table>
	</div>
</div>
</form>
</body>
</html>