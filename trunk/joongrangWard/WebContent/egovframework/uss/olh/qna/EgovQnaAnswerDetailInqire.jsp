<%
 /**
  * @Class Name : EgovQnaAnswerDetailInqure.jsp
  * @Description : EgovQnaAnswerDetailInqure 화면
  * @Modification Information
  * @
  * @  수정일             수정자                   수정내용
  * @ -------    --------    ---------------------------
  * @ 2009.02.01   박정규              최초 생성
  *
  *  @author 공통서비스팀 
  *  @since 2009.02.01
  *  @version 1.0
  *  @see
  *  
  *  Copyright (C) 2009 by MOPAS  All right reserved.
  */
%>
<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<html>
<head>
<title>QA 관리</title>
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<link type="text/css" rel="stylesheet" href="/css/egovframework/uss/olh/qna/com.css" />
<script type="text/javaScript" language="javascript">

/* ********************************************************
 * 목록 으로 가기
 ******************************************************** */
function fn_egov_inqire_qnaanswerlist() {

	document.QnaManageForm.action = "<c:url value='/uss/olh/qnm/QnaAnswerListInqire.do'/>";
	document.QnaManageForm.submit();
		
}

/* ********************************************************
 * 수정처리화면
 ******************************************************** */
function fn_egov_updt_qnacnanswer(qaId){

	// Update하기 위한 키값을 셋팅
	document.QnaManageForm.qaId.value = qaId;	

	document.QnaManageForm.action = "<c:url value='/uss/olh/qnm/QnaCnAnswerUpdtView.do'/>";
	document.QnaManageForm.submit();	

		
}


</script>
</head>
 
<body>
<DIV id="content" style="width:700px">
<!-- ------------------------------------------------------------------ 상단타이틀 -->
<form name="QnaManageForm" action="<c:url value='/uss/olh/qna/QnaAnswerDetailInqire.do'/>" method="post">

<!-- ----------------- 상단 타이틀  영역 -->
<table width="100%" cellpadding="8" class="table-search" border="0">
 <tr>
  <td width="100%"class="title_left">
   <img src="/images/egovframework/uss/olh/qna/icon/tit_icon.gif" width="16" height="16" hspace="3" align="left">&nbsp;Q&A답변상세조회</td>
 </tr>
</table>

<!-- ------------------------------------------------------------------ 줄간격조정  -->
<table width="100%" cellspacing="0" cellpadding="0" border="0">
<tr>
	<td height="3px"></td>
</tr>
</table>

<!-- ------------------------------------------------------------------ 등록  폼 영역  -->
<table width="98%" border="0" cellpadding="0" cellspacing="1" class="table-register">
  
  <tr> 
    <th width="20%" height="23" class="required_text" nowrap >작성자명&nbsp;&nbsp;</th>
    <td width="80%" nowrap>
    	<c:out value="${result.wrterNm}"/>
    	<c:out value="${result.passwordConfirmAt}"/>  
    </td>
  </tr>

  <tr> 
    <th height="23" class="required_text" >전화&nbsp;&nbsp;</th>
    <td width="80%" nowrap>    
      <c:out value="${result.areaNo}"/>-<c:out value="${result.middleTelno}"/>-<c:out value="${result.endTelno}"/>                      
    </td>
  </tr> 

  <tr> 
    <th width="20%" height="23" class="required_text" nowrap >이메일&nbsp;&nbsp;</th>
    <td width="80%" nowrap>
    	<c:out value="${result.emailAdres}"/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    	<input name="emailAnswerAt" type="checkbox"  disabled="true" <c:if test="${result.emailAnswerAt == 'Y'}">checked="true"</c:if>> 이메일답변여부  
    </td>
  </tr>

  <tr> 
    <th width="20%" height="23" class="required_text" nowrap >작성일자&nbsp;&nbsp;</th>
    <td width="80%" nowrap>
  		<c:if test="${result.writngDe != null}">
    		<c:out value='${fn:substring(result.writngDe, 0,4)}'/>-<c:out value='${fn:substring(result.writngDe, 4,6)}'/>-<c:out value='${fn:substring(result.writngDe, 6,8)}'/>       			   	          				 			   
 		</c:if>
    
  
    </td>
  </tr>

  <tr> 
    <th width="20%" height="23" class="required_text" nowrap >조회횟수&nbsp;&nbsp;</th>
    <td width="80%" nowrap>
    	<c:out value="${result.inqireCo}"/>  
    </td>
  </tr>

  <tr> 
    <th width="20%" height="23" class="required_text" nowrap >진행처리상태&nbsp;&nbsp;</th>
    <td width="80%" nowrap>
    	<c:out value="${result.qnaProcessSttusCodeNm}"/>  
    </td>
  </tr>

  <tr> 
    <th height="23" class="required_text" >질문제목&nbsp;&nbsp;</th>
    <td width="80%" nowrap>    
      <c:out value="${result.qestnSj}"/>                 
    </td>
  </tr> 

  <tr> 
    <th height="23" class="required_text" >질문내용&nbsp;&nbsp;</th>
    <td width="80%" nowrap>    
      <textarea name="qestnCn" class="textarea"  cols="300" rows="15"  style="width:450px;" readonly><c:out value="${result.qestnCn}"/>
      </textarea>                       
    </td>
  </tr> 

<!-------------------- 답변내용이 있을경우 Display...  --------------------->
<c:if test="${result.qnaProcessSttusCode == '3'}">
  <tr> 
    <th height="23" class="required_text" >답변내용&nbsp;&nbsp;</th>
    <td width="80%" nowrap>    
      <textarea name="answerCn" class="textarea"  cols="300" rows="15"  style="width:450px;" readonly><c:out value="${result.answerCn}"/>
      </textarea>                                        
    </td>
  </tr> 

  <tr> 
    <th width="20%" height="23" class="required_text" nowrap >담당부서&nbsp;&nbsp;</th>
    <td width="80%" nowrap>
    	<c:out value="${result.orgnztNm}"/>
    </td>
  </tr>

  <tr> 
    <th width="20%" height="23" class="required_text" nowrap >답변일자&nbsp;&nbsp;</th>
    <td width="80%" nowrap>
  		<c:if test="${result.answerDe != null}">
    		<c:out value='${fn:substring(result.answerDe, 0,4)}'/>-<c:out value='${fn:substring(result.answerDe, 4,6)}'/>-<c:out value='${fn:substring(result.answerDe, 6,8)}'/>       			   	          				 			   
 		</c:if>
    </td>
  </tr>

  <tr> 
    <th width="20%" height="23" class="required_text" nowrap >답변자&nbsp;&nbsp;</th>
    <td width="80%" nowrap>
    	<c:out value="${result.emplyrNm}"/>
    </td>
  </tr>

  <tr> 
    <th width="20%" height="23" class="required_text" nowrap >전화번호&nbsp;&nbsp;</th>
    <td width="80%" nowrap>
    	<c:out value="${result.offmTelno}"/>
    </td>
  </tr>

  <tr> 
    <th width="20%" height="23" class="required_text" nowrap >이메일&nbsp;&nbsp;</th>
    <td width="80%" nowrap>
    	<c:out value="${result.aemailAdres}"/>
    </td>
  </tr>

  
</c:if>
   
   
</table>

<!-- ------------------------------------------------------------------ 줄간격조정  -->
<table width="100%" cellspacing="0" cellpadding="0" border="0">
<tr>
	<td height="10px"></td>
</tr>
</table>

<!-- ------------------------------------------------------------------ 목록/저장버튼  -->
<table border="0" cellspacing="0" cellpadding="0" align="center">
<tr> 

  <td><img src="/images/egovframework/uss/olh/qna/button/bu2_left.gif" width="8" height="20"></td>
  <td background="/images/egovframework/uss/olh/qna/button/bu2_bg.gif" class="text_left" nowrap>
  		<a href="JavaScript:fn_egov_updt_qnacnanswer('<c:out value="${result.qaId}"/>');">답변</a> 
  </td>
  <td><img src="/images/egovframework/uss/olh/qna/button/bu2_right.gif" width="8" height="20"></td>
  <td>&nbsp;</td>
   
  <td><img src="/images/egovframework/uss/olh/qna/button/bu2_left.gif" width="8" height="20"></td>
  <td background="/images/egovframework/uss/olh/qna/button/bu2_bg.gif" class="text_left" nowrap>
  		<a href="javascript:fn_egov_inqire_qnaanswerlist();">목록</a> 
  </td>
  <td><img src="/images/egovframework/uss/olh/qna/button/bu2_right.gif" width="8" height="20"></td>      
  <td>&nbsp;</td>
          
</tr>
</table>

<input name="qaId" type="hidden" value="">
<input name="writngPassword" 	type="hidden" value="">
<input name="passwordConfirmAt" type="hidden" value="">

</form>
</DIV>

</body>
</html>