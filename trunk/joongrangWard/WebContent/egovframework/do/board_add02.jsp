<%@ page session="true"  contentType="text/html; charset=euc-kr" %>

<!-- #################### css 설정 start ###################### -->

<link href="/cms/common/css/mp01.css" rel="stylesheet" type="text/css">
<link rel="STYLESHEET" type="text/css" href="/cms/common/calendar/calendar-system.css" >
<link href="/skin/css/blue/board_style.css" rel="stylesheet" type="text/css">
<!-- #################### css 설정 end ########################-->
<script language="JavaScript" src="/cms/common/js/common.js"></script>
<script language="JavaScript" src="/cms/common/js/ajax.js" ></script>
<script language="JavaScript" src="/cms/board/common/BoardCommon.js" ></script>
<script type="text/javascript" src="/cms/common/calendar/calendar.js"></script>
<script type="text/javascript" src="/cms/common/calendar/calendar-en.js"></script>

<!-- ##### 게시판 시작 ##### -->

<!-- ##### 전체 테이블 시작 ##### -->
<meta http-equiv="Content-Type" content="text/html; charset=euc-kr" />
<p style="color:red;font-weight:bold;margin:5px 0;">동적온라인 시스템 이벤트 추가 </p>
<div id="board_form" style="width:700">
			
		<!-- 교육용 입력폼1 시작-->
		<div class="board_write">
				<table cellspacing="1" cellpadding="0" width="100%">
					<colgroup><col width="14%"><col /></colgroup>
					<tr>
						<th>분 류</th>
						<td>
							<input type="radio" name="notifyYN" value="Y" style="border:0"> 접수용  &nbsp;
							<input type="radio" name="notifyYN" value="N" style="border:0" checked> 교육용</td>
					</tr>
					<tr>
						<th>제목</th>
						<td>
							<input name="title" type="text"  class="box1" style="width:98%"  value="">
						</td>
					</tr>
					<tr>
						<th>중복접수여부</th>
						<td>
							<input type="radio" name="mapplyYN" value="Y" style="border:0" checked> 허용  &nbsp;
							<input type="radio" name="mapplyYN" value="N" style="border:0"> 비허용
						</td>
					</tr>
					<tr>
						<th>관리담당자</th>
						<td>
								<input name="search1" type="text"  class="box1" style="width:240px"  value="">&nbsp; <img src="/skin/images/btn_finds.gif" alt="찾기"  align="absmiddle" style="vertical-align:top;"  />
						</td>
					</tr>
					<tr>
						<th>메뉴위치</th>
						<td>
								<input name="search2" type="text"  class="box1" style="width:240px"  value="">&nbsp; <img src="/skin/images/btn_finds.gif" alt="찾기"  align="absmiddle" style="vertical-align:top;"  />
						</td>
					</tr>

				</table>	
			</div> <!--  board_write -->
			<!--  입력폼1 끝 -->

			<!--##### 확인 취소 버튼 시작 #####-->
			<div class="board_btn">
				<a href="javascript:save(document.form, 'INSERT','');"><img src="/skin/images//btn_confirm.gif" alt="확인 버튼"></a>
				<!--a href="javascript:list(document.form);" --><a href="board_list01.jsp"><img src="/skin/images/btn_cancel.gif" alt="취소 버튼"></a>
			</div><br/>
			
		<!--##### 확인 취소 버튼 끝 #####-->



</div>
<font color="red">${requestScope['jspPage']}</font>
</form>



