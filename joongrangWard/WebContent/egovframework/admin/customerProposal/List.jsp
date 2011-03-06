<%@ page language="java" contentType="text/html; charset=utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="validator" uri="http://www.springmodules.org/tags/commons-validator" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<link rel="stylesheet" type="text/css" href="/admin/common/css/common_style.css">
<link rel="stylesheet" type="text/css" href="/admin/common/css/board.css">

<h3 class="tit_03">고객제안</h3>


<table class="list_type01" summary="제안보기 목록 테이블입니다">
	<caption>제안보기 목록</caption>
	<colgroup>
		<col width="8%" />						
		<col width="10%" />					
		<col width="10%" />
		<col width="*" />
		<col width="15%" />
		<col width="12%" />
		<col width="10%" />
		<col width="10%" />
	</colgroup>
	<thead>
		<tr>
			<th scope="col" class="fir">번호</th>
			<th scope="col">채택</th>
			<th scope="col">공개</th>
			<th scope="col">제목</th>
			<th scope="col">등록일</th>
			<th scope="col">작성자</th>
			<th scope="col">첨부파일</th>
			<th scope="col">조회수</th>
		</tr>
	</thead>
	<tbody>
		<c:forEach items="${resultList}" var="item" varStatus="status">
			<tr>
				<!-- 번호 -->
				<td>
					<c:out value="${(resultListSize + 1) - ((CustomerProposal.pageIndex - 1) * CustomerProposal.pageSize + status.count)}"/>
				</td>
				
				<!-- 채택 -->
				<td>
					<c:if test="${item.isAccept == 'N'}">N</c:if>
					<c:if test="${item.isAccept == 'Y'}">Y</c:if>
				</td>
				
				<!-- 공개 -->
				<td>
					<c:if test="${item.isSecret == 'N'}">공개</c:if>
					<c:if test="${item.isSecret == 'Y'}">비공개</c:if>
				</td>
				
				<!-- 제목 -->
				<td class="tal">
					<a href="<c:url value='/admin/customerProposal/select.do?menuId=${menuId}&amp;code=${item.code}&amp;pageIndex=${CustomerProposal.pageIndex}'/>">${item.title}</a>
				</td>
				
				<!-- 제목 -->
				<td>
					<fmt:formatDate value="${item.regDt}" pattern="yyyy년 M월 d일"/>
				</td>
				
				<!-- 작성자 -->
				<td>
					${item.regUserName}
				</td>
				
				<!-- 첨부파일 -->
				<td>
					<c:if test="${item.fileattachCnt > 0}">
						<img src="/portal/open_content/images/common/icon/icon_disk.gif" class="vam" alt="첨부파일 : 한글" />
					</c:if>
				</td>
				
				<!-- 조회수 -->
				<td>
					${item.readCnt}
				</td>
			</tr>
		</c:forEach>
	</tbody>
</table>
<!-- board list end //-->


<div id="paging">
	<div class="paging_con">
		${pagingInfoString}	
	</div>
</div>

