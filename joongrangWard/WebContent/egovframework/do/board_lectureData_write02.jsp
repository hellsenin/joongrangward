<%@ page session="true"  contentType="text/html; charset=euc-kr" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="zvl" value="${requestScope['zvl']}"   scope="page" />

<!-- #################### css ���� start ###################### -->
<link href="/skin/css/blue/board_style.css" rel="stylesheet" type="text/css">
<!-- #################### css ���� end ########################-->

<script type="text/javascript" src="/open_content/system/js/jslb_ajax.js"></script>
<script type="text/javascript" src="/open_content/system/js/prototype.js"></script>
<script type="text/javascript" src="/open_content/system/js/miya_validator.js"></script>
<script type="text/javascript">
	function checkForm(form)
	{
		var v = new MiyaValidator(form);
		v.add("name", {
			required: true
		});
		v.add("zipcode1", {
			required: true,
			span: 2,
            glue: "-",
	        option: "zip"			
		});
		v.add("address1", {
			required: true
		});
		v.add("address2", {
			required: true
		});
	    v.add("phone1", {
	        required: true,
            span: 3,
            glue: "-",
	        option: "phone"                
	    });
	    v.add("email", {
	        required: true,
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
		
	function insert()
	{
		var object = document.frm;
		if(checkForm(object))
		{
			object.zipcode.value = frm.zipcode1.value+"-"+object.zipcode2.value;
			object.phone.value = object.phone1.value+"-"+object.phone2.value+"-"+object.phone3.value;
			object.action = "/A_online.do?method=saveLectureData";
			object.submit();
		}
	}
	</script>
<!-- ##### �Խ��� ���� ##### -->

<!-- ##### ��ü ���̺� ���� ##### -->
<meta http-equiv="Content-Type" content="text/html; charset=euc-kr" />
<p style="color:red;font-weight:bold;margin:5px 0;">������ ���� ���� �Է� ������ </p>
<div id="board_form" style="width:700">
			
			<!-- �Է��� ����-->
		<form name="frm" id="frm" method="post" enctype="multipart/form-data">
		<input type="hidden" id="did" name="did" value="${param.did}" />
		<input type="hidden" id="zipcode" name="zipcode" />
		<input type="hidden" id="phone" name="phone" />
		<div class="board_write">
				<table cellspacing="1" cellpadding="0" width="100%">
					<colgroup><col width="14%"><col /></colgroup>
					<tr>
						<th>�ۼ���</th>
						<td><input name="name" type="text" class="box1" id="name" style="width:150px" maxlength="" />
						&nbsp; (�� �Խ����� �Ǹ����� �Խõ˴ϴ�.)</td>
					</tr>
					<tr>
						<th>�ּ�</th>
						<td>
							<table width="100%" border="0" cellpadding="0" cellspacing="0">
								<tr>
									<td><input name="zipcode1" type="text"  class="box1" id="zipcode1" style="width:50;margin-bottom:1" readonly="yes"> 
									-
										<input name="zipcode2" type="text" class="box1" id="zipcode2"   style="width:50;margin-bottom:1"  readonly="yes">
										&nbsp;
											<a href="/dev_content/0800_member/GC_member_zipcode.jsp" onclick="window.open(this.href,'','width=400,height=400,location=no,toolbar=no,menubar=no,status=no,scrollbars=no,resizable=yes');return false;"
								onkeypress="if(event.keyCode==13) {window.open(this.href,'','width=400,height=400,location=no,toolbar=no,menubar=no,status=no,scrollbars=no,resizable=yes'); return false;}">
								<img src="/skin/photo/images/btn_addr.gif" alt="�����ȣ �˻�" border="0" align="absmiddle"></a>
									</td>
								</tr>
								<tr>
									<td class="bbs_text"><input name="address1" type="text" class="box1" id="address1"  style="width:400;margin-bottom:1" readonly="yes">
									<br><input name="address2" type="text"  class="box1" id="address2"  style="width:400;margin-bottom:1">
									</td>
								</tr>
							</table>
						</td>
					</tr>
					<tr>
						<th>��ȭ��ȣ</th>
						<td><input name="phone1" type="text"  class="box1" id="phone1" style="width:50px"> 
						- 
						<input name="phone2" type="text"  class="box1" id="phone2" style="width:50px"> 
						- 
						<input name="phone3" type="text"  class="box1" id="phone3" style="width:50px">
						</td>
					</tr>
					<tr>
						<th>�̸��� *</th>
						<td><input name="email" type="text"  class="box1" style="width:200px"></td>
					</tr>
			<c:if test="${zvl.size > 0}">
          	<c:forEach var="x" begin="0" end="${zvl.size-1}">
					<tr>
						<th>${zvl.FIELD_NAME[x]}<input type="hidden" name="fieldName" value="${zvl.FIELD_NAME[x]}"/></th>
						<td>
							<c:if test="${zvl.FIELD_TYPE[x] == 'textArea'}">
							<textarea id="fieldValue" name="fieldValue" style="width:100%; height:80px;" class="box1"></textarea>
							</c:if>
							<c:if test="${zvl.FIELD_TYPE[x] == 'text'}">
							<input type="text" id="fieldValue" name="fieldValue"  class="box1" style="width:100%" />
							</c:if>
						</td>
					</tr>
				</c:forEach>
			</c:if>
			<c:if test="${not empty zvl.FILE_NUM[0] || zvl.FILE_NUM[0] > 0}">
          		<c:forEach var="x" begin="0" end="${zvl.FILE_NUM[0]-1}">
					<tr>
						<th>÷������</th>
						<td><input name="fileList[${x}]" type="file" style="width:300px"></td>
					</tr>
				</c:forEach>
			</c:if>
			<c:if test="${not empty zvl.CONTENT_NM[0]}">
					<tr>
						<th colspan="2">${zvl.CONTENT_NM[0]}</th>
					</tr>
					<tr>
						<td colspan="2" style="background-color:#f5f5f5">�Ʒ��� �ۼ��Ͻô� ���� (÷������ ����)�߿� ���������� ���� ������ �ִٸ� ���������� Ÿ�ο��� ����Ǿ� ħ�ع��� �� �����Ƿ� ���� �� ����Ͽ� �ֽñ� �ٶ��ϴ�.  (������������ : �ֹε�Ϲ�ȣ, ���¹�ȣ, �ڵ�����ȣ ��)</td>
					</tr>

					<!-- �� ���� ���� -->					
					<tr>
						<td colspan="2">
								<textarea name="content"  style="width:100%; height:400px;"></textarea>
						</td>
					</tr>	
			</c:if>
					<!-- �۳��� �� -->
				<!--  ���� ���� �� -->
				</table>	

			</div> <!--  board_write -->
		</form>
			<!--  �Է� �� �� -->

			<!--##### Ȯ�� ��� ��ư ���� #####-->
			<div class="board_btn">
				<a href="javascript:insert();"><img src="/skin/images//btn_confirm.gif" alt="Ȯ�� ��ư"></a>
				<!--a href="javascript:list(document.form);" --><a href="/A_online.do?method=view&did=${param.did}"><img src="/skin/images/btn_cancel.gif" alt="��� ��ư"></a>
			</div><br/>
			
		<!--##### Ȯ�� ��� ��ư �� #####-->



</div>
<font color="red">${requestScope['jspPage']}</font>



