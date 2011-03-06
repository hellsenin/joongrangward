<%@ page session="true"  contentType="text/html; charset=euc-kr" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/xml"  prefix="x" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %> 

<c:set var="onlineZvl" value="${requestScope['onlineZvl']}"   scope="page" />
<c:set var="zvl" value="${requestScope['zvl']}"   scope="page" />

<%
	response.setHeader("Content-Type", "application/vnd.ms-excel");
	response.setHeader("Content-Disposition", "attachment; filename=member.xls"); 
	response.setHeader("Content-Description", "JSP Generated Data"); 
%>
<html> 
<head> 
<title></title> 
</head> 
<body> 
    <table border=1> <!-- border=1은 필수 excel 셀의 테두리가 생기게함 --> 
        <tr bgcolor=#CACACA> <!-- bgcolor=#CACACA excel 셀의 바탕색을 회색으로 --> 
            <td colspan="6">
            <H3>${onlineZvl.TITLE[0]} 신청인</H3></td> 
        </tr> 
        <tr bgcolor=yellow> 
            <td>번호</td>
            <td>작성자</td>
            <td>신청일</td> 
            <td>상태</td>
            <td>추가입력항목</td>
            <td>내용</td>
        </tr>
        
	<c:if test="${zvl.rows[0] > 0}">
     	<c:forEach var="x" begin="0" end="${zvl.rows[0]-1}">
        <tr> 
            <td>${zvl.rows[0]-x}</td>
            <td>${zvl.MEM_NM[x]}</td>
            <td>${zvl.REG_DATE[x]}</td> 
            <td>
				<c:choose>
					<c:when test="${not empty onlineZvl.APP_INWON[0]}">
						<c:if test="${onlineZvl.APP_INWON[0] >= (zvl.rows[0]-x)}">신청</c:if>
						<c:if test="${onlineZvl.APP_INWON[0] < (zvl.rows[0]-x)}">대기</c:if>
					</c:when>
					<c:otherwise>신청</c:otherwise>
				</c:choose>
			</td> 
			<td>
     		 <x:parse var='document' xml='${zvl.DYNAMIC_DATA[x]}'/>  
     		 <x:forEach select='$document//field'>  
     		 	<x:out select='name'/> : <x:out select='value'/> <br/>
     		 </x:forEach>		
     		</td>
     		 <td>${zvl.CONTENTS[x]}</td> 
        </tr>   
		</c:forEach>
	</c:if>
    </table> 

</body> 
</html> 