<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ page import="egovframework.com.sym.mpm.web.EgovMenuManageController"  %>
<%@ page import="egovframework.com.sym.mpm.service.MenuManageVO"  %>
<%@ page import="egovframework.com.sym.mpm.service.MenuManageVO"  %>
<%@ page import="egovframework.com.cmm.service.Globals"  %>
<%
 /**
  * @Class Name : EgovMenuCreatSiteMap.jsp
  * @Description : 메뉴사이트맵 생성 화면
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
<title>메뉴사이트맵생성</title>
<script language="javascript1.2" src="/js/egovframework/sym/mpm/EgovMenuCreatSiteMap.js"/></script>
<script language="javascript1.2">
<!--
/*절대 path 사이트맵이 저장될 장소의  절대 패스*/
var vRootPath    = "D:/egovframework/workspace/egovcmm/src/main/webapp";   // Window webapp 위치
//var vRootPath    = "/product/jeus/webhome/was_com/egovframework-com-1_0/egovframework-com-1_0_war___"; // Unix webapp 위치
/* 절대 path내  사이트맵 jsp를 저장할 장소 지정 */
var vSiteMapPath = "/html/egovframework/uss/umt/";


/* ********************************************************
 * 조회 함수
 ******************************************************** */
function selectMenuCreatSiteMap() {
	document.menuCreatManageSiteMapForm.scrtyEstbstrgetId.value = opener.document.menuCreatManageForm.scrtyEstbstrgetId.value;
	document.menuCreatManageSiteMapForm.action = "<c:url value='/sym/mpm/EgovMenuCreatSiteMapSelect.do'/>";
    document.menuCreatManageSiteMapForm.submit();
}

/* ********************************************************
 * Html 생성 함수
 ******************************************************** */
function CreatSiteMap() {
	fHtmlCreat_Head();
	usrID = document.menuCreatManageSiteMapForm.creatPersonId.value;
	authorCode = document.menuCreatManageSiteMapForm.authorCode.value;
	document.menuCreatManageSiteMapForm.valueHtml.value    = vHtmlCode;
	document.menuCreatManageSiteMapForm.bndeFileNm.value   = authorCode+"_SiteMap.jsp";
	document.menuCreatManageSiteMapForm.tmp_rootPath.value = vRootPath;
	document.menuCreatManageSiteMapForm.bndeFilePath.value = vSiteMapPath;
	document.menuCreatManageSiteMapForm.mapCreatId.value   = authorCode;
	document.menuCreatManageSiteMapForm.action = "<c:url value='/sym/mpm/EgovMenuCreatSiteMapInsert.action'/>";
    document.menuCreatManageSiteMapForm.submit();
}
<c:if test="${!empty resultMsg}">alert("${resultMsg}");</c:if>
-->
</script>

</head>
<body> 
<form name="menuCreatManageSiteMapForm" action ="/sym/mpm/EgovMenuCreatSiteMapSelect.do" method="post">
<input name="valueHtml"      type="hidden" />
<input name="creatPersonId"  type="hidden" value ="${resultVO.creatPersonId}" />
<input name="bndeFileNm"     type="hidden" />
<input name="bndeFilePath"   type="hidden" />
<input name="mapCreatId"     type="hidden" />
<input name="tmp_rootPath"   type="hidden" />
<DIV id="main" style="display:"> 

<table width="490" cellpadding="8" class="table-search" border="0" align="center">
 <tr>
  <td width="40%"class="title_left">
  <img src="<%=imagePath_icon %>tit_icon.gif" width="16" height="16" hspace="3" align="absmiddle">&nbsp;메뉴사이트맵생성</td>
  <td width="10%"></td>
  <td widht="25%"></td>
  <th width="25%">
     <table border="0" cellspacing="0" cellpadding="0" align="rigth">
       <tr>
         <td width="10"></td>
         <td><img src="<%=imagePath_button %>bu2_left.gif" width="8" height="20"></td>
         <td background="<%=imagePath_button %>bu2_bg.gif" nowrap><a href="javascript:CreatSiteMap()">사이트맵생성</a></td>
         <td><img src="<%=imagePath_button %>bu2_right.gif" width="8" height="20"></td>
         <td width="10"></td>
       </tr>
     </table>
  </th>
 </tr>
</table>

<table width="490" border="0" cellpadding="0" cellspacing="1" align="center">
 <tr>
  <td width="480">
    <table width="480" border="0" cellpadding="0" cellspacing="1" class="table-register">
      <tr>
        <th width="150" height="40" class="" >권한코드&nbsp;</th>
        <td width="330"><input name="authorCode" type="text" size="20" value="${resultVO.authorCode}"  maxlength="30" readOnly>
        <input name="chkCreat" type="text" size="10" value="${resultBoolean.chkCreat}"  maxlength="10" readOnly>
        </td>
        
      </tr>
    </table>
   </td>
 </tr>
</table>

<table width="490" border="0" cellspacing="0" cellpadding="0" align="center">
  <tr>
    <td height="10">
		<c:forEach var="result1" items="${list_menulist}" varStatus="status" > 
		<input type="hidden" name="tmp_menuNmVal" value="${result1.menuNo}|${result1.upperMenuId}|${result1.menuNm}|${result1.menuOrdr}|${result1.chkURL}|">
		</c:forEach>
    </td>
  </tr>
</table>
<table width="490" cellpadding="8"  align="center">
  <tr>
    <td>
    
    <div class="tree" style="width:480px; height:25px;">
		<script language="javascript">
		    var chk_Object = true;
		    var chk_browse = "";
			if (eval(document.menuCreatManageSiteMapForm.authorCode)=="[object]") chk_browse = "IE";
			if (eval(document.menuCreatManageSiteMapForm.authorCode)=="[object NodeList]") chk_browse = "Fox";
			if (eval(document.menuCreatManageSiteMapForm.authorCode)=="[object Collection]") chk_browse = "safai";

			var Tree = new Array;
			if(chk_browse=="IE"&&eval(document.menuCreatManageSiteMapForm.tmp_menuNmVal)!="[object]"){
			   alert("메뉴 목록 데이타가 존재하지 않습니다.");
			   chk_Object = false;
			}
			if(chk_browse=="Fox"&&eval(document.menuCreatManageSiteMapForm.tmp_menuNmVal)!="[object NodeList]"){
			   alert("메뉴 목록 데이타가 존재하지 않습니다.");
			   chk_Object = false;
			}
			if(chk_browse=="safai"&&eval(document.menuCreatManageSiteMapForm.tmp_menuNmVal)!="[object Collection]"){
				   alert("메뉴 목록 데이타가 존재하지 않습니다.");
				   chk_Object = false;
			}
			if( chk_Object ){
				for (var j = 0; j < document.menuCreatManageSiteMapForm.tmp_menuNmVal.length; j++) {
					Tree[j] = document.menuCreatManageSiteMapForm.tmp_menuNmVal[j].value;
			    }
			    createTree(Tree);
            }else{
                alert("사이트맵 생성 데이타가 존재하지 않습니다. \n 메뉴를 생성하신 후 작업하세요.");
                window.close();
            }
		</script>
	</div>
    
    </td> 
    <td>
	
    </td> 
  </tr>
</table>

</DIV>  
</form>
</body>
</html>

