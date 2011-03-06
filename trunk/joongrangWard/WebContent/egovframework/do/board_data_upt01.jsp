<%@ page session="true"  contentType="text/html; charset=euc-kr" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="zvl" value="${requestScope['zvl']}"   scope="page" />

<!-- #################### css ���� start ###################### -->
<link href="/skin/css/blue/board_style.css" rel="stylesheet" type="text/css">
<!-- #################### css ���� end ########################-->

<script language="javascript" src="/cms/dev_content/common/js/jslb_ajax.js"></script>
<script language="javascript" src="/cms/dev_content/common/js/prototype.js"></script>
<script type="text/javascript" src="/cms/dev_content/common/js/miya_validator.js"></script>
<script type="text/javascript" src="/cms/dev_content/common/js/reqForm.js"></script>
<script language="javascript">
	function postInvoke( resultMsg, invokeId )
	{
		switch( invokeId )
		{
			case 'success':
				alert('���������� ��ϵǾ����ϴ�.');
				location.href = "/A_online.do?method=viewAcceptData&dataId=${zvl.DATA_ID[0]}";
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
		v.add("memNm", {
			required: true
		});
		v.add("zipcode1", {
			span: 2,
            glue: "-",
	        option: "zip"			
		});
		v.add("address1", {
			required: true
		});
	    v.add("phone1", {
	        required: true,
            span: 3,
            glue: "-",
	        option: "phone"                
	    });
	    v.add("email", {
            option: "email"		        
	    });
		var result = v.validate();
		if (!result) {
			alert(v.getErrorMessage());
			v.getErrorElement().focus();
			return false;
		} 
		else
		{
			if(checkInputDateField("fieldValue"))
				return true;
			else return false;
		}
	}
	
	function update()
	{
		var object = document.frm;
		if(checkForm(object))
		{
			object.method.value = "updateAcceptData";
			object.action = "/A_online.do";
			object.target = "targetAction";
			object.submit();
		}
	}
	</script>
<!-- ##### �Խ��� ���� ##### -->

<!-- ##### ��ü ���̺� ���� ##### -->
<meta http-equiv="Content-Type" content="text/html; charset=euc-kr" />
<IFRAME NAME='targetAction' WIDTH='0' HEIGHT='0' FRAMEBORDER='' SCROLLING='no' SRC='' MARGINWIDTH='0' MARGINHEIGHT='0' HSPACE='0' VSPACE='0'></IFRAME>
<p style="color:red;font-weight:bold;margin:5px 0;">������ ���� ���� �Է� ������ </p>
<div id="board_form" style="width:700">
			
			<!-- �Է��� ����-->
		<form name="frm" id="frm" method="post">
		<input type="hidden" id="method" name="method" />
		<input type="hidden" id="did" name="did" value="${param.did}" />
		<input type="hidden" id="dataId" name="dataId" value="${param.dataId}" />
		<div class="board_write">
				<table cellspacing="1" cellpadding="0" width="100%">
					<colgroup><col width="14%"><col /></colgroup>
					<tr>
						<th>�ۼ��� *</th>
						<td><input name="memNm" type="text" class="box1" id=""memNm"" style="width:150px" value="${zvl.MEM_NM[0]}" maxlength="" />
						&nbsp; (�� �Խ����� �Ǹ����� �Խõ˴ϴ�.)</td>
					</tr>
					<tr>
						<th>�ּ� *</th>
						<td>
							<table width="100%" border="0" cellpadding="0" cellspacing="0">
								<tr>
									<td>
										<c:set var="fnZipcode" value="${fn:split(zvl.ZIPCODE[0], '-')}"/>
										<input name="zipcode1" type="text" class="box1" id="zipcode1" style="width:50;margin-bottom:1" value="${fnZipcode[0]}"> 
										-
										<input name="zipcode2" type="text" class="box1" id="zipcode2" style="width:50;margin-bottom:1" value="${fnZipcode[1]}">
										&nbsp;
											<a href="/dev_content/0800_member/GC_member_zipcode.jsp" onclick="window.open(this.href,'','width=400,height=400,location=no,toolbar=no,menubar=no,status=no,scrollbars=no,resizable=yes');return false;"
								onkeypress="if(event.keyCode==13) {window.open(this.href,'','width=400,height=400,location=no,toolbar=no,menubar=no,status=no,scrollbars=no,resizable=yes'); return false;}">
								<img src="/skin/photo/images/btn_addr.gif" alt="�����ȣ �˻�" border="0" align="absmiddle"></a>
									</td>
								</tr>
								<tr>
									<td class="bbs_text"><input name="address1" type="text" class="box1" id="address1"  style="width:400;margin-bottom:1" value="${zvl.ADDRESS1[0]}">
									</td>
								</tr>
							</table>
						</td>
					</tr>
					<tr>
						<th>��ȭ��ȣ *</th>
						<td>
						<c:set var="fnPhone" value="${fn:split(zvl.PHONE[0], '-')}"/>
						<input name="phone1" type="text"  class="box1" id="phone1" style="width:50px" value="${fnPhone[0]}"> 
						- 
						<input name="phone2" type="text"  class="box1" id="phone2" style="width:50px" value="${fnPhone[1]}"> 
						- 
						<input name="phone3" type="text"  class="box1" id="phone3" style="width:50px" value="${fnPhone[2]}">
						</td>
					</tr>
					<tr>
						<th>�̸���</th>
						<td><input name="email" type="text"  class="box1" style="width:200px" value="${zvl.EMAIL[0]}"></td>
					</tr>
			<c:if test="${zvl.dataSize > 0}">
          	<c:forEach var="x" begin="0" end="${zvl.dataSize-1}">
					<tr>
						<th>${zvl.FIELD_NAME[x]}<input type="hidden" name="fieldName" value="${zvl.FIELD_NAME[x]}"/></th>
						<td>
							<c:if test="${zvl.FIELD_TYPE[x] == 'textArea'}">
							<textarea id="fieldValue" name="fieldValue" style="width:100%; height:80px;" class="box1">${zvl.FIELD_VALUE[x]}</textarea>
							</c:if>
							<c:if test="${zvl.FIELD_TYPE[x] == 'text'}">
							<input type="text" id="fieldValue" name="fieldValue"  class="box1" style="width:100%" value="${zvl.FIELD_VALUE[x]}" />
							</c:if>
						</td>
					</tr>
				</c:forEach>
			</c:if>
					<tr>
						<th colspan="2">${zvl.CONTENT_NM[0]}</th>
					</tr>
					<tr>
						<td colspan="2" style="background-color:#f5f5f5">�Ʒ��� �ۼ��Ͻô� ���� (÷������ ����)�߿� ���������� ���� ������ �ִٸ� ���������� Ÿ�ο��� ����Ǿ� ħ�ع��� �� �����Ƿ� ���� �� ����Ͽ� �ֽñ� �ٶ��ϴ�.  (������������ : �ֹε�Ϲ�ȣ, ���¹�ȣ, �ڵ�����ȣ ��)</td>
					</tr>

					<!-- �� ���� ���� -->					
					<tr>
						<td colspan="2">
								<textarea name="contents"  style="width:100%; height:400px;">${zvl.CONTENTS[0]}</textarea>
						</td>
					</tr>	
					<!-- �۳��� �� -->
				<!--  ���� ���� �� -->
				</table>	

			</div> <!--  board_write -->
		</form>
			<!--  �Է� �� �� -->

			<!--##### Ȯ�� ��� ��ư ���� #####-->
			<div class="board_btn">
				<a href="javascript:update();"><img src="/skin/images//btn_confirm.gif" alt="Ȯ�� ��ư"></a>
				<!--a href="javascript:list(document.form);" --><a href="/A_online.do?method=viewAcceptData&dataId=${param.dataId}"><img src="/skin/images/btn_cancel.gif" alt="��� ��ư"></a>
			</div><br/>
			
		<!--##### Ȯ�� ��� ��ư �� #####-->



</div>
<font color="red">${requestScope['jspPage']}</font>



