<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%
 /**
  * @Class Name : EgovMenuCreat.jsp
  * @Description : 메뉴생성 화면
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

<c:set var="topCategories" value="${adminMenuCategoryMap['menu_0']}" />
		
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link rel="stylesheet" href="/css/egovframework/sym/mpm/mpm.css" type="text/css" />
<link rel="stylesheet" type="text/css" href="/admin/common/css/common_style.css" />
<link rel="stylesheet" type="text/css" href="/admin/common/css/board.css" />
<title>메뉴생성</title>
<script type="text/javascript" src="/admin/common/js/miya_validator.js"></script>
<script language="javascript1.2" src="/js/egovframework/sym/mpm/EgovMenuCreat.js"/></script>
<script language="javascript1.2">
<!--

function lnbMenu() {
	var depth01Cnt = ${fn:length(topCategories)};
	var _d = document,
	objID = _d.getElementById('lnb_menu'),
	objUl = objID.getElementsByTagName('ul'),
	objUlLength = objUl.length;

	var initialize = function() {
		for(var i=0; i<objUlLength; i++) {
			objUl[i].style.display = 'none';	
		}
	};

	this.specifyOpen = function(idx) {
		for(var i=0; i<depth01Cnt; i++)
		{	
			var lnbObj = _d.getElementById('lnb'+i);
			var lnbUlObj = lnbObj.getElementsByTagName('ul');
			if(idx == i)
			{	
				lnbObj.style.display = 'block';
				for(var j=0; j<lnbUlObj.length; j++) 
				{
					lnbUlObj[j].style.display = 'block';
				}
			}
			else
			{
				lnbObj.style.display = 'none';
				for(var j=0; j<lnbUlObj.length; j++) 
				{
					lnbUlObj[j].style.display = 'none';
				}
			}
		}

		top.doResize();
	};


	initialize();
}

/* ********************************************************
 * 조회 함수
 ******************************************************** */
function selectMenuCreatTmp() {
    document.menuCreatManageForm.action = "<c:url value='/sym/mpm/EgovMenuCreatSelect.do'/>";
    document.menuCreatManageForm.submit();
}

/* ********************************************************
 * 멀티입력 처리 함수
 ******************************************************** */
function fInsertMenuCreat() {

	var v = new MiyaValidator(document.menuCreatManageForm);
    v.add("checkField", {
        required: true,
        message: "적용할 메뉴를 선택하세요."
    });
    var result = v.validate();
    if (!result) {
        alert(v.getErrorMessage());
        //v.getErrorElement().focus();
    } 
    else
    {
	    document.menuCreatManageForm.checkedAuthorForInsert.value=document.menuCreatManageForm.authorCode.value;
	    document.menuCreatManageForm.action = "<c:url value='/sym/mpm/EgovMenuCreatInsert.do'/>";
	    document.menuCreatManageForm.submit(); 
    }
}
/* ********************************************************
 * 메뉴사이트맵 생성 화면 호출
 ******************************************************** */
function fMenuCreatSiteMap() {
	id = document.menuCreatManageForm.authorCode.value;
	window.open('/sym/mpm/EgovMenuCreatSiteMapSelect.do?authorCode='+id,'Pop_SiteMap','scrollbars=yes, width=500, height=700');
}
<c:if test="${!empty resultMsg}">alert("${resultMsg}");</c:if>
-->
</script>

</head>
<body> 
<form name="menuCreatManageForm" action ="/sym/mpm/EgovMenuCreatSelect.do" method="post">
<input name="checkedAuthorForInsert"  type="hidden" />

<DIV id="main" style="display:width:700px;"> 

<table width="717" cellpadding="8" class="table-search" border="0">
 <tr>
  <td width="40%"class="title_left">
  <img src="<%=imagePath_icon %>tit_icon.gif" width="16" height="16" hspace="3" align="absmiddle">&nbsp;권한적용</td>
  <td width="10%"></td>
  <td widht="25%"></td>
  <th width="25%">
     <table border="0" cellspacing="0" cellpadding="0" align="right">
       <tr>
         <td width="10"></td>
         <td><img src="<%=imagePath_button %>bu2_left.gif" width="8" height="20"></td>
         <td background="<%=imagePath_button %>bu2_bg.gif" nowrap><a href="javascript:fInsertMenuCreat()">권한적용</a></td>
         <td><img src="<%=imagePath_button %>bu2_right.gif" width="8" height="20"></td>
         <td width="5"></td>
       </tr>
     </table>
  </th>
 </tr>
</table>

<table width="717" border="0" cellpadding="0" cellspacing="1">
 <tr>
  <td width="100%">
    <table width="100%" border="0" cellpadding="0" cellspacing="1" class="table-register">
      <tr>
        <th width="15%" height="40" class="" >권한코드&nbsp;</th>
        <td width="85%"><input name="authorCode" type="text" size="30" value="${resultVO.authorCode}"  maxlength="30" readonly /></td>
      </tr>
    </table>
   </td>
 </tr>
</table>

<table width="717" border="0" cellpadding="0" cellspacing="1">
 <tr>
  <td width="100%">
    <table width="100%" border="0" cellpadding="0" cellspacing="1" class="table-register">
      <tr>
      	<td>&nbsp;</td>
      </tr>
    </table>
   </td>
 </tr>
</table>

<table width="717" border="0" cellspacing="0" cellpadding="0" class="table-line">
  <tr>
    <td height="10"> 
    <input type='checkbox' name='checkAll' class='check2' onclick='javascript:fCheckAll();' />메뉴목록<br/>
	<div id="authomenu">
		<ul id="lnb_menu">
		<c:if test="${fn:length(topCategories)>0}">		 
	 	<c:forEach var="x" begin="0" end="${fn:length(topCategories)-1}">
			<li>
	 	<img id=icon1 border=0 alt=Folder src="/images/egovframework/cmm/utl/menu_folderopen.gif" />
 		<a href="#" onclick="objLNB.specifyOpen(${x}); return false;" onkeypress="this.onclick();">${topCategories[x].menuNm}</a>
				<ul id="lnb${x}">
			<c:set var="d01MenuKey" value="menu_${topCategories[x].menuNo}" />
			<c:set var="d01Categories" value="${adminMenuCategoryMap[d01MenuKey]}" />
			<c:if test="${fn:length(d01Categories)>0}">
	 		<c:forEach var="y" begin="0" end="${fn:length(d01Categories)-1}">	
					<li>
			 	<IMG id=icon1 border=0 alt=Folder src="/images/egovframework/cmm/utl/menu_folderopen.gif">
		 		${d01Categories[y].menuNm}
						<ul>
			<c:set var="menuKey" value="menu_${d01Categories[y].menuNo}" />
			<c:set var="d02Categories" value="${adminMenuCategoryMap[menuKey]}" />
			<c:if test="${fn:length(d02Categories)>0}">
	 			<c:forEach var="z" begin="0" end="${fn:length(d02Categories)-1}">
							<li>
						 	<IMG id=icon1 border=0 alt=Folder src="/images/egovframework/cmm/utl/menu_folderopen.gif">
					 		${d02Categories[z].menuNm}
								<ul>
					<c:set var="d02MenuKey" value="menu_${d02Categories[z].menuNo}" />
					<c:set var="d03Categories" value="${adminMenuCategoryMap[d02MenuKey]}" />
					<c:if test="${fn:length(d03Categories)>0}">
					 	<c:forEach var="k" begin="0" end="${fn:length(d03Categories)-1}">
									<li>
									<input type='checkbox' name='checkField' class='check2' value="${topCategories[x].menuNo}_${d01Categories[y].menuNo}_${d02Categories[z].menuNo}_${d03Categories[k].menuNo}" <c:if test="${d03Categories[k].chkYeoBu > 0}">checked="checked"</c:if> />
											 	<IMG id=icon1 border=0 alt=Folder src="/images/egovframework/cmm/utl/menu_page.gif">
										 		${d03Categories[k].menuNm}
									</li>
						</c:forEach>
					</c:if>
								</ul>
							</li>
				</c:forEach>
			</c:if>
					</ul>
				</li>
			</c:forEach>
			</c:if>
				</ul>
			</li>
		</c:forEach>
		</c:if>
		</ul>
	</div>
    </td>
  </tr>
</table>
</DIV>  
</form>
</body>
</html>
<script type="text/javascript"> 
//<![CDATA[
var objLNB = new lnbMenu();
//]]>
</script>
