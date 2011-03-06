<%@ page session="true"  contentType="text/html; charset=euc-kr" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="onlineZvl" value="${requestScope['onlineZvl']}"   scope="page" />
<c:set var="dataZvl" value="${requestScope['dataZvl']}"   scope="page" />
<c:set var="fieldZvl" value="${requestScope['fieldZvl']}"   scope="page" />

<!-- #################### css ���� start ###################### -->
<link href="/skin/css/blue/board_style.css" rel="stylesheet" type="text/css">
<!-- #################### css ���� end ########################-->

<script language="javascript" src="/cms/dev_content/common/js/jslb_ajax.js"></script>
<script language="javascript" src="/cms/dev_content/common/js/prototype.js"></script>
<script language="javascript">
	function deleteAccept()
	{
		if(confirm("�ش� �̺�Ʈ�� �⺻������ ��û�� ����� ���� �����Ͻðڽ��ϱ�?"))
		{
			var url = "/A_online.do";
			var param = "&method=deleteAccept&did=${onlineZvl.DID[0]}";
			sendRequest(callbackDeleteAccept, param, 'POST', url, true, true);
		}
	}

	function callbackDeleteAccept(oj)
	{
		try 
		{
			var jsonData = oj.responseText;
			var j = eval('(' + jsonData + ')');
			var code = j.resultCode;
			if(code == "1")
			{
				 alert("���������� �����Ǿ����ϴ�.");
				 location.href="/A_online.do?method=getTopCategory";
			}
			else if(code == "0")
			{
				 alert(j.resultMsg);
			}
		}	
		catch (err) 
		{
			alert("FUNCTION : callbackDeleteAccept() " + err.description);
		}
	}
	
	function deleteAcceptData()
	{
		if(confirm("��û�� ����� ���� �����Ͻðڽ��ϱ�?"))
		{
			var url = "/A_online.do";
			var param = "&method=deleteAcceptData&did=${onlineZvl.DID[0]}";
			sendRequest(callbackDeleteAcceptData, param, 'POST', url, true, true);
		}
	}

	function callbackDeleteAcceptData(oj)
	{
		try 
		{
			var jsonData = oj.responseText;
			var j = eval('(' + jsonData + ')');
			var code = j.resultCode;
			if(code == "1")
			{
				 alert("���������� �����Ǿ����ϴ�.");
				 //location.href="/A_online.do?method=insertPage";
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
<p style="color:red;font-weight:bold;margin:5px 0;">������ �̺�Ʈ ����Ʈ ȭ�� </p>
<div id="board_form" style="width:700">
		<!-- ### �з� ���� ### -->
			
		<!-- ### �з� �� ### -->

		<!-- ### �亯�޸� �۸� ���� ���� ����  ### -->
			
		<!-- ### �亯�޸� �۸� ���� ����  �� ### -->

			<!-- ������ �̺�Ʈ ����Ʈ ȭ��-->
			<div class="board_view">
				<table cellspacing="1" cellpadding="0" width="100%" class="view">
					<colgroup><col width="14%"><col /></colgroup>
					<tr>
						<th class="view">����</th>
						<td class="view">${onlineZvl.TITLE[0]}</td>
					</tr>
					<tr>
						<th class="view">�����Ⱓ</th>
						<td class="view">${onlineZvl.RECEIPT_SDATE[0]} ~ ${onlineZvl.RECEIPT_EDATE[0]}</td>
					</tr>
					<tr>
						<th class="view">��������</th>
						<td class="view">
							<c:if test="${onlineZvl.RECEIPT_TYPE[0] == '0'}">������ ��û�ο� ${onlineZvl.APP_INWON[0]}�� ����ο� ${onlineZvl.WAIT_INWON[0]}��</c:if>
							<c:if test="${onlineZvl.RECEIPT_TYPE[0] == '1'}">�Ϲ�����</c:if>
						</td>
					</tr>
					<tr>
						<th class="view">�ߺ���������</th>
						<td class="view">
							<c:if test="${onlineZvl.DUP_YN[0]=='Y'}">���</c:if>
							<c:if test="${onlineZvl.DUP_YN[0]=='N'}">�����</c:if>
						</td>
					</tr>
					<tr>
						<th class="view">���������</th>
						<td class="view">${onlineZvl.MANAGER[0]}</td>
					</tr>
					<tr>
						<th class="view">����URL</th>
						<td class="view">${onlineZvl.MENU_LOC[0]}</td>
					</tr>
					<tr>
						<th class="view">�ٷΰ���URL</th>
						<td class="view">/online.do?method=list&amp;did=${onlineZvl.DID[0]}</td>
					</tr>
				</table>	
			</div> <!--  board_view -->

			<!-- �Է���2 ����-->
		`<div class="board_write">
				<table id="userTbl" cellspacing="1" cellpadding="0" width="100%">
					<colgroup><col width="40%"><col /></colgroup>
					<tr id="inputInfo">
						<th>�Է±⺻����</th>
						<td>�̸�, �ּ�, ��ȭ��ȣ,�̸���</td>
					</tr>
					<tr id="addInfo">
						<th colspan="2">
							<p style="float:left;width:40%;text-align:center;">	�߰� �Է� ���� </p>	
						</th>
					</tr>
					
				<c:if test="${fieldZvl.size > 0}">
		      		<c:forEach var="x" begin="0" end="${fieldZvl.size-1}">
					<tr>
						<th class="view">${fieldZvl.FIELD_NAME[x]}</th>
						<td class="view">
							<c:if test="${fieldZvl.FIELD_TYPE[x] == 'text'}">�Ϲ� �Է� ����</c:if>
							<c:if test="${fieldZvl.FIELD_TYPE[x] == 'date'}">���� �Է� ����</c:if>
							<c:if test="${fieldZvl.FIELD_TYPE[x] == 'textArea'}">�ؽ�Ʈ �Է� ����</c:if>
						</td>
					</tr>
					</c:forEach>
				</c:if>				
				</table>       

			</div><!--  board_write -->
			<!--  �Է���2 �� -->

		<!-- �Է���3 ����-->
		`<div id="addInfo2" class="board_write">
				<table cellspacing="1" cellpadding="0" width="100%">
					<colgroup><col width="40%"><col /></colgroup>
					<tr>
						<th>÷������  </th>
						<td>${onlineZvl.FILE_NUM[0]}</td>
					</tr>
					<tr>
						<th>���� �׸� �Է� ����</th>
						<td>${onlineZvl.CONTENT_NM[0]}</td>
					</tr>
				</table>       

			</div><!--  board_write -->
			<!--  �Է���3 �� -->
			<!-- ���, ����, ���� ��ư -->
	 
			<!-- *********************************************************************************** 
				common/ListModiDeletePage.jsp 
				��� ���� ���� �ϴ� ��ư �κ��� ���� �������� ����. 
			**************************************************************************************-->
		<div style="padding:5px 0 0 0;">
			<span style="width:60%">				
			</span>
			<span style="width:40%;text-align:right;">					
							<a href="/A_online.do?method=updateAcceptPage&did=${onlineZvl.DID[0]}"><img src="/skin/images/btn_modify.gif" alt="����" border="0"></a>&nbsp;
						 	<a href="javascript:deleteAccept();"><img src="/skin/images/btn_del.gif" alt="����" border="0"></a>
				
			</span>
		<div>

		<!-- ���, ����, ���� ��ư ��-->


			<!-- ������ �̺�Ʈ ����Ʈ ȭ��--->
		<div style="padding:8px 0;"><a href="javascript:deleteAcceptData();"><img src="/skin/images/btn_all_delete.gif" alt="��û������ �ϰ�����" /></a></div>

		<div class="board_list">			
			<table cellspacing="1" cellpadding="0">
			<colgroup>
		
					<col width="15" /><col width="40" /><col width="*" /><col width="100" /><col width="40" />
				</colgroup>
				<thead>
				<tr>
					<th id="board_check"><input type="checkbox" onClick="mboardCheckDelete()" name="all_chk"></th>
					<th id="board_num">��ȣ</th>
					<th id="board_korname">�ۼ���</th>
					<th id="board_create">��û��</th>
					<th id="board_status">����</th>
				</tr>
				</thead>
				<tbody>  
			<c:if test="${dataZvl.rows[0] == 0}">
				<tr height="23">	
					<td colspan="5">�����Ͱ� �����ϴ�.</td>		
				</tr>	
			</c:if>
			<c:if test="${dataZvl.rows[0] > 0}">
				<c:forEach var="x" begin="0" end="${dataZvl.rows[0]-1}">  
				<!-- ##### �Խñ� ���� ##### -->
				<tr height="23">	
					<td headers="board_check"><input type="checkbox" value=2 name="chkBoardId"></td>
					<td headers="board_num">${dataZvl.totCount - (dataZvl.cpage-1)*dataZvl.pageCount - x}</td>
					<td headers="board_korname"><a href="/A_online.do?method=viewAcceptData&dataId=${dataZvl.DATA_ID[x]}">${dataZvl.MEM_NM[x]}</a></td>
					<td headers="board_create">${dataZvl.REG_DATE[x]}</td>
					<td headers="board_status">
				<c:choose>
					<c:when test="${not empty onlineZvl.APP_INWON[0]}">
						<c:if test="${onlineZvl.APP_INWON[0] >= (zvl.rows[0]-x)}">��û</c:if>
						<c:if test="${onlineZvl.APP_INWON[0] < (zvl.rows[0]-x)}">���</c:if>
					</c:when>
					<c:otherwise>��û</c:otherwise>
				</c:choose>
					</td>		
				</tr>	
				</c:forEach>
			</c:if>
				<!-- ##### �Խñ� �� ##### -->
				 </tbody>
      </table>
		</div>
   <!-- ##### ����Ʈ ��  ##### -->
		<div class="tfoot">
			<div class="list_num">&nbsp;
				<a href="/A_online.do?method=getExcelOfAcceptData&did=${onlineZvl.DID[0]}"><img src="/skin/images/btn_info_down.gif" border="0" alt="��û������ �ٿ�ε�" align="absmiddle"></a>
					
			</div>
			<div class="board_btn2">		
					<a href="/A_online.do?method=writeAcceptPage&did=${onlineZvl.DID[0]}"><img src="/skin/images/btn_regist_2.gif" border="0" alt="����ϱ�"></a>		
			</div>
			<div class="cb"></div>
			
		<c:if test="${dataZvl.rows[0] > 0}">
		</div>
			<div class="page_nate">${dataZvl.paging}
		</div>
		</c:if>

</div>
</form>
<font color="red">${requestScope['jspPage']}</font>



