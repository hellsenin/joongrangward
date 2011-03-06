<%
 /**
  * @Class Name  : EgovSulmunModify.jsp
  * @Description : EgovSulmunModify 화면
  * @Modification Information
  * @
  * @  수정일             수정자                   수정내용
  * @ -------    --------    ---------------------------
  * @ 2009.11.10   김명구              최초 생성
  *
  *  @author 공통서비스팀 
  *  @since 2009.11.10
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
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="validator" uri="http://www.springmodules.org/tags/commons-validator" %>
<html>
<head>
<title>의정참여 설문 수정</title>
<meta http-equiv="content-type" content="text/html; charset=utf-8" />

<link rel="stylesheet" type="text/css" href="/admin/common/css/common_style.css">
<link rel="stylesheet" type="text/css" href="/admin/common/css/board.css">

<validator:javascript formName="administCode" staticJavascript="false" xhtml="true" cdata="false"/>

<script type="text/javascript" src="<c:url value="/validator.do"/>"></script>
<script type="text/javascript" src="<c:url value='/namo/js/namo_scripteditor.js'/>"></script>
<script type="text/javascript" src="/js/egovframework/admin/sulmun/Calendar.js"></script>
<script type="text/javaScript">

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
* 수정 처리 함수
******************************************************** */
function fnUpdate(){
	if(confirm("수정하시겠습니까?")){
		document.getElementById("sulmunDesc").value = CrossEditor.GetBodyValue();
		document.frm.action 			= "<c:url value='/admin/sulmun/EgovSulmunModify.do'/>";
		document.frm.cmd.value 			= "Modify";
		document.frm.submit();
	}			
}
</script>
</head>

<body>
<!-- ------------------------------------------------------------------ 상단타이틀 -->
<form name="frm" method="post" enctype="multipart/form-data">

<input name="cmd" type="hidden" value="Modify">

<input type="hidden" name="sulmunId" value="${result.sulmunId}">
<input type="hidden" name="sulmunCategory" value="1">
<input type="hidden" name="delFlag" value="${result.delFlag}"/>
<input type="hidden" name="pageIndex" value="${sulmun.pageIndex}"/>

<!-- ----------------- 상단 타이틀  영역 -->
<h3 class="tit_03">설문 수정</h3>

<!-- ------------------------------------------------------------------ 수정  폼 영역  -->

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
			<td colspan="3" class="output">
				<input type="text" name="sulmunTitle" value="${result.sulmunTitle}" style="width:400px;"/>
			</td>
		</tr>
		<tr>
			<!-- 담당부서 -->
			<th scope="row">담당부서</th>
			
			<td colspan="3" class="output">
				<select id="deptId" name="deptId">
					<c:forEach var="dept" items="${deptList}" varStatus="status">
						<option value="${dept.deptCode}" <c:if test="${dept.deptCode == deptId}">selected="selected"</c:if> >${dept.deptNm}</option>
					</c:forEach>
				</select>
			</td>
		</tr>
		<tr>
			<!-- 참여URL -->
			<th scope="row">참여URL</th>
			<td colspan="3" class="output">
				<input type="text" name="partUrl" value="${result.partUrl}" style="width:400px;"/>
			</td>
		</tr>
		<tr>
			<!-- 결과URL -->
			<th scope="row">결과URL</th>
			<td colspan="3" class="output">
				<input type="text" name="resultUrl" value="${result.resultUrl}" style="width:400px;"/>
			</td>
		</tr>
		<tr>
			<!-- 설문기간 -->
			<th scope="row">설문기간</th>
			<td colspan="3" class="output">
				<input type="text" name="startDate" value="${result.startDate}"/><img src="/images/calendar.gif" width="24" height="22" border="0" align="absmiddle" onclick="Calendar_D(document.frm.startDate)"/>
    			~
				<input type="text" name="endDate" value="${result.endDate}"/><img src="/images/calendar.gif" width="24" height="22" border="0" align="absmiddle" onclick="Calendar_D(document.frm.endDate)"/>
			</td>
		</tr>
		<tr>
			<!-- 설문상태 -->
			<th scope="row">설문상태</th>
			<td class="output">
				<select id="state" name="state">
					<option value="1" <c:if test="${result.state == '1'}">selected="selected"</c:if>>진행중</option>
					<option value="2" <c:if test="${result.state == '2'}">selected="selected"</c:if>>완료</option>
				</select>
			</td>
		</tr>
		<tr>
			<th scope="row"><label for="sulmunDesc">설문내용</label></th>
			<td colspan="3" class="outputEditor">
				<input type="hidden" id="sulmunDesc" name="sulmunDesc" value='<c:out value="${result.sulmunDesc}" escapeXml="false"/>' />
				<script>
					var CrossEditor = new NamoSE('sulmunDesc');
					CrossEditor.editorStart();
					CrossEditor.SetValue(document.getElementById('sulmunDesc').value);
				</script>
			</td>
		</tr>
	</tbody>
</table>
</div>

</form>



<div id="btn_area">
	<div class="btn_right_fr">
		<a href="javascript:fnUpdate();"><img src="/admin/images/common/btn/btn_regist.gif" alt="등록" /></a>
		<a href="javascript:linkPage('${sulmun.pageIndex}');"><img src="/admin/images/common/btn/btn_list.gif" alt="목록" /></a>	
	</div>
</div><!-- btn end -->

</body>
</html>


