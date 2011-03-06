<%@ page session="true"  contentType="text/html; charset=euc-kr" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="onlineZvl" value="${requestScope['onlineZvl']}"   scope="page" />
<c:set var="dataZvl" value="${requestScope['dataZvl']}"   scope="page" />

<!-- #################### css 설정 start ###################### -->
<link href="/skin/css/blue/board_style.css" rel="stylesheet" type="text/css">
<!-- #################### css 설정 end ########################-->

<script language="javascript" src="/cms/dev_content/common/js/jslb_ajax.js"></script>
<script language="javascript" src="/cms/dev_content/common/js/prototype.js"></script>
<script language="javascript" src="/cms/dev_content/common/js/miya_validator.js"></script>
<script language="javascript">
	function deleteLecture()
	{
		if(confirm("해당 이벤트의 기본정보와 하위이벤트, 신청자 목록을 전부 삭제하시겠습니까?"))
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
				 alert("성공적으로 삭제되었습니다.");
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
		if(confirm("해당 이벤트의 기본정보와 신청자 목록을 전부 삭제하시겠습니까?"))
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
				 alert("성공적으로 삭제되었습니다.");
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

<!-- ##### 게시판 시작 ##### -->

<!-- ##### 전체 테이블 시작 ##### -->
<meta http-equiv="Content-Type" content="text/html; charset=euc-kr" />
<p style="color:red;font-weight:bold;margin:5px 0;">교육 프로그램 리스트 페이지 </p>
<div id="board_form" style="width:700">
		<!-- ### 분류 시작 ### -->
			
		<!-- ### 분류 끝 ### -->

		<!-- ### 답변달린 글만 보기 여부 시작  ### -->
			
		<!-- ### 답변달린 글만 보기 여부  끝 ### -->

			<!-- 접수용 이벤트 리스트 화면-->
			<div class="board_view">
				<table cellspacing="1" cellpadding="0" width="100%" class="view">
					<colgroup><col width="14%"><col /></colgroup>
					<tr>
						<th class="view">제목</th>
						<td class="view">${onlineZvl.TITLE[0]}</td>
					</tr>
					<tr>
						<th class="view">중복접수여부</th>
						<td class="view">
							<c:if test="${onlineZvl.DUP_YN[0]=='Y'}">허용</c:if>
							<c:if test="${onlineZvl.DUP_YN[0]=='N'}">비허용</c:if>
						</td>
					</tr>
					<tr>
						<th class="view">관리담당자</th>
						<td class="view">${onlineZvl.MANAGER[0]}</td>
					</tr>
					<tr>
						<th class="view">메뉴위치</th>
						<td class="view">${onlineZvl.MENU_LOC[0]}</td>
					</tr>
					<tr>
						<th class="view">바로가기URL</th>
						<td class="view">/online.do?method=list&amp;did=${onlineZvl.DID[0]}</td>
					</tr>
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
							<a href="/A_online.do?method=updateLecturePage&did=${onlineZvl.DID[0]}"><img src="/skin/images/btn_modify.gif" alt="수정" border="0"></a>&nbsp;
						 	<a href="javascript:deleteLecture();"><img src="/skin/images/btn_del.gif" alt="삭제" border="0"></a>
				
			</span>
		<div>

		<!-- 목록, 수정, 삭제 버튼 끝-->


		<!-- 접수용 이벤트 리스트 화면--->
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
					<th id="board_coursename">과정명</th>
					<th id="board_appdate">접수기간</th>
					<th id="board_ondate">교육기간</th>
					<th id="board_number">현원/정원</th>
					<th id="board_status">상태</th>
					<th id="board_del">삭제</th>
				</tr>
				</thead>
				<tbody> 
				<!-- ##### 게시글 시작 ##### -->
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
					<c:if test="${dataZvl.STATUS[x] == 0}">접수전</c:if>
					<c:if test="${dataZvl.STATUS[x] == 1}">접수중</c:if>
					<c:if test="${dataZvl.STATUS[x] == 2}">접수마감</c:if>
					</td>
					<td headers="board_del"><a href="javascript:deleteSubLecture('${dataZvl.DID[x]}');">삭제</a></td>
				</tr>
			</c:forEach>
		</c:when>
		</c:choose>			
				<!-- ##### 게시글 끝 ##### -->
				 </tbody>
      </table>
		</div>
   <!-- ##### 리스트 끝  ##### -->
		<div class="tfoot">
			<div class="list_num">&nbsp;</div>
			<div class="board_btn2">		
					<a href="/A_online.do?method=insertLecturePage&parentId=${param.did}"><img src="/skin/images/btn_regist_2.gif" border="0" alt="등록하기"></a>		
			</div>
			<div class="cb"></div>
		</div>
			<div class="page_nate">${dataZvl.paging}</div>

</div>
</form>
<font color="red">${requestScope['jspPage']}</font>



