<%@ page session="true"  contentType="text/html; charset=euc-kr" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="zvl" value="${requestScope['zvl']}"   scope="page" />

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

<script language="javascript" src="/cms/dev_content/common/js/util.js"></script>
<script language="javascript" src="/cms/dev_content/common/js/jslb_ajax.js"></script>
<script language="javascript" src="/cms/dev_content/common/js/prototype.js"></script>
<script language="javascript" src="/cms/dev_content/common/js/protoload.js"></script>
<script language="javascript" src="/cms/dev_content/common/js/reqForm.js"></script>
<script language="javascript" src="/cms/dev_content/common/js/miya_validator.js"></script>
<script language="javascript">
function init()
{
	var dupYn = "${onlineZvl.DUP_YN[0]}";
	if(dupYn == "Y") frm.dupYn.item(0).checked=true;
	else if(dupYn == "N") frm.dupYn.item(1).checked=true;
}

function checkForm()
{
	var v = new MiyaValidator(frm);
	v.add("title", {
		required: true
	});
	v.add("dupYn", {
		required: true
	});
	var result = v.validate();
	if (!result) {
		alert(v.getErrorMessage());
		v.getErrorElement().focus();
		return false;
	} 
	else
	{
		return true;
	}
}

function update()
{
	if(checkForm())
	{
		frm.method.value = "updateLecture";
		frm.action = "/A_online.do";
		frm.target = "targetAction";
		frm.submit();
	}
}

function postInvoke( resultMsg, invokeId )
{
	switch( invokeId )
	{
		case 'success':
			alert('���������� ��ϵǾ����ϴ�.');
			location.href="/A_online.do?method=view&did=${zvl.DID[0]}";
		break;

		case 'failure':
		if(resultMsg) alert(resultMsg);
		else alert('����Ÿ ��Ͻ� ������ �߻��Ͽ����ϴ�.');
		break;
	} 
}
</script>
<!-- ##### �Խ��� ���� ##### -->

<!-- ##### ��ü ���̺� ���� ##### -->
<meta http-equiv="Content-Type" content="text/html; charset=euc-kr" />
<IFRAME NAME='targetAction' WIDTH='0' HEIGHT='0' FRAMEBORDER='' SCROLLING='no' SRC='' MARGINWIDTH='0' MARGINHEIGHT='0' HSPACE='0' VSPACE='0'></IFRAME>
<p style="color:red;font-weight:bold;margin:5px 0;">�����¶��� �ý��� �̺�Ʈ �߰� </p>
<div id="board_form" style="width:700">
			
		<!-- ������ �Է���1 ����-->
		
	<form id="frm" name="frm" method="post">
	<input type="hidden" id="method" name="method"/>
	<input type="hidden" id="did" name="did" value="${zvl.DID[0]}" />
		<div class="board_write">
				<table cellspacing="1" cellpadding="0" width="100%">
					<colgroup><col width="14%"><col /></colgroup>
					<tr>
						<th>�� ��</th>
						<td>������</td>
					</tr>
					<tr>
						<th>����</th>
						<td>
							<input name="title" type="text"  class="box1" style="width:98%"  value="${zvl.TITLE[0]}">
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
					<tr>
						<th>���������</th>
						<td>
								<input name="manager" type="text"  class="box1" id="manager" style="width:240px"  value="${zvl.MANAGER[0]}">
								&nbsp; <img src="/skin/images/btn_finds.gif" alt="ã��"  align="absmiddle" style="vertical-align:top;"  />
						</td>
					</tr>
					<tr>
						<th>�޴���ġ</th>
						<td>
								<input name="menuLoc" type="text"  class="box1" id="menuLoc" style="width:240px"  value="${zvl.MENU_LOC[0]}">
								&nbsp; <img src="/skin/images/btn_finds.gif" alt="ã��"  align="absmiddle" style="vertical-align:top;"  />
						</td>
					</tr>

				</table>	
			</div> <!--  board_write -->
			<!--  �Է���1 �� -->
			</form>
			<!--##### Ȯ�� ��� ��ư ���� #####-->
			<div class="board_btn">
				<a href="javascript:update();"><img src="/skin/images//btn_confirm.gif" alt="Ȯ�� ��ư"></a>
				<!--a href="javascript:list(document.form);" --><a href="/A_online.do?method=view&did=${zvl.DID[0]}"><img src="/skin/images/btn_cancel.gif" alt="��� ��ư"></a>
			</div><br/>
			
		<!--##### Ȯ�� ��� ��ư �� #####-->



</div>
<font color="red">${requestScope['jspPage']}</font>
<script>
init();
</script>


