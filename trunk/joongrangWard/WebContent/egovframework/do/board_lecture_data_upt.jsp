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
<script language="javascript">
	function postInvoke( resultMsg, invokeId )
	{
		switch( invokeId )
		{
			case 'success':
				alert('���������� ��ϵǾ����ϴ�.');
				location.href = "/A_online.do?method=viewLectureData&dataId=${zvl.DATA_ID[0]}";
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
		v.add("birthday", {
			required: true,
            glue: "-",
	        option: "isdate"    	
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
			return true;
		}
	}	
	function update()
	{
		var object = document.frm;
		if(checkForm(object))
		{
			object.zipcode.value = frm.zipcode1.value+"-"+object.zipcode2.value;
			object.phone.value = object.phone1.value+"-"+object.phone2.value+"-"+object.phone3.value;
			object.method.value = "updateLectureData";
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
		<input type="hidden" id="zipcode" name="zipcode" />
		<input type="hidden" id="phone" name="phone" />
		<div class="board_write">
				<table cellspacing="1" cellpadding="0" width="100%">
					<colgroup><col width="14%"><col /></colgroup>
					<tr>
						<th>�ۼ��� *</th>
						<td><input name="memNm" type="text" class="box1" id="memNm" style="width:150px" value="${zvl.MEM_NM[0]}" maxlength="" />
						&nbsp; (�� �Խ����� �Ǹ����� �Խõ˴ϴ�.)</td>
					</tr>
					<tr>
						<th>������� *</th>
						<td><input name="birthday" type="text" class="box1" id="birthday" style="width:150px" value="${zvl.BIRTHDAY[0]}" maxlength="" /></td>
					</tr>
					<tr>
						<th>�ּ� *</th>
						<td>
							<table width="100%" border="0" cellpadding="0" cellspacing="0">
								<tr>
									<td>
										<c:set var="fnZipcode" value="${fn:split(zvl.ZIPCODE[0], '-')}"/>
										<input name="zipcode1" type="text"  class="box1" id="zipcode1" style="width:50;margin-bottom:1" value="${fnZipcode[0]}" /> 
										-
										<input name="zipcode2" type="text" class="box1" id="zipcode2"   style="width:50;margin-bottom:1" value="${fnZipcode[1]}"/>
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
						<td><input name="phone1" type="text"  class="box1" id="phone1" style="width:50px" value="${zvl.PHONES[0]}"> 
						- 
						<input name="phone2" type="text"  class="box1" id="phone2" style="width:50px" value="${zvl.PHONES[1]}"> 
						- 
						<input name="phone3" type="text"  class="box1" id="phone3" style="width:50px" value="${zvl.PHONES[2]}">
						</td>
					</tr>
					<tr>
						<th>�̸���</th>
						<td><input name="email" type="text"  class="box1" style="width:200px" value="${zvl.EMAIL[0]}"></td>
					</tr>
				<!--  ���� ���� �� -->
				</table>	

			</div> <!--  board_write -->
		</form>
			<!--  �Է� �� �� -->

			<!--##### Ȯ�� ��� ��ư ���� #####-->
			<div class="board_btn">
				<a href="javascript:update();"><img src="/skin/images//btn_confirm.gif" alt="Ȯ�� ��ư"></a>
				<!--a href="javascript:list(document.form);" --><a href="/A_online.do?method=viewLectureData&dataId=${param.dataId}"><img src="/skin/images/btn_cancel.gif" alt="��� ��ư"></a>
			</div><br/>
			
		<!--##### Ȯ�� ��� ��ư �� #####-->



</div>
<font color="red">${requestScope['jspPage']}</font>



