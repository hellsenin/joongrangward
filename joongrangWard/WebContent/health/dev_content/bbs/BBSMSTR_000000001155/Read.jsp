<%@page contentType="text/html;charset=utf-8" %>
<%@ page import="egovframework.com.cmm.service.EgovProperties" %>    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%pageContext.setAttribute("crlf", "\r\n");%>

<script type="text/javascript"> 
	
	function fn_egov_delete_notice() {
		
		if (confirm('삭제하시겠습니까?')) {
			return true;
		}
		return false;
	}
	
</script>

<div id="contents">
<form name="frm" method="post" action="/health/bbs/deleteBoardArticle.do" onsubmit="return fn_egov_delete_notice();">
<input type="hidden" name="bbsId" value="<c:out value='${result.bbsId}'/>" />
<input type="hidden" name="pageIndex" value="<c:out value='${searchVO.pageIndex}'/>"/>
<input type="hidden" name="nttId" value="<c:out value='${result.nttId}'/>" />
<input type="hidden" name="categoryId" value="<c:out value='${param.categoryId}'/>" />

<div class="mt15">
<table width="100%" border="0" cellspacing="0" cellpadding="0" class="table_list" summary="제목, 등록일, 조회수, 담당부서, 내용, 첨부파일 제공">
    <caption>게시물내용보기</caption>
    <colgroup>
		<col style="width:18%;" />
		<col style="width:*;" />
    </colgroup>
    <tr>
        <th scope="row">제목</th>
        <td class="aleft" colspan="3">
        	<p><c:out value="${result.nttSj}" /></p>
        </td>
    </tr>
    <tr>
        <th scope="row">등록일</th>
        <td class="aleft">
        	<p><c:out value="${result.frstRegisterPnttm}"/></p>
        </td>
        <th style="width:18%;" scope="row">조회수 </th>
        <td class="aleft"><c:out value="${result.inqireCo}"/></td>
    </tr>
    <tr>
        <th width="10%" scope="row">담당부서 </th>
        <td colspan="3" class="aleft"><c:out value="${result.option1}" /></td>
    </tr>
    <tr>
        <td colspan="4" id="db_data_area"> ${fn:replace(result.nttCn, crlf, "<br />")}</td>
    </tr>
    <tr>
        <th scope="row">첨부파일 </th>
        <td colspan="3" class="aleft"> 
        	<c:import url="/cmm/fms/selectFileInfs.do" charEncoding="utf-8">
				<c:param name="param_atchFileId" value="${result.atchFileId}" />
			</c:import>
		</td>
    </tr>
</table>
</div>
<p class="btn_ri mt15">
    <a href="/health/bbs/selectBoardList.do?categoryId=${param.categoryId}&amp;bbsId=${param.bbsId}"><img src="../../../images/btn_list.gif" alt="목록"  /></a>
</p>

</form>
</div>
