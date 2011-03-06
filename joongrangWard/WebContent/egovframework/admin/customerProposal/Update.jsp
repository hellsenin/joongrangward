<%@ page language="java" contentType="text/html; charset=utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="validator" uri="http://www.springmodules.org/tags/commons-validator" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<link href="/admin/common/css/common_style.css" rel="stylesheet" type="text/css" />
<link href="/admin/common/css/board.css" rel="stylesheet" type="text/css" />

<script type="text/javascript" src="<c:url value='/namo/js/namo_scripteditor.js'/>"></script>

<script type="text/javascript" src="/portal/open_content/system/js/miya_validator.js"></script>
<script type="text/javascript" src="/portal/open_content/system/js/util.js"></script>
<script type="text/javascript">
function checkForm(isAccept) {
	
	document.getElementById("acceptComment").value = CrossEditor.GetBodyValue();
	document.getElementById("isAccept").value = isAccept;
	if(confirm('채택하시겠습니까?')) {
		return true;	
	} else {
		false;
	}
	
	
}
</script>


<h3 class="tit_03">고객제안 (채택하기)</h3>

<div class="text_area_2">
	<!-- 신청인 정보 -->
	<!--<jsp:include page="/portal/dev_content/apply/userInfo.jsp" flush="true" />-->
	<form name="fm" method="post" enctype="multipart/form-data" action="<c:url value='/admin/customerProposal/updateAccept.do'/>">
	<input type="hidden" value="${result.code}" name="code" id="code" />
	<input type="hidden" value="${result.isAccept}" name="isAccept" id="isAccept" />
	<input type="hidden" value="${CustomerProposal.pageIndex}" name="pageIndex" id="pageIndex" />
	
	
	<div class="board_view">
	
	
	<table class="view_type01" summary="제안보기">
		<caption>제안보기</caption>
		<colgroup>
			<col width="20%" />
			<col width="*" />
		</colgroup>
		<tbody>
			<tr>
				<th scope="row">등록일</th>
				<td class="output">
					<fmt:formatDate value="${result.regDt}" pattern="yyyy년 M월 d일"/>
				</td>
			</tr>
			<tr>
				<th scope="row">제목</th>
				<td class="output">${result.title}</td>
			</tr>
			<tr>
				<th scope="row">개요</th>
				<td class="output">${result.summary}</td>
			</tr>
			<tr>
				<th scope="row">현황 및 문제점</th>
				<td class="output">${result.currentAndProblem}</td>
			</tr>
			<tr>
				<th scope="row">개선 내용</th>
				<td class="output">${result.improveContent}</td>
			</tr>
			<tr>
				<th scope="row">개선 효과</th>
				<td class="output">${result.improveEffect}</td>
			</tr>
			<tr>
				<th scope="row">조치 사항</th>
				<td class="output">
					<c:set var="action_arr" value="${fn:split(result.action, ',')}"/>
					<label for="item0">
						<input type="checkbox" id="item0" class="va" <c:if test="${fn:trim(action_arr[0]) == '1'}">checked="checked"</c:if>/>
						관련규정 개정
					</label>
					<label for="item1">
						<input type="checkbox" id="item1" class="va" <c:if test="${fn:trim(action_arr[1]) == '1'}">checked="checked"</c:if>/>
						인력추가 지원
					</label>
					<label for="item2">
						<input type="checkbox" id="item2" class="va" <c:if test="${fn:trim(action_arr[2]) == '1'}">checked="checked"</c:if>/>
						예산확보 지원
					</label>
					<label for="item3">
						<input type="checkbox" id="item3" class="va" <c:if test="${fn:trim(action_arr[3]) == '1'}">checked="checked"</c:if>/>
						업무프로세스 조정
					</label>
					<label for="item4">
						<input type="checkbox" id="item4" class="va" <c:if test="${fn:trim(action_arr[4]) == '1'}">checked="checked"</c:if>/>
						관련기관 협의 
					</label>
				</td>
			</tr>
			<tr>
				<th scope="row">첨부 파일</th>
				<td class="output">
					<c:forEach var="files" items="${fileList}" varStatus="status">
						<a href="/portal/minwon/fileDown.do?fileId=${files.fileId}">${files.orgFileName}</a>
					</c:forEach>
				</td>
			</tr>
		</tbody>
	</table>
	</div>
	
	
	
	<div class="board_view">
	<table class="view_type01" summary="채택하기">
		<caption>채택하기</caption>
		<colgroup>
			<col width="20%" />
			<col width="*" />
		</colgroup>
		<tbody>
			<tr>
				<th scope="row">채택 사유</th>
				<td class="outputEditor">
					<input type="hidden" id="acceptComment" name="acceptComment" value='<c:out value="${result.acceptComment}" escapeXml="false"/>' />
					<script>
						var CrossEditor = new NamoSE('acceptComment');
						CrossEditor.editorStart();
						CrossEditor.SetValue(document.getElementById('acceptComment').value);
					</script>
				</td>
			</tr>
		</tbody>
	</table>
	</div>
	
	
	<div id="btn_area">
		<div class="btn_right_fl">
			<c:if test="${result.isAccept == 'N'}">
				<input type="image" value="/admin/images/common/btn/btn_modify.gif" alt="채택하기" onclick="return checkForm('Y');"/>
			</c:if>
			<c:if test="${result.isAccept == 'Y'}">
				<input type="image" value="/admin/images/common/btn/btn_modify.gif" alt="채택취소하기" onclick="return checkForm('N');"/>
			</c:if>
			<a href="javascript:delete_confirm();"><img src="/admin/images/common/btn/btn_delete.gif" alt="삭제" /></a>
		</div>
		<div class="btn_right_fr">
			<a href="/admin/customerProposal/selectList.do?pageIndex=${CustomerProposal.pageIndex}">
				<img src="/admin/images/common/btn/btn_list.gif" alt="목록" />
			</a>
		</div>
	</div>
	
	</form>
</div>
