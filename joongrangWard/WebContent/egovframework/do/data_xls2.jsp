<%@ page session="true"  contentType="text/html; charset=euc-kr" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
    <table border=1> <!-- border=1�� �ʼ� excel ���� �׵θ��� ������� --> 
        <tr bgcolor=#CACACA> <!-- bgcolor=#CACACA excel ���� �������� ȸ������ --> 
            <td colspan="8">
            <H3>${onlineZvl.TITLE[0]} ��û��</H3></td> 
        </tr> 
        <tr bgcolor=yellow> 
            <td>��ȣ</td>
            <td>���̵�</td>
            <td>�ۼ���</td>
            <td>�ּ�</td>
            <td>��ȭ��ȣ</td>
            <td>�̸���</td>
            <td>��û��</td> 
            <td>����</td>
        </tr>
        
	<c:if test="${zvl.rows[0] > 0}">
     	<c:forEach var="x" begin="0" end="${zvl.rows[0]-1}">
        <tr> 
            <td>${zvl.rows[0]-x}</td>
            <td>${zvl.WEB_MEM_ID[x]}</td>
            <td>${zvl.MEM_NM[x]}</td>
            <td>${zvl.ZIPCODE[x]} ${zvl.ADDRESS1[x]}</td> 
     		 <td>${zvl.PHONE[x]}</td> 
     		 <td>${zvl.EMAIL[x]}</td> 
     		 <td>${zvl.REG_DATE[x]}</td> 
            <td>
				<c:choose>
					<c:when test="${onlineZvl.APP_INWON[0] >= (zvl.rows[0]-x)}">��û</c:when>
					<c:when test="${onlineZvl.APP_INWON[0] < (zvl.rows[0]-x)}">���</c:when>
				</c:choose>
			</td> 
        </tr>   
		</c:forEach>
	</c:if>
    </table> 

</body> 
</html> 