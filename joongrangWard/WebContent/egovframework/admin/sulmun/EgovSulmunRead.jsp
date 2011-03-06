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
<title>고객참여 설문 보기</title>
<meta http-equiv="content-type" content="text/html; charset=utf-8" />

<link href="/admin/common/css/common_style.css" rel="stylesheet" type="text/css" />
<link href="/admin/common/css/board.css" rel="stylesheet" type="text/css" />

<script type="text/javaScript" language="javascript">

/* ********************************************************
 * 페이징 처리 함수
 ******************************************************** */
function linkPage(pageNo){
	document.frm.pageIndex.value = pageNo;
	document.frm.action = "<c:url value='/admin/sulmun/EgovSulmunList.do'/>";
   	document.frm.submit();
}
/* ********************************************************
 * 조회 처리 
 ******************************************************** */
function fnSelectList(){
	document.frm.action 			= "<c:url value='/admin/sulmun/EgovSulmunList.do'/>";
	document.frm.pageIndex.value 	= 1;
   	document.frm.submit();
}
/* ********************************************************
* 수정을 위한 처리 함수
******************************************************** */
function fnForUpdate(){
	document.frm.action 			= "<c:url value='/admin/sulmun/EgovSulmunModify.do'/>";
	document.frm.cmd.value 			= "";
	document.frm.submit();			
}
/* ********************************************************
 * 삭제 처리 함수
 ******************************************************** */
function fnDelete(){
	if(confirm("삭제하시겠습니까?")){
		document.frm.action 			= "<c:url value='/admin/sulmun/EgovSulmunDelete.do'/>";
		document.frm.cmd.value 			= "Delete";
		document.frm.submit();
	}
}
</script>
</head>


<body>

<form name="frm" method="post">

<input type="hidden" name="cmd">
<input type="hidden" name="sulmunId" value="${result.sulmunId}">
<input type="hidden" name="sulmunCategory" value="0">
<input type="hidden" name="pageIndex" value="${sulmun.pageIndex}"/>

<h3 class="tit_03">설문참여</h3>


<div  class="board_view">
<table class="view_type01" summary="제목, 참여URL, 결과URL, .. 로 구성되어 있습니다.">
	<caption>일반자료실 상세내용</caption>
	<colgroup>
		<col style="width:110px;"/>
		<col style="width:410px;"/>
		<col style="width:73px;"/>
		<col style="width:147px;"/>
	</colgroup>
	<tbody>
		<tr>
			<!-- 제목 -->
			<th scope="row">제목</th>
			<td colspan="3" class="output">${result.sulmunTitle}</td>
		</tr>
		<tr>
			<!-- 담당부서 -->
			<th scope="row">담당부서</th>
			<td colspan="3" class="output">
				<c:forEach var="dept" items="${deptList}" varStatus="status">
					<c:if test="${dept.deptCode == result.deptId}">${dept.deptNm}</c:if>
				</c:forEach>
			</td>
		</tr>
		<tr>
			<!-- 참여URL -->
			<th scope="row">참여URL</th>
			<td colspan="3" class="output">
				<a href="${result.partUrl}" title="새창열림" target="_blank">
					${result.partUrl}
				</a>
			</td>
		</tr>
		<tr>
			<!-- 결과URL -->
			<th scope="row">결과URL</th>
			<td colspan="3" class="output">
				<a href="${result.resultUrl}" title="새창열림" target="_blank">
					${result.resultUrl}
				</a>
			</td>
		</tr>
		<tr>
			<!-- 설문기간 -->
			<th scope="row">설문기간</th>
			<td class="output">${result.startDate} ~ ${result.endDate}</td>
			<!-- 설문상태 -->
			<th scope="row">설문상태</th>
			<td class="output">
				<c:if test="${result.state == '1'}">진행중</c:if>
				<c:if test="${result.state == '2'}">완료</c:if>
			</td>
		</tr>
		<tr>
			<!-- 설문 내용 -->
			<th scope="row">설문 내용</th>
			<td class="output" colspan="3">
				<c:out value="${result.sulmunDesc}" escapeXml="false" />
			</td>
		</tr>
	</tbody>
</table>
</div>
</form>

<div id="btn_area">
	<div class="btn_right_fl">
		<a href="javascript:fnForUpdate()"><img src="/admin/images/common/btn/btn_modify.gif" alt="수정" /></a>
		<a href="javascript:fnDelete()"><img src="/admin/images/common/btn/btn_delete.gif" alt="삭제" /></a>
	</div>
	<div class="btn_right_fr">
		<a href="javascript:linkPage('${sulmun.pageIndex}')"><img src="/admin/images/common/btn/btn_list.gif" alt="목록" /></a>	
	</div>
</div><!-- btn end -->


</body>
</html>