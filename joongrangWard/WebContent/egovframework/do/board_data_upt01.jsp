<%@ page session="true"  contentType="text/html; charset=euc-kr" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="zvl" value="${requestScope['zvl']}"   scope="page" />

<!-- #################### css 설정 start ###################### -->
<link href="/skin/css/blue/board_style.css" rel="stylesheet" type="text/css">
<!-- #################### css 설정 end ########################-->

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
				alert('성공적으로 등록되었습니다.');
				location.href = "/A_online.do?method=viewAcceptData&dataId=${zvl.DATA_ID[0]}";
			break;
	
	  		case 'failure':
				if(resultMsg) alert(resultMsg);
				else alert('데이타 등록시 문제가 발생하였습니다.');
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
<!-- ##### 게시판 시작 ##### -->

<!-- ##### 전체 테이블 시작 ##### -->
<meta http-equiv="Content-Type" content="text/html; charset=euc-kr" />
<IFRAME NAME='targetAction' WIDTH='0' HEIGHT='0' FRAMEBORDER='' SCROLLING='no' SRC='' MARGINWIDTH='0' MARGINHEIGHT='0' HSPACE='0' VSPACE='0'></IFRAME>
<p style="color:red;font-weight:bold;margin:5px 0;">관리자 접수 대행 입력 페이지 </p>
<div id="board_form" style="width:700">
			
			<!-- 입력폼 시작-->
		<form name="frm" id="frm" method="post">
		<input type="hidden" id="method" name="method" />
		<input type="hidden" id="did" name="did" value="${param.did}" />
		<input type="hidden" id="dataId" name="dataId" value="${param.dataId}" />
		<div class="board_write">
				<table cellspacing="1" cellpadding="0" width="100%">
					<colgroup><col width="14%"><col /></colgroup>
					<tr>
						<th>작성자 *</th>
						<td><input name="memNm" type="text" class="box1" id=""memNm"" style="width:150px" value="${zvl.MEM_NM[0]}" maxlength="" />
						&nbsp; (본 게시판은 실명으로 게시됩니다.)</td>
					</tr>
					<tr>
						<th>주소 *</th>
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
								<img src="/skin/photo/images/btn_addr.gif" alt="우편번호 검색" border="0" align="absmiddle"></a>
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
						<th>전화번호 *</th>
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
						<th>이메일</th>
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
						<td colspan="2" style="background-color:#f5f5f5">아래의 작성하시는 내용 (첨부파일 포함)중에 개인정보에 관한 내용이 있다면 개인정보가 타인에게 노출되어 침해받을 수 있으므로 삭제 후 등록하여 주시기 바랍니다.  (개인정보내용 : 주민등록번호, 계좌번호, 핸드폰번호 등)</td>
					</tr>

					<!-- 글 내용 시작 -->					
					<tr>
						<td colspan="2">
								<textarea name="contents"  style="width:100%; height:400px;">${zvl.CONTENTS[0]}</textarea>
						</td>
					</tr>	
					<!-- 글내용 끝 -->
				<!--  본문 내용 끝 -->
				</table>	

			</div> <!--  board_write -->
		</form>
			<!--  입력 폼 끝 -->

			<!--##### 확인 취소 버튼 시작 #####-->
			<div class="board_btn">
				<a href="javascript:update();"><img src="/skin/images//btn_confirm.gif" alt="확인 버튼"></a>
				<!--a href="javascript:list(document.form);" --><a href="/A_online.do?method=viewAcceptData&dataId=${param.dataId}"><img src="/skin/images/btn_cancel.gif" alt="취소 버튼"></a>
			</div><br/>
			
		<!--##### 확인 취소 버튼 끝 #####-->



</div>
<font color="red">${requestScope['jspPage']}</font>



