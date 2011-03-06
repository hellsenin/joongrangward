<%--
/**
 * @Class Name  : egovAuthorUpdate.java
 * @Description : egovAuthorUpdate jsp
 * @Modification Information
 * @
 * @  수정일         수정자          수정내용
 * @ -------    --------    ---------------------------
 * @ 2009.02.01    lee.m.j          최초 생성
 *
 *  @author lee.m.j
 *  @since 2009.03.11
 *  @version 1.0
 *  @see
 *  
 *  Copyright (C) 2009 by MOPAS  All right reserved.
 */
--%>

<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="validator" uri="http://www.springmodules.org/tags/commons-validator" %>

<c:set var="registerFlag" value="${empty authorManageVO.authorCode ? 'INSERT' : 'UPDATE'}"/>
<c:set var="registerFlagName" value="${empty authorManageVO.authorCode ? '권한 등록' : '권한 수정'}"/>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<link href="<c:url value='/css/egovframework/cmm/sec/ram/com.css' />" rel="stylesheet" type="text/css">
<link rel="stylesheet" type="text/css" href="/admin/common/css/common_style.css">
<link rel="stylesheet" type="text/css" href="/admin/common/css/board.css">
<title></title>
<script type="text/javascript" src="<c:url value="/validator.do"/>"></script>
<validator:javascript formName="authorManage" staticJavascript="false" xhtml="true" cdata="false"/>
<script type="text/javaScript" language="javascript">

function fncSelectAuthorList() {
	var varFrom = document.getElementById("authorManage");
	varFrom.action = "<c:url value='/cmm/sec/ram/EgovAuthorList.do'/>";
	varFrom.submit();       
}

function fncAuthorInsert() {

    var varFrom = document.getElementById("authorManage");
    varFrom.action = "<c:url value='/cmm/sec/ram/EgovAuthorInsert.do'/>";

    if(confirm("저장 하시겠습니까?")){
        if(!validateAuthorManage(varFrom)){           
            return;
        }else{
            varFrom.submit();
        } 
    }
}

function fncAuthorUpdate() {
	var varFrom = document.getElementById("authorManage");
	varFrom.action = "<c:url value='/cmm/sec/ram/EgovAuthorUpdate.do'/>";

    if(confirm("저장 하시겠습니까?")){
        if(!validateAuthorManage(varFrom)){           
            return;
        }else{
            varFrom.submit();
        } 
    }
}

function fncAuthorDelete() {
	var varFrom = document.getElementById("authorManage");
	varFrom.action = "<c:url value='/cmm/sec/ram/EgovAuthorDelete.do'/>";
	if(confirm("삭제 하시겠습니까?")){
	    varFrom.submit();
	}
}

</script>
</head>

<body>
<DIV id="main">

   <h3 class="tit_03">권한 수정</h3>

<table border="0">
  <tr>
    <td width="700">
<form:form commandName="authorManage" method="post" >

<table width="100%" cellpadding="8" class="view_type01">
  <tr>
    <th class="required_text" width="20%" nowrap>권한  코드<img src="/images/egovframework/uss/olp/mgt/icon/required.gif" width="15" height="15"></th>
    <td nowrap><input name="authorCode" id="authorCode" type="text" <c:if test="${registerFlag == 'UPDATE'}">readonly</c:if> value="<c:out value='${authorManage.authorCode}'/>" size="40" />&nbsp;<form:errors path="authorCode" /></td>
     
  </tr>
  <tr>  
    <th class="required_text" width="20%" nowrap>권한 명<img src="/images/egovframework/uss/olp/mgt/icon/required.gif" width="15" height="15"></th>
    <td nowrap><input name="authorNm" id="authorNm" type="text" value="<c:out value='${authorManage.authorNm}'/>" required="true" fieldTitle="권한 명" maxLength="50" char="s" size="40" />&nbsp;<form:errors path="authorNm" /></td>
  </tr>
  <tr>  
    <th class="required_text" width="20%" nowrap>설명</th>
    <td nowrap><input name="authorDc" id="authorDc" type="text" value="<c:out value="${authorManage.authorDc}"/>" required="true" fieldTitle="설명" maxLength="50" char="s" size="50" /></td>
  </tr>
  <tr>  
    <th class="required_text" width="20%" nowrap>등록일자</th>
    <td nowrap><input name="authorCreatDe" id="authorCreatDe" type="text" value="<c:out value="${authorManage.authorCreatDe}"/>" required="true" fieldTitle="등록일자" maxLength="50" char="s" size="20" readonly/></td>
  </tr>
</table>

				<div id="btn_area">
    	<c:if test="${authorManage.authorCode != 'ROLE_ANONYMOUS' && authorManage.authorCode != 'ROLE_ALL'}">
					<div class="btn_right_fl">
      <c:if test="${registerFlag == 'INSERT'}">
						<a href="javascript:fncAuthorInsert()"><img src="/admin/images/common/btn/btn_regist.gif" alt="등록" /></a>
	 </c:if>
      <c:if test="${registerFlag == 'UPDATE'}">
						<a href="javascript:fncAuthorUpdate()"><img src="/admin/images/common/btn/btn_regist.gif" alt="수정" /></a>
						<a href="javascript:fncAuthorDelete()"><img src="/admin/images/common/btn/btn_delete.gif" alt="삭제" /></a>
	 </c:if>
					</div>
		</c:if>
					<div class="btn_right_fr">
						<a href="javascript:fncSelectAuthorList()"><img src="/admin/images/common/btn/btn_list.gif" alt="목록" /></a>	
					</div>
					
				</div><!-- btn end -->   
<!--
    <button type="button" onclick="javascript:fncSelectAuthorList();">List</button>
    <input type="submit" value="<c:out value='${registerFlag}'/>"/>
 -->
<!-- 검색조건 유지 -->
<c:if test="${registerFlag == 'UPDATE'}">
<input type="hidden" name="searchCondition" value="<c:out value='${authorManageVO.searchCondition}'/>"/>
<input type="hidden" name="searchKeyword" value="<c:out value='${authorManageVO.searchKeyword}'/>"/>
<input type="hidden" name="pageIndex" value="<c:out value='${authorManageVO.pageIndex}'/>"/>
</c:if>
</form:form>
    
</td>
</tr>
</table>   
 
</DIV>
</body>
</html>

