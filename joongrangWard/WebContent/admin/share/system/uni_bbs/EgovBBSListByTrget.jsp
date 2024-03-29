<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<% 
 /**
  * @Class Name : EgovBBSListByTarget.jsp
  * @Description : 커뮤니티/동호회 사용 게시판 목록 조회 포틀릿화면
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
<link href="<c:url value='/css/egovframework/cop/bbs/com.css' />" rel="stylesheet" type="text/css">
<script type="text/javascript">
	function press(event) {
		if (event.keyCode==13) {
			fn_egov_select_brdMstr('1');
		}
	}
	
	function fn_egov_insert_addBrdMstr(){	
		document.frm.action = "<c:url value='/cop/bbs/addBBSMasterByTrget.do'/>";
		document.frm.submit();
	}
	
	function fn_egov_select_brdMstr(pageNo){
		document.frm.pageIndex.value = pageNo; 
		document.frm.action = "<c:url value='/cop/bbs/selectBdMstrListByTrget.do'/>";
		document.frm.submit();	
	}
	
	function fn_egov_inqire_brdMstr(bbsId){
		document.frm.bbsId.value = bbsId;
		document.frm.param_bbsId.value = bbsId;
		document.frm.param_trgetId.value = document.frm.trgetId.value;
		document.frm.action = "<c:url value='/cop/bbs/SelectBBSMasterInfByTrget.do'/>";
		document.frm.submit();			
	}
</script>
<title>게시판 정보</title>
</head>
<body>

<form name="frm" action ="" method="post">
<input type="hidden" name="bbsId" value="">
<input type="hidden" name="trgetId" value="${trgetId}">
<input type="hidden" name="param_bbsId" value="">
<input type="hidden" name="param_trgetId" value="">

<div id="border" style="width:730px">
	<table width="100%" cellpadding="8" class="table-search" border="0">
	 <tr>
	  <td width="40%"class="title_left">
	   <img src="<c:url value='/images/egovframework/cop/bbs/icon/tit_icon.gif' />" width="16" height="16" hspace="3" align="absmiddle" alt="title icon">
	   &nbsp;게시판 정보</td>
	  <th >
	  </th>
	  <td width="10%" >
	   		<select name="searchCnd" class="select">
			   <!-- option selected value=''>--선택하세요--</option-->
			   <option value="0" <c:if test="${searchVO.searchCnd == '0'}">selected="selected"</c:if> >게시판명</option>
			   <option value="1" <c:if test="${searchVO.searchCnd == '1'}">selected="selected"</c:if> >게시판유형</option>	
		   </select>
		</td>
	  <td widht="35%">
	    <input name="searchWrd" type="text" size="35" value='<c:out value="${searchVO.searchWrd}"/>' maxlength="35" onkeypress="press(event);"> 
	  </td>
	  <th width="10%">
	   <table border="0" cellspacing="0" cellpadding="0">
	    <tr> 
	      <td><img src="<c:url value='/images/egovframework/cop/bbs/btn/bu2_left.gif' />" width="8" height="20" alt="button left"></td>
	      <td background="<c:url value='/images/egovframework/cop/bbs/btn/bu2_bg.gif'/>" class="text_left" nowrap>
	      <a href="javascript:fn_egov_select_brdMstr('1')">조회</a> 
	      </td>
	      <td><img src="<c:url value='/images/egovframework/cop/bbs/btn/bu2_right.gif'/>" width="8" height="20" alt="button right"></td>
	      <td>&nbsp;&nbsp;</td>
	      <td><img src="<c:url value='/images/egovframework/cop/bbs/btn/bu2_left.gif'/>" width="8" height="20" alt="button left"></td>
	      <td background="<c:url value='/images/egovframework/cop/bbs/btn/bu2_bg.gif'/>" class="text_left" nowrap>
	      <a href="javascript:fn_egov_insert_addBrdMstr()">등록</a> 
	      </td>
	      <td><img src="<c:url value='/images/egovframework/cop/bbs/btn/bu2_right.gif'/>" width="8" height="20" alt="button right"></td>     
	    </tr>
	   </table>
	  </th>  
	 </tr>
	</table>
	<table width="100%" cellpadding="8" class="table-line">
	 <thead>
	  <tr>
	    <!-- th class="title" width="3%" nowrap><input type="checkbox" name="all_check" class="check2"></th-->  
	    <th class="title" width="10%" nowrap>번호</th>
	    <th class="title" width="44%" nowrap>게시판명</th>
	    <th class="title" width="10%" nowrap>게시판유형</th>
	    <th class="title" width="10%" nowrap>게시판속성</th>
	    <th class="title" width="15%" nowrap>생성일</th>   
	    <th class="title" width="8%" nowrap>사용여부</th>         
	  </tr>
	 </thead>     
	 <tbody>
	  <tr>
		 <c:forEach var="result" items="${resultList}" varStatus="status">
		  <tr>
		    <!--td class="lt_text3" nowrap><input type="checkbox" name="check1" class="check2"></td-->
		    <td class="lt_text3" nowrap><c:out value="${(searchVO.pageIndex-1) * searchVO.pageSize + status.count}"/></td>		    
		    <td class="lt_text3" nowrap>
		    <c:choose>
		    	<c:when test="${result.useAt == 'N'}">
		    		<c:out value="${result.bbsNm}"/>
		    	</c:when>
		    	<c:otherwise>
			    	<a href="javascript:fn_egov_inqire_brdMstr('<c:out value="${result.bbsId}"/>')">
			    	<c:out value="${result.bbsNm}"/></a>		    	
		    	</c:otherwise>
		    </c:choose>
		    </td>
		    <td class="lt_text3" nowrap><c:out value="${result.bbsTyCodeNm}"/></td>
		    <td class="lt_text3" nowrap><c:out value="${result.bbsAttrbCodeNm}"/></td>
		    <td class="lt_text3" nowrap><c:out value="${result.frstRegisterPnttm}"/></td>
		    <td class="lt_text3" nowrap>
		    	<c:if test="${result.useAt == 'N'}"><spring:message code="button.notUsed" /></c:if>
		    	<c:if test="${result.useAt == 'Y'}"><spring:message code="button.use" /></c:if>
		    </td>  
		  </tr>
		 </c:forEach>	  
		 <c:if test="${fn:length(resultList) == 0}">
		  <tr>
		    <td class="lt_text3" nowrap colspan="6" ><spring:message code="common.nodata.msg" /></td>  
		  </tr>		 
		 </c:if>
	 </tbody>  
	 <!--tfoot>
	  <tr class="">
	   <td colspan=6 align="center"></td>
	  </tr>
	 </tfoot -->
	</table>
	<table width="100%" border="0" cellspacing="0" cellpadding="0">
	  <tr> 
	    <td height="10"></td>
	  </tr>
	</table>
	<div align="center">
		<ui:pagination paginationInfo="${paginationInfo}" type="image" jsFunction="fn_egov_select_brdMstr" />
	</div>
	<input name="pageIndex" type="hidden" value="${searchVO.pageIndex}"/>
</div>
</form>
</body>
</html>