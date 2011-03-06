<%
 /**
  * @Class Name : EgovQnaAnswerListInqire.jsp
  * @Description : EgovQnaAnswerListInqire 화면
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
<title>EgovQnaAnswerManageList</title>
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<link type="text/css" rel="stylesheet" href="/css/egovframework/uss/olh/qna/com.css" />
<script type="text/javaScript" language="javascript">

/*********************************************************
 * 초기화
 ******************************************************** */
function fn_egov_initl_qnaanswerlist(){

	// 첫 입력란에 포커스..
	document.QnaAnswerListForm.searchKeyword.focus();
	
}

/*********************************************************
 * 페이징 처리 함수
 ******************************************************** */
function fn_egov_select_linkPage(pageNo){
	
	document.QnaAnswerListForm.pageIndex.value = pageNo;
	document.QnaAnswerListForm.action = "<c:url value='/uss/olh/qnm/QnaAnswerListInqire.do'/>";
   	document.QnaAnswerListForm.submit();
   	
}

/*********************************************************
 * 조회 처리 함수
 ******************************************************** */
function fn_egov_search_qnacnanswer(){

	document.QnaAnswerListForm.pageIndex.value = 1;
	document.QnaAnswerListForm.submit();
	
}

/*********************************************************
 * 등록 처리 함수
 ******************************************************** */
function fn_egov_regist_qnaanswercn(){
				
	document.QnaAnswerListForm.action = "<c:url value='/uss/olh/qnm/QnaAnswerCnRegistView.do'/>";
	document.QnaAnswerListForm.submit();	
	
}

/* ********************************************************
 * 상세회면 처리 함수
 ******************************************************** */
function fn_egov_inquire_qnaanswerdetail(qaId) {		

	// Q&A ID 셋팅.
	document.QnaAnswerListForm.qaId.value = qaId;	
    document.QnaAnswerListForm.action = "<c:url value='/uss/olh/qnm/QnaAnswerDetailInqire.do'/>"; 
  	document.QnaAnswerListForm.submit();	
	   	   		
}

</script>
</head>
<body onLoad="fn_egov_initl_qnaanswerlist();">

<DIV id="content" style="width:700px">

<form name="QnaAnswerListForm" action="<c:url value='/uss/olh/qnm/QnaAnswerListInqire.do'/>" method="post">
<table width="100%" cellpadding="8" class="table-search" border="0">
 <tr>
  <td width="40%" class="title_left">
   <img src="/images/egovframework/uss/olh/qna/icon/tit_icon.gif" width="16" height="16" hspace="3" align="left">&nbsp;Q&A답변목록 조회</td>
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
      <td><img src="/images/egovframework/uss/olh/qna/button/bu2_left.gif" width="8" height="20"></td> 
      
      <td background="/images/egovframework/uss/olh/qna/button/bu2_bg.gif" class="text_left" nowrap>
      		<a href="javascript:fn_egov_search_qnacnanswer();">조회</a> 
      </td>
      
      <td><img src="/images/egovframework/uss/olh/qna/button/bu2_right.gif" width="8" height="20"></td>
              
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
    <th class="title" width="10%" nowrap>작성자</th>        
    <th class="title" width="10%" nowrap>진행상태</th>               
    <th class="title" width="10%" nowrap>조회수</th>        
    <th class="title" width="10%" nowrap>작성일자</th>                   
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
  <tr style="cursor:hand;" onClick="fn_egov_inquire_qnaanswerdetail('<c:out value="${resultInfo.qaId}"/>')">
		<td class="lt_text3"><c:out value="${(searchVO.pageIndex-1) * searchVO.pageSize + status.count}"/></td>
		<td class="lt_text3"><c:out value="${resultInfo.qestnSj}"/></td>
		<td class="lt_text3"><c:out value="${resultInfo.wrterNm}"/></td>
		<td class="lt_text3"><c:out value="${resultInfo.qnaProcessSttusCodeNm}"/></td>
		<td class="lt_text3"><c:out value="${resultInfo.inqireCo}"/></td>				
		<td class="lt_text3"><c:out value='${fn:substring(resultInfo.writngDe, 0,4)}'/>-<c:out value='${fn:substring(resultInfo.writngDe, 4,6)}'/>-<c:out value='${fn:substring(resultInfo.writngDe, 6,8)}'/>		
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

<input name="qaId" type="hidden" value="">
<input name="passwordConfirmAt" type="hidden" value="">

<input name="pageIndex" type="hidden" value="<c:out value='${searchVO.pageIndex}'/>"/>

</form>

</DIV>

