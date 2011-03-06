<%--
  Class Name : EgovMeetingManageModify.jsp
  Description : 회의정보 수정 페이지
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
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="validator" uri="http://www.springmodules.org/tags/commons-validator" %>
<html>
<head>
<title>회의정보 관리</title>
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<link type="text/css" rel="stylesheet" href="/css/egovframework/uss/olp/mgt/com.css" />
<script type="text/javascript" src="/js/egovframework/cmm/uss/olp/mgt/EgovUtilMeetingManage.js"></script>
<script type="text/javascript" src="<c:url value='/js/egovframework/cmm/sym/cal/EgovCalPopup.js' />"></script>
<script type="text/javascript" src="<c:url value="/validator.do"/>"></script>
<validator:javascript formName="meetingManageVO" staticJavascript="false" xhtml="true" cdata="false"/>
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
 * 저장처리화면
 ******************************************************** */
function fn_egov_save_MeetingManage(){
	var varFrom = document.getElementById("meetingManageVO");
	if(confirm("저장 하시겠습니까?")){
		varFrom.action =  "/uss/olp/mgt/EgovMeetingManageModify.do";

		if(!validateMeetingManageVO(varFrom)){ 			
			return;
		}else{

			if(varFrom.nonatdrnCo.value == ""){varFrom.nonatdrnCo.value = "0"};
			if(varFrom.atdrnCo.value == ""){varFrom.atdrnCo.value = "0"};
			
			varFrom.mtgBeginTime.value = fn_egov_SelectBoxValue('mtgBeginHH') + ":" + fn_egov_SelectBoxValue('mtgBeginMM');
			varFrom.mtgEndTime.value = fn_egov_SelectBoxValue('mtgEndHH') + ":" + fn_egov_SelectBoxValue('mtgEndMM');
			varFrom.submit();
		} 
	}
}
/* ********************************************************
 * 주관자 부서 팝업창열기
 ******************************************************** */
function fn_egov_mnaerDept_MeetingManage(){

	var arrParam = new Array(1);
	arrParam[0] = self;
	arrParam[1] = "typeMeeting1";
	
 	window.showModalDialog("/uss/olp/mgt/EgovMeetingManageLisAuthorGroupPopup.do", arrParam ,"dialogWidth=800px;dialogHeight=500px;resizable=yes;center=yes");
 }
/* ********************************************************
 * 주관 부서 팝업창열기
 ******************************************************** */
function fn_egov_mngtDeptNm_MeetingManage(){

	var arrParam = new Array(1);
	arrParam[0] = self;
	arrParam[1] = "typeMeeting2";
	
 	window.showModalDialog("/uss/olp/mgt/EgovMeetingManageLisAuthorGroupPopup.do", arrParam ,"dialogWidth=800px;dialogHeight=500px;resizable=yes;center=yes");
 }

/* ********************************************************
 * 아이디  팝업창열기
 ******************************************************** */
function fn_egov_mnaer_MeetingManage(){
	var arrParam = new Array(1);
	arrParam[0] = window;
	arrParam[1] = "typeMeeting";

  	window.showModalDialog("/uss/olp/mgt/EgovMeetingManageLisEmpLyrPopup.do", arrParam,"dialogWidth=800px;dialogHeight=500px;resizable=yes;center=yes");
}
</script>
</head>
<body onLoad="fn_egov_init_MeetingManage();">
<DIV id="content" style="width:712px">
<!-- ------------------------------------------------------------------ 상단타이틀 -->
<form:form commandName="meetingManageVO"  action="" method="post">
<!-- ----------------- 상단 타이틀  영역 -->
<table width="100%" cellpadding="8" class="table-search" border="0">
 <tr>
  <td width="100%"class="title_left">
   <img src="/images/egovframework/uss/olp/mgt/icon/tit_icon.gif" width="16" height="16" hspace="3" align="absmiddle">&nbsp;회의정보 수정</td>
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
    <td width="80%" nowrap>
     	   <input name="mtgNm" type="text" size="73" value="${resultList[0].mtgNm}" maxlength="100" style="width:100%;">
     	   <div><form:errors path="mtgNm" cssClass="error" /></div>  
    </td>
  </tr>
  
  <tr> 
    <th height="23" class="required_text" >회의 안건 내용<img src="/images/egovframework/uss/olp/mgt/icon/required.gif" width="15" height="15"></th>
    <td>
      <textarea name="mtgMtrCn" class="textarea"  cols="75" rows="4"  style="width:100%;" value="">${resultList[0].mtgMtrCn}</textarea>
      <div><form:errors path="mtgMtrCn" cssClass="error" /></div> 
    </td>
  </tr> 
  
  <tr> 
    <th height="23" class="required_text" >회의순서<img src="/images/egovframework/uss/olp/mgt/icon/required.gif" width="15" height="15"></th>
    <td>
      <input name="mtgSn" type="text" size="73" value="${resultList[0].mtgSn}" maxlength="10" style="width:60px;">
      <div><form:errors path="mtgSn" cssClass="error" /></div>  
    </td>
  </tr> 
  
  <tr> 
    <th height="23" class="required_text" >회의회차<img src="/images/egovframework/uss/olp/mgt/icon/required.gif" width="15" height="15"></th>
    <td>
      <input name="mtgCo" type="text" size="73" value="${resultList[0].mtgCo}" maxlength="5" style="width:60px;">
      <div><form:errors path="mtgCo" cssClass="error" /></div>  
    </td>
  </tr> 
  
  <tr> 
    <th height="23" class="required_text" >회의일자<img src="/images/egovframework/uss/olp/mgt/icon/required.gif" width="15" height="15"></th>
    <td>
      <input name="mtgDe" id="mtgDe" type="text" size="73" value="${resultList[0].mtgDe}" maxlength="10" style="width:80px;">  
       <a href="#" onClick="javascript:fn_egov_NormalCalendar( document.getElementById('meetingManageVO'),  document.getElementById('mtgDe') );">  
      <img src="<c:url value='/images/egovframework/cmm/sym/cal/bu_icon_carlendar.gif' />"  align="absmiddle" style="border:0px" alt="회의일자달력" title="회의일자달력">
      </a>
      <div><form:errors path="mtgDe" cssClass="error" /></div>
    </td>
  </tr> 
  <tr> 
    <th height="23" class="required_text" >회의장소<img src="/images/egovframework/uss/olp/mgt/icon/required.gif" width="15" height="15"></th>
    <td>
      <input name="mtgPlace" type="text" size="73" value="${resultList[0].mtgPlace}" maxlength="70" style="width:200px;">
      <div><form:errors path="mtgPlace" cssClass="error" /></div>  
    </td>
  </tr> 
  <tr> 
    <th height="23" class="required_text" >회의시작시간<img src="/images/egovframework/uss/olp/mgt/icon/required.gif" width="15" height="15"></th>
    <td>
	     
		<c:forTokens var="one" 
		            items="${resultList[0].mtgBeginTime}"
		            delims=":" varStatus="sts">
		         <c:if test="${sts.count == 1}">
		         
		         <select name="mtgBeginHH" id="mtgBeginHH">
			     <c:forEach var="h" begin="1" end="24" step="1">
			      	<option value="${h}" <c:if test="${h == one}">selected</c:if>>${h}시</option>
			      </c:forEach>
			     </select>
		         
		         </c:if>
		         <c:if test="${sts.count == 2}">
		         
				     <select name="mtgBeginMM" id="mtgBeginMM">
				     <option value="0">0분</option>
				      <c:forEach var="m" begin="1" end="60" step="1">
				      	<option value="${m}" <c:if test="${m == one}">selected</c:if>>${m}분</option>
				      </c:forEach>
				    </select>

		         </c:if>

		</c:forTokens>
		<input name="mtgBeginTime" type="hidden" value="" id="mtgBeginTime">
		<div><form:errors path="mtgBeginHH" cssClass="error" /></div>
		<div><form:errors path="mtgBeginMM" cssClass="error" /></div>
    </td>
  </tr> 
  <tr> 
    <th height="23" class="required_text" >회의종료시간<img src="/images/egovframework/uss/olp/mgt/icon/required.gif" width="15" height="15"></th>
    <td>
		<c:forTokens var="one" 
		            items="${resultList[0].mtgEndTime}"
		            delims=":" varStatus="sts">
		         <c:if test="${sts.count == 1}">
		         
		         <select name="mtgEndHH" id="mtgEndHH">
			     <c:forEach var="h" begin="1" end="24" step="1">
			      	<option value="${h}" <c:if test="${h == one}">selected</c:if>>${h}시</option>
			      </c:forEach>
			     </select>
		         
		         </c:if>
		         <c:if test="${sts.count == 2}">
		         
				     <select name="mtgEndMM" id="mtgEndMM">
				     <option value="0">0분</option>
				      <c:forEach var="m" begin="1" end="60" step="1">
				      	<option value="${m}" <c:if test="${m == one}">selected</c:if>>${m}분</option>
				      </c:forEach>
				    </select>

		         </c:if>

		</c:forTokens>
	    
       <input name="mtgEndTime" type="hidden" value="" id="mtgEndTime">
       <div><form:errors path="mtgEndHH" cssClass="error" /></div>
       <div><form:errors path="mtgEndMM" cssClass="error" /></div>
    </td>
  </tr> 
  <tr> 
    <th height="23" class="required_text" >비공개 회의여부<img src="/images/egovframework/uss/olp/mgt/icon/required.gif" width="15" height="15"></th>
    <td>
     <input name="clsdrMtgAt" type="checkbox" style="border:0px;" value="1" <c:if test="${resultList[0].clsdrMtgAt == '1'}">checked</c:if>>
    </td>
  </tr> 
  
  <tr> 
    <th height="23" class="required_text" >열람 개시일<img src="/images/egovframework/uss/olp/mgt/icon/required.gif" width="15" height="15"></th>
    <td>
      <input name="readngBeginDe" id="readngBeginDe" type="text" size="73" value="${resultList[0].readngBeginDe}" maxlength="10" style="width:80px;">
       <a href="#" onClick="javascript:fn_egov_NormalCalendar(document.getElementById('meetingManageVO'),  document.getElementById('readngBeginDe'));">  
      <img src="<c:url value='/images/egovframework/cmm/sym/cal/bu_icon_carlendar.gif' />"  align="absmiddle" style="border:0px" alt="열람개시일달력" title="열람개시일달력">
      </a>
      <div><form:errors path="readngBeginDe" cssClass="error" /></div>  
    </td>
  </tr>   
  <tr> 
    <th height="23" class="required_text" >열람 여부<img src="/images/egovframework/uss/olp/mgt/icon/required.gif" width="15" height="15"></th>
    <td>
       <select name="readngAt">
       	<option value="N" <c:if test="${resultList[0].readngAt == 'N'}">selected</c:if>>N</option>
       	<option value="Y" <c:if test="${resultList[0].readngAt == 'Y'}">selected</c:if>>Y</option>
      	</select>
    </td>
  </tr> 

  <tr> 
    <th height="23" class="required_text" >
  <DIV style="padding:0px 0px 0px 0px;margin:0px 15px 0px 0px;border:solid 0px;">회의결과 내용</DIV></th>    
    <td>
      <textarea name="mtgResultCn" class="textarea"  cols="75" rows="4"  style="width:100%;" value="${resultList[0].mtgResultCn}"></textarea> 
    </td>
  </tr>
  
  <tr> 
    <th height="23" class="required_text">
  <DIV style="padding:0px 0px 0px 0px;margin:0px 15px 0px 0px;border:solid 0px;">회의결과 여부</DIV></th>    
    <td>
     <input name="mtgResultEnnc" type="checkbox" style="border:0px;" value="1" <c:if test="${resultList[0].mtgResultEnnc == '1'}">checked</c:if>>
    </td>
  </tr> 

  <tr> 
    <th height="23" class="required_text" >
  <DIV style="padding:0px 0px 0px 0px;margin:0px 15px 0px 0px;border:solid 0px;">기타 사항</DIV></th>    
    <td>
      <textarea name="etcMatter" class="textarea"  cols="75" rows="2"  style="width:100%;" value="${resultList[0].etcMatter}"></textarea> 
    </td>
  </tr>
 
  <tr> 
    <th height="23" class="required_text">
  <DIV style="padding:0px 0px 0px 0px;margin:0px 15px 0px 0px;border:solid 0px;">주관부서</DIV></th>    
    <td>
      <input name="mngtDeptNm" id="mngtDeptNm" type="text" size="73" value="${resultList[0].mngtDeptNm}" maxlength="2000" style="width:100px;" readOnly>
       <a href="#" onClick="fn_egov_mngtDeptNm_MeetingManage()">
      <img src="/images/egovframework/uss/olp/mgt/img/search2.gif" align="absmiddle" style="border:0px" alt="주관부서" title="주관부서">
      </a>
      <input name="mngtDeptId" id="mngtDeptId" type="hidden" value="${resultList[0].mngtDeptId}" >
    </td>
  </tr> 
  <tr> 
    <th height="23" class="required_text">
  <DIV style="padding:0px 0px 0px 0px;margin:0px 15px 0px 0px;border:solid 0px;">주관자명</DIV></th>    
    <td>
      <input name="mnaerNm" id="mnaerNm" type="text" size="73" value="${resultList[0].mnaerIds}" maxlength="2000" style="width:100px;" readOnly>
            <a href="#" onClick="fn_egov_mnaer_MeetingManage()">
      <img src="/images/egovframework/uss/olp/mgt/img/search2.gif" align="absmiddle" style="border:0px" alt="주관자ID" title="주관자ID">
      </a>
      <input name="mnaerId" id="mnaerId" type="hidden" value="${resultList[0].mnaerId}" >
    </td>
  </tr> 

  <tr> 
    <th height="23" class="required_text">
  <DIV style="padding:0px 0px 0px 0px;margin:0px 15px 0px 0px;border:solid 0px;">주관자부서</DIV></th>    
    <td>
      <input name="mnaerDeptNm"  id="mnaerDeptNm" type="text" size="73" value="${resultList[0].mnaerDeptNm}" maxlength="2000" style="width:100px;" readOnly>
      <a href="#" onClick="fn_egov_mnaerDept_MeetingManage()">
      <img src="/images/egovframework/uss/olp/mgt/img/search2.gif" align="absmiddle" style="border:0px" alt="주관자부서" title="주관자부서">
      </a>
	  <input name="mnaerDeptId"  id="mnaerDeptId" type="hidden" value="${resultList[0].mnaerDeptId}" >
    </td>
  </tr> 

  <tr> 
    <th height="23" class="required_text" >
   <DIV style="padding:0px 0px 0px 0px;margin:0px 15px 0px 0px;border:solid 0px;">회의여부</DIV></th>  
    <td>
       <select name="mtnAt">
       	<option value="Y"  <c:if test="${resultList[0].mtnAt == 'Y'}">selected</c:if>>Y</option>
       	<option value="N"  <c:if test="${resultList[0].mtnAt == 'N'}">selected</c:if>>N</option>
      	</select>
    </td>
  </tr> 

  <tr> 
    <th height="23" class="required_text" >
  <DIV style="padding:0px 0px 0px 0px;margin:0px 15px 0px 0px;border:solid 0px;">불참석자수</DIV></th>
    <td>
      <input name="nonatdrnCo" id="nonatdrnCo" type="text" size="73" value="${resultList[0].nonatdrnCo}" maxlength="10" style="width:60px;">  
    </td>
  </tr> 
  <tr> 
    <th height="23" class="required_text" >
  <DIV style="padding:0px 0px 0px 0px;margin:0px 15px 0px 0px;border:solid 0px;">참석자수</DIV></th>  
    <td>
      <input name="atdrnCo" id="atdrnCo" type="text" size="73" value="${resultList[0].atdrnCo}" maxlength="10" style="width:60px;">  
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
  <td background="/images/egovframework/uss/olp/mgt/button/bu2_bg.gif" class="text_left" nowrap><a href="JavaScript:fn_egov_list_MeetingManage();">목록</a> 
  </td>
  <td><img src="/images/egovframework/uss/olp/mgt/button/bu2_right.gif" width="8" height="20"></td>      
  <td>&nbsp;</td>
  <td><img src="/images/egovframework/uss/olp/mgt/button/bu2_left.gif" width="8" height="20"></td>
  <td background="/images/egovframework/uss/olp/mgt/button/bu2_bg.gif" class="text_left" nowrap><a href="JavaScript:fn_egov_save_MeetingManage();">저장</a> 
  </td>
  <td><img src="/images/egovframework/uss/olp/mgt/button/bu2_right.gif" width="8" height="20"></td>      
</tr>
</table>
</center>
<input type="hidden" name="cal_url" value="<c:url value='/sym/cmm/EgovNormalCalPopup.do'/>" />
<input name="mtgId" type="hidden" value="<c:out value='${resultList[0].mtgId}'/>"/>
<input name="cmd" type="hidden" value="<c:out value='save'/>"/>
</form:form>
</DIV>

</body>
</html>