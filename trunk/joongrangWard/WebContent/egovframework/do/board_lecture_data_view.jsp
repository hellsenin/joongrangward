<%@ page session="true"  contentType="text/html; charset=euc-kr" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="zvl" value="${requestScope['zvl']}"   scope="page" />

<!-- #################### css ���� start ###################### -->
<link href="/skin/css/blue/board_style.css" rel="stylesheet" type="text/css">
<!-- #################### css ���� end ########################-->
<script language="javascript" src="/cms/dev_content/common/js/jslb_ajax.js"></script>
<script language="javascript" src="/cms/dev_content/common/js/prototype.js"></script>
<script type="text/javascript">

	function deleteLectureDataByDataId()
	{
		if(confirm("�����Ͻðڽ��ϱ�?"))
		{
			var url = "/A_online.do";
			var param = "&method=deleteLectureDataByDataId&did=${zvl.DID[0]}&dataId=${zvl.DATA_ID[0]}";
			sendRequest(callbackDeleteLectureDataByDataId, param, 'POST', url, true, true);
		}
	}

	function callbackDeleteLectureDataByDataId(oj)
	{
		try 
		{
			var jsonData = oj.responseText;
			var j = eval('(' + jsonData + ')');
			var code = j.resultCode;
			if(code == "1")
			{
				 alert("���������� �����Ǿ����ϴ�.");
				 location.href="/A_online.do?method=subView&did=${zvl.DID[0]}";
			}
			else if(code == "0")
			{
				 alert(j.resultMsg);
			}
		}	
		catch (err) 
		{
			alert("FUNCTION : callbackDeleteAcceptData() " + err.description);
		}
	}
</script>

<!-- ##### �Խ��� ���� ##### -->

<!-- ##### ��ü ���̺� ���� ##### -->
<meta http-equiv="Content-Type" content="text/html; charset=euc-kr" />
<p style="color:red;font-weight:bold;margin:5px 0;">������ �̺�Ʈ �������� </p>
<div id="board_form" style="width:700">
			
			<!-- ������ �̺�Ʈ �� ȭ��-->
			<div class="board_view">
				<table cellspacing="1" cellpadding="0" width="100%" class="view">
					<colgroup><col width="14%"><col /></colgroup>
					<tr>
						<th class="view">�ۼ���</th>
						<td class="view">${zvl.MEM_NM[0]}</td>
					</tr>
					<tr>
						<th class="view">�������</th>
						<td class="view">${zvl.BIRTHDAY[0]}</td>
					</tr>
					<tr>
						<th class="view">�ּ�</th>
						<td class="view">${zvl.ZIPCODE[0]} ${zvl.ADDRESS1[0]}</td>
					</tr>
					<tr>
						<th class="view">��ȭ��ȣ</th>
						<td class="view">${zvl.PHONE[0]}</td>
					</tr>
					<tr>
						<th class="view">�̸���</th>
						<td class="view">${zvl.EMAIL[0]}</td>
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
				<a href="/A_online.do?method=updateLectureDataPage&dataId=${zvl.DATA_ID[0]}"><img src="/skin/images/btn_modify.gif" alt="����" border="0"></a>&nbsp;
				<a href="javascript:deleteLectureDataByDataId();"><img src="/skin/images/btn_del.gif" alt="����" border="0"></a>&nbsp;
				<a href="/A_online.do?method=subView&did=${zvl.DID[0]}"><img src="/skin/images/btn_list.gif" alt="���" border="0"></a>				
			</span>
		<div>

		<!-- ���, ����, ���� ��ư ��-->



</div>
</form>
<font color="red">${requestScope['jspPage']}</font>



