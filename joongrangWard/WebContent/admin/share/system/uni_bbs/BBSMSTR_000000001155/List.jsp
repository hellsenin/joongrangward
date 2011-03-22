<%@page contentType="text/html;charset=utf-8" %>
<%@ page import="egovframework.com.cmm.service.EgovProperties" %>    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<c:set var="path" value="${fn:split(currMenu.fullPath, '/')}" />
    <c:set var="title" value=""/>
	<c:forEach var="x" begin="0" end="${fn:length(path)-1}">
		<c:set var="title" value="${path[x]}&lt;${title}"/>
	</c:forEach>
	<title>중랑구청 보건소</title>
<link href="/health/open_content/system/css/default.css" rel="stylesheet" type="text/css" />
<link href="/health/open_content/system/css/common.css" rel="stylesheet" type="text/css" />
<link href="/health/open_content/system/css/blue.css" rel="stylesheet" type="text/css" />
<link href="/health/open_content/system/css/board_blue.css" rel="stylesheet" type="text/css" />

<script type="text/javascript">

	function fn_bbs_search_check() {

	var searchCnd = document.frm.searchCnd.value;
	var searchWrd = document.frm.searchWrd.value;
	
		if(searchCnd == "" || searchCnd == null){
			
			alert("검색조건을 선택하세요");
			return false;
		
		} else if(searchWrd == "" || searchWrd == null){
			
			alert("검색어를 입력하세요");
			return false;
		
		} else {
			
			document.frm.searchWrd.value = searchString;
			return true;
		}
	
	}

</script>
<script type="text/javascript" src="/health/open_content/system/js/common_ui.js"></script>
</head>

<body style="background:none;padding:10px;">

<h2 style="padding:15px 0 15px 0;">자율점검</h2>
<p class="title_deco"></p>
<div id="contents">

<form name="frm" action="/admin/bbs/selectBoardList.do?bbsId=${param.bbsId}" method="post" onSubmit="return fn_bbs_search_check();">
<!-- 
    <div class="fl_l"> <span>${resultCnt}건 [${searchVO.pageIndex} / 1 Page]</span> </div>
-->
    <div class="mb15 mt15 cb fr">
        <legend>게시물검색</legend>
        <select name="searchCnd" title="구분선택">
            <option value="" <c:if test="${searchVO.searchCnd == ''}">selected="selected"</c:if> >선택</option>
			<option value="NTT_SJ" <c:if test="${searchVO.searchCnd == 'NTT_SJ'}">selected="selected"</c:if> >제목</option>
			<option value="NTT_CN" <c:if test="${searchVO.searchCnd == 'NTT_CN'}">selected="selected"</c:if> >내용</option>
        </select>
        <input type="text" title="검색어" class="text" name="searchWrd" value='<c:out value="${searchVO.searchWrd}"/>' />
    <input type="image" src="/health/open_content/images/borad/btn_search.gif" alt="검색" />
    </div>
</form>

<table width="100%" border="0" cellspacing="0" cellpadding="0" class="table_list" summary="번호, 제목, 담당부서, 등록일, 첨부파일, 조회수로 구성">
    <caption>
    게시물리스트
    </caption>
    <colgroup>
		<col style="width:7%;" />
		<col style="width:*;" />
		<col style="width:15%;" />
		<col style="width:12%;" />
		<col style="width:10%;" />
    </colgroup>
    <thead>
        <tr>
            <th>번호</th>
            <th>제목</th>
            <th>담당부서</th>
            <th>등록일</th>
            <th>첨부파일</th>
            <th>조회수</th>
        </tr>
    </thead>
    <tbody>
    	<c:forEach var="result" items="${resultList}" varStatus="status">
        <tr>
            <td class="aleft"><c:out value="${(resultCnt) - (searchVO.pageSize * (searchVO.pageIndex-1))}"/></td>
            <td class="aleft"><a href="/admin/bbs/selectBoardArticle.do?bbsId=${param.bbsId}&amp;nttId=${result.nttId}"><c:out value="${result.nttSj}" /></a></td>
            <td class="aleft"><c:out value="${result.option1}" /></td>
			<td class="aleft"><c:out value="${result.frstRegisterPnttm}"/></td>
            <td class="aleft">
            	<c:if test="${result.fileNm != null}">
					<a href="/cmm/fms/FileDown.do?atchFileId=<c:out value='${result.atchFileId}'/>&fileSn=<c:out value='${result.fileSeq}'/>"><img src="http://www.geumcheon.go.kr/open_content/images/common/icon/icon_form.gif" alt="첨부파일" /></a>
				</c:if>
            </td>
            <td class="aleft"><c:out value="${result.inqireCo}"/></td>
        </tr>
        <c:set var="resultCnt" value="${resultCnt-1}" />
        </c:forEach>
    </tbody>
</table>

<ol class="paging">
    <!-- 이미지들어간곳은 붙여서 코딩하기 바람 -->
    ${pageNav}
</ol>

<div class="board_btn_set send_mg" style="padding-top:15px;"> 
	<span class="register">
		<a href="/admin/bbs/addBoardArticle.do?bbsId=${param.bbsId}">등록하기</a>
	</span>
</div>

</div>

</body>
</html>