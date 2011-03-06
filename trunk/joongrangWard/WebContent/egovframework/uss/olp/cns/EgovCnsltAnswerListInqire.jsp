<%
 /**
  * @Class Name : EgovCnsltAnswerListInqire.jsp
  * @Description : EgovCnsltAnswerListInqire 화면
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
<title>EgovCnsltAnswerManageList</title>
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<link type="text/css" rel="stylesheet" href="/css/egovframework/uss/olp/cns/com.css" />
<script type="text/javaScript" language="javascript">

/*********************************************************
 * 초기화
 ******************************************************** */
function fn_egov_initl_cnsltanswerlist(){

	// 첫 입력란에 포커스..
	document.CnsltAnswerListForm.searchKeyword.focus();
	
}

/*********************************************************
 * 페이징 처리 함수
 ******************************************************** */
function fn_egov_select_linkPage(pageNo){
	
	document.CnsltAnswerListForm.pageIndex.value = pageNo;
	document.CnsltAnswerListForm.action = "<c:url value='/uss/olp/cnm/CnsltAnswerListInqire.do'/>";
   	document.CnsltAnswerListForm.submit();
   	
}

/*********************************************************
 * 조회 처리 함수
 ******************************************************** */
function fn_egov_search_cnsltdtlsanswer(){

	document.CnsltAnswerListForm.pageIndex.value = 1;
	document.CnsltAnswerListForm.submit();
	
}

/*********************************************************
 * 등록 처리 함수
 ******************************************************** */
function fn_egov_regist_cnsltanswercn(){
				
	document.CnsltAnswerListForm.action = "<c:url value='/uss/olp/cnm/CnsltAnswerCnRegistView.do'/>";
	document.CnsltAnswerListForm.submit();	
	
}

/* ********************************************************
 * 상세회면 처리 함수
 ******************************************************** */
function fn_egov_inquire_cnsltanswerdetail(cnsltId) {		

	// Q&A ID 셋팅.
	document.CnsltAnswerListForm.cnsltId.value = cnsltId;	
    document.CnsltAnswerListForm.action = "<c:url value='/uss/olp/cnm/CnsltAnswerDetailInqire.do'/>"; 
  	document.CnsltAnswerListForm.submit();	
	   	   		
}

</script>
</head>
<body onLoad="fn_egov_initl_cnsltanswerlist();">

<DIV id="content" style="width:700px">

<form name="CnsltAnswerListForm" action="<c:url value='/uss/olp/cnm/CnsltAnswerListInqire.do'/>" method="post">
<table width="100%" cellpadding="8" class="table-search" border="0">
 <tr>
  <td width="40%" class="title_left">
   <img src="/images/egovframework/uss/olp/cns/icon/tit_icon.gif" width="16" height="16" hspace="3" align="left">&nbsp;상담답변목록 조회</td>
  <th>
  </th>
  <td width="10%">
   	<select name="searchCondition" class="select">
		   <option selected value=''>--선택하세요--</option>
		   <option value="wrterNm"  <c:if test="${searchVO.searchCondition == 'wrterNm'}">selected="selected"</c:if> >작성자명</option>
		   <option value=qnaProcessSttusCodeNm  <c:if test="${searchVO.searchCondition == 'qnaProcessSttusCodeNm'}">selected="selected"</c:if> >진행상태</option>			   
	   </select>
	</td>
  
  <td width="35%">
    <input name="searchKeyword" type="text" size="35" value='<c:out value="${searchVO.searchKeyword}"/>'  maxlength="35" > 
  </td>
  
  <th width="10%">
   <table border="0" cellspacing="0" cellpadding="0">
    <tr> 
      <td><img src="/images/egovframework/uss/olp/cns/button/bu2_left.gif" width="8" height="20"></td> 
      
      <td background="/images/egovframework/uss/olp/cns/button/bu2_bg.gif" class="text_left" nowrap>
      		<a href="javascript:fn_egov_search_cnsltdtlsanswer();">조회</a> 
      </td>
      
      <td><img src="/images/egovframework/uss/olp/cns/button/bu2_right.gif" width="8" height="20"></td>
              
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
    <th class="title" width="40%" nowrap>상담제목</th>    
    <th class="title" width="10%" nowrap>작성자</th>        
    <th class="title" width="10%" nowrap>작성일자</th>
    <th class="title" width="10%" nowrap>진행상태</th>               
    <th class="title" width="10%" nowrap>조회수</th>                           
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
  <tr style="cursor:hand;" onClick="fn_egov_inquire_cnsltanswerdetail('<c:out value="${resultInfo.cnsltId}"/>')">
		<td class="lt_text3"><c:out value="${(searchVO.pageIndex-1) * searchVO.pageSize + status.count}"/></td>
		<td class="lt_text3"><c:out value="${resultInfo.cnsltSj}"/></td>
		<td class="lt_text3"><c:out value="${resultInfo.wrterNm}"/></td> 
		<td class="lt_text3"><fmt:formatDate value="${resultInfo.writngDe}"  pattern="yyyy-MM-dd"/></td>
		<td class="lt_text3"><c:out value="${resultInfo.qnaProcessSttusCodeNm}"/></td>
		<td class="lt_text3"><c:out value="${resultInfo.inqireCo}"/></td>						
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

<input name="cnsltId" type="hidden" value="">
<input name="passwordConfirmAt" type="hidden" value="">

<input name="pageIndex" type="hidden" value="<c:out value='${searchVO.pageIndex}'/>"/>

</form>

</DIV>

