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
				location.href="/A_online.do?method=insertPage";
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
		var param = "&method=deleteSubLecture&did=${onlineZvl.DID[0]}";
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
<p style="color:red;font-weight:bold;margin:5px 0;">교육프로그램 신청 확인 페이지 </p>
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
						<th class="view">과정명</th>
						<td class="view">${onlineZvl.TITLE[0]}</td>
					</tr>
					<tr>
						<th class="view">접수기간</th>
						<td class="view">${onlineZvl.RECEIPT_SDATE[0]} ~ ${onlineZvl.RECEIPT_EDATE[0]}</td>
					</tr>
					<tr>
						<th class="view">교육기간</th>
						<td class="view">${onlineZvl.LEC_SDATE[0]} ~ ${onlineZvl.LEC_EDATE[0]}</td>
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
						<th class="view">바로가기URL</th>
						<td class="view">/online.do?method=view&amp;did=${onlineZvl.DID[0]}</td>
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
							<th class="view">상태</th>
							<td class="view">
								<c:if test="${onlineZvl.STATUS[0] == 0}">접수전</c:if>
								<c:if test="${onlineZvl.STATUS[0] == 1}">접수중</c:if>
								<c:if test="${onlineZvl.STATUS[0] == 2}">접수마감</c:if>
							</td>
						</tr>
				</table>	
			</div> <!--  board_view -->
		<!-- 목록, 수정, 삭제 버튼 끝-->
<div style="padding:5px 0 0 0;">
			<span style="width:60%">				
			</span>
			<span style="width:40%;text-align:right;">					
							<a href="/A_online.do?method=updateSubPage&did=${onlineZvl.DID[0]}"><img src="/skin/images/btn_modify.gif" alt="수정" border="0"></a>&nbsp;
						 	<a href="javascript:deleteSubLecture();"><img src="/skin/images/btn_del.gif" alt="삭제" border="0"></a>
				
			</span>
		<div>

			<!-- 접수용 이벤트 리스트 화면--->
		<div style="padding:8px 0;"><img src="/skin/images/btn_all_delete.gif" alt="신청자정보 일괄삭제" /></div>

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
				<!-- ##### 게시글 시작 ##### -->
			<c:if test="${dataZvl.rows[0] == 0}">
				<tr height="23">	
					<td colspan="5">데이터가 없습니다.</td>		
				</tr>	
			</c:if>
			<c:if test="${dataZvl.rows[0] > 0}">
				<c:forEach var="x" begin="0" end="${dataZvl.rows[0]-1}">  
				<tr height="23">
					<td headers="board_check"><input type="checkbox" value=2 name="chkBoardId"></td>
					<td headers="board_num">${dataZvl.totCount - (dataZvl.cpage-1)*dataZvl.pageCount - x}</td>
					<td headers="board_korname"><a href="/A_online.do?method=viewLectureData&dataId=${dataZvl.DATA_ID[x]}">${dataZvl.MEM_NM[x]}</a></td>
					<td headers="board_create">${dataZvl.REG_DATE[x]}</td>
					<td headers="board_status">
				<c:choose>
					<c:when test="${onlineZvl.APP_INWON[0] >= (x+1)}">신청</c:when>
					<c:when test="${onlineZvl.APP_INWON[0] < (x+1) && (onlineZvl.APP_INWON[0]+onlineZvl.WAIT_INWON[0]) >= (x+1)}">대기</c:when>
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
				<a href="/A_online.do?method=getExcelOfLectureData&did=${onlineZvl.DID[0]}"><img src="/skin/images/btn_info_down.gif" border="0" alt="신청자정보 다운로드" align="absmiddle"></a>
					
			</div>
			<div class="board_btn2">		
					<a href="/A_online.do?method=writeLectureDataPage&did=${onlineZvl.DID[0]}"><img src="/skin/images/btn_regist_2.gif" border="0" alt="등록하기"></a>		
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



