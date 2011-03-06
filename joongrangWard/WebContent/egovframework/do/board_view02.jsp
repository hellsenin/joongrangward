<%@ page session="true"  contentType="text/html; charset=euc-kr" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="onlineZvl" value="${requestScope['onlineZvl']}"   scope="page" />
<c:set var="fieldZvl" value="${requestScope['fieldZvl']}"   scope="page" />
<!-- #################### css ���� start ###################### -->
<link href="/skin/css/blue/board_style.css" rel="stylesheet" type="text/css">
<!-- #################### css ���� end ########################-->

<!-- ##### �Խ��� ���� ##### -->

<!-- ##### ��ü ���̺� ���� ##### -->
<meta http-equiv="Content-Type" content="text/html; charset=euc-kr" />
<p style="color:red;font-weight:bold;margin:5px 0;">�������α׷� �� ������ </p>
<div id="board_form" style="width:700">
			
			<!-- ������ �̺�Ʈ �� ȭ��-->
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
						<td class="view">${onlineZvl.STATUS[0]}</td>
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
				<a href="/A_online.do?method=updateSubPage&did=${param.did}"><img src="/skin/images/btn_modify.gif" alt="����" border="0"></a>&nbsp;
				<a href="javascript:del();"><img src="/skin/images/btn_del.gif" alt="����" border="0"></a>&nbsp;
				<a href="/A_online.do?method=view&did=${onlineZvl.PARENT_ID[0]}"><img src="/skin/images/btn_list.gif" alt="���" border="0"></a>				
			</span>
		<div>

		<!-- ���, ����, ���� ��ư ��-->



</div>
</form>
<font color="red">${requestScope['jspPage']}</font>



