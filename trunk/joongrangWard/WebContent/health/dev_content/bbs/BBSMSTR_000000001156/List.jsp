<%@page contentType="text/html;charset=utf-8" %>
<%@ page import="egovframework.com.cmm.service.EgovProperties" %>    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

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

		<div id="contents">
			<div id="location">HOME > 자율점검서식</div>
			<h3><img src="/images/h3_02.gif" alt="자율점검서식" /></h3>
				<div class="top_txt"><img src="/images/top_txt.gif" alt="의료기관 등 자율점검을 인터넷 방식으로 변경하였습니다. 의료기관 및 약국 등 각 업소 개설자(대표자)의 적극적인 협조를 부탁드리며, 발송된 공문과 서식 등을 참고하여 자율점검표를 성실히 기한 내에 입력하여 주시기 바랍니다." /></div>
				

		<!-- 게시물검색 -->
			<div class="mb15 mt15 cb fr">
		<label for="searchCnd" class="blind">구분선택</label>
        <select name="searchCnd" id="searchCnd">
            <option value="" <c:if test="${searchVO.searchCnd == ''}">selected="selected"</c:if> >선택</option>
			<option value="NTT_SJ" <c:if test="${searchVO.searchCnd == 'NTT_SJ'}">selected="selected"</c:if> >제목</option>
			<option value="NTT_CN" <c:if test="${searchVO.searchCnd == 'NTT_CN'}">selected="selected"</c:if> >내용</option>
        </select>
		<label for="searchWrd" class="blind">검색어</label>
        <input type="text" id="searchWrd" class="text" name="searchWrd" value='<c:out value="${searchVO.searchWrd}"/>' />
			  <input class="vm" name="" type="image" src="/images/btn_search.gif" alt="검색" />
			</div>
        <!-- //게시물검색 -->
	
		<table width="100%" border="0" cellspacing="0" cellpadding="0" class="table_list">
          <caption>자율점검서식 게시판입니다.</caption>
          <colgroup>
				  <col style="width:7%;" />
				  <col style="width:*;" />
				  <col style="width:18%;" />
				  <col style="width:25%;" />
				  <col style="width:12%;" />
          </colgroup>
          <thead>
            <tr>
              <th>번호</th>
              <th>제목</th>
              <th>점검기간</th>
              <th>문제수</th>
              <th>첨부파일</th>
            </tr>
          </thead>
          <tbody>
    	<c:forEach var="result" items="${resultList}" varStatus="status">
            <tr>
              <td><c:out value="${(resultCnt) - (searchVO.pageSize * (searchVO.pageIndex-1))}"/></td>
              <td class="aleft"><a href="/health/bbs/selectBoardArticle.do?categoryId=${param.categoryId}&amp;bbsId=${param.bbsId}&amp;nttId=${result.nttId}"><c:out value="${result.nttSj}" /></a></td>
              <td>${result.option1}~${result.option2}</td>
              <td>${result.option3}</td>
              <td><img src="/images/file_down.gif" alt="첨부파일 다운로드" />
            	<c:if test="${result.fileNm != null}">
					<a href="/cmm/fms/FileDown.do?atchFileId=<c:out value='${result.atchFileId}'/>&fileSn=<c:out value='${result.fileSeq}'/>"><img src="/images/file_down.gif" alt="첨부파일" /></a>
				</c:if>
              </td>
            </tr>
        <c:set var="resultCnt" value="${resultCnt-1}" />
        </c:forEach>
          </tbody>
        </table>

        <!-- 목록 페이징 -->
        <div class="paging">
    		${pageNav}
        </div>
        <!-- //목록 페이징 -->



		</div>
