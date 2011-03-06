<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%pageContext.setAttribute("crlf", "\r\n"); %>
<%
 /**
  * @Class Name : EgovMailDetail.jsp
  * @Description : 발송메일 상세 조회 화면
  * @Modification Information
  * @
  * @  수정일         수정자                   수정내용
  * @ -------    --------    ---------------------------
  * @ 2009.03.11    박지욱          최초 생성
  *
  *  @author 공통서비스 개발팀 박지욱
  *  @since 2009.03.11
  *  @version 1.0
  *  @see
  *  
  *  Copyright (C) 2009 by MOPAS  All right reserved.
  */
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link rel="stylesheet" href="/css/egovframework/ems/com.css" type="text/css">
<title>MOPAS 발송메일 상세 조회</title>
<script type="text/javascript" src="<c:url value='/js/egovframework/cmm/fms/EgovMultiFile.js'/>"></script>
<script type="text/javaScript" language="javascript">
/* ********************************************************
 * 삭제 처리 함수
 ******************************************************** */
function fnDelete(){
	var ret = confirm("삭제하시겠습니까?");
	if (ret == true) {
		document.detailForm.action = "<c:url value='/ems/deleteSndngMail.do'/>";
		document.detailForm.target = "";
		document.detailForm.submit();
	}
}
/* ********************************************************
 * 뒤로 처리 함수
 ******************************************************** */
function fnBack(){
	document.detailForm.action = "<c:url value='/ems/backSndngMailDetail.do'/>";
	document.detailForm.target = "";
	document.detailForm.submit();
}

/* ********************************************************
 * XML형태의 발송메일 보기
 ******************************************************** */
function fnSelectXml(){
	document.detailForm.action = "<c:url value='/ems/selectSndngMailXml.do'/>";
	document.detailForm.target = "_blank";
	document.detailForm.submit();
}
</script>
</head>
<body>
  <form name="detailForm" action ="<c:url value='/ems/deleteSndngMail.action'/>" method="post">
  	  <input name="mssageId" type="hidden" value="${resultInfo.mssageId}"/>
  	  <input name="atchFileIdList" type="hidden" value="${resultInfo.atchFileId}"/>
	  <table width="700">
	    <tr>
	      <td>
			<table width="700" cellpadding="8" class="table-search" border="0">
			 <tr>
			  <td width="700"class="title_left">
			   <img src="/images/egovframework/ems/tit_icon.gif" width="16" height="16" hspace="3" align="absmiddle">&nbsp;발송메일 상세조회</td>
			 </tr>
			</table>
			<table width="700" border="0" cellpadding="0" cellspacing="1" class="table-register">
			  <tr> 
			    <th width="200" height="23" class="required_text" nowrap >보내는사람&nbsp;&nbsp;</th>
			    <td width="500" nowrap>${resultInfo.dsptchPerson}</td>
			  </tr>
			  <tr> 
			    <th width="200" height="23" class="required_text" nowrap >받는사람&nbsp;&nbsp;</th>
			    <td width="500" nowrap>${resultInfo.recptnPerson}</td>
			  </tr>
			  <tr> 
			    <th width="200" height="23" class="required_text" nowrap >제목&nbsp;&nbsp;</th>
			    <td width="500" nowrap>${resultInfo.sj}</td>
			  </tr>
			  <tr> 
			    <th width="200" height="23" class="required_text" >발신 내용&nbsp;&nbsp;</th>
			    <td width="500" nowrap>
			      <c:out value="${fn:replace(resultInfo.emailCn , crlf , '<br/>')}" escapeXml="false" />
			    </td>
			  </tr> 
			  <tr> 
			    <th width="200" height="23" class="required_text" >발송 결과&nbsp;&nbsp;</th>
			    <td width="500" nowrap>${resultInfo.sndngResultCode}</td>
			  </tr> 
			  <tr> 
			    <th width="200" height="23" class="required_text" >XML메일보기&nbsp;&nbsp;</th>
			    <td width="500" nowrap><a href="javascript:fnSelectXml();">${resultInfo.mssageId}.xml</a></td>
			  </tr>
			  <c:if test="${result.atchFileId != ''}">
			  <tr> 
			    <th width="200" height="23" class="required_text" >첨부파일&nbsp;&nbsp;</th>
			    <td width="500" nowrap>
					<c:import url="/cmm/fms/selectFileInfs.do" >
						<c:param name="param_atchFileId" value="${resultInfo.atchFileId}" />
					</c:import>
			    </td>
			  </tr>
			  </c:if>
			</table>
			<table width="700" border="0" cellspacing="0" cellpadding="0">
			  <tr> 
			    <td height="10"></td>
			  </tr>
			</table>
		  </td>
		</tr>
		<tr>
		  <td>
			<table border="0" cellspacing="0" cellpadding="0" align="right">
			  <tr> 
			    <td><img src="/images/egovframework/ems/bu2_left.gif" width="8" height="20"></td>
			    <td background="/images/egovframework/ems/bu2_bg.gif" class="text_left" nowrap><a href="javascript:fnBack();">뒤로</a> 
			    </td>
			    <td><img src="/images/egovframework/ems/bu2_right.gif" width="8" height="20"></td>    
			    <td>&nbsp;&nbsp;</td>  
			    <td><img src="/images/egovframework/ems/bu2_left.gif" width="8" height="20"></td>
			    <td background="/images/egovframework/ems/bu2_bg.gif" class="text_left" nowrap><a href="javascript:fnDelete();">삭제</a> 
			    </td>
			    <td><img src="/images/egovframework/ems/bu2_right.gif" width="8" height="20"></td> 
			  </tr>
			</table>
		  </td>
		</tr>
	  </table>
  </form>	  
</body>
</html>

