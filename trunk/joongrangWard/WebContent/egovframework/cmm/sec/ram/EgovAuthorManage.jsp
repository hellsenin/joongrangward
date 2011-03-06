<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%
 /** 
  * @Class Name : EgovAuthorManage.java
  * @Description : EgovAuthorManage List 화면
  * @Modification Information
  * @
  * @  수정일                     수정자                    수정내용
  * @ -------       --------    ---------------------------
  * @ 2009.03.01    Lee.m.j       최초 생성
  *
  *  @author 실행환경 개발팀 홍길동
  *  @since 2009.02.01
  *  @version 1.0
  *  @see
  *  
  *  Copyright (C) 2009 by MOPAS  All right reserved.
  */
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<link href="<c:url value='/css/egovframework/cmm/sec/ram/com.css' />" rel="stylesheet" type="text/css">
<link rel="stylesheet" type="text/css" href="/admin/common/css/common_style.css">
<link rel="stylesheet" type="text/css" href="/admin/common/css/board.css">
<title>SYSTEM HISTORY</title>

<script type="text/javaScript" language="javascript" defer="defer">
<!--

function fncCheckAll() {
    var checkField = document.listForm.delYn;
    if(document.listForm.checkAll.checked) {
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

function fncManageChecked() {

    var checkField = document.listForm.delYn;
    var checkId = document.listForm.checkId;
    var returnValue = "";

    var returnBoolean = false;
    var checkCount = 0;

    if(checkField) {
        if(checkField.length > 1) {
            for(var i=0; i<checkField.length; i++) {
                if(checkField[i].checked) {
                    checkField[i].value = checkId[i].value;
                    if(returnValue == "")
                        returnValue = checkField[i].value;
                    else 
                	    returnValue = returnValue + ";" + checkField[i].value;
                    checkCount++;
                }
            }
            if(checkCount > 0) 
                returnBoolean = true;
            else {
                alert("선택된 권한이 없습니다.");
                returnBoolean = false;
            }
        } else {
            if(document.listForm.delYn.checked == false) {
                alert("선택된 권한이 없습니다.");
                returnBoolean = false;
            }
            else {
                returnValue = checkId.value;
                returnBoolean = true;
            }
        }
    } else {
        alert("조회된 결과가 없습니다.");
    }

    document.listForm.authorCodes.value = returnValue;

    return returnBoolean;
}

function fncSelectAuthorList(pageNo){
    document.listForm.searchCondition.value = "1";
    document.listForm.pageIndex.value = pageNo;
    document.listForm.action = "<c:url value='/cmm/sec/ram/EgovAuthorList.do'/>";
    document.listForm.submit();
}

function fncSelectAuthor(author) {
    document.listForm.authorCode.value = author;
    document.listForm.action = "<c:url value='/cmm/sec/ram/EgovAuthor.do'/>";
    document.listForm.submit();     
}

function fncAddAuthorInsert() {
    location.replace("<c:url value='/cmm/sec/ram/EgovAuthorInsertView.do'/>"); 
}

function fncAuthorDeleteList() {

    if(fncManageChecked()) {	
        if(confirm("삭제하시겠습니까?")) {
            document.listForm.action = "<c:url value='/cmm/sec/ram/EgovAuthorListDelete.do'/>";
            document.listForm.submit();
        } 
    }
}

function fncAddAuthorView() {
    document.listForm.action = "<c:url value='/cmm/sec/ram/EgovAuthorUpdate.do'/>";
    document.listForm.submit();     
}

function fncSelectAuthorRole(author) {
    document.listForm.searchKeyword.value = author;
    document.listForm.action = "<c:url value='/cmm/sec/ram/EgovAuthorRoleList.do'/>";
    document.listForm.submit();     
}

function linkPage(pageNo){
    document.listForm.searchCondition.value = "1";
    document.listForm.pageIndex.value = pageNo;
    document.listForm.action = "<c:url value='/cmm/sec/ram/EgovAuthorList.do'/>";
    document.listForm.submit();
}


function press() {

    if (event.keyCode==13) {
    	fncSelectAuthorList('1');
    }
}


-->
</script>

</head>

<body>
   
<DIV id="main" style="display:">

   <h3 class="tit_03">권한 관리</h3>
   
<table border="0">
  <tr>
    <td width="700">

<form name="listForm" action="<c:url value='/cmm/sec/ram/EgovAuthorList.do'/>" method="post">
<table width="100%" cellpadding="8" class="table-search" border="0">
 <tr>
  <td width="60%">권한 명 : <input name="searchKeyword" type="text" value="<c:out value="${authorManageVO.searchKeyword}"/>" size="25" title="검색" onkeypress="press();" /></td> 
 </tr>
</table>
<table width="100%" cellpadding="8" class="list_type01">
 <thead>
  <tr>
    <th class="title" width="3%" nowrap><input type="checkbox" name="checkAll" class="check2" onclick="javascript:fncCheckAll()"></th>  
    <th class="title" width="15%" nowrap>권한 ID</th>
    <th class="title" width="25%" nowrap>권한 명</th>
    <th class="title" width="40%" nowrap>설명</th>
    <th class="title" width="15%" nowrap>등록일자</th>
    <th class="title" width="5%" nowrap>롤 정보</th>
  </tr>
 </thead>
 <tbody>
 <c:forEach var="author" items="${authorList}" varStatus="status">
  <tr>
    <td class="lt_text3" nowrap>
    	<c:if test="${author.authorCode != 'ROLE_ANONYMOUS' && author.authorCode != 'ROLE_ALL'}">
    	<input type="checkbox" name="delYn" class="check2"><input type="hidden" name="checkId" value="<c:out value="${author.authorCode}"/>" />
    	</c:if>
    </td>
    <td class="lt_text" nowrap><a href="javascript:fncSelectAuthor('<c:out value="${author.authorCode}"/>')"><c:out value="${author.authorCode}"/></a></td>
    <td class="lt_text" nowrap><c:out value="${author.authorNm}"/></td>
    <td class="lt_text3" nowrap><c:out value="${author.authorDc}"/></td>
    <td class="lt_text3" nowrap><c:out value="${author.authorCreatDe}"/></td>
    <td class="lt_text3" nowrap><a href="javascript:fncSelectAuthorRole('<c:out value="${author.authorCode}"/>')"><img src="<c:url value='/images/egovframework/cmm/sec/ram/icon/search.gif'/>" width="15" height="15" align="absmiddle"  alt="롤 정보"></a></td>
    
  </tr>
 </c:forEach>
 </tbody> 

 <!--tfoot>
  <tr class="">
   <td colspan=6 align="center"></td>
  </tr>
 </tfoot -->
</table>
<table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr> 
    <td height="10"></td>
  </tr>
</table>

<c:if test="${!empty authorManageVO.pageIndex }">
				<div id="paging">
					<div class="paging_con">
        <ui:pagination paginationInfo = "${paginationInfo}"
            type="default"
            jsFunction="linkPage"
            />
    				</div>
    			</div>

</c:if>
				<div id="btn_area">
					<div class="btn_right_fl">
						<a href="javascript:fncAddAuthorInsert()"><img src="/admin/images/common/btn/btn_regist.gif" alt="등록" /></a>
						<a href="javascript:fncAuthorDeleteList()"><img src="/admin/images/common/btn/btn_delete.gif" alt="삭제" /></a>
					</div>
					<div class="btn_right_fr">
						<a href="javascript:fncSelectAuthorList('1')"><img src="/admin/images/common/btn/btn_list.gif" alt="목록" /></a>	
					</div>
					
				</div><!-- btn end -->
				
<input type="hidden" name="authorCode"/>
<input type="hidden" name="authorCodes"/>
<input type="hidden" name="pageIndex" value="<c:out value='${authorManageVO.pageIndex}'/>"/>
<input type="hidden" name="searchCondition"/>
</form>
</td>
</tr>
</table>
</DIV>
</body>
</html>
