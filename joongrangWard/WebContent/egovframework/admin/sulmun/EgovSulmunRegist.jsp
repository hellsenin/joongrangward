<%
 /**
  * @Class Name  : EgovSulmunRegist.jsp
  * @Description : EgovSulmunRegist 화면
  * @Modification Information
  * @
  * @  수정일             수정자                   수정내용
  * @ -------    --------    ---------------------------
  * @ 2009.11.09   김명구              최초 생성
  *
  *  @author 공통서비스팀 
  *  @since 2009.11.09
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
<title>고객참여 설문 등록</title>
<meta http-equiv="content-type" content="text/html; charset=utf-8" />

<link rel="stylesheet" type="text/css" href="/admin/common/css/common_style.css">
<link rel="stylesheet" type="text/css" href="/admin/common/css/board.css">

<validator:javascript formName="administCode" staticJavascript="false" xhtml="true" cdata="false"/>

<script type="text/javascript" src="<c:url value="/validator.do"/>"></script>
<script type="text/javascript" src="<c:url value='/namo/js/namo_scripteditor.js'/>"></script>
<script type="text/javascript" src="/js/egovframework/admin/sulmun/Calendar.js"></script>

<script type="text/javascript" src="/portal/open_content/system/js/miya_validator.js"></script>
<script type="text/javascript" src="/portal/open_content/system/js/util.js"></script>
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
* 등록 처리 함수 
******************************************************** */
function fnInsert(){
	document.getElementById("sulmunDesc").value = CrossEditor.GetBodyValue();

	
	var v = new MiyaValidator(document.frm);
    v.add("sulmunTitle", {
    	required: true
    });
    v.add("partUrl", {
    	required: true
    });
    v.add("resultUrl", {
        required: true
    });
    v.add("startDate", {
        required: true
    });
    v.add("endDate", {
        required: true
    });
    v.add("sulmunDesc", {
        required: true
    });
    
    var result = v.validate();
    if (!result) {
        alert(v.getErrorMessage());
        v.getErrorElement().focus();
    } 
    else {        
    	if(confirm("등록하시겠습니까?")){
    		document.frm.action 			= "<c:url value='/admin/sulmun/EgovSulmunRegist.do'/>";
    		document.frm.cmd.value 			= 'Regist';
    		document.frm.submit();
    	}
    }
	
}
</script>

</head>

<body>


<form method="post" name="frm" enctype="multipart/form-data">

<input type="hidden" name="cmd"/>
<input type="hidden" name="delFlag" value="1"/>
<input type="hidden" name="sulmunId" value="${sulmun.sulmunId}"/>
<input type="hidden" name="sulmunCategory" value="0">
<input type="hidden" name="pageIndex" value="${sulmun.pageIndex}"/>

<div  class="board_view">
<!-- ------------------------------------------------------------------ 등록  폼 영역  -->
<table summary="게시판 쓰기 페이지 입니다" class="view_type01">
	<caption>게시판 쓰기</caption>
	<colgroup>
		<col width="20%" />
		<col width="30%" />
		<col width="20%" />
		<col width="30%" />
	</colgroup>
	<tbody>
		<tr>
			<th scope="row">제목</th>
			<td colspan="3" class="output">
				<input type="text" name="sulmunTitle" size="50" maxlength="200" style="width:400px;"/>
			</td>
		</tr>
		<tr>
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
			<th scope="row">등록일</th>
			<td colspan="3" class="output">
				<input type="text" size="50" value="${currDate}" readonly="readonly"/>
			</td>
		</tr>
		<tr>
			<th scope="row">기간</th>
			<td colspan="3" class="output">
				<input type="text" name="startDate" readonly="readonly"/><img src="/images/calendar.gif" width="24" height="22" border="0" align="absmiddle" onclick="Calendar_D(document.frm.startDate)"/>
    			~
				<input type="text" name="endDate" readonly="readonly"/><img src="/images/calendar.gif" width="24" height="22" border="0" align="absmiddle" onclick="Calendar_D(document.frm.endDate)"/>
			</td>
		</tr>
		<tr>
			<th scope="row">참여하기 URL</th>
			<td colspan="3" class="output">
				<input type="text" name="partUrl" size="50" maxlength="200" style="width:400px;" value="${sulmun.partUrl}"/>
			</td>
		</tr>
		<tr>
			<th scope="row">결과보기 URL</th>
			<td colspan="3" class="output">
				<input type="text" name="resultUrl" size="50" maxlength="200" style="width:400px;" value="${sulmun.resultUrl}"/>
			</td>
		</tr>
		<tr>
			<th scope="row">상태</th>
			<td colspan="3" class="output">
				<select id="state" name="state">
					<option value="1">진행중</option>
					<option value="2">완료</option>
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
		<a href="/admin/sulmun/EgovSulmunList.do?pageIndex=${sulmun.pageIndex}">
			<img src="/admin/images/common/btn/btn_list.gif" alt="목록" />
		</a>
	</div>
	
	<div class="btn_right_fr" style="margin-right: 3px;">
		<a href="javascript:fnInsert();"><img src="/admin/images/common/btn/btn_regist.gif" alt="등록" /></a>
	</div>
	
</div><!-- btn end -->
</body>
</html>