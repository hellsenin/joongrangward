<%--
  Class Name : EgovMeetingManageDetail.jsp
  Description : 회의정보 상세조회 페이지
  Modification Information
 
      수정일         수정자                   수정내용
    -------    --------    ---------------------------
     2008.03.09    장동한          최초 생성
 
    author   : 공통서비스 개발팀 장동한
    since    : 2009.03.09
   
    Copyright (C) 2009 by MOPAS  All right reserved.
--%>
<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%pageContext.setAttribute("crlf", "\r\n"); %>
<html>
<head>
<title>회의정보 관리</title>
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<link type="text/css" rel="stylesheet" href="/css/egovframework/uss/olp/mgt/com.css" />
<script type="text/javaScript" language="javascript">


/* ********************************************************
 * 초기화
 ******************************************************** */
function fn_egov_init_MeetingManage(){

	
}
/* ********************************************************
 * 목록 으로 가기
 ******************************************************** */
function fn_egov_list_MeetingManage(){
	location.href = "/uss/olp/mgt/EgovMeetingManageList.do";
}
/* ********************************************************
 * 수정화면으로  바로가기
 ******************************************************** */
function fn_egov_modify_MeetingManage(){
	var varFrom = document.getElementById("MeetingManageForm");
	
	varFrom.action = "/uss/olp/mgt/EgovMeetingManageModify.do";;
	varFrom.submit();
}
/* ********************************************************
 * 삭제 처리
 ******************************************************** */
 function fn_egov_delete_MeetingManage(){
		var vFrom = document.MeetingManageForm;
		if(confirm("삭제 하시겠습니까?")){
			vFrom.cmd.value = 'del';
			vFrom.action = "/uss/olp/mgt/EgovMeetingManageDetail.do";
			vFrom.submit();
		}else{
			vFrom.cmd.value = '';
		}
}
</script>
</head>

<body onLoad="fn_egov_init_MeetingManage();">
<DIV id="content" style="width:712px">
<!-- ------------------------------------------------------------------ 상단타이틀 -->
<form name="MeetingManageForm"  id="MeetingManageForm" action="" method="post">
<!-- ----------------- 상단 타이틀  영역 -->
<table width="100%" cellpadding="8" class="table-search" border="0">
 <tr>
  <td width="100%"class="title_left">
   <img src="/images/egovframework/uss/olp/mgt/icon/tit_icon.gif" width="16" height="16" hspace="3" align="absmiddle">&nbsp;회의정보 상세조회</td>
 </tr>
</table>
<!-- ------------------------------------------------------------------ 줄간격조정  -->
<table width="100%" cellspacing="0" cellpadding="0" border="0">
<tr>
	<td height="3px"></td>
</tr>
</table>
<!-- ------------------------------------------------------------------ 등록  폼 영역  -->
<table width="100%" border="0" cellpadding="0" cellspacing="1" class="table-register">
  <tr> 
    <th width="20%" height="23" class="required_text" nowrap >회의제목<img src="/images/egovframework/uss/olp/mgt/icon/required.gif" width="15" height="15"></th>
    <td width="80%">
     	  ${resultList[0].mtgNm}
    </td>
  </tr>
  
  <tr> 
    <th height="23" class="required_text" >회의 안건 내용<img src="/images/egovframework/uss/olp/mgt/icon/required.gif" width="15" height="15"></th>
    <td>
     ${resultList[0].mtgMtrCn} 
    </td>
  </tr> 
  
  <tr> 
    <th height="23" class="required_text" >회의순서<img src="/images/egovframework/uss/olp/mgt/icon/required.gif" width="15" height="15"></th>
    <td>
     ${resultList[0].mtgSn}  
    </td>
  </tr> 
  
  <tr> 
    <th height="23" class="required_text" >회의회차<img src="/images/egovframework/uss/olp/mgt/icon/required.gif" width="15" height="15"></th>
    <td>
     ${resultList[0].mtgCo}  
    </td>
  </tr> 
  
  <tr> 
    <th height="23" class="required_text" >회의일자<img src="/images/egovframework/uss/olp/mgt/icon/required.gif" width="15" height="15"></th>
    <td>
     ${resultList[0].mtgDe}  
    </td>
  </tr> 
  <tr> 
    <th height="23" class="required_text" >회의장소<img src="/images/egovframework/uss/olp/mgt/icon/required.gif" width="15" height="15"></th>
    <td>
     ${resultList[0].mtgPlace}  
    </td>
  </tr> 
  <tr> 
    <th height="23" class="required_text" >회의시작시간<img src="/images/egovframework/uss/olp/mgt/icon/required.gif" width="15" height="15"></th>
    <td>
		<c:forTokens var="one" 
		            items="${resultList[0].mtgBeginTime}"
		            delims=":" varStatus="sts">
  				<c:if test="${sts.count == 1}">${one}시</c:if>
		        <c:if test="${sts.count == 2}">${one}분</c:if>
		</c:forTokens>
    </td>
  </tr> 
  <tr> 
    <th height="23" class="required_text" >회의종료시간<img src="/images/egovframework/uss/olp/mgt/icon/required.gif" width="15" height="15"></th>
    <td>
		<c:forTokens var="one" 
		            items="${resultList[0].mtgEndTime}"
		            delims=":" varStatus="sts">
  				<c:if test="${sts.count == 1}">${one}시</c:if>
		        <c:if test="${sts.count == 2}">${one}분</c:if>
		</c:forTokens>
    </td>
  </tr> 
  <tr> 
    <th height="23" class="required_text" >비공개 회의여부<img src="/images/egovframework/uss/olp/mgt/icon/required.gif" width="15" height="15"></th>
    <td>
    <c:if test="${resultList[0].clsdrMtgAt eq '1'}">예</c:if>
	<c:if test="${resultList[0].clsdrMtgAt eq ''}">아니오</c:if>
    </td>
  </tr> 
  
  <tr> 
    <th height="23" class="required_text" >열람 개시일<img src="/images/egovframework/uss/olp/mgt/icon/required.gif" width="15" height="15"></th>
    <td>
     ${resultList[0].readngBeginDe}  
    </td>
  </tr>   
  <tr> 
    <th height="23" class="required_text" >열람 여부<img src="/images/egovframework/uss/olp/mgt/icon/required.gif" width="15" height="15"></th>
    <td>
    ${resultList[0].readngAt}
    </td>
  </tr> 

  <tr> 
    <th height="23" class="required_text" >
    <DIV style="padding:0px 0px 0px 0px;margin:0px 15px 0px 0px;border:solid 0px;">회의결과 내용</DIV></th>
    <td>
    ${resultList[0].mtgResultCn} 
    </td>
  </tr>
  
  <tr> 
    <th height="23" class="required_text"> 
    <DIV style="padding:0px 0px 0px 0px;margin:0px 15px 0px 0px;border:solid 0px;">회의결과 여부</DIV></th>
    <td>
    <c:if test="${resultList[0].mtgResultEnnc eq '1'}">예</c:if>
	<c:if test="${resultList[0].mtgResultEnnc eq ''}">아니오</c:if>
    </td>
  </tr> 

  <tr> 
    <th height="23" class="required_text" >
    <DIV style="padding:0px 0px 0px 0px;margin:0px 15px 0px 0px;border:solid 0px;">기타 사항</DIV></th>
    <td>
    ${resultList[0].etcMatter} 
    </td>
  </tr>
 
  <tr> 
    <th height="23" class="required_text">
      <DIV style="padding:0px 0px 0px 0px;margin:0px 15px 0px 0px;border:solid 0px;">주관부서</DIV></th>
    <td>
    ${resultList[0].mngtDeptNm}
    </td>
  </tr> 
  <tr> 
    <th height="23" class="required_text">
  <DIV style="padding:0px 0px 0px 0px;margin:0px 15px 0px 0px;border:solid 0px;">주관자ID</DIV></th>   
    <td>
    ${resultList[0].mnaerIds}
    </td>
  </tr> 
  <tr> 
    <th height="23" class="required_text">
    <DIV style="padding:0px 0px 0px 0px;margin:0px 15px 0px 0px;border:solid 0px;">주관자명</DIV></th>
    <td>
    ${resultList[0].mnaerNm}
    </td>
  </tr> 
  <tr> 
    <th height="23" class="required_text">
    <DIV style="padding:0px 0px 0px 0px;margin:0px 15px 0px 0px;border:solid 0px;">주관자부서</DIV></th>
    <td>
     ${resultList[0].mnaerDeptNm}
    </td>
  </tr> 

  <tr> 
    <th height="23" class="required_text" >
    <DIV style="padding:0px 0px 0px 0px;margin:0px 15px 0px 0px;border:solid 0px;">회의여부</DIV></th>
    <td>
    ${resultList[0].mtnAt}
    </td>
  </tr> 

  <tr> 
    <th height="23" class="required_text" >
    <DIV style="padding:0px 0px 0px 0px;margin:0px 15px 0px 0px;border:solid 0px;">불참석자수</DIV></th>
    <td>
    ${resultList[0].nonatdrnCo}  
    </td>
  </tr> 
  <tr> 
    <th height="23" class="required_text" >
      <DIV style="padding:0px 0px 0px 0px;margin:0px 15px 0px 0px;border:solid 0px;">참석자수</DIV></th>
    <td>
    ${resultList[0].atdrnCo}  
    </td>
  </tr>
<!--
  <tr> 
    <th height="23" class="required_text" nowrap>파일첨부</th>
    <td>
      <input type="file" name="upFile">
    </td>
-->
  </tr> 
</table>
<!-- ------------------------------------------------------------------ 줄간격조정  -->
<table width="100%" cellspacing="0" cellpadding="0" border="0">
<tr>
	<td height="3px"></td>
</tr>
</table>
<center>
<!-- ------------------------------------------------------------------ 목록/저장버튼  -->
<table border="0" cellspacing="0" cellpadding="0" align="center">
<tr> 
  <td><img src="/images/egovframework/uss/olp/mgt/button/bu2_left.gif" width="8" height="20"></td>
  <td background="/images/egovframework/uss/olp/mgt/button/bu2_bg.gif" class="text_left" nowrap><a href="JavaScript:fn_egov_list_MeetingManage();"><spring:message code="button.list" /></a>  
  </td>
  <td><img src="/images/egovframework/uss/olp/mgt/button/bu2_right.gif" width="8" height="20"></td>      
  <td>&nbsp;</td>
  <td><img src="/images/egovframework/uss/olp/mgt/button/bu2_left.gif" width="8" height="20"></td>
  <td background="/images/egovframework/uss/olp/mgt/button/bu2_bg.gif" class="text_left" nowrap><a href="JavaScript:fn_egov_delete_MeetingManage();"><spring:message code="button.delete" /></a> 
  </td>
  <td><img src="/images/egovframework/uss/olp/mgt/button/bu2_right.gif" width="8" height="20"></td>      
  <td>&nbsp;</td>
  <td><img src="/images/egovframework/uss/olp/mgt/button/bu2_left.gif" width="8" height="20"></td>
  <td background="/images/egovframework/uss/olp/mgt/button/bu2_bg.gif" class="text_left" nowrap><a href="JavaScript:fn_egov_modify_MeetingManage();"><spring:message code="button.update" /></a>  
  </td>
  <td><img src="/images/egovframework/uss/olp/mgt/button/bu2_right.gif" width="8" height="20"></td>
</tr>
</table>
</center>
<input name="mtgId" type="hidden" value="<c:out value='${resultList[0].mtgId}'/>"/>
<input name="cmd" type="hidden" value="<c:out value=''/>"/>
</form>
</DIV>

</body>
</html>