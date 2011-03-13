<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="validator" uri="http://www.springmodules.org/tags/commons-validator" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<form name="mfrm" method="post" action="/health/freecheck/forCheck.do?categoryId=${param.categoryId}" enctype="multipart/form-data">

	<div id="contents">	
	<div class="mt15">			
		<table width="100%" border="0" cellspacing="0" cellpadding="0" class="table_list" summary="제목, 주관부서, 등록일, 조회수, 첨부파일, 내용으로 구성되어 있습니다.">
				<caption>민원서식 상세내용</caption>
				<colgroup>
				  <col style="width:18%;" />
				  <col style="width:*;" />
				</colgroup>
				 <tbody>
					<tr>
					  <th>분류</th>
						<td class="aleft">
							<c:choose>
								<c:when test="${result.type_cd == '02'}">자율점검표</c:when>
								<c:when test="${result.type_cd == '03'}">법령인지도</c:when>
							</c:choose>
						</td>
					</tr>
					<tr>
						<th>제목</th>
						<td class="aleft">${result.title}</td>
					</tr>
					<tr>
						<th>점검기간</th>
						<td class="aleft"><fmt:formatDate value="${result.start_dt}" pattern="yyyy년MM월dd일"/> ~ <fmt:formatDate value="${result.end_dt}" pattern="yyyy년MM월dd일"/></td>
					</tr>
					<tr >
						<th>점검내용</th>
						<td class="aleft">
							${result.contents}
						</td>
					</tr>
					<tr>
						<th>첨부파일</th>
						<td class="aleft">
							<c:url value="/health/freecheck/download.do" var="download_url">
								<c:param name="file" value="${result.attachfile1}"></c:param>
							</c:url>
							<a href="${download_url}"><strong>${result.attachfile1}</strong></a>
						</td>
					</tr>
				</tbody>
			</table>
</form>

		<form action="/health/freecheck/forCheck.do?categoryId=${param.categoryId}" method="post">
			<input type="hidden" name="company_cd" value="${Bean.company_cd}"/>
			<input type="hidden" name="find_type_cd" value="${Bean.find_type_cd}"/>
			<input type="hidden" name="year_cd" value="${Bean.year_cd}"/>
			<input type="hidden" name="id" value="${Bean.id}"/>
			<input type="hidden" name="company_id" value="${Bean.id}"/>
			<input type="hidden" name="pageIndex" value="${Bean.pageIndex}"/>
			
			<input type="hidden" name="view_state" value="${Bean.view_state}"/>
			
			<input type="hidden" name="type_cd_01_yn" value="${Bean.type_cd_01_yn}"/>
			<input type="hidden" name="type_cd_02_yn" value="${Bean.type_cd_02_yn}"/>
			<input type="hidden" name="type_cd_03_yn" value="${Bean.type_cd_03_yn}"/>
			<input type="hidden" name="type_cd_04_yn" value="${Bean.type_cd_04_yn}"/>
			<input type="hidden" name="type_cd_05_yn" value="${Bean.type_cd_05_yn}"/>
			<input type="hidden" name="type_cd_06_yn" value="${Bean.type_cd_06_yn}"/>
			<input type="hidden" name="type_cd_07_yn" value="${Bean.type_cd_07_yn}"/>
			<input type="hidden" name="type_cd_08_yn" value="${Bean.type_cd_08_yn}"/>
			<input type="hidden" name="type_cd_09_yn" value="${Bean.type_cd_09_yn}"/>
			<input type="hidden" name="type_cd_10_yn" value="${Bean.type_cd_10_yn}"/>
			<input type="hidden" name="type_cd_11_yn" value="${Bean.type_cd_11_yn}"/>
			
			<input type="hidden" name="master_cd" value="${result.master_cd}"/>
			<input type="hidden" name="type_cd" value="${Bean.type_cd}"/>
			
<p class="btn_ri mt15">
			<span class="btn_del"><input type="submit" value="온라인점검" /></span>
		
			<c:url var="list_action" value="/health/freecheck/list.do?categoryId=${param.categoryId}">
				<c:param name="company_cd" value="${Bean.company_cd}"/>
				<c:param name="find_type_cd" value="${Bean.find_type_cd}"/>
				<c:param name="year_cd" value="${Bean.year_cd}"/>
				<c:param name="id" value="${Bean.id}"/>
				<c:param name="pageIndex" value="${Bean.pageIndex}"/>
				<c:param name="type_cd_01_yn" value="${Bean.type_cd_01_yn}"/>
				<c:param name="type_cd_02_yn" value="${Bean.type_cd_02_yn}"/>
				<c:param name="type_cd_03_yn" value="${Bean.type_cd_03_yn}"/>
				<c:param name="type_cd_04_yn" value="${Bean.type_cd_04_yn}"/>
				<c:param name="type_cd_05_yn" value="${Bean.type_cd_05_yn}"/>
				<c:param name="type_cd_06_yn" value="${Bean.type_cd_06_yn}"/>
				<c:param name="type_cd_07_yn" value="${Bean.type_cd_07_yn}"/>
				<c:param name="type_cd_08_yn" value="${Bean.type_cd_08_yn}"/>
				<c:param name="type_cd_09_yn" value="${Bean.type_cd_09_yn}"/>
				<c:param name="type_cd_10_yn" value="${Bean.type_cd_10_yn}"/>
				<c:param name="type_cd_11_yn" value="${Bean.type_cd_11_yn}"/>
			</c:url>
			<a href="${list_action}"><img src="../../../images/btn_list.gif" alt="목록" /></a>
</p>
		</form>

</div>
</div>

