<%@ page session="true"  contentType="text/html; charset=euc-kr" %>

<!-- #################### css ���� start ###################### -->
<link href="/skin/css/blue/board_style.css" rel="stylesheet" type="text/css">
<!-- #################### css ���� end ########################-->

<!-- ##### �Խ��� ���� ##### -->

<!-- ##### ��ü ���̺� ���� ##### -->
<meta http-equiv="Content-Type" content="text/html; charset=euc-kr" />
<p style="color:red;font-weight:bold;margin:5px 0;">�������α׷� �ۼ��� ��û���� ��������  </p>
<div id="board_form" style="width:700">
			
			<!-- ������ �̺�Ʈ �� ȭ��-->
			<div class="board_view">
				<table cellspacing="1" cellpadding="0" width="100%" class="view">
					<colgroup><col width="14%"><col /></colgroup>
					<tr>
						<th class="view">ID</th>
						<td class="view">aaaa</td>
					</tr>
					<tr>
						<th class="view">�ۼ���</th>
						<td class="view">ȫ�浿</td>
					</tr>
					<tr>
						<th class="view">�����ȣ</th>
						<td class="view">111-111</td>
					</tr>
					<tr>
						<th class="view">�ּ�</th>
						<td class="view">����� ��õ�� ���ﵿ 1020</td>
					</tr>
					<tr>
						<th class="view">��ȭ��ȣ</th>
						<td class="view">02-212-2222</td>
					</tr>
					<tr>
						<th class="view">�̸���</th>
						<td class="view"><a href="#">kkkk@gc.go.kr</a></td>
					</tr>
				<!--  ���� ���� �� -->
				</table>	

			</div> <!--  board_view -->

			<!-- ���, ����, ���� ��ư -->
	 
			<!-- *********************************************************************************** 
				common/ListModiDeletePage.jsp 
				��� ���� ���� �ϴ� ��ư �κ��� ���� �������� ����. 
			**************************************************************************************-->
		<div style="padding:5px 0 0 0;">
			<span style="width:60%">				
			</span>
			<span style="width:40%;text-align:right;">					
				<a href="javascript:showPasswordForm(document.form,'EDIT');"><img src="/skin/images/btn_modify.gif" alt="����" border="0"></a>&nbsp;
				<a href="javascript:showPasswordForm(document.form,'DELETE');"><img src="/skin/images/btn_del.gif" alt="����" border="0"></a>&nbsp;
				<a href="board_list03.jsp"><img src="/skin/images/btn_list.gif" alt="���" border="0"></a>				
			</span>
		<div>

		<!-- ���, ����, ���� ��ư ��-->



</div>
</form>
<font color="red">${requestScope['jspPage']}</font>



