<%@ page session="true"  contentType="text/html; charset=euc-kr" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="zvl" value="${requestScope['zvl']}"   scope="page" />
<c:set var="fileZvl" value="${requestScope['fileZvl']}"   scope="page" />

<!-- #################### css 설정 start ###################### -->
<link href="/skin/css/blue/board_style.css" rel="stylesheet" type="text/css">
<!-- #################### css 설정 end ########################-->
<script language="javascript" src="/cms/dev_content/common/js/jslb_ajax.js"></script>
<script language="javascript" src="/cms/dev_content/common/js/prototype.js"></script>
<script type="text/javascript">

	function deleteAcceptDataByDataId()
	{
		if(confirm("삭제하시겠습니까?"))
		{
			var url = "/A_online.do";
			var param = "&method=deleteAcceptDataByDataId&did=${zvl.DID[0]}&dataId=${zvl.DATA_ID[0]}";
			sendRequest(callbackDeleteAcceptDataByDataId, param, 'POST', url, true, true);
		}
	}

	function callbackDeleteAcceptDataByDataId(oj)
	{
		try 
		{
			var jsonData = oj.responseText;
			var j = eval('(' + jsonData + ')');
			var code = j.resultCode;
			if(code == "1")
			{
				 alert("성공적으로 삭제되었습니다.");
				 location.href="/A_online.do?method=view&did=${zvl.DID[0]}";
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

<!-- ##### 게시판 시작 ##### -->

<!-- ##### 전체 테이블 시작 ##### -->
<meta http-equiv="Content-Type" content="text/html; charset=euc-kr" />
<p style="color:red;font-weight:bold;margin:5px 0;">접수용 이벤트 뷰페이지 </p>
<div id="board_form" style="width:700">
			
			<!-- 접수용 이벤트 뷰 화면-->
			<div class="board_view">
				<table cellspacing="1" cellpadding="0" width="100%" class="view">
					<colgroup><col width="14%"><col /></colgroup>
					<tr>
						<th class="view">작성자</th>
						<td class="view">${zvl.MEM_NM[0]}</td>
					</tr>
					<tr>
						<th class="view">주소</th>
						<td class="view">${zvl.ZIPCODE[0]} ${zvl.ADDRESS1[0]}</td>
					</tr>
					<tr>
						<th class="view">전화번호</th>
						<td class="view">${zvl.PHONE[0]}</td>
					</tr>
					<tr>
						<th class="view">이메일</th>
						<td class="view">${zvl.EMAIL[0]}</td>
					</tr>
			<c:if test="${zvl.dataSize > 0}">
          	<c:forEach var="x" begin="0" end="${zvl.dataSize-1}">
					<tr>
						<th class="view">${zvl.FIELD_NAME[x]}</th>
						<td class="view">${zvl.FIELD_VALUE[x]}</td>
					</tr>
				</c:forEach>
			</c:if>
			<c:if test="${fileZvl.rows[0] > 0}">
          		<c:forEach var="x" begin="0" end="${fileZvl.rows[0]-1}">
					<tr>
						<th class="view">FILE${x+1}</th>
						<td class="view"><a href="/download.do?path=ONLINE_DIR&fileName=${fileZvl.FILE_NAME[x]}">${fileZvl.FILE_NAME[x]}</a></td>
					</tr>
				</c:forEach>
			</c:if>
			<c:if test="${not empty zvl.CONTENT_NM[0]}">
					<tr>
						<th colspan="2">${zvl.CONTENT_NM[0]}</th>
					</tr>
					<tr>
						<td colspan="2" style="background-color:#f5f5f5">아래의 작성하시는 내용 (첨부파일 포함)중에 개인정보에 관한 내용이 있다면 개인정보가 타인에게 노출되어 침해받을 수 있으므로 삭제 후 등록하여 주시기 바랍니다.  (개인정보내용 : 주민등록번호, 계좌번호, 핸드폰번호 등)</td>
					</tr>

					<!-- 글 내용 시작 -->					
					<tr>
						<td colspan="2">
								${zvl.CONTENTS[0]}
						</td>
					</tr>	
			</c:if>
				<!--  본문 내용 끝 -->
				</table>	

			</div> <!--  board_view -->

			<!-- 목록, 수정, 삭제 버튼 -->
	 
			<!-- *********************************************************************************** 
				common/ListModiDeletePage.jsp 
				목록 수정 삭제 하는 버튼 부분을 따로 페이지로 뺐다. 
			**************************************************************************************-->
		<div style="padding:5px 0 0 0;">
			<span style="width:60%">				
			</span>
			<span style="width:40%;text-align:right;">					
				<a href="/A_online.do?method=updateAcceptDataPage&dataId=${zvl.DATA_ID[0]}"><img src="/skin/images/btn_modify.gif" alt="수정" border="0"></a>&nbsp;
				<a href="javascript:deleteAcceptDataByDataId();"><img src="/skin/images/btn_del.gif" alt="삭제" border="0"></a>&nbsp;
				<a href="/A_online.do?method=view&did=${zvl.DID[0]}"><img src="/skin/images/btn_list.gif" alt="목록" border="0"></a>				
			</span>
		<div>

		<!-- 목록, 수정, 삭제 버튼 끝-->



</div>
</form>
<font color="red">${requestScope['jspPage']}</font>



