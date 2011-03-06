<%
 /**
  * @Class Name : EgovCnsltListInqire.jsp
  * @Description : EgovCnsltListInqire 화면
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
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"  %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<%@ page import="egovframework.com.uss.umt.service.EgovMberManageService"  %>

<html>
<head>
<title>EgovCnsltManageList</title>
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<link type="text/css" rel="stylesheet" href="/css/egovframework/uss/olp/cns/com.css" />

<script type="text/javaScript" language="javascript">

/*********************************************************
 * 초기화
 ******************************************************** */
function fn_egov_initl_cnsltlist(){

	document.CnsltListForm.searchKeyword.focus();
	
}

/*********************************************************
 * 페이징 처리 함수
 ******************************************************** */
function fn_egov_select_linkPage(pageNo){
	
	document.CnsltListForm.pageIndex.value = pageNo;
	document.CnsltListForm.action = "<c:url value='/uss/olp/cns/CnsltListInqire.do'/>";
   	document.CnsltListForm.submit();
   	
}

/*********************************************************
 * 조회 처리 함수
 ******************************************************** */
function fn_egov_search_cnsltdtls(){

	document.CnsltListForm.pageIndex.value = 1;
	document.CnsltListForm.submit();
	
}

/*********************************************************
 * 등록 처리 함수
 ******************************************************** */
function fn_egov_regist_cnsltdtls(){

	// 로그인을 할 것인자? 실명확인을 할것인지? 판단 화면
	var loginRealnm_url 	= "<c:url value='/uss/olp/cns/LoginRealnmChoice.do'/>";	
	var	loginRealnm_status 	= "dialogWidth=350px;dialogHeight=150px;resizable=no;center=yes";

	// 로그인 화면
	var	login_url 		= "<c:url value='/uat/uia/egovLoginUsr.do'/>"; 		
	var login_status 	= "dialogWidth=700px;dialogHeight=420px;resizable=no;center=yes";
	

	// 실명확인 화면 
	var	realnm_url 	= "<c:url value='/sec/rnc/EgovRlnmCnfirm.do?nextUrlName=button.cnsltregist&nextUrl=C'/>"; 		
	var realnm_status 	= "dialogWidth=740px;dialogHeight=180px;resizable=no;center=yes";

	var	returnValue = false;
	
	var certificationAt = document.CnsltListForm.certificationAt.value;

	
	// 인증여부 확인
	if (certificationAt == "N") {

		// 로그인? 실명확인 여부 화면 호출
		returnValue = window.showModalDialog(loginRealnm_url, self, loginRealnm_status);
		
		// 결과값을 받아. 결과를 Submit한다.
	 	if	(returnValue)	{

	 		ls_loginRealnmAt = document.CnsltListForm.loginRealnmAt.value;

	 		// 로그인처리
	 		if (ls_loginRealnmAt == "L")		{

				// 로그인 화면 호출
			    /* 추후 진행 예정..
	 			returnValue = window.showModalDialog(login_url, self, login_status);
	 			
	 			returnValue = true;
				*/

				// 팝업이 아닌 메인 화면으로 처리.
	 			document.CnsltListForm.action = "<c:url value='/uat/uia/egovLoginUsr.do'/>";
	 			document.CnsltListForm.submit();
	 			 			

	 			returnValue = false;
	 			
	 		// 실명확인처리
	 		} else if (ls_loginRealnmAt == "R")	{
			 		 			
				// 실명확인 화면 호출
	 			returnValue = window.showModalDialog(realnm_url, self, realnm_status);

	 			ls_wrterNm = document.CnsltListForm.realname.value;

	 			document.CnsltListForm.wrterNm.value = ls_wrterNm;
	 			
	 				 			

	 		}  // 로그인처리 혹은 실명확인 경우 end...

	 		
 			if	(returnValue)	{

 				// 상담등록화면 호출..
 				fn_egov_regist_cnsltcn();
 		 		 				
 			}
	 		
	 			 			
	 	}	// 결과값을 받아. 결과를 Submit한다. end..
		
	} else	{

		// 상담등록화면 호출..
		fn_egov_regist_cnsltcn();
		
	}
				
}


/*********************************************************
 * 상담등록화면 호출
 ******************************************************** */
function fn_egov_regist_cnsltcn(){

	document.CnsltListForm.action = "<c:url value='/uss/olp/cns/CnsltDtlsRegistView.do'/>";
	document.CnsltListForm.submit();
		
}

	
/* ********************************************************
 * 상세회면 처리 함수
 ******************************************************** */
function fn_egov_inquire_cnsltdetail(cnsltId) {		

	// 사이트 키값(siteId) 셋팅.
	document.CnsltListForm.cnsltId.value = cnsltId;	
//  document.CnsltListForm.action = "<c:url value='/uss/olp/cns/CnsltDetailInqire.do'/>";
  	document.CnsltListForm.action = "<c:url value='/uss/olp/cns/CnsltInqireCoUpdt.do'/>"; 
  	document.CnsltListForm.submit();	
	   	   		
}

</script>
</head>
<body onLoad="fn_egov_initl_cnsltlist();">

<DIV id="content" style="width:712px">

<form name="CnsltListForm" action="<c:url value='/uss/olp/cns/CnsltListInqire.do'/>" method="post">

<!---------------------- 실명확인을 위한  설정   Start...---------------------------->
<input type="hidden" name="ihidnum" value="">
<input type="hidden" name="realname" value="">

<input type="hidden" name ="nextUrlName" value="Q&A 작성">
<input type="hidden" name ="nextUrl" value="/uss/olh/qna/QnaCnRegistView.do">

<input type="hidden" name="certificationAt" value="${certificationAt}">
<input type="hidden" name="loginRealnmAt" value="">

<input type="hidden" name="wrterNm" value="">
<!---------------------- 실명확인을 위한  설정 End......---------------------------->

<table width="100%" cellpadding="8" class="table-search" border="0">
 <tr>
  <td width="40%" class="title_left">
   <img src="/images/egovframework/uss/olp/cns/icon/tit_icon.gif" width="16" height="16" hspace="3" align="left">&nbsp;상담목록 조회</td>
  <th>
  </th>
  <td width="10%">
   	<select name="searchCondition" class="select">
		   <option selected value=''>--선택하세요--</option>
		   <option value="wrterNm"  <c:if test="${searchVO.searchCondition == 'wrterNm'}">selected="selected"</c:if> >작성자명</option>
		   <option value="cnsltSj"  <c:if test="${searchVO.searchCondition == 'cnsltSj'}">selected="selected"</c:if> >상담제목</option>			   
	   </select>
	</td>
  
  <td width="35%">
    <input name="searchKeyword" type="text" size="35" value='<c:out value="${searchVO.searchKeyword}"/>'  maxlength="35" > 
  </td>
  
  <th width="10%">
   <table border="0" cellspacing="0" cellpadding="0">
    <tr> 
      <td><img src="/images/egovframework/uss/olp/cns/button/bu2_left.gif" width="8" height="20"></td> 
      
      <td background="/images/egovframework/uss/olp/cns/button/bu2_bg.gif" class="text_left" nowrap>
      		<a href="javascript:fn_egov_search_cnsltdtls();">조회</a> 
      </td>
      
      <td><img src="/images/egovframework/uss/olp/cns/button/bu2_right.gif" width="8" height="20"></td>
      
      <td>&nbsp;&nbsp;</td>
      
      <td><img src="/images/egovframework/uss/olp/cns/button/bu2_left.gif" width="8" height="20"></td>
      
      <td background="/images/egovframework/uss/olp/cns/button/bu2_bg.gif" class="text_left" nowrap>
      		<a href="javascript:fn_egov_regist_cnsltdtls();">등록</a> 
      </td>
      
      <td><img src="/images/egovframework/uss/olp/cns/button/bu2_right.gif" width="8" height="20"></td>
      
      <td>&nbsp;&nbsp;</td>
        
    </tr>
   </table>
  </th>  
 </tr>
</table>

<table width="100%" cellspacing="0" cellpadding="0" border="0">
<tr>
	<td height="3px"></td>
</tr>
</table>

<table width="98%" cellpadding="8" class="table-line" border="0">
<thead>
<tr>      
    <th class="title" width="5%" nowrap>순번</th>        
    <th class="title" width="40%" nowrap>상담제목</th>    
    <th class="title" width="10%" nowrap>작성자</th>        
    <th class="title" width="10%" nowrap>작성일자</th>
    <th class="title" width="10%" nowrap>진행상태</th>               
    <th class="title" width="10%" nowrap>조회수</th>                           
</tr>
</thead>

 <c:if test="${fn:length(resultList) == 0}">
  <tr> 
  	<td class="lt_text3" colspan=10>
  		<spring:message code="common.nodata.msg" />  		
  	</td>
  </tr>   	          				 			   
 </c:if>
  
<tbody>      
<c:forEach items="${resultList}" var="resultInfo" varStatus="status">
  <tr style="cursor:hand;" onClick="fn_egov_inquire_cnsltdetail('<c:out value="${resultInfo.cnsltId}"/>')">
		<td class="lt_text3"><c:out value="${(searchVO.pageIndex-1) * searchVO.pageSize + status.count}"/></td>
		<td class="lt_text3"><c:out value="${resultInfo.cnsltSj}"/></td>
		<td class="lt_text3"><c:out value="${resultInfo.wrterNm}"/></td> 
		<td class="lt_text3"><fmt:formatDate value="${resultInfo.writngDe}"  pattern="yyyy-MM-dd"/></td>
		<td class="lt_text3"><c:out value="${resultInfo.qnaProcessSttusCodeNm}"/></td>
		<td class="lt_text3"><c:out value="${resultInfo.inqireCo}"/></td>						
  </tr>   
</c:forEach>
</tbody>  
</table>

<table width="100%" cellspacing="0" cellpadding="0" border="0">
<tr>
	<td height="3px"></td>
</tr>
</table>

<div align="center">
	<div>
		<ui:pagination paginationInfo = "${paginationInfo}"
				type="image"
				jsFunction="fn_egov_select_linkPage"
				/>
	</div>
</div>


<input name="cnsltId" type="hidden" value="">
<input name="passwordConfirmAt" type="hidden" value="">

<input name="pageIndex" type="hidden" value="<c:out value='${searchVO.pageIndex}'/>"/>

</form>

</DIV>

