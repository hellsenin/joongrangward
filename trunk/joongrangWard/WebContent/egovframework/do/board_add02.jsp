<%@ page session="true"  contentType="text/html; charset=euc-kr" %>

<!-- #################### css ���� start ###################### -->

<link href="/cms/common/css/mp01.css" rel="stylesheet" type="text/css">
<link rel="STYLESHEET" type="text/css" href="/cms/common/calendar/calendar-system.css" >
<link href="/skin/css/blue/board_style.css" rel="stylesheet" type="text/css">
<!-- #################### css ���� end ########################-->
<script language="JavaScript" src="/cms/common/js/common.js"></script>
<script language="JavaScript" src="/cms/common/js/ajax.js" ></script>
<script language="JavaScript" src="/cms/board/common/BoardCommon.js" ></script>
<script type="text/javascript" src="/cms/common/calendar/calendar.js"></script>
<script type="text/javascript" src="/cms/common/calendar/calendar-en.js"></script>

<!-- ##### �Խ��� ���� ##### -->

<!-- ##### ��ü ���̺� ���� ##### -->
<meta http-equiv="Content-Type" content="text/html; charset=euc-kr" />
<p style="color:red;font-weight:bold;margin:5px 0;">�����¶��� �ý��� �̺�Ʈ �߰� </p>
<div id="board_form" style="width:700">
			
		<!-- ������ �Է���1 ����-->
		<div class="board_write">
				<table cellspacing="1" cellpadding="0" width="100%">
					<colgroup><col width="14%"><col /></colgroup>
					<tr>
						<th>�� ��</th>
						<td>
							<input type="radio" name="notifyYN" value="Y" style="border:0"> ������  &nbsp;
							<input type="radio" name="notifyYN" value="N" style="border:0" checked> ������</td>
					</tr>
					<tr>
						<th>����</th>
						<td>
							<input name="title" type="text"  class="box1" style="width:98%"  value="">
						</td>
					</tr>
					<tr>
						<th>�ߺ���������</th>
						<td>
							<input type="radio" name="mapplyYN" value="Y" style="border:0" checked> ���  &nbsp;
							<input type="radio" name="mapplyYN" value="N" style="border:0"> �����
						</td>
					</tr>
					<tr>
						<th>���������</th>
						<td>
								<input name="search1" type="text"  class="box1" style="width:240px"  value="">&nbsp; <img src="/skin/images/btn_finds.gif" alt="ã��"  align="absmiddle" style="vertical-align:top;"  />
						</td>
					</tr>
					<tr>
						<th>�޴���ġ</th>
						<td>
								<input name="search2" type="text"  class="box1" style="width:240px"  value="">&nbsp; <img src="/skin/images/btn_finds.gif" alt="ã��"  align="absmiddle" style="vertical-align:top;"  />
						</td>
					</tr>

				</table>	
			</div> <!--  board_write -->
			<!--  �Է���1 �� -->

			<!--##### Ȯ�� ��� ��ư ���� #####-->
			<div class="board_btn">
				<a href="javascript:save(document.form, 'INSERT','');"><img src="/skin/images//btn_confirm.gif" alt="Ȯ�� ��ư"></a>
				<!--a href="javascript:list(document.form);" --><a href="board_list01.jsp"><img src="/skin/images/btn_cancel.gif" alt="��� ��ư"></a>
			</div><br/>
			
		<!--##### Ȯ�� ��� ��ư �� #####-->



</div>
<font color="red">${requestScope['jspPage']}</font>
</form>



