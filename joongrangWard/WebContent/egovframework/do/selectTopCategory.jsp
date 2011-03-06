<%@ page session="true"  contentType="text/html; charset=euc-kr" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>


<meta http-equiv="Content-Type" content="text/html; charset=euc-kr" />
<!-- #################### css 설정 start ###################### -->
<link href="/skin/css/blue/board_style.css" rel="stylesheet" type="text/css">
<!-- #################### css 설정 end ########################-->
<!-- ##### 전체 테이블 시작 ##### -->

<div id="board_form" style="width:700">
	<div class="board_list">
		<table cellspacing="1" cellpadding="0">
			<thead>
			<tr>
				<th width="12%" id="board_num">번호</th>
				<th width="12%" id="board_num">분류</th>
				<th width="15%" id="board_title">제목</th>
				<th width="22%" id="board_korname">관리자</th>
				<th width="35%" id="board_create">url</th>
				<th width="16%" id="board_file">첨부</th>
			</tr>
			</thead>

		<!-- ##### 공지글 시작 ##### -->
				<tbody>			
		 		<c:forEach var="result" items="${resultList}" varStatus="status">
					<tr>
					<td headers="board_num">${(result.pageIndex-1) * result.pageSize + result.count}</td>
					<td headers="board_num">
						<c:if test="${result.kind=='0'}">접수용</c:if>
						<c:if test="${result.kind=='1'}">교육용</c:if>
					</td>
					<td headers="board_title" title="555">
						<a href="/A_online.do?method=view&did=${result.did}">
							${result.title}
						</a>								
					</td>
					<td headers="board_korname">${result.manager}</td>				
					<td headers="board_create">/online.do?method=list&amp;did=${result.did}</td>				
					<td headers="board_file">${result.fileNum}
					</td>
					</tr>
				</c:forEach>	  
				 <c:if test="${fn:length(resultList) == 0}">
				  <tr>
				    <td headers="board_title" colspan="6"><spring:message code="common.nodata.msg" /></td>  
				  </tr>		 
				 </c:if>
		        </tbody>
      </table>
		</div>
   <!-- ##### 리스트 끝  ##### -->
		<div class="tfoot">
			<div class="list_num">
			</div>
			<div class="board_btn2">
              <a href="/do/writeDynamicOnline.do"><img src="/skin/images/btn_write.gif" border="0" alt="등록하기"></a> </div>
			<div class="cb"></div>
		</div>
		<div class="page_nate">
		<ui:pagination paginationInfo="${paginationInfo}" type="image" jsFunction="fn_egov_select_brdMstr" />
		</div>

</div>


