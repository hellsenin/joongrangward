<%@ page contentType="text/html; charset=utf-8"%>
<%@ page import="egovframework.com.uat.uia.service.SessionVO" %>
<%@ page import="javax.servlet.http.HttpSession" %>
<%
SessionVO sessionVO = new SessionVO();
sessionVO.setSUserId("jang830");
sessionVO.setSUserNm("장동한");
sessionVO.setUniqId("USRCNFRM_00000000002");

sessionVO.setSEmail("jdh830@nate.com");
sessionVO.setSUserSe("G");

session.setAttribute("sessionVO", sessionVO);

%>
<html>
<head> 
<title>EGOV FRAMEWORK CSS TEST</title>
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<style>
/* Black 텍스트 Hyperlink Style */
A:link { font-size:9pt; font-family:돋움;color:#000000; text-decoration:none; }
A:visited { font-size:9pt; font-family:돋움;color:#000000; text-decoration:none; }
A:active { font-size:9pt; font-family:돋움;color:red; text-decoration:none; }
A:hover { font-size:9pt; font-family:돋움;color:red;text-decoration:none;}

	/* 등록 테이블 */
.table-register{BORDER-TOP: #D2D4D1 1px solid;BORDER-bottom: #D2D4D1 1px solid;BORDER-left: #D2D4D1 1px solid;BORDER-right: #D2D4D1 1px solid; border-collapse: collapse;}
.table-register th{ padding-left:2;padding-right:5;background-color: #E4EAF8; Text-align: right ;}
.table-register td{ padding-left:2;padding-right:5;background-color: #F7F7F7;}
  
td {font-family: "돋움"; font-size: 9pt; height:20px; font-weight:normal;}
th {font-family: "돋움"; font-size: 9pt; color:#000000; font-weight:normal;}

body {font-family: "돋움"; font-size: 9pt; color:#000000; font-weight:normal;}

.tdG  {font-family: "돋움"; font-size: 9pt; color:red; height:20px; font-weight:bold ;}
</style>
</head> 

<body leftmargin="1px" rightmargin="2px" marginwidth="0px" topmargin="0px" marginheight="0px" >
<table width="100%" height="100%" border="0">
<tr> 
	<td align="center"  valign="center">
Session Information<BR>
<%=sessionVO.getSUserId() %><br>
<%=sessionVO.getSUserNm() %><br>
<%=sessionVO.getSEmail() %><br>
<%=sessionVO.getSUserSe() %><br>
<%=sessionVO.getUniqId() %><br>		
	<table width="100%" border="0" cellpadding="0" cellspacing="1" class="table-register">
	<tr> 
		<td align="center" class="tdG" nowrap><a href="/uss/olp/qtm/EgovQustnrTmplatManageList.do" target="content">설문템플릿관리</a></td>
	</tr>
	<tr> 
		<td align="center" class="tdG" nowrap><a href="/uss/olp/qmc/EgovQustnrManageList.do" target="content">설문지정보관리</a></td>
	</tr>
	<tr> 
		<td align="center" class="tdG" nowrap><a href="/uss/olp/qqm/EgovQustnrQestnManageList.do" target="content">설문문항관리</a></td>
	</tr>
	<tr> 
		<td align="center" class="tdG" nowrap><a href="/uss/olp/qim/EgovQustnrItemManageList.do" target="content">설문항목관리</a></td>
	</tr>
	<tr> 
		<td align="center" class="tdG" nowrap><a href="/uss/olp/qri/EgovQustnrRespondInfoList.do" target="content">설문조사(응답결과)관리</a></td>
	</tr>
	<tr> 
		<td align="center" class="tdG" nowrap><a href="/uss/olp/qnn/EgovQustnrRespondInfoManageList.do" target="content">설문조사관리</a></td>
	</tr>
	<tr> 
		<td align="center" class="tdG" nowrap><a href="/uss/olp/qrm/EgovQustnrRespondManageList.do" target="content">설문응답자정보관리</a></td>
	</tr>
	<tr> 
		<td align="center" class="tdG" nowrap><a href="/uss/olp/mgt/EgovMeetingManageList.do" target="content">회의정보관리</a></td>
	</tr>
	<tr> 
		<td align="center" class="tdG" nowrap><a href="/uss/ion/ecc/EgovEventCmpgnList.do" target="content">이벤트관리</a></td>
	</tr>
	<tr> 
		<td align="center" class="tdG" nowrap><a href="/uss/ion/ecc/EgovTnextrlHrInfoList.do" target="content">외부인사정보관리</a></td>
	</tr>
	<tr> 
		<td align="center" class="tdG" nowrap><a href="/EgovPageLink.do?link=cmm/utl/testlist" target="content"><font color="blue">요소기술</font></a></td>
	</tr> 
	
	<tr> 
		<td align="center" class="tdG" nowrap><a href="/cop/smt/sdm/EgovDeptSchdulManageList.do" target="content">부서일정관리</a></td>
	</tr>
	<tr> 
		<td align="center" class="tdG" nowrap><a href="/cop/smt/sim/EgovIndvdlSchdulManageList.do" target="content">일정관리</a></td>
	</tr>
	<tr> 
		<td align="center" class="tdG" nowrap><a href="/cop/smt/asm/EgovAllSchdulManageList.do" target="content">전체일정</a></td>
	</tr>
	<tr> 
		<td align="center" class="tdG" nowrap><a href="/cop/smt/dsm/EgovDiaryManageList.do" target="content">일지관리</a></td>
	</tr>
	<tr>
	<td></td>
	</tr>
	
  <tr>
    <td align="center" nowrap><a href="/uss/olh/wor/WordDicaryListInqire.do" target="content">용어사전 목록조회</a></td>
  </tr>

  <tr>
    <td align="center" nowrap><a href="/uss/ion/sit/SiteListInqire.do" target="content">사이트 목록조회</a></td>
  </tr>

  <tr>
    <td align="center" nowrap><a href="/uss/ion/rec/RecomendSiteListInqire.do" target="content">추천사이트 목록조회</a></td>
  </tr>

  <tr>
    <td align="center" nowrap><a href="/uss/olh/hpc/HpcmListInqire.do" target="content">도움말 목록조회</a></td>
  </tr>

  <tr>
    <td align="center" nowrap><a href="/uss/ion/nws/NewsInfoListInqire.do" target="content">뉴스정보목록조회</a></td>
  </tr>
  
  <tr>
    <td align="center" nowrap><a href="/uss/olh/faq/FaqListInqire.do" target="content">FAQ 목록조회</a></td>
  </tr>

  <tr>
    <td align="center" nowrap><a href="/uss/sam/stp/StplatListInqire.do" target="content">약관 목록조회</a></td>
  </tr>

  <tr>
    <td align="center" nowrap><a href="/uss/sam/cpy/CpyrhtPrtcPolicyListInqire.do" target="content">저작권보호정책 목록조회</a></td>
  </tr>

  <tr>
    <td align="center" nowrap><a href="/uss/olh/qna/QnaListInqire.do" target="content">Q&A 목록조회</a></td>
  </tr>

  <tr>
    <td align="center" nowrap><a href="/uss/olh/qnm/QnaAnswerListInqire.do" target="content">Q&A답변목록 조회</a></td>
  </tr>

  <tr>
    <td align="center" nowrap><a href="/uss/olp/cns/CnsltListInqire.do" target="content">상담목록조회</a></td>
  </tr>

  <tr>
    <td align="center" nowrap><a href="/uss/olp/cnm/CnsltAnswerListInqire.do" target="content">상담답변목록 조회</a></td>
  </tr>
	</table>
	
	
	<br>
	<br>
	<br>
	<br>
	</td>
</tr>
</table>


</body>
</html>