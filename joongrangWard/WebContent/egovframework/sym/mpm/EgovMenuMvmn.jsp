<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%
 /** 
  * @Class Name : EgovMenuMvmn.jsp
  * @Description : 메뉴이동 화면
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
<title>메뉴이동</title>
<script language="javascript1.2" src="/js/egovframework/sym/mpm/EgovMenuList.js"/></script>
<script language="javascript1.2">
<!--
function selectProgramListSearch() {  
	progrmManageForm.submit();
}
function choisProgramListSearch(vFileNm) { 
	eval("opener.document.all."+opener.document.all.tmp_SearchElementName.value).value = vFileNm;
    window.close();
}

/* ********************************************************
 * 상세내역조회 함수
 ******************************************************** */
function choiceNodes(nodeNum) {
	var nodeValues = nodes[nodeNum].split("|");
	opener.document.menuListForm.upperMenuId.value = nodeValues[4];
    window.close();
}
/* ********************************************************
 * 조회 함수
 ******************************************************** */
function selectMenuListTmp() {
	document.menuListForm.req_RetrunPath.value = "/sym/mpm/EgovMenuMvmn";
    document.menuListForm.action = "<c:url value='/sym/mpm/EgovMenuListSelectTmp.do'/>";
    document.menuListForm.submit();
}
-->
</script>
</head>
<body style="overflow-x:hidden;overflow-y:auto"> 
<form name="searchUpperMenuIdForm" action ="/sym/mpm/EgovMenuListSelectMvmn.do" method="post">
<input type="hidden" name="req_RetrunPath" value="/sym/mpm/EgovMenuMvmn">
<c:forEach var="result" items="${list_menulist}" varStatus="status" > 
<input type="hidden" name="tmp_menuNmVal" value="${result.menuNo}|${result.upperMenuId}|${result.menuNm}|${result.progrmFileNm}|${result.menuNo}|${result.menuOrdr}|${result.menuNm}|${result.upperMenuId}|${result.menuDc}|${result.relateImagePath}|${result.relateImageNm}|${result.progrmFileNm}|">
</c:forEach>
<DIV id="main" style="display:"> 

<table width="570" cellpadding="8" class="table-search" border="0">
 <tr>
  <td width="40%"class="title_left"> 
   <img src="<%=imagePath_icon %>tit_icon.gif" width="16" height="16" hspace="3" align="absmiddle">&nbsp;메뉴이동</td>
  <th >
  </th>
  <td width="10%" ></td>
  <td widht="35%"></td> 
  <th width="10%">
   <table border="0" cellspacing="0" cellpadding="0">
    <tr> 
      <td></td>      
    </tr>
   </table>
  </th>  
 </tr>
</table>
<table width="570" border="0" cellpadding="0" cellspacing="1">
 <tr>
  <td width="100%"> 
    <table width="100%" border="0" cellpadding="0" cellspacing="1" class="table-register">
      <tr> 
        <th width="20%" height="40" class="" >이동할메뉴명&nbsp;</th>
        <td width="80%">
          <table border="0" cellspacing="0" cellpadding="0" align="left">
            <tr> 
              <td >&nbsp;<input name="progrmFileNm" type="text" size="30" value=""  maxlength="60" ></td>
            </tr>
          </table> 
        </td>
      </tr> 
    </table>
   </td>
 </tr>    
</table>
<table width="570" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td height="10">&nbsp;</td>
  </tr>
</table>

<table width="570" cellpadding="8" class="table-line">
  <tr>
    <td> 
 		<div class="tree" style="width:400px; height:25px;">
			<script language="javascript">

		    var chk_Object = true;
		    var chk_browse = "";
			if (eval(document.searchUpperMenuIdForm.req_RetrunPath)=="[object]") chk_browse = "IE";
			if (eval(document.searchUpperMenuIdForm.req_RetrunPath)=="[object NodeList]") chk_browse = "Fox";
			if (eval(document.searchUpperMenuIdForm.req_RetrunPath)=="[object Collection]") chk_browse = "safai";

			var Tree = new Array;
			if(chk_browse=="IE"&&eval(document.searchUpperMenuIdForm.tmp_menuNmVal)!="[object]"){
			   alert("메뉴 목록 데이타가 존재하지 않습니다.");
			   chk_Object = false;
			}
			if(chk_browse=="Fox"&&eval(document.searchUpperMenuIdForm.tmp_menuNmVal)!="[object NodeList]"){
			   alert("메뉴 목록 데이타가 존재하지 않습니다.");
			   chk_Object = false;
			}
			if(chk_browse=="safai"&&eval(document.searchUpperMenuIdForm.tmp_menuNmVal)!="[object Collection]"){
				   alert("메뉴 목록 데이타가 존재하지 않습니다.");
				   chk_Object = false;
			}
			if( chk_Object ){
				for (var j = 0; j < document.searchUpperMenuIdForm.tmp_menuNmVal.length; j++) {
					Tree[j] = document.searchUpperMenuIdForm.tmp_menuNmVal[j].value;
			    }
			    createTree(Tree, true);
            }else{
                alert("메뉴가 존재하지 않습니다. 메뉴 등록 후 사용하세요");
                window.close();
            }
           </script>
		</div>
    </td>
  </tr>
</table>
</DIV>

</form>
</body>
</html>

