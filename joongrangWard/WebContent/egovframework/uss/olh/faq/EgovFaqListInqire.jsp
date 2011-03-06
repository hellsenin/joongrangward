<%
 /**
  * @Class Name : EgovFaqListInqire.jsp
  * @Description : EgovFaqListInqire 화면
  * @Modification Information
  * @
  * @  수정일             수정자                   수정내용
  * @ -------    --------    ---------------------------
  * @ 2009.02.01   박정규              최초 생성
  *
  *  @author 공통서비스팀 
  *  @since 2009.02.01
  *  @version 1.0
  *  @see
  *  
  *  Copyright (C) 2009 by MOPAS  All right reserved.
  */
%>

<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"  %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<html>
<head>
<title>EgovFaqManageList</title>
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<link type="text/css" rel="stylesheet" href="/css/egovframework/uss/olh/faq/com.css" />
<script type="text/javaScript" language="javascript">

/*********************************************************
 * 초기화
 ******************************************************** */
function fn_egov_initl_faqlist(){

	// 첫 입력란에 포커스..
	document.FaqListForm.searchKeyword.focus();
	
}

/*********************************************************
 * 페이징 처리 함수
 ******************************************************** */
function fn_egov_select_linkPage(pageNo){
	
	document.FaqListForm.pageIndex.value = pageNo;
	document.FaqListForm.action = "<c:url value='/uss/olh/faq/FaqListInqire.do'/>";
   	document.FaqListForm.submit();
   	
}

/*********************************************************
 * 조회 처리 함수
 ******************************************************** */
function fn_egov_search_faq(){

	document.FaqListForm.pageIndex.value = 1;
	document.FaqListForm.submit();
	
}

/*********************************************************
 * 등록 처리 함수
 ******************************************************** */
function fn_egov_regist_faq(){

	document.FaqListForm.action = "<c:url value='/uss/olh/faq/FaqCnRegistView.do'/>";
	document.FaqListForm.submit();	
	
}

/*********************************************************
 * 수정 처리 함수
 ******************************************************** */
function fn_egov_updt_faqlist(){

	document.FaqListForm.action = "<c:url value='/uss/olh/faq/FaqCnUpdtView.do'/>";
	document.FaqListForm.submit();	

}
/* ********************************************************
 * 상세회면 처리 함수
 ******************************************************** */
function fn_egov_inquire_faqlistdetail(faqId) {		

	// Faqid
	document.FaqListForm.faqId.value = faqId;	
//  document.FaqListForm.action = "<c:url value='/uss/olh/faq/FaqListDetailInqire.do'/>";
  	document.FaqListForm.action = "<c:url value='/uss/olh/faq/FaqInqireCoUpdt.do'/>";  	
  	document.FaqListForm.submit();	
	   	   		
}


</script>
</head>
<body onLoad="fn_egov_initl_faqlist();">

<DIV id="content" style="width:712px">

<form name="FaqListForm" action="<c:url value='/uss/olh/faq/FaqListInqire.do'/>" method="post">
<table width="100%" cellpadding="8" class="table-search" border="0">
 <tr>
  <td width="40%" class="title_left">
   <img src="/images/egovframework/uss/olh/faq/icon/tit_icon.gif" width="16" height="16" hspace="3" align="left">&nbsp;FAQ 목록 조회</td>
  <th>
  </th>
  <td width="10%">
   	<select name="searchCondition" class="select">
		   <option selected value=''>--선택하세요--</option>
		   <option value="qestnSj"  <c:if test="${searchVO.searchCondition == 'qestnSj'}">selected="selected"</c:if> >질문제목</option>			   
	   </select>
	</td>
  
  <td width="35%">
    <input name="searchKeyword" type="text" size="35" value='<c:out value="${searchVO.searchKeyword}"/>'  maxlength="35" > 
  </td>
  
  <th width="10%">
   <table border="0" cellspacing="0" cellpadding="0">
    <tr> 
      <td><img src="/images/egovframework/uss/olh/faq/button/bu2_left.gif" width="8" height="20"></td> 
      
      <td background="/images/egovframework/uss/olh/faq/button/bu2_bg.gif" class="text_left" nowrap>
      		<a href="javascript:fn_egov_search_faq();">조회</a> 
      </td>
      
      <td><img src="/images/egovframework/uss/olh/faq/button/bu2_right.gif" width="8" height="20"></td>
      
      <td>&nbsp;&nbsp;</td>
      
      <td><img src="/images/egovframework/uss/olh/faq/button/bu2_left.gif" width="8" height="20"></td>
      
      <td background="/images/egovframework/uss/olh/faq/button/bu2_bg.gif" class="text_left" nowrap>
      		<a href="javascript:fn_egov_regist_faq();">등록</a> 
      </td>
      
      <td><img src="/images/egovframework/uss/olh/faq/button/bu2_right.gif" width="8" height="20"></td>
      
      <td>&nbsp;&nbsp;</td>
        
    </tr>
   </table>
  </th>  
 </tr>
</table>

<table width="100%" cellspacing="0" cellpadding="0" border="0">
<tr>
	<td height="3px"></td>
</tr>
</table>

<table width="98%" cellpadding="8" class="table-line" border="0">
<thead>
<tr>      
    <th class="title" width="5%" nowrap>순번</th>        
    <th class="title" width="40%" nowrap>질문제목</th>                   
    <th class="title" width="5%" nowrap>조회수</th>        
    <th class="title" width="10%" nowrap>등록일자</th>               
    
</tr>
</thead>

 <c:if test="${fn:length(resultList) == 0}">
  <tr> 
  	<td class="lt_text3" colspan=10>
  		<spring:message code="common.nodata.msg" />
  	</td>
  </tr>   	          				 			   
 </c:if>
    
<tbody>      
<c:forEach items="${resultList}" var="resultInfo" varStatus="status">
  <tr style="cursor:hand;" onClick="fn_egov_inquire_faqlistdetail('<c:out value="${resultInfo.faqId}"/>')">
		<td class="lt_text3"><c:out value="${(searchVO.pageIndex-1) * searchVO.pageSize + status.count}"/></td>	        
		<td class="lt_text3"><c:out value="${resultInfo.qestnSj}"/></td>		
		<td class="lt_text3"><c:out value="${resultInfo.inqireCo}"/></td>		
		<td class="lt_text3"><fmt:formatDate value="${resultInfo.lastUpdusrPnttm}"  pattern="yyyy-MM-dd"/></td>			
  </tr>   
</c:forEach>
</tbody>  
</table>


<table width="100%" cellspacing="0" cellpadding="0" border="0">
<tr>
	<td height="3px"></td>
</tr>
</table>

<div align="center">
	<div>
		<ui:pagination paginationInfo = "${paginationInfo}"
				type="image"
				jsFunction="fn_egov_select_linkPage"
				/>
	</div>
</div>

<input name="faqId" type="hidden" value="">

<input name="pageIndex" type="hidden" value="<c:out value='${searchVO.pageIndex}'/>"/>

</form>

</DIV>

