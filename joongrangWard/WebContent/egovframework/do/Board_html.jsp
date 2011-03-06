<%@ page session="true"  contentType="text/html; charset=euc-kr" %>


<meta http-equiv="Content-Type" content="text/html; charset=euc-kr" />
<!-- #################### css 설정 start ###################### -->
<link href="/skin/css/blue/board_style.css" rel="stylesheet" type="text/css">
<!-- #################### css 설정 end ########################-->
<!-- ##### 폼 전송 시작 ##### -->
<form method="post" name="form" >
<input type="hidden" name="communityKey" value="B0009" />
<input type="hidden" name="pageNum"      value="1">
<input type="hidden" name="pageSize"     value="10">
<input type="hidden" name="act"          value="LIST" />
<input type="hidden" name="boardId"      value="" />
<input type="hidden" name="branch_session"      value="" />
<input type="hidden" name="only_reply" value="" />
<input type="hidden" name="mbo_mother_page"      value="/cms/board/board/Board.jsp" />
<input type="hidden" name="board_table_name"		value="WCM_BOARD_B0009" />
<input type="hidden" name="sort_type" value="DESC" />
<input type="hidden" name="sort_column" value="" />

<!--  리스트에서 게시물 삭제에 필요한 정보 시작 -->
<input type="hidden" name="memoTable"     value="WCM_BOARD_MEMO_B0009" />
<input type="hidden" name="login_id" value="nemo" />
<!--  리스트에서 게시물 삭제에 필요한 정보 끝 -->


<!-- ##### 폼 전송 끝 ##### -->
<!-- ************************  뷰 단에 리스트 보여질때 삭제 하는 부분 끝 ******************************* -->

<!-- ##### 게시판 시작 ##### -->

<!-- ##### 전체 테이블 시작 ##### -->

<div id="board_form" style="width:700">
		<!-- ### 분류 시작 ### -->
			
		<!-- ### 분류 끝 ### -->

		<!-- ### 답변달린 글만 보기 여부 시작  ### -->
			
		<!-- ### 답변달린 글만 보기 여부  끝 ### -->

			<!--접수용 이벤트 리스트 화면-->
			<div class="board_view">
				<table cellspacing="1" cellpadding="0" width="100%" class="view">
					<colgroup><col width="14%"><col width="36%"><col width="14%"><col width="36%"></colgroup>
					<tr>
						<th class="view">제목</th>
						<td colspan="3" class="view">고위정책과정</td>
					</tr>
					<tr>
						<th class="view">접수기간</th>
						<td class="view">2009년01월01일 ~ 2009년10월31일</td>
						<th class="view">등록일</th>
						<td class="view">2009/07/02
							 (2009/07/02 17:11:45)
						</td>
					</tr>

					

					

			
					<tr>
						<th class="view">E-Mail</th>
						<td colspan="3"  class="view" >&nbsp;</td>
					</tr>
				</table>
			</div>

			<!-- 글수 / 총글수 및 검색 관련 테이블 끝 -->

			<div class="board_list">
				<table cellspacing="1" cellpadding="0">
				<colgroup>
			
						<col width="15" /><col width="40" /><col width="*" /><col width="60" /><col width="70" /><col width="32" /><col width="40" />
					</colgroup>
					<thead>
					<tr>
						<th id="board_check"> <input type="checkbox" onClick="mboardCheckDelete()" name="all_chk"></th><th id="board_num">번호</th><th id="board_title">제목</th><th id="board_korname">작성자</th><th id="board_create">등록일</th><th id="board_file">첨부</th><th id="board_read"><a href="javascript:orderCount('READ_CNT');">조회</a></th>
			</tr>
					</thead>

		<!-- ##### 공지글 시작 ##### -->
				<tbody>
        
								<tr>
								<td headers="board_check"><input type="checkbox" value=1 name="chkBoardId"></td> 

									<td headers="board_num"><img src="/skin/images/alim.gif"></td>
								
								
												<td headers="board_title" title="555">
													<a href="javascript:mboardView(1,'A','Y','Y')">
												<span style="font-weight:bold">555</span>

											</a>
											
										</td>
								
							
												<td headers="board_korname">디코스</td>
							
												<td headers="board_create">2009-07-02</td>
							
											<td headers="board_file">
											&nbsp;

									</td>
							
												<td headers="board_read">6</td>
							
						</tr>

        
        <!-- ##### 공지글 끝 ##### -->
        <!-- ##### 게시글 시작 ##### -->
        

						<tr height="23">
						<td headers="board_check"><input type="checkbox" value=2 name="chkBoardId"></td> 

												<td headers="board_num">1</td>
							
												<td headers="board_title" title="11"><div>
										<a href="javascript:mboardView(2,
													'A',
													'Y',
													'Y')">
												11

												
														
												
												
													</a></div>
										</td>
							
													<td headers="board_korname">
												
													디코스
												
												
											</td>
									 
												<td headers="board_create">2009-07-02</td>
						
						
						<!--  첨부파일 시작  -->
							
										<td headers="board_file">
									&nbsp

								</td>
							
					<!-- 첨부파일 끝 -->

								<td headers="board_read">1</td>

						</tr>
        

        <!-- ##### 게시글 끝 ##### -->
		        </tbody>
      </table>
		</div>
   <!-- ##### 리스트 끝  ##### -->
		<div class="tfoot">
			<div class="list_num">
					출력수&nbsp;
					<select name="chg_page_size" onChange="chgPageSize()" style="height:18px;" class="pagesize">
						<option value="10"  SELECTED>10</option>
						<option value="15" >15</option>
						<option value="20"  >20</option>
						<option value="30" >30</option>
					</select>
					
						<a href="javascript:orderNotice();"><img src="/skin/images/btn_noticeadmin.gif" border="0" alt="공지순서관리" align="absmiddle"></a>
					
			</div>
			<div class="board_btn2">
		
		
				<a href="javascript:mboardDeleteBoard();"><img src="/skin/images/btn_del.gif" border="0" alt="삭제하기"></a>
		
					<a href="javascript:INSERT();"><img src="/skin/images/btn_write.gif" border="0" alt="등록하기"></a>
		
			</div>
			<div class="cb"></div>
		</div>
					<div class="page_nate"><a href="javascript:mboardGoPage(1, 10)"><img src='/skin/images/btn_first.gif' alt='처음 페이지로 버튼' border='0' align='absmiddle'></a>&nbsp;<a href="javascript:mboardGoPage(1, 10)"><img src='/skin/images/btn_prev.gif' alt='이전 10페이지로  버튼' border='0' align='absmiddle'></a>&nbsp;<a href="javascript:mboardGoPage(1, 10)"><span class='link'>1</span></a>&nbsp;<a href="javascript:mboardGoPage(1, 10)"><img src='/skin/images/btn_next.gif' alt='다음 10페이지로 버튼' border='0' align='absmiddle'></a>&nbsp;<a href="javascript:mboardGoPage(1, 10)"><img src='/skin/images/btn_end.gif' alt='끝 페이지로 버튼' border='0' align='absmiddle'></a></div>

</div>
</form>



