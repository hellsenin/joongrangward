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
				location.href="/A_online.do?method=insertPage";
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
		var param = "&method=deleteSubLecture&did=${onlineZvl.DID[0]}";
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
<p style="color:red;font-weight:bold;margin:5px 0;">�������α׷� ��û Ȯ�� ������ </p>
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
						<th class="view">������</th>
						<td class="view">${onlineZvl.TITLE[0]}</td>
					</tr>
					<tr>
						<th class="view">�����Ⱓ</th>
						<td class="view">${onlineZvl.RECEIPT_SDATE[0]} ~ ${onlineZvl.RECEIPT_EDATE[0]}</td>
					</tr>
					<tr>
						<th class="view">�����Ⱓ</th>
						<td class="view">${onlineZvl.LEC_SDATE[0]} ~ ${onlineZvl.LEC_EDATE[0]}</td>
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
						<th class="view">�ٷΰ���URL</th>
						<td class="view">/online.do?method=view&amp;did=${onlineZvl.DID[0]}</td>
					</tr>
					<c:if test="${fieldZvl.size>0}">
					  <c:forEach var="x" begin="0" end="${fieldZvl.size-1}">
						<tr>
							<th class="view">${fieldZvl.FIELD_NAME[x]}</th>
							<td class="view">${fieldZvl.FIELD_VALUE[x]}</td>
						</tr>
						</c:forEach>
				  </c:if>
						<tr>
							<th class="view">����</th>
							<td class="view">
								<c:if test="${onlineZvl.STATUS[0] == 0}">������</c:if>
								<c:if test="${onlineZvl.STATUS[0] == 1}">������</c:if>
								<c:if test="${onlineZvl.STATUS[0] == 2}">��������</c:if>
							</td>
						</tr>
				</table>	
			</div> <!--  board_view -->
		<!-- ���, ����, ���� ��ư ��-->
<div style="padding:5px 0 0 0;">
			<span style="width:60%">				
			</span>
			<span style="width:40%;text-align:right;">					
							<a href="/A_online.do?method=updateSubPage&did=${onlineZvl.DID[0]}"><img src="/skin/images/btn_modify.gif" alt="����" border="0"></a>&nbsp;
						 	<a href="javascript:deleteSubLecture();"><img src="/skin/images/btn_del.gif" alt="����" border="0"></a>
				
			</span>
		<div>

			<!-- ������ �̺�Ʈ ����Ʈ ȭ��--->
		<div style="padding:8px 0;"><img src="/skin/images/btn_all_delete.gif" alt="��û������ �ϰ�����" /></div>

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
				<!-- ##### �Խñ� ���� ##### -->
			<c:if test="${dataZvl.rows[0] == 0}">
				<tr height="23">	
					<td colspan="5">�����Ͱ� �����ϴ�.</td>		
				</tr>	
			</c:if>
			<c:if test="${dataZvl.rows[0] > 0}">
				<c:forEach var="x" begin="0" end="${dataZvl.rows[0]-1}">  
				<tr height="23">
					<td headers="board_check"><input type="checkbox" value=2 name="chkBoardId"></td>
					<td headers="board_num">${dataZvl.totCount - (dataZvl.cpage-1)*dataZvl.pageCount - x}</td>
					<td headers="board_korname"><a href="/A_online.do?method=viewLectureData&dataId=${dataZvl.DATA_ID[x]}">${dataZvl.MEM_NM[x]}</a></td>
					<td headers="board_create">${dataZvl.REG_DATE[x]}</td>
					<td headers="board_status">
				<c:choose>
					<c:when test="${onlineZvl.APP_INWON[0] >= (x+1)}">��û</c:when>
					<c:when test="${onlineZvl.APP_INWON[0] < (x+1) && (onlineZvl.APP_INWON[0]+onlineZvl.WAIT_INWON[0]) >= (x+1)}">���</c:when>
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
				<a href="/A_online.do?method=getExcelOfLectureData&did=${onlineZvl.DID[0]}"><img src="/skin/images/btn_info_down.gif" border="0" alt="��û������ �ٿ�ε�" align="absmiddle"></a>
					
			</div>
			<div class="board_btn2">		
					<a href="/A_online.do?method=writeLectureDataPage&did=${onlineZvl.DID[0]}"><img src="/skin/images/btn_regist_2.gif" border="0" alt="����ϱ�"></a>		
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



