<%@ page session="true"  contentType="text/html; charset=euc-kr" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="onlineZvl" value="${requestScope['onlineZvl']}"   scope="page" />
<c:set var="fieldZvl" value="${requestScope['fieldZvl']}"   scope="page" />

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

<script language="javascript" src="/cms/dev_content/common/js/jslb_ajax.js"></script>
<script language="javascript" src="/cms/dev_content/common/js/prototype.js"></script>
<script language="javascript" src="/cms/dev_content/common/js/reqForm.js"></script>
<script language="javascript" src="/cms/dev_content/common/js/miya_validator.js"></script>

<script language="javascript">
	
	function init()
	{
		var receiptType = "${onlineZvl.RECEIPT_TYPE[0]}";
		var dupYn = "${onlineZvl.DUP_YN[0]}";
		
		if(receiptType == "0")
		{
		 	frm.receiptType.item(0).checked=true;
			$("inwonTr").show();
		}
		else if(receiptType == "1")
		{
		 	frm.receiptType.item(1).checked=true;
			$("inwonTr").hide();
		}
		
		if(dupYn == "Y") frm.dupYn.item(0).checked=true;
		else if(dupYn == "N") frm.dupYn.item(1).checked=true;
		
	}
	
	function postInvoke( resultMsg, invokeId )
	{
		switch( invokeId )
		{
			case 'success':
				alert('���������� ��ϵǾ����ϴ�.');
				location.href="/A_online.do?method=view&did=${onlineZvl.PARENT_ID[0]}";
			break;
	
				case 'failure':
				if(resultMsg) alert(resultMsg);
				else alert('����Ÿ ��Ͻ� ������ �߻��Ͽ����ϴ�.');
				break;
		} 
	}

	function checkForm(form)
	{
		var v = new MiyaValidator(form);
		v.add("title", {
			required: true
		});
		v.add("receiptSdate", {
			required: true
		});
		v.add("receiptEdate", {
			required: true
		});
		v.add("lecSdate", {
			required: true
		});
		v.add("lecEdate", {
			required: true
		});
		v.add("receiptType", {
			required: true
		});
		var r = get_radio_value("receiptType");
		if(r == "0")
		{
			v.add("appInwon", {
				required: true,
			option: "number"
			});
			v.add("waitInwon", {
				required: true,
			option: "number"

			});
		}
		v.add("dupYn", {
			required: true
		});
		var result = v.validate();
		if (!result) {
				alert(v.getErrorMessage());
				v.getErrorElement().focus();
				return false;
		} 
		else if(!checkInputField("managerFieldName") || !checkInputField("managerFieldValue"))
		{
			return false;
		}
		else
		{
			return true;
		}
	}
	function update()
	{
		if(checkForm(frm))
		{
			frm.method.value = "update";
			frm.action = "/A_online.do";
			frm.target = "targetAction";
			frm.submit();
		}
	}
	
	function appendRow(objName)
	{
		var tbl = $(objName);
		var newRow = tbl.insertRow(tbl.rows.length);
		var cell0 = newRow.insertCell(0);
		var cell1 = newRow.insertCell(1);
		if(objName == 'managerTbl')
		{
			cell0.innerHTML = 
				"<td><input name=\"managerFieldName\" type=\"text\"  class=\"box1\" style=\"width:98%\"  value=\"\"></td>";	
			cell1.innerHTML = 
				"<td><input name=\"managerFieldValue\" type=\"text\" class=\"box1\" style=\"width:98%\" id=\"managerFieldValue\" value=\"\" /></td>";
		}
		else
		{
			cell0.innerHTML = 
				"<td><input name=\"userFieldName\" type=\"text\"  class=\"box1\" style=\"width:98%\"  value=\"\"></td>";	
			cell1.innerHTML = 
				"<select id=\"userFieldType\" name=\"userFieldType\">"+
				"<option value=\"text\">�Ϲ� �Է� ����</option>"+
				"<option value=\"textArea\">�ؽ�Ʈ �Է� ����</option>"+
				"</select>";
		}
	}
	
	function deleteLastRow(objName)
	{
		var tbl = $(objName);
		if (tbl.rows.length > 2) tbl.deleteRow(tbl.rows.length - 1);
	}
	
	function changeInwonType()
	{
		var r = get_radio_value("receiptType");
		if(r == "0")
		{
			$("inwonTr").show();
		}
		else
		{
			text_clear("appInwon|waitInwon");
			$("inwonTr").hide();
		}
	}
	
	function viewControl(chkObj, objName, fieldName)
	{
		if(chkObj.checked) 
		{
			$(objName).show();
		}
		else 
		{
			text_clear(fieldName);
			$(objName).hide();
		}
	}

</script>
<!-- ##### �Խ��� ���� ##### -->

<!-- ##### ��ü ���̺� ���� ##### -->
<meta http-equiv="Content-Type" content="text/html; charset=euc-kr" />
<IFRAME NAME='targetAction' WIDTH='0' HEIGHT='0' FRAMEBORDER='' SCROLLING='no' SRC='' MARGINWIDTH='0' MARGINHEIGHT='0' HSPACE='0' VSPACE='0'></IFRAME>
<p style="color:red;font-weight:bold;margin:5px 0;">�������α׷� ��� ������</p>
<div id="board_form" style="width:700">
			
			<!-- �Է���1 ����-->
		<form id="frm" name="frm" method="post">
		<input type="hidden" id="method" name="method"/>
		<input type="hidden" id="kind" name="kind" value="1" />
		<input type="hidden" id="did" name="did" value="${onlineZvl.DID[0]}"/>
		<div class="board_write">
				<table cellspacing="1" cellpadding="0" width="100%">
					<colgroup><col width="14%"><col /></colgroup>
					<tr>
						<th>������</th>
						<td><input name="title" type="text"  class="box1" style="width:98%"  value="${onlineZvl.TITLE[0]}"></td>
					</tr>
					<tr>
						<th>�����Ⱓ</th>
						<td align="left">
							<table border="0" cellspacing="0" cellpadding="0">
								<tr>
									<td width="300" class="reg_text"><input name="receiptSdate" type="text" class="bbs_texts" id="receiptSdate" style="background-color:#ffffff; border:#BCBCBC solid 1px;width:100;" value="${onlineZvl.RECEIPT_SDATE[0]}" size="20" maxlength="10"  readonly>
										<img src="/cms/img/btn/btn_date.gif" align="absmiddle" style="cursor:hand" onClick="return showCalendar('receiptSdate', 'y-mm-dd');">&nbsp; ~
										<input name="receiptEdate" type="text" class="bbs_text" id="receiptEdate" style="background-color:#ffffff; border:#BCBCBC solid 1px;width:100;" value="${onlineZvl.RECEIPT_EDATE[0]}" size="20"  maxlength="10" readonly>
										<img src="/cms/img/btn/btn_date.gif" align="absmiddle" style="cursor:hand" onClick="return showCalendar('receiptEdate', 'y-mm-dd');">&nbsp; 
								  </td>
								</tr>
							</table>
						</td>
					</tr>
					<tr>
						<th>�����Ⱓ</th>
						<td align="left">
							<table border="0" cellspacing="0" cellpadding="0">
								<tr>
									<td width="300" class="reg_text"><input name="lecSdate" type="text" class="bbs_texts" id="lecSdate" style="background-color:#ffffff; border:#BCBCBC solid 1px;width:100;" value="${onlineZvl.LEC_SDATE[0]}" size="20" maxlength="10"  readonly>
										<img src="/cms/img/btn/btn_date.gif" align="absmiddle" style="cursor:hand" onClick="return showCalendar('lecSdate', 'y-mm-dd');">&nbsp; ~
										<input name="lecEdate" type="text" class="bbs_text" id="lecEdate" style="background-color:#ffffff; border:#BCBCBC solid 1px;width:100;" value="${onlineZvl.LEC_EDATE[0]}" size="20"  maxlength="10" readonly>
										<img src="/cms/img/btn/btn_date.gif" align="absmiddle" style="cursor:hand" onClick="return showCalendar('lecEdate', 'y-mm-dd');">&nbsp; 
								  </td>
								</tr>
							</table>
						</td>
					</tr>
					<tr>
						<th>��������</th>
						<td>
							<input type="radio" name="receiptType" value="0" style="border:0" onclick="changeInwonType()" checked> 
							������  &nbsp;
							<input type="radio" name="receiptType" value="1" style="border:0" onclick="changeInwonType()"> 
							�Ϲ�����
							<span id="inwonTr">
							<br />
							��û�ο� :  <input name="appInwon" type="text"  class="box1" id="appInwon" style="width:40px"  value="${onlineZvl.APP_INWON[0]}"> 
							&nbsp;
							����ο� :  <input name="waitInwon" type="text"  class="box1" id="waitInwon" style="width:40px"  value="${onlineZvl.WAIT_INWON[0]}">
							</span>
						</td>
					</tr>
					<tr>
						<th>�ߺ���������</th>
						<td>
							<input type="radio" name="dupYn" value="Y" style="border:0" checked> 
							���  &nbsp;
							<input type="radio" name="dupYn" value="N" style="border:0"> 
							�����
						</td>
					</tr>
				<!--  ���� ���� �� -->
				</table>	

			</div> <!--  board_write -->
			<!--  �Է���1 �� -->

			<!-- �Է���2 ����-->
		`<div class="board_write">
				<table id="managerTbl" cellspacing="1" cellpadding="0" width="100%">
					<colgroup><col width="40%"><col /></colgroup>
					<tr>
						<th colspan="2">
							<p style="float:left;width:40%;text-align:center;">	���� ���α׷� ���� </p>	<p style="float:right;">+ <a href="javascript:appendRow('managerTbl');">�߰�</a> |  - <a href="javascript:deleteLastRow('managerTbl');">����</a></p></th>
					</tr>
					<c:if test="${fieldZvl.size>0}">
					  <c:forEach var="x" begin="0" end="${fieldZvl.size-1}">
					<tr>
						<td><input name="managerFieldName" type="text"  class="box1" style="width:98%"  value="${fieldZvl.FIELD_NAME[x]}"></td>
						<td><input name="managerFieldValue" type="text"  class="box1" style="width:98%"  value="${fieldZvl.FIELD_VALUE[x]}"></td>
					</tr>
						</c:forEach>
				  </c:if>
				</table>       

			</div><!--  board_write -->
			</form>
			<!--  �Է���2 �� -->


			<!--##### Ȯ�� ��� ��ư ���� #####-->
			<div class="board_btn">
				<a href="javascript:update();"><img src="/skin/images//btn_confirm.gif" alt="Ȯ�� ��ư"></a>
				<!--a href="javascript:list(document.form);" --><a href="/A_online.do?method=view&did=${onlineZvl.PARENT_ID[0]}"><img src="/skin/images/btn_cancel.gif" alt="��� ��ư"></a>
			</div><br/>
			
		<!--##### Ȯ�� ��� ��ư �� #####-->
</div>
<font color="red">${requestScope['jspPage']}</font>
<script>
init();
</script>



