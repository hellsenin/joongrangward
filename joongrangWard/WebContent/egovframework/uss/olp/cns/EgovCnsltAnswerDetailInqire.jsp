<%
 /**
  * @Class Name : EgovCnsltAnswerDetailInqure.jsp
  * @Description : EgovCnsltAnswerDetailInqure 화면
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
<title>상담관리</title>
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<link type="text/css" rel="stylesheet" href="/css/egovframework/uss/olp/cns/com.css" />
<script type="text/javaScript" language="javascript">

/* ********************************************************
 * 목록 으로 가기
 ******************************************************** */
function fn_egov_inqire_cnsltanswerlist() {

	document.CnsltManageForm.action = "<c:url value='/uss/olp/cnm/CnsltAnswerListInqire.do'/>";
	document.CnsltManageForm.submit();
		
}

/* ********************************************************
 * 수정처리화면
 ******************************************************** */
function fn_egov_updt_cnsltdtlsanswer(cnsltId){

	// Update하기 위한 키값을 셋팅
	document.CnsltManageForm.cnsltId.value = cnsltId;	

	document.CnsltManageForm.action = "<c:url value='/uss/olp/cnm/CnsltDtlsAnswerUpdtView.do'/>";
	document.CnsltManageForm.submit();	

		
}


</script>
</head>
 
<body>
<DIV id="content" style="width:700px">
<!-- ------------------------------------------------------------------ 상단타이틀 -->
<form name="CnsltManageForm" action="<c:url value='/uss/olp/cns/CnsltAnswerDetailInqire.do'/>" method="post">

<!-- ----------------- 상단 타이틀  영역 -->
<table width="100%" cellpadding="8" class="table-search" border="0">
 <tr>
  <td width="100%"class="title_left">
   <img src="/images/egovframework/uss/olp/cns/icon/tit_icon.gif" width="16" height="16" hspace="3" align="left">&nbsp;상담답변상세조회</td>
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
    <th width="20%" height="23" class="required_text" nowrap >작성자명</th>
    <td width="80%" nowrap>
    	<c:out value="${result.wrterNm}"/>  
    </td>
  </tr>

  <tr> 
    <th height="23" class="required_text" >전화</th>
    <td width="80%" nowrap>    
    	<c:if test="${result.areaNo != null}">    
      		<c:out value="${result.areaNo}"/>-<c:out value="${result.middleTelno}"/>-<c:out value="${result.endTelno}"/>
		</c:if>                            
    </td>
  </tr> 

  <tr> 
    <th height="23" class="required_text" >휴대폰전화번호</th>
    <td width="80%" nowrap>    
    
    	<c:if test="${result.firstMoblphonNo != null}">
      		<c:out value="${result.firstMoblphonNo}"/>-<c:out value="${result.middleMbtlnum}"/>-<c:out value="${result.endMbtlnum}"/>
		</c:if>
		                            
    </td>
  </tr> 

  <tr> 
    <th width="20%" height="23" class="required_text" nowrap >이메일</th>
    <td width="80%" nowrap>
    	<c:out value="${result.emailAdres}"/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    	<input name="emailAnswerAt" type="checkbox"  disabled="true" <c:if test="${result.emailAnswerAt == 'Y'}">checked="true"</c:if>> 이메일답변여부  
    </td>
  </tr>

  <tr> 
    <th width="20%" height="23" class="required_text" nowrap >작성일자</th>
    <td width="80%" nowrap>    	
    	<c:out value="${result.writngDe}"/>
    </td>
  </tr>

  <tr> 
    <th width="20%" height="23" class="required_text" nowrap >조회횟수</th>
    <td width="80%" nowrap>
    	<c:out value="${result.inqireCo}"/>  
    </td>
  </tr>

  <tr> 
    <th width="20%" height="23" class="required_text" nowrap >처리상태</th>
    <td width="80%" nowrap>
    	<c:out value="${result.qnaProcessSttusCodeNm}"/>  
    </td>
  </tr>

  <tr> 
    <th height="23" class="required_text" >상담제목</th>
    <td width="80%" nowrap>    
      <c:out value="${result.cnsltSj}"/>                 
    </td>
  </tr> 

  <tr> 
    <th height="23" class="required_text" >상담내용</th>
    <td width="80%" nowrap>    
      <textarea name="cnsltCn" class="textarea"  cols="300" rows="15"  style="width:450px;" readonly><c:out value="${result.cnsltCn}"/>
      </textarea>                       
    </td>
  </tr> 

<!-------------------- 답변내용이 있을경우 Display...  --------------------->
<c:if test="${result.qnaProcessSttusCode == '3'}">
  <tr> 
    <th height="23" class="required_text" >답변내용</th>
    <td width="80%" nowrap>    
      <textarea name="managtCn" class="textarea"  cols="300" rows="15"  style="width:450px;" readonly><c:out value="${result.managtCn}"/>
      </textarea>                                        
    </td>
  </tr> 

  <tr> 
    <th width="20%" height="23" class="required_text" nowrap >담당부서</th>
    <td width="80%" nowrap>
    	<c:out value="${result.orgnztNm}"/>
    </td>
  </tr>

  <tr> 
    <th width="20%" height="23" class="required_text" nowrap >답변일자</th>
    <td width="80%" nowrap>
  		<c:if test="${result.managtDe != null}"> 
  			<c:out value="${result.managtDe}"/>      			   	          				 			   
 		</c:if>
    </td>
  </tr>

  <tr> 
    <th width="20%" height="23" class="required_text" nowrap >답변자</th>
    <td width="80%" nowrap>
    	<c:out value="${result.emplyrNm}"/>
    </td>
  </tr>

  <tr> 
    <th width="20%" height="23" class="required_text" nowrap >전화번호</th>
    <td width="80%" nowrap>
    	<c:out value="${result.offmTelno}"/>
    </td>
  </tr>

  <tr> 
    <th width="20%" height="23" class="required_text" nowrap >이메일</th>
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

  <td><img src="/images/egovframework/uss/olp/cns/button/bu2_left.gif" width="8" height="20"></td>
  <td background="/images/egovframework/uss/olp/cns/button/bu2_bg.gif" class="text_left" nowrap>
  		<a href="JavaScript:fn_egov_updt_cnsltdtlsanswer('<c:out value="${result.cnsltId}"/>');">답변</a> 
  </td>
  <td><img src="/images/egovframework/uss/olp/cns/button/bu2_right.gif" width="8" height="20"></td>
  <td>&nbsp;</td>
   
  <td><img src="/images/egovframework/uss/olp/cns/button/bu2_left.gif" width="8" height="20"></td>
  <td background="/images/egovframework/uss/olp/cns/button/bu2_bg.gif" class="text_left" nowrap>
  		<a href="javascript:fn_egov_inqire_cnsltanswerlist();">목록</a> 
  </td>
  <td><img src="/images/egovframework/uss/olp/cns/button/bu2_right.gif" width="8" height="20"></td>      
  <td>&nbsp;</td>
          
</tr>
</table>

<input name="cnsltId" type="hidden" value="">
<input name="writngPassword" 	type="hidden" value="">
<input name="passwordConfirmAt" type="hidden" value="">

</form>
</DIV>

</body>
</html>