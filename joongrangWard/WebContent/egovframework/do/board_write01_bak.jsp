<%@ page session="true"  contentType="text/html; charset=euc-kr" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="zvl" value="${requestScope['zvl']}"   scope="page" />

<!-- #################### css 설정 start ###################### -->
<link href="/skin/css/blue/board_style.css" rel="stylesheet" type="text/css">
<!-- #################### css 설정 end ########################-->

<script language="javascript" src="/cms/dev_content/common/js/jslb_ajax.js"></script>
<script language="javascript" src="/cms/dev_content/common/js/prototype.js"></script>
<script language="javascript">
	function postInvoke( object, invokeId )
	{
		switch( invokeId )
		{
			case 'success':
				alert('성공적으로 등록되었습니다.');
			break;
	
	  		case 'failure':
				alert('데이타 등록시 문제가 발생하였습니다.');
	   		break;
		} 
	}
		
	function insert()
	{
		var object = document.frm;
		object.addr.value = frm.zipcode1.value+"-"+object.zipcode2.value+" "+object.address1.value+" "+object.address2.value;
		object.phone.value = object.phone1.value+"-"+object.phone2.value+"-"+object.phone3.value;
		object.method.value = "saveData";
		object.action = "/A_online.do";
		object.target = "targetAction";
		object.submit();
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
		<input type="hidden" id="addr" name="addr" />
		<input type="hidden" id="phone" name="phone" />
		<div class="board_write">
				<table cellspacing="1" cellpadding="0" width="100%">
					<colgroup><col width="14%"><col /></colgroup>
					<tr>
						<th>작성자</th>
						<td><input name="name" type="text" class="box1" id="name" style="width:150px" maxlength="" />
						&nbsp; (본 게시판은 실명으로 게시됩니다.)</td>
					</tr>
					<tr>
						<th>주소</th>
						<td>
							<table width="100%" border="0" cellpadding="0" cellspacing="0">
								<tr>
									<td><input name="zipcode1" type="text"  class="box1" id="zipcode1" style="width:50;margin-bottom:1" readonly="yes"> 
									-
										<input name="zipcode2" type="text" class="box1" id="zipcode2"   style="width:50;margin-bottom:1"  readonly="yes">
										&nbsp;
											<a href="/open_content/member/GC_member_zipcode.jsp?code=" onclick="window.open(this.href,'','width=400,height=400,location=no,toolbar=no,menubar=no,status=no,scrollbars=no,resizable=yes');return false;"
								onkeypress="if(event.keyCode==13) {window.open(this.href,'','width=400,height=400,location=no,toolbar=no,menubar=no,status=no,scrollbars=no,resizable=yes'); return false;}">
								<img src="/skin/photo/images/btn_addr.gif" alt="우편번호 검색" border="0" align="absmiddle"></a>
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
						<th>전화번호</th>
						<td><input name="phone1" type="text"  class="box1" id="phone1" style="width:50px"> 
						- 
						<input name="phone2" type="text"  class="box1" id="phone2" style="width:50px"> 
						- 
						<input name="phone3" type="text"  class="box1" id="phone3" style="width:50px">
						</td>
					</tr>
					<tr>
						<th>이메일 *</th>
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
					<tr>
						<th colspan="2">내용</th>
					</tr>
					<tr>
						<td colspan="2" style="background-color:#f5f5f5">아래의 작성하시는 내용 (첨부파일 포함)중에 개인정보에 관한 내용이 있다면 개인정보가 타인에게 노출되어 침해받을 수 있으므로 삭제 후 등록하여 주시기 바랍니다.  (개인정보내용 : 주민등록번호, 계좌번호, 핸드폰번호 등)</td>
					</tr>

					<!-- 글 내용 시작 -->					
					<tr>
						<td colspan="2">
								<textarea name="content"  style="width:100%; height:400px;"></textarea>
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
				<a href="javascript:insert();"><img src="/skin/images//btn_confirm.gif" alt="확인 버튼"></a>
				<!--a href="javascript:list(document.form);" --><a href="board_list01.jsp"><img src="/skin/images/btn_cancel.gif" alt="취소 버튼"></a>
			</div><br/>
			
		<!--##### 확인 취소 버튼 끝 #####-->



</div>



