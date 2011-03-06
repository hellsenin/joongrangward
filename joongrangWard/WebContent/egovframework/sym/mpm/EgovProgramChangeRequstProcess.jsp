<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%
 /**
  * @Class Name : EgovProgramChangeRequstProcess.jsp
  * @Description : 프로그램변경요청처리 조회 화면
  * @Modification Information
  * @
  * @  수정일         수정자                   수정내용
  * @ -------    --------    ---------------------------
  * @ 2009.03.10    이용          최초 생성
  *
  *  @author 공통서비스 개발팀 이용
  *  @since 2009.03.10
  *  @version 1.0
  *  @see
  *  
  *  Copyright (C) 2009 by MOPAS  All right reserved.
  */
  /* Image Path 설정 */
  String imagePath_icon   = "/images/egovframework/sym/mpm/icon/";
  String imagePath_button = "/images/egovframework/sym/mpm/button/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link rel="stylesheet" href="/css/egovframework/sym/mpm/mpm.css" type="text/css">
<title>프로그램변경요청처리</title>
<script language="javascript1.2" src="/js/egovframework/sts/calendar.js"/></script>
<script type="text/javascript" src="<c:url value='/js/egovframework/cmm/sym/cal/EgovCalPopup.js' />"></script>
<script language="javascript1.2">
<!--
/* ********************************************************
 * 페이징 처리 함수
 ******************************************************** */
function linkPage(pageNo){
	document.programChangeRequstProcessListForm.pageIndex.value = pageNo;
	document.programChangeRequstProcessListForm.action = "<c:url value='/sym/mpm/EgovProgramChangeRequstProcessListSelect.do'/>";
   	document.programChangeRequstProcessListForm.submit();
}

/* ********************************************************
 * 조회 처리 함수
 ******************************************************** */ 
function selectProgramChangeRequstProcessList() { 
	document.programChangeRequstProcessListForm.pageIndex.value = 1;
	document.programChangeRequstProcessListForm.action = "<c:url value='/sym/mpm/EgovProgramChangeRequstProcessListSelect.do'/>";
	document.programChangeRequstProcessListForm.submit();
}

/* ********************************************************
 * 상세조회처리 함수
 ******************************************************** */
function selectChangeRequstProcessListDetail(progrmFileNm, tmp_no) {
	document.programChangeRequstProcessListForm.tmp_progrmNm.value = progrmFileNm;
	document.programChangeRequstProcessListForm.tmp_rqesterNo.value = tmp_no;
	document.programChangeRequstProcessListForm.action = "<c:url value='/sym/mpm/EgovProgramChangRequstProcessDetailSelect.do'/>";
	document.programChangeRequstProcessListForm.submit();	
}

/* ********************************************************
 * 검색조건 처리 함수
 ******************************************************** */
function fncSearchSpan(vSearch) {
	searchSpan.innerHTML = "&nbsp;&nbsp;"
	if(vSearch == "1"){  
		searchSpan.innerHTML += "전체조회&nbsp; <input name='searchKeyword' type='hidden' size='10' value='%'  maxlength='20' >";
	}else if(vSearch == "2"){
		searchSpan.innerHTML += "처리상태&nbsp;"
		                      + "<select name='searchKeyword'><option value='A'>신청중</option><option value='P'>진행중</option>"
							  + "<option value='R'>반려</option><option value='C'>처리완료</option></select>";
	}else if(vSearch == "3"){
        searchSpan.innerHTML += "요청일자&nbsp;"
            + "<input type='hidden' name='cal_url' value=\"<c:url value='/sym/cmm/EgovNormalCalPopup.do'/>\" />"
            + "<input name='searchKeywordFrom' type='text' size='8' value=''  maxlength='8'>"
            + "<a href=\"javascript:fn_egov_NormalCalendar(programChangeRequstProcessListForm, programChangeRequstProcessListForm.searchKeywordFrom,'');\" style=\"selector-dummy:expression(this.hideFocus=false);\">"
            + "<img src='/images/egovframework/cmm/sym/cal/bu_icon_carlendar.gif' name='cal_img1' id='cal_img1' border='0' title='달력' alt='달력'></a> ~ "
            + "<input name='searchKeywordTo'   type='text' size='8' value=''  maxlength='8'>"
            + "<a href=\"javascript:fn_egov_NormalCalendar(programChangeRequstProcessListForm,programChangeRequstProcessListForm.searchKeywordTo,'');\" style=\"selector-dummy:expression(this.hideFocus=false);\">"
            + "<img src='/images/egovframework/cmm/sym/cal/bu_icon_carlendar.gif' name='cal_img2' id='cal_img2' border='0' title='달력' alt='달력'></a>";

            
 //                             + "<input name='searchKeywordFrom' type='text' size='10' value=''  maxlength='14' >"
 //                             + "<img src='/images/egovframework/sts/ico_cal.gif' name='cal_img1' id='cal_img1' border='0' title='달력' onClick='popUpCalendar(this, searchKeywordFrom, \"yyyymmdd\")' style='cursor:pointer;'> ~ "
 //                             + "<input name='searchKeywordTo'   type='text' size='10' value=''  maxlength='14' >"
 //                             + "<img src='/images/egovframework/sts/ico_cal.gif' name='cal_img2' id='cal_img2' border='0' title='달력' onClick='popUpCalendar(this, searchKeywordTo, \"yyyymmdd\")' style='cursor:pointer;'>";
	}else if(vSearch == "4"){
        searchSpan.innerHTML += "요청자  &nbsp;<input name='searchKeyword' type='text' size='10' value=''  maxlength='20' >";
	}
} 
<c:if test="${!empty resultMsg}">alert("${resultMsg}");</c:if>
--> 
</script>

</head>
<body> 
<form name="programChangeRequstProcessListForm" action ="/sym/mpm/EgovProgramChangeRequstProcessListSelect.do" method="post">
<input name="pageIndex" type="hidden" value="<c:out value='${searchVO.pageIndex}'/>"/>

<DIV id="main" style="display:"> 

<table width="717" cellpadding="8" class="table-search" border="0">
 <tr>
  <td width="40%"class="title_left">
   <img src="<%=imagePath_icon %>tit_icon.gif" width="16" height="16" hspace="3" align="absmiddle">&nbsp;프로그램변경요청처리</td>
  <th >
  </th>
  <td width="10%" ></td>
  <td widht="35%"></td> 
  <th width="10%">
  </th>  
 </tr>
</table>
<table width="717" border="0" cellpadding="0" cellspacing="1">
 <tr>
  <td width="100%"> 
    <table width="100%" border="0" cellpadding="0" cellspacing="1" class="table-register">
      <tr> 
        <th width="15%" height="40" class="" >검색조건&nbsp;</th>
        <td width="85%">
           <table border="0" cellspacing="0" cellpadding="0" align="left">
            <tr> 
              <td width="10%" align="right">&nbsp;
                <select name="searchCondition" onchange="javascript:fncSearchSpan(this.value);">
                    <option value="1">전체    </option>
                    <option value="2">처리상태    </option>
                    <option value="3">요청일자  </option>
                    <option value="4">요청자  </option>
                </select>
              </td>
              <td width="60%" align="left">
              <span id="searchSpan" >&nbsp;&nbsp;전체조회&nbsp;<input name='searchKeyword' type='hidden' size='10' value='%'  maxlength='20' ></span>

              </td>

              <td width="5%"></td>
              <td><img src="<%=imagePath_button %>bu2_left.gif" width="8" height="20"></td>
              <td background="<%=imagePath_button %>bu2_bg.gif" nowrap><a href="javascript:selectProgramChangeRequstProcessList()">조회</a></td>
              <td><img src="<%=imagePath_button %>bu2_right.gif" width="8" height="20"></td>   
              <td width="20%"></td>   
            </tr>
          </table> 
        </td>
      </tr> 
    </table>
   </td>
 </tr>    
</table>
<table width="717" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td height="10">&nbsp; </td>
  </tr>
</table>
<table width="717" cellpadding="8" class="table-line" style="table-layout:fixed">
 <thead>
  <tr>
    <th class="title" width="80"  nowrap>요청번호</th>
    <th class="title" width="177" nowrap>프로그램파일명</th>
    <th class="title" width="80"  nowrap>처리상태</th>
    <th class="title" width="200" nowrap>요청제목</th>
    <th class="title" width="80"  nowrap>요청자</th>   
    <th class="title" width="100" nowrap>요청일자</th>
  </tr>
 </thead>    
 <tbody>
 <c:forEach var="result" items="${list_changerequst}" varStatus="status">
  <tr>
    <td class="lt_text" nowrap><c:out value="${result.rqesterNo}"/></td>
    <td class="lt_text" style="cursor:hand;" nowrap><a href="javascript:selectChangeRequstProcessListDetail('<c:out value="${result.progrmFileNm}"/>','<c:out value="${result.rqesterNo}"/>')"><c:out value="${result.progrmFileNm}"/></a></td>
    <td class="lt_text" nowrap>
      <c:if test="${empty result.processSttus}">N/A</c:if> 
      <c:if test="${result.processSttus == 'A'}">신청중</c:if>
      <c:if test="${result.processSttus == 'P'}">진행중</c:if>
      <c:if test="${result.processSttus == 'R'}">반려</c:if>
      <c:if test="${result.processSttus == 'C'}">처리완료</c:if>
    </td>
    <td class="lt_text" nowrap><c:out value="${result.rqesterSj}"/></td>  
    <td class="lt_text" nowrap><c:out value="${result.rqesterPersonId}"/></td>  
    <td class="lt_text" nowrap><c:out value="${result.rqesterDe}"/></td>
  </tr>
 </c:forEach>
 </tbody>  
 <!--tfoot>
  <tr class="">
   <td colspan=6 align="center"></td>
  </tr>
 </tfoot -->
</table>
<table width="717" border="0" cellspacing="0" cellpadding="0">
  <tr> 
    <td height="10"></td>
  </tr>
  <tr> 
    <td height="10">
<!-- 페이징 시작 -->
<div align="center">
  <div>
	<ui:pagination paginationInfo = "${paginationInfo}"	type="image" jsFunction="linkPage"/>
  </div>
</div>
<!-- 페이징 끝 -->
    </td>
  </tr>
</table> 

</DIV>
<input type="hidden" name="tmp_progrmNm">
<input type="hidden" name="tmp_rqesterNo">
</form>
</body>
</html>