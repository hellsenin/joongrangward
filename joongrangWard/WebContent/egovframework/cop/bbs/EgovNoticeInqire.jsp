<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<% 
 /**
  * @Class Name : EgovNoticeInqire.jsp
  * @Description : 게시물 조회 화면
  * @Modification Information
  * @
  * @  수정일      수정자            수정내용
  * @ -------        --------    ---------------------------
  * @ 2009.03.23   이삼섭          최초 생성
  *
  *  @author 공통서비스 개발팀 이삼섭
  *  @since 2009.03.23
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
<link href="<c:url value='/css/egovframework/cop/bbs/com.css' />" rel="stylesheet" type="text/css">
<link href="<c:url value='${brdMstrVO.tmplatCours}' />" rel="stylesheet" type="text/css">
<script type="text/javascript" src="<c:url value='/js/egovframework/cop/bbs/EgovBBSMng.js' />"></script>
<c:if test="${anonymous == 'true'}"><c:set var="prefix" value="/anonymous"/></c:if>
<script type="text/javascript">
	function onloading() {
		if ("<c:out value='${msg}'/>" != "") {
			alert("<c:out value='${msg}'/>");
		}
	}
	
	function fn_egov_select_noticeList(pageNo) {
		document.frm.pageIndex.value = pageNo; 
		document.frm.action = "<c:url value='/cop/bbs${prefix}/selectBoardList.do'/>";
		document.frm.submit();	
	}
	
	function fn_egov_delete_notice() {
		if ("<c:out value='${anonymous}'/>" == "true" && document.frm.password.value == '') {
			alert('등록시 사용한 패스워드를 입력해 주세요.');
			document.frm.password.focus();
			return;
		}
		
		if (confirm('<spring:message code="common.delete.msg" />')) {
			document.frm.action = "<c:url value='/cop/bbs${prefix}/deleteBoardArticle.do'/>";
			document.frm.submit();
		}	
	}
	
	function fn_egov_moveUpdt_notice() {
		if ("<c:out value='${anonymous}'/>" == "true" && document.frm.password.value == '') {
			alert('등록시 사용한 패스워드를 입력해 주세요.');
			document.frm.password.focus();
			return;
		}

		document.frm.action = "<c:url value='/cop/bbs${prefix}/forUpdateBoardArticle.do'/>";
		document.frm.submit();			
	}
	
	function fn_egov_addReply() {
		document.frm.action = "<c:url value='/cop/bbs${prefix}/addReplyBoardArticle.do'/>";
		document.frm.submit();			
	}	
</script>
<title><c:out value='${result.bbsNm}'/> - 글조회</title>
</head>
<body onload="onloading();">
<form name="frm" method="post" action="">
<input type="hidden" name="pageIndex" value="<c:out value='${searchVO.pageIndex}'/>"/>
<input type="hidden" name="bbsId" value="<c:out value='${result.bbsId}'/>" />
<input type="hidden" name="nttId" value="<c:out value='${result.nttId}'/>" />
<input type="hidden" name="parnts" value="<c:out value='${result.parnts}'/>" />
<input type="hidden" name="sortOrdr" value="<c:out value='${result.sortOrdr}'/>" />
<input type="hidden" name="replyLc" value="<c:out value='${result.replyLc}'/>" />
<input type="hidden" name="nttSj" value="<c:out value='${result.nttSj}'/>" />

<div id="border">

	<table width="100%" cellpadding="8" class="table-search" border="0">
	 <tr>
	  <td width="100%" class="title_left">
	   <img src="<c:url value='/images/egovframework/cop/bbs/icon/tit_icon.gif' />" width="16" height="16" hspace="3" align="absmiddle" alt="title icon">
	   &nbsp;<c:out value='${result.bbsNm}'/> - 글조회</td>
	 </tr>
	</table>
	<table width="100%" border="0" cellpadding="0" cellspacing="1" bgcolor="ffffff" class="generalTable">
	  <tr> 
	    <th width="15%" height="23" nowrap >제목</th>
	    <td width="85%" colspan="5" nowrap><c:out value="${result.nttSj}" />
	    </td>
	  </tr>
	  <tr> 
	    <th width="15%" height="23" nowrap >작성자</th>
	    <td width="15%" class="lt_text3" nowrap>
	    <c:choose>
	    	<c:when test="${anonymous == 'true'}">
	    		******
	    	</c:when>
	    	<c:when test="${result.ntcrNm == ''}">
	    		<c:out value="${result.frstRegisterNm}" />
	    	</c:when>
	    	<c:otherwise>
	    		<c:out value="${result.ntcrNm}" />
	    	</c:otherwise>
	    </c:choose>

	    </td>
	    <th width="15%" height="23" nowrap >작성시간</th>
	    <td width="15%" class="listCenter" nowrap><c:out value="${result.frstRegisterPnttm}" />
	    </td>
	    <th width="15%" height="23" nowrap >조회수</th>
	    <td width="15%" class="listCenter" nowrap><c:out value="${result.inqireCo}" />
	    </td>
	  </tr>    
	  <tr> 
	    <th height="23" >글내용</th>
	    <td colspan="5">
	     <div id="bbs_cn">
<c:out value="${result.nttCn}" escapeXml="false" />	
	     </div>
	    </td>
	  </tr>
	  <c:if test="${not empty result.atchFileId}">
		  <c:if test="${result.bbsAttrbCode == 'BBSA02'}">
		  <tr> 
		    <th height="23" >첨부이미지</th>
		    <td colspan="5">
					<c:import url="/cmm/fms/selectImageFileInfs.do" charEncoding="utf-8">
						<c:param name="atchFileId" value="${result.atchFileId}" />
					</c:import>
		    </td>
		  </tr>
		  </c:if>
		  <tr> 
		    <th height="23">첨부파일 목록</th>
		    <td colspan="6">
				<c:import url="/cmm/fms/selectFileInfs.do" charEncoding="utf-8">
					<c:param name="param_atchFileId" value="${result.atchFileId}" />
				</c:import>
		    </td>
		  </tr>
	  </c:if>
	  <c:if test="${anonymous == 'true'}">
	  <tr> 
	    <th height="23"><spring:message code="cop.password" /></th>
	    <td colspan="5">
	    	<input name="password" type="password" size="20" value="" maxlength="20" >
	    </td>
	  </tr>
	  </c:if>   
	</table>
	<table width="100%" border="0" cellspacing="0" cellpadding="0">
	  <tr> 
	    <td height="10"></td>
	  </tr>
	</table>
	<div align="center">
	<table width="100%"  border="0" cellspacing="0" cellpadding="0" align="center">
	<tr>
	 <td width="100%">
	 <div align="center">
		<table border="0" cellspacing="0" cellpadding="0" align="center">
			<tr> 
		     <c:if test="${result.frstRegisterId == sessionUniqId}">     
			      <td><img src="<c:url value='/images/egovframework/cop/bbs/btn/bu2_left.gif'/>" width="8" height="20" alt="button left"></td>
			      <td background="<c:url value='/images/egovframework/cop/bbs/btn/bu2_bg.gif'/>" class="text_left" nowrap>
			      <a href="javascript:fn_egov_moveUpdt_notice()">수정</a> 
			      </td>
			      <td><img src="<c:url value='/images/egovframework/cop/bbs/btn/bu2_right.gif'/>" width="8" height="20" alt="button right"></td> 
			      
			      <td width="10"></td>
			      <td><img src="<c:url value='/images/egovframework/cop/bbs/btn/bu2_left.gif'/>" width="8" height="20" alt="button left"></td>
			      <td background="<c:url value='/images/egovframework/cop/bbs/btn/bu2_bg.gif'/>" class="text_left" nowrap>
			      <a href="javascript:fn_egov_delete_notice()">삭제</a> 
			      </td>
			      <td><img src="<c:url value='/images/egovframework/cop/bbs/btn/bu2_right.gif'/>" width="8" height="20" alt="button right"></td>
		     </c:if>	
		     <c:if test="${result.replyPosblAt == 'Y'}">     
			      <td width="10"></td>
			      <td><img src="<c:url value='/images/egovframework/cop/bbs/btn/bu2_left.gif'/>" width="8" height="20" alt="button left"></td>
			      <td background="<c:url value='/images/egovframework/cop/bbs/btn/bu2_bg.gif'/>" class="text_left" nowrap>
			      <a href="javascript:fn_egov_addReply()">답글작성</a> 
			      </td>
			      <td><img src="<c:url value='/images/egovframework/cop/bbs/btn/bu2_right.gif'/>" width="8" height="20" alt="button right"></td>    
	          </c:if>
	          <td width="10"></td>
	          <td><img src="<c:url value='/images/egovframework/cop/bbs/btn/bu2_left.gif'/>" width="8" height="20" alt="button left"></td>
		      <td background="<c:url value='/images/egovframework/cop/bbs/btn/bu2_bg.gif'/>" class="text_left" nowrap>
		      <a href="javascript:fn_egov_select_noticeList('1')">목록</a> 
		      </td>
		      <td><img src="<c:url value='/images/egovframework/cop/bbs/btn/bu2_right.gif'/>" width="8" height="20" alt="button right"></td>    
			</tr>
		</table>
		</div>
	 </td>
	</tr>
	</table>
	</div>
</div>
</form>
</body>
</html>