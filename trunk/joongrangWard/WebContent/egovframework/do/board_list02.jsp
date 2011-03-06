<%@ page session="true"  contentType="text/html; charset=euc-kr" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="onlineZvl" value="${requestScope['onlineZvl']}"   scope="page" />
<c:set var="dataZvl" value="${requestScope['dataZvl']}"   scope="page" />

<!-- #################### css ���� start ###################### -->
<link href="/skin/css/blue/board_style.css" rel="stylesheet" type="text/css">
<!-- #################### css ���� end ########################-->

<script language="javascript" src="/cms/dev_content/common/js/jslb_ajax.js"></script>
<script language="javascript" src="/cms/dev_content/common/js/prototype.js"></script>
<script language="javascript" src="/cms/dev_content/common/js/miya_validator.js"></script>
<script language="javascript">
	function deleteLecture()
	{
		if(confirm("�ش� �̺�Ʈ�� �⺻������ �����̺�Ʈ, ��û�� ����� ���� �����Ͻðڽ��ϱ�?"))
		{
			var url = "/A_online.do";
			var param = "&method=deleteLecture&did=${onlineZvl.DID[0]}";
			sendRequest(callbackDeleteLecture, param, 'POST', url, true, true);
		}
	}

	function callbackDeleteLecture(oj)
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
			alert("FUNCTION : callbackDeleteLecture() " + err.description);
		}
	}

	function deleteSubLecture(id)
	{
		if(confirm("�ش� �̺�Ʈ�� �⺻������ ��û�� ����� ���� �����Ͻðڽ��ϱ�?"))
		{
			var url = "/A_online.do";
			var param = "&method=deleteSubLecture&did="+id;
			sendRequest(callbackDeleteSubLecture, param, 'POST', url, true, true);
		}
	}

	function callbackDeleteSubLecture(oj)
	{
		try 
		{
			var jsonData = oj.responseText;
			var j = eval('(' + jsonData + ')');
			var code = j.resultCode;
			if(code == "1")
			{
				 alert("���������� �����Ǿ����ϴ�.");
				location.href="/A_online.do?method=view&did=${onlineZvl.DID[0]}";
			}
			else if(code == "0")
			{
				 alert(j.resultMsg);
			}
		}	
		catch (err) 
		{
			alert("FUNCTION : callbackDeleteSubLecture() " + err.description);
		}
	}
</script>

<!-- ##### �Խ��� ���� ##### -->

<!-- ##### ��ü ���̺� ���� ##### -->
<meta http-equiv="Content-Type" content="text/html; charset=euc-kr" />
<p style="color:red;font-weight:bold;margin:5px 0;">���� ���α׷� ����Ʈ ������ </p>
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
						<th class="view">�޴���ġ</th>
						<td class="view">${onlineZvl.MENU_LOC[0]}</td>
					</tr>
					<tr>
						<th class="view">�ٷΰ���URL</th>
						<td class="view">/online.do?method=list&amp;did=${onlineZvl.DID[0]}</td>
					</tr>
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
							<a href="/A_online.do?method=updateLecturePage&did=${onlineZvl.DID[0]}"><img src="/skin/images/btn_modify.gif" alt="����" border="0"></a>&nbsp;
						 	<a href="javascript:deleteLecture();"><img src="/skin/images/btn_del.gif" alt="����" border="0"></a>
				
			</span>
		<div>

		<!-- ���, ����, ���� ��ư ��-->


		<!-- ������ �̺�Ʈ ����Ʈ ȭ��--->
		<div class="board_list">			
			<table cellspacing="1" cellpadding="0">
			<colgroup>		
					<col width="15" />
					<col width="50" />
					<col width="*" />
					<col width="105" />
					<col width="105" />
					<col width="60" />
					<col width="50" />
					<col width="40" />
				</colgroup>
				<thead>
				<tr>
					<th id="board_check"><input type="checkbox" onClick="mboardCheckDelete()" name="all_chk"></th>
					<th id="board_coursename">������</th>
					<th id="board_appdate">�����Ⱓ</th>
					<th id="board_ondate">�����Ⱓ</th>
					<th id="board_number">����/����</th>
					<th id="board_status">����</th>
					<th id="board_del">����</th>
				</tr>
				</thead>
				<tbody> 
				<!-- ##### �Խñ� ���� ##### -->
		<c:choose>
	    <c:when test="${dataZvl.rows[0] > 0}">
            <c:forEach var="x" begin="0" end="${dataZvl.rows[0]-1}">
				<tr height="23">
					<td headers="board_check"><input type="checkbox" name="chkBoardId" value="${dataZvl.DID[x]}"></td>
					<td headers="board_coursename"><a href="/A_online.do?method=subView&did=${dataZvl.DID[x]}">${dataZvl.TITLE[x]}</a></td>
					<td headers="board_appdate">${dataZvl.RECEIPT_SDATE[x]}<br /> ~ ${dataZvl.RECEIPT_EDATE[x]}</td>
					<td headers="board_ondate">${dataZvl.LEC_SDATE[x]}<br /> ~ ${dataZvl.LEC_EDATE[x]}</td>
					<td headers="board_ondate"><c:if test="${dataZvl.INWON[x] > 0}">${dataZvl.USER_COUNT[x]}/${dataZvl.INWON[x]}</c:if></td>
					<td headers="board_status">
					<c:if test="${dataZvl.STATUS[x] == 0}">������</c:if>
					<c:if test="${dataZvl.STATUS[x] == 1}">������</c:if>
					<c:if test="${dataZvl.STATUS[x] == 2}">��������</c:if>
					</td>
					<td headers="board_del"><a href="javascript:deleteSubLecture('${dataZvl.DID[x]}');">����</a></td>
				</tr>
			</c:forEach>
		</c:when>
		</c:choose>			
				<!-- ##### �Խñ� �� ##### -->
				 </tbody>
      </table>
		</div>
   <!-- ##### ����Ʈ ��  ##### -->
		<div class="tfoot">
			<div class="list_num">&nbsp;</div>
			<div class="board_btn2">		
					<a href="/A_online.do?method=insertLecturePage&parentId=${param.did}"><img src="/skin/images/btn_regist_2.gif" border="0" alt="����ϱ�"></a>		
			</div>
			<div class="cb"></div>
		</div>
			<div class="page_nate">${dataZvl.paging}</div>

</div>
</form>
<font color="red">${requestScope['jspPage']}</font>



