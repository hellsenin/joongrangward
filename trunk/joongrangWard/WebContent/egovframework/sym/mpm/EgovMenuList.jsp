<%--
 /** 
  * @Class Name : EgovMenuList.jsp
  * @Description : 메뉴목록 화면
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
--%>
<%@ page contentType="text/html; charset=utf-8"%> 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="validator" uri="http://www.springmodules.org/tags/commons-validator" %>
<c:set var="ImgUrl" value="/images/egovframework/sym/mpm/"/>
<c:set var="CssUrl" value="/css/egovframework/sym/mpm/"/>

<c:set var="siteId" value="${param.siteId}" />
<c:if test="${empty siteId}" >
	<c:set var="siteId" value="1" />
</c:if>

<%
String imagePath_icon   = "/images/egovframework/sym/mpm/icon/";
String imagePath_button = "/images/egovframework/sym/mpm/button/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link rel="stylesheet" href="${CssUrl}mpm.css" type="text/css" />
<title>메뉴정보등록</title>
<script type="text/javascript" src="<c:url value="/validator.do" />"></script>
<script language="javascript1.2" src="/js/egovframework/sym/mpm/EgovMenuList.js"/></script>
<script language="javascript1.2">
<!--
/* ********************************************************
 * 파일검색 화면 호출 함수
 ******************************************************** */
function searchFileNm() {
	document.menuListForm.tmp_SearchElementName.value = "progrmFileNm";
	window.open('/sym/mpm/EgovProgramListSearch.do','','width=500,height=350');
}

/* ********************************************************
 * 메뉴등록 처리 함수
 ******************************************************** */
function insertMenuList() {
	if(!fn_validatorMenuList()){return;}
	document.menuListForm.action = "<c:url value='/sym/mpm/EgovMenuListInsert.do'/>";
	menuListForm.submit();

}

function insertChildMenuList() {
	initlMenuList();
	document.menuListForm.upperMenuId.value = document.menuListForm.menuNo.value;
	document.menuListForm.menuNm.value = "하위메뉴";
	document.menuListForm.action = "<c:url value='/sym/mpm/EgovMenuListInsert.do'/>";
	menuListForm.submit();
}

/* ********************************************************
 * 메뉴수정 처리 함수
 ******************************************************** */
function updateMenuList() {
    if(!fn_validatorMenuList()){return;}
	document.menuListForm.action = "<c:url value='/sym/mpm/EgovMenuListUpdt.do'/>";
	menuListForm.submit();
}

/* ********************************************************
 * 메뉴삭제 처리 함수
 ******************************************************** */
function deleteMenuList() {
    if(!fn_validatorMenuList()){return;}
	document.menuListForm.action = "<c:url value='/sym/mpm/EgovMenuListDelete.do'/>";
	menuListForm.submit();
}

/* ********************************************************
 * 메뉴리스트 조회 함수
 ******************************************************** */
function selectMenuList() {
    document.menuListForm.action = "<c:url value='/sym/mpm/EgovMenuListSelect.do'/>";
    document.menuListForm.submit();
}

/* ********************************************************
 * 메뉴이동 화면 호출 함수
 ******************************************************** */
function mvmnMenuList() {
	window.open('/sym/mpm/EgovMenuListSelectMvmn.do','Pop_Mvmn','scrollbars=yes,width=600,height=600');
}

/* ********************************************************
 * 초기화 함수
 ******************************************************** */
function initlMenuList() {
	document.menuListForm.menuOrdr.value="";
	document.menuListForm.menuNm.value="";
	document.menuListForm.menuDc.value="";
	document.menuListForm.menuLink.value="";
	document.menuListForm.menuPopupYn.value="";
	document.menuListForm.deptId.value = "";
}

/* ********************************************************
 * 조회 함수
 
 ******************************************************** */
function selectMenuListTmp() {
	document.menuListForm.req_RetrunPath.value = "/sym/mpm/EgovMenuList";
    document.menuListForm.action = "<c:url value='/sym/mpm/EgovMenuListSelectTmp.do'/>";
    document.menuListForm.submit();
}

/* ********************************************************
 * 상세내역조회 함수
 ******************************************************** */
 function choiceNodes(nodeNum) {
		var nodeValues = nodes[nodeNum].split("|");
		document.menuListForm.menuNo.value = nodeValues[0];
		document.menuListForm.upperMenuId.value = nodeValues[1];
		document.menuListForm.menuOrdr.value = nodeValues[5];
		document.menuListForm.menuNm.value = nodeValues[6];
		document.menuListForm.menuDc.value = nodeValues[8];
		document.menuListForm.siteId.value = nodeValues[12];
		document.menuListForm.menuLink.value = nodeValues[13];
		document.menuListForm.menuPopupYn.value = nodeValues[14];
		document.menuListForm.deptId.value = nodeValues[15];
}

/* ********************************************************
 * 입력값 validator 함수
 ******************************************************** */
function fn_validatorMenuList() {	
	if(document.menuListForm.menuOrdr.value == ""){alert("메뉴순서는 Not Null 항목입니다."); return false;}
	if(!checkNumber(document.menuListForm.menuOrdr.value)){alert("메뉴순서는 숫자만 입력 가능합니다."); return false;}	
	if(document.menuListForm.menuNm.value == ""){alert("메뉴명은 Not Null 항목입니다."); return false;}
	
    return true;
}

/* ********************************************************
 * 필드값 Number 체크 함수
 ******************************************************** */
function checkNumber(str) { 
    var flag=true; 
    if (str.length > 0) { 
        for (i = 0; i < str.length; i++) {  
            if (str.charAt(i) < '0' || str.charAt(i) > '9') { 
                flag=false; 
            } 
        } 
    } 
    return flag; 
}
-->
</script>

</head> 
<body>  
<form name="menuListForm" action ="/sym/mpm/EgovMenuListSelect.do" method="post">
<input type="hidden" name="req_RetrunPath" value="/sym/mpm/EgovMenuList" />
<input type="hidden" name="menuNo" />
<input type="hidden" name="upperMenuId" value="0" />
<input type="hidden" name="siteId" value="${siteId}" />
<DIV id="main" style="display:"> 

<table width="717" cellpadding="8" class="table-search" border="0">
 <tr>
  <td width="100%" class="title_left">
   <img src="<%=imagePath_icon %>tit_icon.gif" width="16" height="16" hspace="3" align="absmiddle">&nbsp;메뉴 목록</td>
 </tr>
</table>


<table width="717" cellpadding="8" class="table-search" border="0">
  <tr>
   <td width="240" class="title_left" rowspan='2'>
	<c:forEach var="result" items="${list_menulist}" varStatus="status" > 
	<input type="hidden" name="tmp_menuNmVal" value="${result.menuNo}|${result.upperMenuId}|${result.menuNm}|${result.progrmFileNm}|${result.menuNo}|${result.menuOrdr}|${result.menuNm}|${result.upperMenuId}|${result.menuDc}|${result.relateImagePath}|${result.relateImageNm}|${result.progrmFileNm}|${result.siteId}|${result.menuLink}|${result.menuPopupYn}|${result.deptId}|">
	</c:forEach>
	
<div class="tree" style="position:absolute; left:24px; top:40px; width:240px; height:25px; z-index:10;">
	<script language="javascript">
		    var chk_Object = true;
		    var chk_browse = "";
			if (eval(document.menuListForm.req_RetrunPath)=="[object]") chk_browse = "IE";
			if (eval(document.menuListForm.req_RetrunPath)=="[object NodeList]") chk_browse = "Fox";
			if (eval(document.menuListForm.req_RetrunPath)=="[object Collection]") chk_browse = "safai";

			var Tree = new Array;
			if(chk_browse=="IE"&&eval(document.menuListForm.tmp_menuNmVal)!="[object]"){
			   alert("메뉴 목록 데이타가 존재하지 않습니다.");
			   chk_Object = false;
			}
			if(chk_browse=="Fox"&&eval(document.menuListForm.tmp_menuNmVal)!="[object NodeList]"){
			   alert("메뉴 목록 데이타가 존재하지 않습니다.");
			   chk_Object = false;
			}
			if(chk_browse=="safai"&&eval(document.menuListForm.tmp_menuNmVal)!="[object Collection]"){
				   alert("메뉴 목록 데이타가 존재하지 않습니다.");
				   chk_Object = false;
			}
			if( chk_Object ){
				for (var j = 0; j < document.menuListForm.tmp_menuNmVal.length; j++) {
					Tree[j] = document.menuListForm.tmp_menuNmVal[j].value;
			    }
			    createTree(Tree);
            }else{
                alert("메뉴가 존재하지 않습니다. 메뉴 등록 후 사용하세요.");
            }
	</script>
</div>

   </td>
   <td width="*" class="title_left">
	   <table border="0" cellspacing="0" cellpadding="0" align="left">
		<tr> 
		  <td height="10"><img src="<%=imagePath_button %>bu2_left.gif" width="8" height="20"></td>
		  <td background="<%=imagePath_button %>bu2_bg.gif" class="text_left" nowrap><a href="javascript:initlMenuList()">초기화</a></td>
		  <td><img src="<%=imagePath_button %>bu2_right.gif" width="8" height="20"></td> 
	      <td width="10"></td>
	       <td height="10"><img src="<%=imagePath_button %>bu2_left.gif" width="8" height="20"></td>
		  <td background="<%=imagePath_button %>bu2_bg.gif" class="text_left" nowrap><a href="javascript:insertMenuList()">메뉴등록</a></td>
		  <td><img src="<%=imagePath_button %>bu2_right.gif" width="8" height="20"></td> 
	       <td width="10"></td>
		  <td height="10"><img src="<%=imagePath_button %>bu2_left.gif" width="8" height="20"></td>
		  <td background="<%=imagePath_button %>bu2_bg.gif" class="text_left" nowrap><a href="javascript:insertChildMenuList()">하위메뉴등록</a></td>
		  <td><img src="<%=imagePath_button %>bu2_right.gif" width="8" height="20"></td> 
	       <td width="10"></td>
		  <td height="10"><img src="<%=imagePath_button %>bu2_left.gif" width="8" height="20"></td>
		  <td background="<%=imagePath_button %>bu2_bg.gif" class="text_left" nowrap><a href="javascript:updateMenuList()">수정</a></td>
		  <td><img src="<%=imagePath_button %>bu2_right.gif" width="8" height="20"></td> 
	      <td width="10"></td>
		  <td height="10"><img src="<%=imagePath_button %>bu2_left.gif" width="8" height="20"></td>
		  <td background="<%=imagePath_button %>bu2_bg.gif" class="text_left" nowrap><a href="javascript:deleteMenuList()">삭제</a></td>
		  <td><img src="<%=imagePath_button %>bu2_right.gif" width="8" height="20"></td>      
		</tr>
	   </table>
   </td>
 <tr>

   <td width="70%" class="title_left">

		<table width="100%" border="0" cellpadding="0" cellspacing="1" class="table-register">
		  <tr>
		    <th width="30%" height="23" class="required_text" nowrap >메뉴순서<img src="<%=imagePath_icon %>required.gif" width="15" height="15"></th>
		    <td width="70%" nowrap>
		      &nbsp; <input name="menuOrdr" type="text" size="10" value=""  maxlength="10"> 
		    </td>
		  </tr> 
		  <tr> 
		    <th width="30%" height="23" class="required_text" nowrap >메뉴명<img src="<%=imagePath_icon %>required.gif" width="15" height="15"></th>
		    <td width="70%" nowrap>
		      &nbsp; <input name="menuNm" type="text" size="30" value=""  maxlength="30" > 
		    </td>
		  </tr>  
		  <tr>
		    <th width="30%" height="23" class="required_text" nowrap >메뉴링크<img src="<%=imagePath_icon %>required.gif" width="15" height="15"></th>
		    <td width="70%" nowrap>
		      &nbsp; <input name="menuLink" type="text" size="30" value=""  maxlength="60" > 
		    </td>
		  </tr>
		  <tr>
		    <th width="30%" height="23" class="required_text" nowrap >메뉴팝업유무<img src="<%=imagePath_icon %>required.gif" width="15" height="15"></th>
		    <td width="70%" nowrap>
		      &nbsp; <input name="menuPopupYn" type="radio" value="Y" > 사용 <input name="menuPopupYn" type="radio" value="N" checked>미사용 
		    </td>
		  </tr>
		  <tr>
		    <th width="30%" height="23" class="required_text" nowrap >부서ID<img src="<%=imagePath_icon %>required.gif" width="15" height="15"></th>
		    <td width="70%" nowrap>
		      &nbsp; <input name="deptId" type="text" size="30" value=""  maxlength="60" > 
		    </td>
		  </tr>
		  <tr> 
		    <th width="30%" height="23" class="required_text" >메뉴설명</th>
		    <td width="70%">
		      &nbsp; <textarea name="menuDc" class="textarea"  cols="45" rows="8"  style="width:350px;" value=""></textarea> 
		    </td>
		  </tr> 
		</table>
		<table width="100%" border="0" cellspacing="0" cellpadding="0">
		  <tr> 
		    <td height="10"></td>
		  </tr>
		</table>

   </td>
 </tr>
</table>
<br>
    <input type="hidden" name="tmp_SearchElementName" value="">
    <input type="hidden" name="tmp_SearchElementVal" value="">
    <input type="hidden" name="tmp_CheckVal" value="">
</DIV>

</form> 
</body>
</html>

