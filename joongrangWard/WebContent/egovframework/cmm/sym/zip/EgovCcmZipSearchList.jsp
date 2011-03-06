<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<head>
<title>우편번호 찾기</title>
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<link type="text/css" rel="stylesheet" href="/portal/open_content/system/css/popup.css" />
<base target="_self">
<script type="text/javaScript">
/* ********************************************************
 * 결과 우편번호,주소 반환 
 ******************************************************** */
function fn_egov_return_Zip(zip,addr){
	var retVal   = new Object();
	var sZip     = zip;
	var vZip     = zip.substring(0,3)+"-"+zip.substring(3,6);
	var sAddr    = addr.replace("/^\s+|\s+$/g","");
	retVal.sZip  = sZip;
	retVal.vZip  = vZip;
	retVal.sAddr = sAddr;
	window.returnValue = retVal;
	window.close();
}	

function checkForm(form)
{
	if(!form.searchKeyword.value)
	{
		alert("동명을 입력하세요.");
		form.searchKeyword.focus();
		return false;
	}
	return true;
}
</script>
</head>
<body style="width:520px; height:600px;">
<form name="listForm" action="<c:url value='/sym/cmm/EgovCcmZipSearchList.do'/>" method="post" onsubmit="return checkForm(this)">
	<input name="searchCondition" type="hidden" size="35" value="4"> 
	<div id="popupwrap">
		<div class="popbg">
		<h1>우편번호 찾기</h1>
		</div>
		<div class="zipcode_search">
			<p><label for="search">동명을 입력하시오.</label>
				<input type="text" id="search" name="searchKeyword" value="${searchVO.searchKeyword}"  maxlength="20" class="intext vam"/>
				<input type="image" class="vam" src="/portal/open_content/images/common/btn/pop_btn_search.gif" class="주소검색" />
			</p>
			
		</div>
			
		<table width="100%" summary="우편번호 검색" class="list_type01">
			<caption>우편번호 검색</caption>
			<thead>
				<tr>  
					<th class="fir" scope="col">우편번호</th>
					<th scope="col">주소</th>
				</tr>
			</thead>
			<tbody>
			<c:forEach items="${resultList}" var="resultInfo" varStatus="status">
			<tr style="cursor:pointer;cursor:hand;" onclick="javascript:fn_egov_return_Zip( '${resultInfo.zip}', '${resultInfo.ctprvnNm} ${resultInfo.signguNm} ${resultInfo.emdNm} ${resultInfo.liBuldNm}');">
				<td><c:out value='${fn:substring(resultInfo.zip, 0,3)}'/>-<c:out value='${fn:substring(resultInfo.zip, 3,6)}'/></td>
				<td>${resultInfo.ctprvnNm} ${resultInfo.signguNm} ${resultInfo.emdNm} ${resultInfo.liBuldNm} ${resultInfo.lnbrDongHo}</td>
			</tr>   
			</c:forEach>
			</tbody>  
		</table>


		<div class="paging mgb20">
			<div class="paging_con">${pageNav}</div>
		</div>
		

		<div id="btn_area">
			<div class="btn_center">
				<a href="#btn_area" onclick="window.close();event.returnValue = false;">
					<img alt="닫기" src="/portal/open_content/images/common/btn/btn_pop_confirm.gif"/>
				</a>
			</div>
		</div>	

	</div>
</form>
</body>
