<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%
 /**
  * @Class Name : EgovMenuManage.jsp
  * @Description : 메뉴관리 조회 화면
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
<title>메뉴관리리스트</title>

<script type="text/javascript" src="/portal/open_content/system/js/prototype.js"></script>
<script type="text/javascript" src="/portal/open_content/system/js/protoload.js"></script>
<script type="text/javascript" src="/portal/open_content/system/js/jslb_ajax.js"></script>

<script language="javascript1.2">
<!--
function test()
{
	$('main').startWaiting('bigBlackWaiting');
}

function setFixMenuCategory()
{
	var url = "/admin/main/setFixMenuCategory.do";
	var param = '&siteId='+$F("siteId");
	//$('waitingArea').startWaiting('bigBlackWaiting');
	sendRequest(callbackSetFixMenuCategory, param, 'POST', url, true, true);
}

//종합정보
function callbackSetFixMenuCategory(oj)
{
	try 
	{	
		var jsonData = oj.responseText;
		var j = eval('(' + jsonData + ')');		

		if( parseInt(j.resultCode) == 1 )
		{
			alert("성공적으로 적용되었습니다.");
		}
		else
		{	
			alert(j.resultMsg);
		}

		//$('waitingArea').stopWaiting();
	}	
	catch (err) 
	{
		alert("서버와 통신에 실패하였습니다.");
		//$('waitingArea').stopWaiting();
	}
}


/* ********************************************************
 * 모두선택 처리 함수
 ******************************************************** */
function fCheckAll() {
    var checkField = document.menuManageForm.checkField;
    if(document.menuManageForm.checkAll.checked) {
        if(checkField) {
            if(checkField.length > 1) {
                for(var i=0; i < checkField.length; i++) {
                    checkField[i].checked = true;
                }
            } else {
                checkField.checked = true;
            }
        }
    } else {
        if(checkField) {
            if(checkField.length > 1) {
                for(var j=0; j < checkField.length; j++) {
                    checkField[j].checked = false;
                }
            } else {
                checkField.checked = false;
            }
        }
    }
}
/* ********************************************************
 * 멀티삭제 처리 함수
 ******************************************************** */
function fDeleteMenuList() {
    var checkField = document.menuManageForm.checkField;
    var menuNo = document.menuManageForm.checkMenuNo;
    var checkMenuNos = "";
    var checkedCount = 0;
    if(checkField) {

    	if(checkField.length > 1) {
            for(var i=0; i < checkField.length; i++) {
                if(checkField[i].checked) {
                    checkMenuNos += ((checkedCount==0? "" : ",") + menuNo[i].value);
                    checkedCount++;
                }
            }
        } else {
            if(checkField.checked) {
                checkMenuNos = menuNo.value;
            }
        }
    }   

    document.menuManageForm.checkedMenuNoForDel.value=checkMenuNos;
    document.menuManageForm.action = "<c:url value='/sym/mpm/EgovMenuManageListDelete.do'/>";
    document.menuManageForm.submit(); 
}

/* ********************************************************
 * 페이징 처리 함수
 ******************************************************** */
function linkPage(pageNo){
//	document.menuManageForm.searchKeyword.value = 
	document.menuManageForm.pageIndex.value = pageNo;
	document.menuManageForm.action = "<c:url value='/sym/mpm/EgovMenuManageSelect.do'/>";
   	document.menuManageForm.submit();
}

/* ********************************************************
 * 조회 처리 함수
 ******************************************************** */
function selectMenuManageList() { 
	document.menuManageForm.pageIndex.value = 1;
	document.menuManageForm.action = "<c:url value='/sym/mpm/EgovMenuManageSelect.do'/>";
	document.menuManageForm.submit();
}

/* ********************************************************
 * 입력 화면 호출 함수
 ******************************************************** */
function insertMenuManage() {
   	document.menuManageForm.action = "<c:url value='/sym/mpm/EgovMenuRegistInsert.do'/>";
   	document.menuManageForm.submit();	
}

/* ********************************************************
 * 일괄처리 화면호출 함수
 ******************************************************** */
 function bndeInsertMenuManage() {
	   	document.menuManageForm.action = "<c:url value='/sym/mpm/EgovMenuRegistInsert.do'/>";
	   	document.menuManageForm.submit();	
	}
 
function bndeInsertMenuManage() {
   	document.menuManageForm.action = "<c:url value='/sym/mpm/EgovMenuBndeRegist.do'/>";
   	document.menuManageForm.submit();
} 
/* ********************************************************
 * 상세조회처리 함수
 ******************************************************** */
function selectUpdtMenuManageDetail(menuNo) {
	document.menuManageForm.req_menuNo.value = menuNo;
   	document.menuManageForm.action = "<c:url value='/sym/mpm/EgovMenuManageListDetailSelect.do'/>";
   	document.menuManageForm.submit();	
}
/* ********************************************************
 * 최초조회 함수
 ******************************************************** */
function fMenuManageSelect(){ 
    document.menuManageForm.action = "<c:url value='/sym/mpm/EgovMenuManageSelect.do'/>";
    document.menuManageForm.submit();
}
<c:if test="${!empty resultMsg}">alert("${resultMsg}");</c:if>
-->
</script>

</head>
<body> 
<form name="menuManageForm" action ="javascript:fMenuManageSelect();" method="post">
	<input id="siteId" name="siteId" type="hidden" value="${param.siteId}" />
<input name="pageIndex" type="hidden" value="<c:out value='${searchVO.pageIndex}'/>"/>
<input name="checkedMenuNoForDel" type="hidden" />
<DIV id="main" style="display:"> 

<table width="717" cellpadding="8" class="table-search" border="0">
 <tr>
  <td width="40%"class="title_left">
   <img src="<%=imagePath_icon %>tit_icon.gif" width="16" height="16" hspace="3" align="absmiddle">&nbsp;메뉴관리리스트</td>
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
<table width="717" border="0" cellpadding="0" cellspacing="1">
 <tr>
  <td width="100%"> 
    <table width="100%" border="0" cellpadding="0" cellspacing="1" class="table-register">
      <tr> 
        <th width="20%" height="40" class="" >메뉴명<img src="<%=imagePath_icon %>required.gif" width="15" height="15"></th>
        <td width="80%">
          <table border="0" cellspacing="0" cellpadding="0" align="left">
            <tr> 
              <td >&nbsp;<input name="searchKeyword" type="text" size="80" value="${param.searchKeyword}"  maxlength="60" ></td>
              <td width="5%"></td>
              <td><img src="<%=imagePath_button %>bu2_left.gif" width="8" height="20"></td>
              <td background="<%=imagePath_button %>bu2_bg.gif" nowrap><a href="javascript:selectMenuManageList()">조회</a></td>
              <td><img src="<%=imagePath_button %>bu2_right.gif" width="8" height="20"></td>      
            </tr>
          </table> 
        </td>
      </tr> 
    </table>
   </td>
 </tr>    
</table>
<table width="717" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td width="75%">&nbsp;</td> 
    <td width="25%" height="10">&nbsp;
       <table border="0" cellspacing="0" cellpadding="0" align="left">
         <tr>  
         <c:if test="${param.siteId != 1}">
           <td width="10"></td>
           <td><img src="<%=imagePath_button %>bu2_left.gif" width="8" height="20"></td>
           <td background="<%=imagePath_button %>bu2_bg.gif" nowrap><a href="javascript:setFixMenuCategory()">메뉴적용</a></td>
           <td><img src="<%=imagePath_button %>bu2_right.gif" width="8" height="20"></td> 
         </c:if>
           <td width="10"></td>
           <td><img src="<%=imagePath_button %>bu2_left.gif" width="8" height="20"></td>
           <td background="<%=imagePath_button %>bu2_bg.gif" nowrap><a href="javascript:bndeInsertMenuManage()">일괄등록</a></td>
           <td><img src="<%=imagePath_button %>bu2_right.gif" width="8" height="20"></td> 
           <td width="10"></td> 
           <td><img src="<%=imagePath_button %>bu2_left.gif" width="8" height="20"></td>
           <td background="<%=imagePath_button %>bu2_bg.gif" nowrap><a href="javascript:insertMenuManage()">등록</a></td>
           <td><img src="<%=imagePath_button %>bu2_right.gif" width="8" height="20"></td> 
           <td width="10"></td>     
           <td><img src="<%=imagePath_button %>bu2_left.gif" width="8" height="20"></td>
           <td background="<%=imagePath_button %>bu2_bg.gif" nowrap><a href="javascript:fDeleteMenuList()">삭제</a></td>
           <td><img src="<%=imagePath_button %>bu2_right.gif" width="8" height="20"></td>
         </tr>
       </table>  
    </td>
  </tr>
</table>
<table width="717" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td height="10">&nbsp; </td>
  </tr>
</table>
<table width="717" cellpadding="8" class="table-line" style="table-layout:fixed">
 <thead>
  <tr>
    <th class="title" width="30" nowrap>
       <input type="checkbox" name="checkAll" class="check2" onclick="javascript:fCheckAll();">
    </th>  
    <th class="title" width="40" nowrap>메뉴ID</th>
    <th class="title" width="150" nowrap>메뉴한글명</th>
    <th class="title" width="80" nowrap>상위메뉴ID</th> 
    <th class="title" width="60" nowrap>사용유무</th> 
    <th class="title" width="80" nowrap>담당자명</th> 
  </tr>
 </thead>    
 <tbody>
 
 <c:forEach var="result" items="${list_menumanage}" varStatus="status">
  <tr>
    <td class="lt_text" nowrap>
       <input type="checkbox" name="checkField" class="check2">
       <input name="checkMenuNo" type="hidden" value="<c:out value='${result.menuNo}'/>"/>
    </td>
    <td class="lt_text" nowrap><c:out value="${result.menuNo}"/></td>
    <td class="lt_text" style="cursor:hand;" nowrap><a href="javascript:selectUpdtMenuManageDetail('<c:out value="${result.menuNo}"/>')"><c:out value="${result.menuNm}"/></a></td>
    <td class="lt_text" nowrap><c:out value="${result.upperMenuId}"/></td> 
    <td class="lt_text" nowrap><c:out value="${result.useYn}"/></td>  
    <td class="lt_text" nowrap><c:out value="${result.userName}"/></td>   
  </tr>
 </c:forEach>
 </tbody>  
 <!--tfoot>
  <tr class="">
   <td colspan=6 align="center"></td>
  </tr>
 </tfoot -->
</table>
<table width="717" border="0" cellspacing="0" cellpadding="0">
  <tr> 
    <td height="10"></td>
  </tr>
  <tr> 
    <td>
<!-- 페이징 시작 -->
<div align="center">
  <div>
	<ui:pagination paginationInfo = "${paginationInfo}"	type="image" jsFunction="linkPage"/>
  </div>
</div>
<!-- 페이징 끝 -->
    </td>
  </tr>
</table>

</DIV>  
<input type="hidden" name="req_menuNo">
</form>
</body>
</html>

