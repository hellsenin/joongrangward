<%@ page session="true"  contentType="text/html; charset=euc-kr" %>

<!-- #################### css 설정 start ###################### -->
<link href="/skin/css/blue/board_style.css" rel="stylesheet" type="text/css">
<!-- #################### css 설정 end ########################-->

<!-- ##### 게시판 시작 ##### -->

<!-- ##### 전체 테이블 시작 ##### -->
<meta http-equiv="Content-Type" content="text/html; charset=euc-kr" />
<p style="color:red;font-weight:bold;margin:5px 0;">교육프로그램 작성자 신청정보 뷰페이지  </p>
<div id="board_form" style="width:700">
			
			<!-- 접수용 이벤트 뷰 화면-->
			<div class="board_view">
				<table cellspacing="1" cellpadding="0" width="100%" class="view">
					<colgroup><col width="14%"><col /></colgroup>
					<tr>
						<th class="view">ID</th>
						<td class="view">aaaa</td>
					</tr>
					<tr>
						<th class="view">작성자</th>
						<td class="view">홍길동</td>
					</tr>
					<tr>
						<th class="view">우편번호</th>
						<td class="view">111-111</td>
					</tr>
					<tr>
						<th class="view">주소</th>
						<td class="view">서울시 금천구 시흥동 1020</td>
					</tr>
					<tr>
						<th class="view">전화번호</th>
						<td class="view">02-212-2222</td>
					</tr>
					<tr>
						<th class="view">이메일</th>
						<td class="view"><a href="#">kkkk@gc.go.kr</a></td>
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
				<a href="javascript:showPasswordForm(document.form,'EDIT');"><img src="/skin/images/btn_modify.gif" alt="수정" border="0"></a>&nbsp;
				<a href="javascript:showPasswordForm(document.form,'DELETE');"><img src="/skin/images/btn_del.gif" alt="삭제" border="0"></a>&nbsp;
				<a href="board_list03.jsp"><img src="/skin/images/btn_list.gif" alt="목록" border="0"></a>				
			</span>
		<div>

		<!-- 목록, 수정, 삭제 버튼 끝-->



</div>
</form>
<font color="red">${requestScope['jspPage']}</font>



