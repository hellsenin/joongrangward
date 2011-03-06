<%@ page session="true"  contentType="text/html; charset=euc-kr" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="onlineZvl" value="${requestScope['onlineZvl']}"   scope="page" />
<c:set var="fieldZvl" value="${requestScope['fieldZvl']}"   scope="page" />
<!-- #################### css 설정 start ###################### -->
<link href="/skin/css/blue/board_style.css" rel="stylesheet" type="text/css">
<!-- #################### css 설정 end ########################-->

<!-- ##### 게시판 시작 ##### -->

<!-- ##### 전체 테이블 시작 ##### -->
<meta http-equiv="Content-Type" content="text/html; charset=euc-kr" />
<p style="color:red;font-weight:bold;margin:5px 0;">교육프로그램 뷰 페이지 </p>
<div id="board_form" style="width:700">
			
			<!-- 접수용 이벤트 뷰 화면-->
			<div class="board_view">
				<table cellspacing="1" cellpadding="0" width="100%" class="view">
					<colgroup><col width="14%"><col /></colgroup>
					<tr>
						<th class="view">과정명</th>
						<td class="view">${onlineZvl.TITLE[0]}</td>
					</tr>
					<tr>
						<th class="view">접수기간</th>
						<td class="view">${onlineZvl.RECEIPT_SDATE[0]} ~ ${onlineZvl.RECEIPT_EDATE[0]}</td>
					</tr>
					<tr>
						<th class="view">교육기간</th>
						<td class="view">${onlineZvl.LEC_SDATE[0]} ~ ${onlineZvl.LEC_EDATE[0]}</td>
					</tr>
					<c:if test="${fieldZvl.size>0}">
					  <c:forEach var="x" begin="0" end="${fieldZvl.size-1}">
					<tr>
						<th class="view">${fieldZvl.FIELD_NAME[x]}</th>
						<td class="view">${fieldZvl.FIELD_VALUE[x]}</td>
					</tr>
						</c:forEach>
				  </c:if>
					<tr>
						<th class="view">상태</th>
						<td class="view">${onlineZvl.STATUS[0]}</td>
					</tr>
				<!--  본문 내용 끝 -->
				</table>	

			</div> <!--  board_view -->

			<!-- 목록, 수정, 삭제 버튼 -->
	 
			<!-- *********************************************************************************** 
				common/ListModiDeletePage.jsp 
				목록 수정 삭제 하는 버튼 부분을 따로 페이지로 뺐다. 
			**************************************************************************************-->
		<div style="padding:5px 0 0 0;">
			<span style="width:60%">				
			</span>
			<span style="width:40%;text-align:right;">					
				<a href="/A_online.do?method=updateSubPage&did=${param.did}"><img src="/skin/images/btn_modify.gif" alt="수정" border="0"></a>&nbsp;
				<a href="javascript:del();"><img src="/skin/images/btn_del.gif" alt="삭제" border="0"></a>&nbsp;
				<a href="/A_online.do?method=view&did=${onlineZvl.PARENT_ID[0]}"><img src="/skin/images/btn_list.gif" alt="목록" border="0"></a>				
			</span>
		<div>

		<!-- 목록, 수정, 삭제 버튼 끝-->



</div>
</form>
<font color="red">${requestScope['jspPage']}</font>



