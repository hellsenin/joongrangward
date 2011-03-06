<%@ page session="true"  contentType="text/html; charset=euc-kr" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!-- #################### css 설정 start ###################### -->

<link href="/cms/common/css/mp01.css" rel="stylesheet" type="text/css">
<link rel="STYLESHEET" type="text/css" href="/cms/common/calendar/calendar-system.css" >
<link href="/skin/css/blue/board_style.css" rel="stylesheet" type="text/css">
<!-- #################### css 설정 end ########################-->
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
		var fileNum = "${onlineZvl.FILE_NUM[0]}";
		var contentNm = "${onlineZvl.CONTENT_NM[0]}";
		
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
		
		if(fileNum)
		{
			frm.fchk.checked=true;
			$("fnum").show();
			$("fileNum").value = fileNum;
		}
		if(contentNm)
		{
			frm.cchk.checked=true;
			$("cnm").show();
			$("contentNm").value = contentNm;
		}
	}
	
	function postInvoke( resultMsg, invokeId )
	{
		switch( invokeId )
		{
			case 'success':
				alert('성공적으로 등록되었습니다.');
				location.href="/A_online.do?method=view&did=${onlineZvl.DID[0]}";
			break;
	
			case 'failure':
			if(resultMsg) alert(resultMsg);
			else alert('데이타 등록시 문제가 발생하였습니다.');
			break;
		} 
	}

	function checkForm(form)
	{
		var k = get_radio_value("kind");
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
		if($('fchk').checked)
				v.add("fileNum", {
					required: true,
					option: "number"

				});
		if($('cchk').checked)
				v.add("contentNm", {
					required: true
				});
		var result = v.validate();
		if (!result) {
				alert(v.getErrorMessage());
				v.getErrorElement().focus();
				return false;
		} 
		else if(!checkInputField("userFieldName"))
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
			frm.method.value = "updateAccept";
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
				"<td><input name=\"managerFieldValue\" type=\"text\" class=\"pro_input\" id=\"managerFieldValue\" value=\"\" /></td>";
		}
		else
		{
			cell0.innerHTML = 
				"<td><input name=\"userFieldName\" type=\"text\"  class=\"box1\" style=\"width:98%\"  value=\"\"></td>";	
			cell1.innerHTML = 
				"<select id=\"userFieldType\" name=\"userFieldType\">"+
				"<option value=\"text\">일반 입력 정보</option>"+
				"<option value=\"date\">날자 입력 정보</option>"+
				"<option value=\"textArea\">텍스트 입력 영역</option>"+
				"</select>";
		}
	}
	
	function deleteLastRow(objName)
	{
		var tbl = $(objName);
		if (tbl.rows.length > 3) tbl.deleteRow(tbl.rows.length - 1);
	}
	
	function changeKindType()
	{
		var r = get_radio_value("kind");
		if(r == "0")
		{
			$("receiptDateTr").show();
			$("receiptTypeTr").show();
			$("inwonTr").show();
			$("inputInfo").show();
			$("userTbl").show();
			$("addInfo2").show();
		}
		else if(r == "1")
		{
			text_clear("receiptSdate|receiptEdate|appInwon|waitInwon");
			$("receiptDateTr").hide();
			$("receiptTypeTr").hide();
			$("inwonTr").hide();
			$("inputInfo").hide();
			$("userTbl").hide();
			$("addInfo2").hide();
		}
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
<!-- ##### 게시판 시작 ##### -->

<!-- ##### 전체 테이블 시작 ##### -->
<meta http-equiv="Content-Type" content="text/html; charset=euc-kr" />
<IFRAME NAME='targetAction' WIDTH='0' HEIGHT='0' FRAMEBORDER='' SCROLLING='no' SRC='' MARGINWIDTH='0' MARGINHEIGHT='0' HSPACE='0' VSPACE='0'></IFRAME>
<p style="color:red;font-weight:bold;margin:5px 0;">동적온라인 시스템 이벤트 추가 </p>
<div id="board_form" style="width:700">
			
	<form id="frm" name="frm" method="post">
	<input type="hidden" id="method" name="method"/>
	<input type="hidden" id="did" name="did" value="${onlineZvl.DID[0]}" />
		<!-- 입력폼1 시작-->
		<div class="board_write">
				<table cellspacing="1" cellpadding="0" width="100%">
					<colgroup><col width="14%"><col /></colgroup>
					<tr>
						<th>분 류</th>
						<td>접수용</td>
					</tr>
					<tr>
						<th>제목</th>
						<td>
							<input name="title" type="text"  class="box1" style="width:98%"  value="${onlineZvl.TITLE[0]}">
						</td>
					</tr>
					<tr id="receiptDateTr">
						<th>접수기간</th>
						<td align="left">
							<table border="0" cellspacing="0" cellpadding="0">
								<tr>
									<td width="300" class="reg_text">
									<input name="receiptSdate" type="text" class="bbs_texts" id="receiptSdate" style="background-color:#ffffff; border:#BCBCBC solid 1px;width:100;" value="${onlineZvl.RECEIPT_SDATE[0]}" size="20" maxlength="10"  readonly>
										<img src="/cms/img/btn/btn_date.gif" align="absmiddle" style="cursor:hand" onclick="return showCalendar('receiptSdate', 'y-mm-dd');">&nbsp; ~
										<input name="receiptEdate" type="text" class="bbs_text" id="receiptEdate" style="background-color:#ffffff; border:#BCBCBC solid 1px;width:100;" value="${onlineZvl.RECEIPT_EDATE[0]}" size="20"  maxlength="10" readonly>
										<img src="/cms/img/btn/btn_date.gif" align="absmiddle" style="cursor:hand" onclick="return showCalendar('receiptEdate', 'y-mm-dd');">&nbsp; 
									</td>
								</tr>
							</table>
						</td>
					</tr>
					<tr id="receiptTypeTr">
						<th>접수형태</th>
						<td>
							<input type="radio" name="receiptType" value="0" style="border:0" onclick="changeInwonType()"> 
							선착순  &nbsp;
							<input type="radio" name="receiptType" value="1" style="border:0" onclick="changeInwonType()"> 
							일반접수
							<span id="inwonTr">
							<br />
							신청인원 :  <input name="appInwon" type="text"  class="box1" id="appInwon" style="width:40px"  value="${onlineZvl.APP_INWON[0]}"> 
							&nbsp;
							대기인원 :  <input name="waitInwon" type="text"  class="box1" id="waitInwon" style="width:40px"  value="${onlineZvl.WAIT_INWON[0]}">
							</span>
						</td>
					</tr>
					<tr>
						<th>중복접수여부</th>
						<td>
							<input type="radio" name="dupYn" value="Y" style="border:0"> 
							허용  &nbsp;
							<input type="radio" name="dupYn" value="N" style="border:0"> 
							비허용
						</td>
					</tr>
					<tr>
						<th>관리담당자</th>
						<td>
								<input name="manager" type="text"  class="box1" id="manager" style="width:240px"  value="${onlineZvl.MANAGER[0]}">
								&nbsp; <img src="/skin/images/btn_finds.gif" alt="찾기"  align="absmiddle" style="vertical-align:top;"  />
						</td>
					</tr>
					<tr>
						<th>리턴URL</th>
						<td>
								<input name="menuLoc" type="text"  class="box1" id="menuLoc" style="width:240px"  value="${onlineZvl.MENU_LOC[0]}">
								&nbsp; <img src="/skin/images/btn_finds.gif" alt="찾기"  align="absmiddle" style="vertical-align:top;"  />
						</td>
					</tr>
				</table>	
			</div> <!--  board_write -->
			<!--  입력폼1 끝 -->

			<!-- 입력폼2 시작-->
		`<div class="board_write">
				<table id="userTbl" cellspacing="1" cellpadding="0" width="100%">
					<colgroup><col width="40%"><col /></colgroup>
					<tr id="inputInfo">
						<th>입력기본정보</th>
						<td>이름, 주소, 전화번호,이메일</td>
					</tr>
					<tr id="addInfo">
						<th colspan="2">
							<p style="float:left;width:40%;text-align:center;">	추가 입력 정보 </p>	<p style="float:right;">+ <a href="javascript:appendRow('userTbl');">추가</a> | - <a href="javascript:deleteLastRow('userTbl');">삭제</a></p></th>
					</tr>
					
					<c:if test="${zvl.size > 0}">
		      	<c:forEach var="x" begin="0" end="${zvl.size-1}">
					<tr>
						<td><input name="userFieldName" type="text"  class="box1" style="width:98%"  value="${zvl.FIELD_NAME[x]}"></td>
						<td>
							<select id="userFieldType" name="userFieldType">
									<option value="text" <c:if test="${zvl.FIELD_TYPE[x] == 'text'}">selected</c:if>>일반 입력 정보</option>
									<option value="date" <c:if test="${zvl.FIELD_TYPE[x] == 'date'}">selected</c:if>>날자 입력 영역</option>
									<option value="textArea" <c:if test="${zvl.FIELD_TYPE[x] == 'textArea'}">selected</c:if>>텍스트 입력 영역</option>
								</select>
						</td>
					</tr>
						</c:forEach>
					</c:if>				
				</table>       

			</div><!--  board_write -->
			<!--  입력폼2 끝 -->

		<!-- 입력폼3 시작-->
		`<div id="addInfo2" class="board_write">
				<table cellspacing="1" cellpadding="0" width="100%">
					<colgroup><col width="40%"><col /></colgroup>
					<tr>
						<th><input name="fchk" type="checkbox" class="box1" id="fchk" style="border:0;" onclick="viewControl(this,'fnum', 'fileNum');"/>
						&nbsp;첨부파일 사용 여부  </th>
						<td><span id="fnum" style="display:none">첨부파일 허용 개수 &nbsp;<input name="fileNum" type="text"  class="box1" id="fileNum" style="width:50px"  value=""></span> </td>
					</tr>
					<tr>
						<th><input name="cchk" type="checkbox" class="box1" id="cchk" style="border:0;" onclick="viewControl(this,'cnm', 'contentNm');" />
						&nbsp;내용 항목 입력 여부</th>
						<td><span id="cnm" style="display:none">내용입력항목 제목 &nbsp;<input name="contentNm" type="text"  class="box1" id="contentNm" style="width:200px"  value=""></span></td>
					</tr>
				</table>       

			</div><!--  board_write -->
			<!--  입력폼3 끝 -->
			</form>

			<!--##### 확인 취소 버튼 시작 #####-->
			<div class="board_btn">
				<a href="javascript:update();"><img src="/skin/images//btn_confirm.gif" alt="확인 버튼"></a>
				<!--a href="javascript:list(document.form);" --><a href="/A_online.do?method=view&did=${onlineZvl.DID[0]}"><img src="/skin/images/btn_cancel.gif" alt="취소 버튼"></a>
			</div><br/>
			
		<!--##### 확인 취소 버튼 끝 #####-->



</div>
</form>
<font color="red">${requestScope['jspPage']}</font>
<script>
init();
</script>


