<%
 /**
  * @Class Name  : EgovCcmAdministCodeList.jsp
  * @Description : EgovCcmAdministCodeList 화면
  * @Modification Information
  * @
  * @  수정일             수정자                   수정내용
  * @ -------    --------    ---------------------------
  * @ 2009.04.01   이중호              최초 생성
  *
  *  @author 공통서비스팀 
  *  @since 2009.04.01
  *  @version 1.0
  *  @see
  *  
  *  Copyright (C) 2009 by MOPAS  All right reserved.
  */
%>

<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<html>
<head>
<title>의정참여 설문 관리</title>
<meta http-equiv="content-type" content="text/html; charset=utf-8" />

<link rel="stylesheet" type="text/css" href="/admin/common/css/common_style.css">
<link rel="stylesheet" type="text/css" href="/admin/common/css/board.css">
<script type="text/javaScript" language="javascript">

/* ********************************************************
 * 페이징 처리 함수
 ******************************************************** */
function linkPage(pageNo){
	var varForm				= document.all["frm"];
	varForm.pageIndex.value = pageNo;
	varForm.action 			= "<c:url value='/admin/sulmun/EgovSulmunList.do'/>";
	varForm.submit();
}
/* ********************************************************
 * 조회 처리 
 ******************************************************** */
function fnSearch(){
	var varForm				= document.all["frm"];
	varForm.pageIndex.value = 1;
	varForm.action 			= "<c:url value='/admin/sulmun/EgovSulmunList.do'/>";
	varForm.submit();
}
/* ********************************************************
* 등록을 위한 처리 함수 
******************************************************** */
function fnForRegist(){
	var varForm				= document.all["frm"];
	varForm.cmd.value 		= "";
	varForm.action 			= "<c:url value='/admin/sulmun/EgovSulmunRegist.do'/>";
	varForm.submit();
}
/* ********************************************************
 * 상세회면 처리 함수
 ******************************************************** */
function fnDetail(sulmunId){
	var varForm				= document.all["frm"];
	varForm.sulmunId.value 	= sulmunId;
	varForm.action 			= "<c:url value='/admin/sulmun/EgovSulmunRead.do'/>";
	varForm.submit();
}
</script>
</head>


<body>

<div id="content" style="display">

<form name="frm" method="post">

<input type="hidden" name="cmd">
<input type="hidden" name="sulmunId">
<input type="hidden" name="sulmunCategory" value="1">
<input name="pageIndex" type="hidden" value="${sulmun.pageIndex}"/>

<h3 class="tit_03">설문관리 목록</h3>

<fieldset id="src">
	<legend>게시판 게시물검색</legend>	
	
	<span class="boardsearch">
	<label for="stributary" class="blind">게시물 분류 선택</label>
		<select name="searchCondition" class="select">
		   <option value='' <c:if test="${sulmun.searchCondition == ''}">selected="selected"</c:if>>선택</option>
		   <option value='1' <c:if test="${sulmun.searchCondition == '1'}">selected="selected"</c:if>>제목</option>
		   <option value='2' <c:if test="${sulmun.searchCondition == '2'}">selected="selected"</c:if>>부서</option>
	   </select>
	<label for="input1">
		<input id="input1" type="text" title="검색어입력" style="width:130px" name="searchKeyword" value="${sulmun.searchKeyword}"/>
	</label>
	<label for="input2">
		<input id="input2" type="image" alt="검색" src="/images/common/btn/btn_search_01.gif" onClick="javascript:fnSearch();"/>
	</label>
	</span>
</fieldset><!-- 게시판 게시물검색 end -->

<table class="list_type01" summary="종로구청 설문조사 게시판입니다">
	<caption>종로구청 설문조사 목록 보기</caption>
	<colgroup>
		<col width="8%" />
		<col width="*" />
		<col width="25%" />
		<col width="15%" />
		<col width="12%" />

		<col width="12%" />
	</colgroup>
	<thead>
		<tr>
			<th scope="col">번호</th>
			<th scope="col">제목</th>
			<th scope="col">설문기간</th>
			<!-- 
			<th scope="col">참여하기 URL</th>
			<th scope="col">결과보기 URL</th>
			 -->
			<th scope="col">담당부서</th>
			<th scope="col" width="10%">진행상태</th>
			<!-- <th scope="col" width="10%">상태</th> -->
		</tr>
	</thead>
	<tbody>
		<c:forEach items="${resultList}" var="resultInfo" varStatus="status">
			<tr style="cursor:pointer;cursor:hand;" onclick="javascript:fnDetail('${resultInfo.sulmunId}');">
				<td style="text-align: center;"><c:out value="${(paginationInfo.totalRecordCount + 1) - ((sulmun.pageIndex - 1) * sulmun.pageSize + status.count)}"/></td>
				<td style="text-align: left;">${resultInfo.sulmunTitle}</td>
				<td>${resultInfo.startDate} ~ ${resultInfo.endDate}</td>
				<!-- 
				<td style="text-align: left;">${resultInfo.partUrl}</td>
				<td style="text-align: left;">${resultInfo.resultUrl}</td>
				 -->
				<td style="text-align: center;">${resultInfo.deptName}</td>
				<td style="text-align: center;">
					<c:if test="${resultInfo.state == '1'}">진행중</c:if>
					<c:if test="${resultInfo.state == '2'}">완료</c:if>	
				</td>
				<!-- <td style="text-align: center;">${resultInfo.state}</td> -->
			</tr>
		</c:forEach>

		<c:if test="${fn:length(resultList) == 0}">
			<tr> 
				<td class="lt_text3" colspan="7">
					<spring:message code="common.nodata.msg" />
				</td>
			</tr>   	          				 			   
		</c:if>
	</tbody>
</table>

</form>

<div id="btn_area">
	<div class="btn_right_fr">
		<a href="javascript:fnForRegist();"><img src="/images/common/btn/btn_regist.gif" alt="등록" /></a>	
	</div>					
</div>

<div id="paging">
	<div class="paging_con">
		${pagination}	
	</div>
</div><!-- paging end //-->


</div>



</body>
</html>