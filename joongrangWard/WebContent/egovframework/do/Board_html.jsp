<%@ page session="true"  contentType="text/html; charset=euc-kr" %>


<meta http-equiv="Content-Type" content="text/html; charset=euc-kr" />
<!-- #################### css ���� start ###################### -->
<link href="/skin/css/blue/board_style.css" rel="stylesheet" type="text/css">
<!-- #################### css ���� end ########################-->
<!-- ##### �� ���� ���� ##### -->
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

<!--  ����Ʈ���� �Խù� ������ �ʿ��� ���� ���� -->
<input type="hidden" name="memoTable"     value="WCM_BOARD_MEMO_B0009" />
<input type="hidden" name="login_id" value="nemo" />
<!--  ����Ʈ���� �Խù� ������ �ʿ��� ���� �� -->


<!-- ##### �� ���� �� ##### -->
<!-- ************************  �� �ܿ� ����Ʈ �������� ���� �ϴ� �κ� �� ******************************* -->

<!-- ##### �Խ��� ���� ##### -->

<!-- ##### ��ü ���̺� ���� ##### -->

<div id="board_form" style="width:700">
		<!-- ### �з� ���� ### -->
			
		<!-- ### �з� �� ### -->

		<!-- ### �亯�޸� �۸� ���� ���� ����  ### -->
			
		<!-- ### �亯�޸� �۸� ���� ����  �� ### -->

			<!--������ �̺�Ʈ ����Ʈ ȭ��-->
			<div class="board_view">
				<table cellspacing="1" cellpadding="0" width="100%" class="view">
					<colgroup><col width="14%"><col width="36%"><col width="14%"><col width="36%"></colgroup>
					<tr>
						<th class="view">����</th>
						<td colspan="3" class="view">������å����</td>
					</tr>
					<tr>
						<th class="view">�����Ⱓ</th>
						<td class="view">2009��01��01�� ~ 2009��10��31��</td>
						<th class="view">�����</th>
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

			<!-- �ۼ� / �ѱۼ� �� �˻� ���� ���̺� �� -->

			<div class="board_list">
				<table cellspacing="1" cellpadding="0">
				<colgroup>
			
						<col width="15" /><col width="40" /><col width="*" /><col width="60" /><col width="70" /><col width="32" /><col width="40" />
					</colgroup>
					<thead>
					<tr>
						<th id="board_check"> <input type="checkbox" onClick="mboardCheckDelete()" name="all_chk"></th><th id="board_num">��ȣ</th><th id="board_title">����</th><th id="board_korname">�ۼ���</th><th id="board_create">�����</th><th id="board_file">÷��</th><th id="board_read"><a href="javascript:orderCount('READ_CNT');">��ȸ</a></th>
			</tr>
					</thead>

		<!-- ##### ������ ���� ##### -->
				<tbody>
        
								<tr>
								<td headers="board_check"><input type="checkbox" value=1 name="chkBoardId"></td> 

									<td headers="board_num"><img src="/skin/images/alim.gif"></td>
								
								
												<td headers="board_title" title="555">
													<a href="javascript:mboardView(1,'A','Y','Y')">
												<span style="font-weight:bold">555</span>

											</a>
											
										</td>
								
							
												<td headers="board_korname">���ڽ�</td>
							
												<td headers="board_create">2009-07-02</td>
							
											<td headers="board_file">
											&nbsp;

									</td>
							
												<td headers="board_read">6</td>
							
						</tr>

        
        <!-- ##### ������ �� ##### -->
        <!-- ##### �Խñ� ���� ##### -->
        

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
												
													���ڽ�
												
												
											</td>
									 
												<td headers="board_create">2009-07-02</td>
						
						
						<!--  ÷������ ����  -->
							
										<td headers="board_file">
									&nbsp

								</td>
							
					<!-- ÷������ �� -->

								<td headers="board_read">1</td>

						</tr>
        

        <!-- ##### �Խñ� �� ##### -->
		        </tbody>
      </table>
		</div>
   <!-- ##### ����Ʈ ��  ##### -->
		<div class="tfoot">
			<div class="list_num">
					��¼�&nbsp;
					<select name="chg_page_size" onChange="chgPageSize()" style="height:18px;" class="pagesize">
						<option value="10"  SELECTED>10</option>
						<option value="15" >15</option>
						<option value="20"  >20</option>
						<option value="30" >30</option>
					</select>
					
						<a href="javascript:orderNotice();"><img src="/skin/images/btn_noticeadmin.gif" border="0" alt="������������" align="absmiddle"></a>
					
			</div>
			<div class="board_btn2">
		
		
				<a href="javascript:mboardDeleteBoard();"><img src="/skin/images/btn_del.gif" border="0" alt="�����ϱ�"></a>
		
					<a href="javascript:INSERT();"><img src="/skin/images/btn_write.gif" border="0" alt="����ϱ�"></a>
		
			</div>
			<div class="cb"></div>
		</div>
					<div class="page_nate"><a href="javascript:mboardGoPage(1, 10)"><img src='/skin/images/btn_first.gif' alt='ó�� �������� ��ư' border='0' align='absmiddle'></a>&nbsp;<a href="javascript:mboardGoPage(1, 10)"><img src='/skin/images/btn_prev.gif' alt='���� 10��������  ��ư' border='0' align='absmiddle'></a>&nbsp;<a href="javascript:mboardGoPage(1, 10)"><span class='link'>1</span></a>&nbsp;<a href="javascript:mboardGoPage(1, 10)"><img src='/skin/images/btn_next.gif' alt='���� 10�������� ��ư' border='0' align='absmiddle'></a>&nbsp;<a href="javascript:mboardGoPage(1, 10)"><img src='/skin/images/btn_end.gif' alt='�� �������� ��ư' border='0' align='absmiddle'></a></div>

</div>
</form>



