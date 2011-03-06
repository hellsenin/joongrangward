<%@ page language="java" contentType="text/html; charset=utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="validator" uri="http://www.springmodules.org/tags/commons-validator" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>


<link rel="stylesheet" type="text/css" href="/admin/common/css/common_style.css">
<link rel="stylesheet" type="text/css" href="/admin/common/css/board.css">

<script type="text/javascript" src="/js/egovframework/admin/sulmun/Calendar.js" ></script>
<script type="text/javascript" src="<c:url value='/namo/js/namo_scripteditor.js'/>"></script>
<script type="text/javascript" src="<c:url value='/js/egovframework/cmm/sym/zip/EgovZipPopup.js'/>" ></script>

<script type="text/javascript" src="/portal/open_content/system/js/miya_validator.js"></script>
<script type="text/javascript" src="/portal/open_content/system/js/util.js"></script>
<script>

function checkAndSubmit() {
	if (confirm('등록하시겠습니까?')) {
		return true;
	} else {
		return false;
	}
};
</script>

<form name="fm" method="post" action="<c:url value='/admin/educationLecturer/insert.do'/>" enctype="multipart/form-data">

<h4 class="tit_05">제안 내용</h4>
<!-- write form start -->
<div  class="board_view">
	<table summary="고객 제안하기입니다" class="view_type01">
		<caption>고객 제안하기 쓰기 페이지</caption>
		<colgroup>
			<col width="20%" />
			<col width="30%" />
			<col width="20%" />
			<col width="30%" />
		</colgroup>
		
		<tbody>
			<tr>
				<th scope="row"><label for="regDateStr">등록일</label></th>
				<td class="output" colspan="3">
					<input type="text" id="regDateStr" style="width:125px" class="board1" value="${CURR_DATE_FORMAT}" readonly="readonly" />
				</td>							
			</tr>
			<tr>
				<th scope="row"><label for="title">제목</label></th>
				<td colspan="3" class="output">
					<input type="text" id="title" style="width:90%" class="board1" readonly="readonly" />
				</td>
			</tr>
			<tr>
				<th scope="row"><label for="summary">개요</label></th>
				<td colspan="3" class="output">
					<textarea name="summary" id="summary" cols="50" rows="3" style="width:90%;">
					</textarea>
				</td>
			</tr>
			<tr>
				<th scope="row"><label for="currentAndProblem">현황 및 문제점</label></th>
				<td colspan="3" class="output">
					<textarea name="currentAndProblem" id="currentAndProblem" cols="50" rows="3" style="width:90%;">
					</textarea>
				</td>
			</tr>
		
			<tr>
				<th scope="row"><label for="improveContent">개선내용</label></th>
				<td colspan="3" class="output">
					<textarea name="improveContent" id="improveContent" cols="50" rows="3" style="width:90%;">
					</textarea>
				</td>
			</tr>
			<tr>
				<th scope="row"><label for="improveEffect">개선효과</label></th>
				<td colspan="3" class="output">
					<textarea name="improveEffect" id="improveEffect" cols="50" rows="3" style="width:90%;">
					</textarea>
				</td>
			</tr>
			<tr>
				<th scope="row">조치사항</th>
				<td colspan="3" class="output">
					<c:set var="action_arr" value="${fn:split(action, ',')}"/>
					<label for="item1">
						<input type="checkbox" id="item1" class="va" <c:if test="${action_arr[0] == '1'}">checked="checked"</c:if>/>
						관련규정 개정
					</label>
					<label for="item2">
						<input type="checkbox" id="item2" class="va" <c:if test="${action_arr[0] == '1'}">checked="checked"</c:if>/>
						인력추가 지원
					</label>
					<label for="item3">
						<input type="checkbox" id="item3" class="va" <c:if test="${action_arr[0] == '1'}">checked="checked"</c:if>/>
						예산확보 지원
					</label>
					<label for="item4">
						<input type="checkbox" id="item4" class="va" <c:if test="${action_arr[0] == '1'}">checked="checked"</c:if>/>
						업무프로세스 조정
					</label>
					<label for="item5">
						<input type="checkbox" id="item5" class="va" <c:if test="${action_arr[0] == '1'}">checked="checked"</c:if>/>
						관련기관 협의 
					</label>
					
				</td>
			</tr>
			<tr>
				<th scope="row" rowspan="3" class="con_tit">첨부파일</th>
				<td colspan="3">									
					<a href="#"><input type="image" src="/portal/open_content/images/common/btn/btn_add.gif" class="vam" alt="첨부파일 추가" /></a>
					<a><input type="image" src="/portal/open_content/images/common/btn/btn_rowdel.gif" class="vam" alt="삭제" /></a>
				</td>
			</tr>
			<tr>
				<td colspan="3" class="b_bl">
					<input name="file1" type="file" title="첫번째첨부파일" class="b_text" size="60" style="width:90%" />	
				</td>
			</tr>
			
			<tr>
				<td colspan="3" class="b_bl">
					※ 첨부파일 <br/>
					- 이미지 및 문서 파일만 등록<br/>
					- 최대 용량 5 M<br/>
					- 첨부파일 최대 3개까지 등록 가능
				</td>
			</tr>

		</tbody>
	</table>
</div>


<div id="btn_area">
	<div class="btn_right_fr">
		<a href="javascript:checkAndSubmit();"><img src="/admin/images/common/btn/btn_regist.gif" style="border: 0px;"/></a>
		<c:if test="${openerPage == 'EducationLecturerInsert'}">
			<a href="<c:url value="/admin/educationLecturer/selectList.do"/>"><img src="/admin/images/common/btn/btn_list.gif" alt="목록" /></a>
		</c:if>
	</div>
</div>

</form>
