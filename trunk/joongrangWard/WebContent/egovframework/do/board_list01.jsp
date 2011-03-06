<%@ page session="true"  contentType="text/html; charset=euc-kr" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="onlineZvl" value="${requestScope['onlineZvl']}"   scope="page" />
<c:set var="dataZvl" value="${requestScope['dataZvl']}"   scope="page" />
<c:set var="fieldZvl" value="${requestScope['fieldZvl']}"   scope="page" />

<!-- #################### css 설정 start ###################### -->
<link href="/skin/css/blue/board_style.css" rel="stylesheet" type="text/css">
<!-- #################### css 설정 end ########################-->

<script language="javascript" src="/cms/dev_content/common/js/jslb_ajax.js"></script>
<script language="javascript" src="/cms/dev_content/common/js/prototype.js"></script>
<script language="javascript">
	function deleteAccept()
	{
		if(confirm("해당 이벤트의 기본정보와 신청자 목록을 전부 삭제하시겠습니까?"))
		{
			var url = "/A_online.do";
			var param = "&method=deleteAccept&did=${onlineZvl.DID[0]}";
			sendRequest(callbackDeleteAccept, param, 'POST', url, true, true);
		}
	}

	function callbackDeleteAccept(oj)
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
			alert("FUNCTION : callbackDeleteAccept() " + err.description);
		}
	}
	
	function deleteAcceptData()
	{
		if(confirm("신청자 목록을 전부 삭제하시겠습니까?"))
		{
			var url = "/A_online.do";
			var param = "&method=deleteAcceptData&did=${onlineZvl.DID[0]}";
			sendRequest(callbackDeleteAcceptData, param, 'POST', url, true, true);
		}
	}

	function callbackDeleteAcceptData(oj)
	{
		try 
		{
			var jsonData = oj.responseText;
			var j = eval('(' + jsonData + ')');
			var code = j.resultCode;
			if(code == "1")
			{
				 alert("성공적으로 삭제되었습니다.");
				 //location.href="/A_online.do?method=insertPage";
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
<p style="color:red;font-weight:bold;margin:5px 0;">접수용 이벤트 리스트 화면 </p>
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
						<th class="view">접수기간</th>
						<td class="view">${onlineZvl.RECEIPT_SDATE[0]} ~ ${onlineZvl.RECEIPT_EDATE[0]}</td>
					</tr>
					<tr>
						<th class="view">접수형태</th>
						<td class="view">
							<c:if test="${onlineZvl.RECEIPT_TYPE[0] == '0'}">선착순 신청인원 ${onlineZvl.APP_INWON[0]}명 대기인원 ${onlineZvl.WAIT_INWON[0]}명</c:if>
							<c:if test="${onlineZvl.RECEIPT_TYPE[0] == '1'}">일반접수</c:if>
						</td>
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
						<th class="view">리턴URL</th>
						<td class="view">${onlineZvl.MENU_LOC[0]}</td>
					</tr>
					<tr>
						<th class="view">바로가기URL</th>
						<td class="view">/online.do?method=list&amp;did=${onlineZvl.DID[0]}</td>
					</tr>
				</table>	
			</div> <!--  board_view -->

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
							<p style="float:left;width:40%;text-align:center;">	추가 입력 정보 </p>	
						</th>
					</tr>
					
				<c:if test="${fieldZvl.size > 0}">
		      		<c:forEach var="x" begin="0" end="${fieldZvl.size-1}">
					<tr>
						<th class="view">${fieldZvl.FIELD_NAME[x]}</th>
						<td class="view">
							<c:if test="${fieldZvl.FIELD_TYPE[x] == 'text'}">일반 입력 정보</c:if>
							<c:if test="${fieldZvl.FIELD_TYPE[x] == 'date'}">날자 입력 영역</c:if>
							<c:if test="${fieldZvl.FIELD_TYPE[x] == 'textArea'}">텍스트 입력 영역</c:if>
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
						<th>첨부파일  </th>
						<td>${onlineZvl.FILE_NUM[0]}</td>
					</tr>
					<tr>
						<th>내용 항목 입력 여부</th>
						<td>${onlineZvl.CONTENT_NM[0]}</td>
					</tr>
				</table>       

			</div><!--  board_write -->
			<!--  입력폼3 끝 -->
			<!-- 목록, 수정, 삭제 버튼 -->
	 
			<!-- *********************************************************************************** 
				common/ListModiDeletePage.jsp 
				목록 수정 삭제 하는 버튼 부분을 따로 페이지로 뺐다. 
			**************************************************************************************-->
		<div style="padding:5px 0 0 0;">
			<span style="width:60%">				
			</span>
			<span style="width:40%;text-align:right;">					
							<a href="/A_online.do?method=updateAcceptPage&did=${onlineZvl.DID[0]}"><img src="/skin/images/btn_modify.gif" alt="수정" border="0"></a>&nbsp;
						 	<a href="javascript:deleteAccept();"><img src="/skin/images/btn_del.gif" alt="삭제" border="0"></a>
				
			</span>
		<div>

		<!-- 목록, 수정, 삭제 버튼 끝-->


			<!-- 접수용 이벤트 리스트 화면--->
		<div style="padding:8px 0;"><a href="javascript:deleteAcceptData();"><img src="/skin/images/btn_all_delete.gif" alt="신청자정보 일괄삭제" /></a></div>

		<div class="board_list">			
			<table cellspacing="1" cellpadding="0">
			<colgroup>
		
					<col width="15" /><col width="40" /><col width="*" /><col width="100" /><col width="40" />
				</colgroup>
				<thead>
				<tr>
					<th id="board_check"><input type="checkbox" onClick="mboardCheckDelete()" name="all_chk"></th>
					<th id="board_num">번호</th>
					<th id="board_korname">작성자</th>
					<th id="board_create">신청일</th>
					<th id="board_status">상태</th>
				</tr>
				</thead>
				<tbody>  
			<c:if test="${dataZvl.rows[0] == 0}">
				<tr height="23">	
					<td colspan="5">데이터가 없습니다.</td>		
				</tr>	
			</c:if>
			<c:if test="${dataZvl.rows[0] > 0}">
				<c:forEach var="x" begin="0" end="${dataZvl.rows[0]-1}">  
				<!-- ##### 게시글 시작 ##### -->
				<tr height="23">	
					<td headers="board_check"><input type="checkbox" value=2 name="chkBoardId"></td>
					<td headers="board_num">${dataZvl.totCount - (dataZvl.cpage-1)*dataZvl.pageCount - x}</td>
					<td headers="board_korname"><a href="/A_online.do?method=viewAcceptData&dataId=${dataZvl.DATA_ID[x]}">${dataZvl.MEM_NM[x]}</a></td>
					<td headers="board_create">${dataZvl.REG_DATE[x]}</td>
					<td headers="board_status">
				<c:choose>
					<c:when test="${not empty onlineZvl.APP_INWON[0]}">
						<c:if test="${onlineZvl.APP_INWON[0] >= (zvl.rows[0]-x)}">신청</c:if>
						<c:if test="${onlineZvl.APP_INWON[0] < (zvl.rows[0]-x)}">대기</c:if>
					</c:when>
					<c:otherwise>신청</c:otherwise>
				</c:choose>
					</td>		
				</tr>	
				</c:forEach>
			</c:if>
				<!-- ##### 게시글 끝 ##### -->
				 </tbody>
      </table>
		</div>
   <!-- ##### 리스트 끝  ##### -->
		<div class="tfoot">
			<div class="list_num">&nbsp;
				<a href="/A_online.do?method=getExcelOfAcceptData&did=${onlineZvl.DID[0]}"><img src="/skin/images/btn_info_down.gif" border="0" alt="신청자정보 다운로드" align="absmiddle"></a>
					
			</div>
			<div class="board_btn2">		
					<a href="/A_online.do?method=writeAcceptPage&did=${onlineZvl.DID[0]}"><img src="/skin/images/btn_regist_2.gif" border="0" alt="등록하기"></a>		
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



