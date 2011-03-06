<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link rel="stylesheet" href="/css/egovframework/sym/mpm/mpm.css" type="text/css">
<title>HeadMenu</title>
<script language="javascript" src="/js/egovframework/main.js"></script>
<script type="text/javascript">
	function fn_main_headPageMove(menuNo, url){
		document.selectOne.vStartP.value=menuNo;
		document.selectOne.chkURL.value=url;
	    document.selectOne.action = "<c:url value='/sym/mms/EgovMainMenuLeft.do'/>";
	    document.selectOne.target = "main_left";
	    document.selectOne.submit();
 	    document.selectOne.action = "<c:url value='/sym/mms/EgovMainMenuRight.do'/>";
	    document.selectOne.target = "main_right";
	    document.selectOne.submit();
	}
</script>
</head> 
<body leftmargin="0" topmargin="0" marginwidth="0" marginheight= "0"> 

<link rel="stylesheet" href="/css/com.css" type="text/css">
<form name="selectOne">
<input name="vStartP" type="hidden" />
<input name="chkURL" type="hidden" />
<table width="900" border="0" cellspacing="0" cellpadding="0">
<tr>
<!-- logo -->
<td width="176" height="112"><a href="/sym/mms/EgovMainMenuHome.do" target=_top><img src="/images/egovframework/logo.gif" width="176" height="112"></a></td>
<td width="724">
    <table width="100%" border="0" cellspacing="0" cellpadding="0">
    <tr>
        <td width="360" height="68" class="t_strong">공통서비스 테스트 사이트(업무사용자용)</td>
        <td width="364">
            <div style="position:absolute; left:550px; top:20px; width:400px; height:25px; z-index:5;">
                <select name="select01" onchange="javascript:goPageLNK(this.form);" style="width:350px">
                <option value=""  selected>------------요소기술을 선택하세요-----------</option>
                <option value="/EgovPageLink.do?link=cmm/utl/EgovNetworkState">REQ-COM-071 네트워크상태체크-이용</option>
				<option value="/EgovPageLink.do?link=cmm/utl/EgovNetworkInfo">REQ-COM-072 네트워크정보확인-이용</option>
				<option value="/EgovPageLink.do?link=cmm/utl/EgovFileAuthor">REQ-COM-073 디렉토리권한체크-박지욱</option>
				<option value="/EgovPageLink.do?link=cmm/utl/EgovDrctryMntrg">REQ-COM-074 디렉토리감시-조재영</option>
				<option value="/EgovPageLink.do?link=cmm/utl/EgovDrctryCopy">REQ-COM-075 디렉토리복사-조재영</option>
				<option value="/EgovPageLink.do?link=cmm/utl/EgovDrctryFileDelete">REQ-COM-076 (REQ-COM-132) 디렉토리삭제-조재영</option>
				<option value="/EgovPageLink.do?link=cmm/utl/EgovDrctryCreat">REQ-COM-077 (REQ-COM-130) 디렉토리생성-조재영</option>
				<option value="/EgovPageLink.do?link=cmm/utl/EgovDrctryInfoCeck">REQ-COM-078 디렉토리속성정보체크-조재영</option>
				<option value="/EgovPageLink.do?link=cmm/utl/EgovFileCmprs">REQ-COM-079 디렉토리압축/해제-박지욱</option>
				<option value="/EgovPageLink.do?link=cmm/utl/EgovDrctryMvmn">REQ-COM-080 (REQ-COM-131) 디렉토리이동-조재영</option>
				<option value="/EgovPageLink.do?link=cmm/utl/EgovDrctryDeCeck">REQ-COM-081 디렉토리일자체크-조재영</option> 
				<option value="/EgovPageLink.do?link=cmm/utl/EgovDrctryExst">REQ-COM-082 디렉토리존재체크-조재영</option> 
				<option value="/EgovPageLink.do?link=cmm/utl/EgovDiskAttrb">REQ-COM-083 디스크속성정보체크-조재영</option> 
				<option value="/EgovPageLink.do?link=cmm/utl/EgovDiskCpcty">REQ-COM-084 디스크유효용량체크-조재영</option> 
				<option value="/EgovPageLink.do?link=cmm/utl/EgovDiskExst">REQ-COM-085 디스크존재체크-조재영</option> 
				<option value="/EgovPageLink.do?link=cmm/utl/EgovSysInfo">REQ-COM-086 서버정보확인-박지욱</option> 
				<option value="/EgovPageLink.do?link=cmm/utl/EgovSysInfo">REQ-COM-087 시스템정보확인-박지욱</option>
				<option value="/EgovPageLink.do?link=cmm/utl/EgovSysInfo">REQ-COM-088 유효메모리체크-박지욱</option>
				<option value="/EgovPageLink.do?link=cmm/utl/EgovClntInfo">REQ-COM-089 클라이언트정보확인-박지욱</option> 
				<option value="/EgovPageLink.do?link=cmm/utl/EgovFileAuthor">REQ-COM-090 파일권한체크-박지욱</option> 
				<option value="/EgovPageLink.do?link=cmm/utl/EgovPdfCnvr">REQ-COM-091 파일변환-이용</option>
				<option value="/EgovPageLink.do?link=cmm/utl/EgovFileScrty">REQ-COM-092 파일보안-박지욱</option> 
				<option value="/EgovPageLink.do?link=cmm/utl/EgovFileCopy">REQ-COM-093 파일복사-박지욱</option> 
				<option value="/EgovPageLink.do?link=cmm/utl/EgovFileCmpr">REQ-COM-094 파일비교-박지욱</option> 
				<option value="/EgovPageLink.do?link=cmm/utl/EgovFileInfo">REQ-COM-095 파일속성정보체크-박지욱</option> 
				<option value="/EgovPageLink.do?link=cmm/utl/EgovFtpTool">REQ-COM-096 파일송/수신-박지욱</option> 
				<option value="/EgovPageLink.do?link=cmm/utl/EgovFileDate">REQ-COM-097 파일일자체크-박지욱</option> 
				<option value="/EgovPageLink.do?link=cmm/utl/EgovFileExst">REQ-COM-098 파일존재체크-박지욱</option> 
				<option value="/EgovPageLink.do?link=cmm/utl/EgovFilePars">REQ-COM-099 파일파싱-박지욱</option> 
				<option value="/EgovPageLink.do?link=cmm/utl/EgovProcsInfo">REQ-COM-100 프로세스ID확인-조재영</option> 
				<option value="/EgovPageLink.do?link=cmm/utl/EgovWebEditor">REQ-COM-101 웹에디터-박지욱</option> 
				<option value="/EgovPageLink.do?link=cmm/utl/EgovErncslOutpt">REQ-COM-102 전자관인출력-이중호</option>  
				<option value="/EgovPageLink.do?link=cmm/utl/EgovPrintStatus">REQ-COM-103 프린터상태확인상태확인-장동한</option> 
				<option value="/EgovPageLink.do?link=cmm/utl/EgovPrint">REQ-COM-104 화면인쇄-장동한</option> 
				<option value="/EgovPageLink.do?link=cmm/utl/EgovMenuGov">REQ-COM-105 메인메뉴-이용</option> 
				<option value="/EgovPageLink.do?link=cmm/utl/EgovTreeMenu">REQ-COM-106 트리메뉴-이용</option> 
				<option value="/EgovPageLink.do?link=cmm/utl/EgovSession">REQ-COM-107 세션처리-이삼섭</option> 
				<option value="/EgovPageLink.do?link=cmm/utl/EgovCookieProcess">REQ-COM-108 쿠키처리-박정규</option> 
				<option value="/EgovPageLink.do?link=cmm/utl/EgovWeekCalc">REQ-COM-109 날짜/시간/요일계산-이중호</option> 
				<option value="/EgovPageLink.do?link=cmm/utl/EgovDateCnvr">REQ-COM-110 날짜/시간/요일변환-이중호</option> 
				<option value="/EgovPageLink.do?link=cmm/utl/EgovDateValidCeck">REQ-COM-111 날짜/시간/요일유효성체크-이중호</option> 
				<option value="/EgovPageLink.do?link=cmm/utl/EgovDfkCnvr">REQ-COM-112 날짜/시간/요일포맷변경-이중호</option> 
				<option value="/EgovPageLink.do?link=cmm/utl/EgovDeRndmCreate">REQ-COM-113 랜덤날짜구하기-이중호</option> 
				<option value="/EgovPageLink.do?link=cmm/utl/EgovRandomStr">REQ-COM-114 랜덤문자열구하기-박정규</option> 
				<option value="/EgovPageLink.do?link=cmm/utl/EgovRandomNumber">REQ-COM-115 랜덤숫자구하기-박정규</option> 
				<option value="/EgovPageLink.do?link=cmm/utl/EgovNumberSearch">REQ-COM-116 숫자검색-박정규</option> 
				<option value="/EgovPageLink.do?link=cmm/utl/EgovNumberCnvr">REQ-COM-117 숫자변환-박정규</option> 
				<option value="/EgovPageLink.do?link=cmm/utl/EgovNumberValidCeck">REQ-COM-118 숫자유효성체크-박정규</option> 
				<option value="/EgovPageLink.do?link=cmm/utl/EgovNumberReplc">REQ-COM-119 숫자치환-박정규</option> 
				<option value="/EgovPageLink.do?link=cmm/utl/EgovRlnoIntgrCeck">REQ-COM-120 실수/정수/음수체크-박정규</option> 
				<option value="/EgovPageLink.do?link=cmm/utl/EgovSlrcldLrrCnvr">REQ-COM-121 양력/음력변환-이중호</option> 
				<option value="/EgovPageLink.do?link=cmm/utl/EgovEncdDcd">REQ-COM-122 인코딩/디코딩-박정규</option> 
				<option value="/EgovPageLink.do?link=cmm/utl/EgovSpclStrProcess">REQ-COM-123 특수문자열처리-박정규</option> 
				<option value="/EgovPageLink.do?link=cmm/utl/EgovEhgtCalc">REQ-COM-124 환율계산-박정규</option> 
				<option value="/EgovPageLink.do?link=cmm/utl/EgovTimestamp">REQ-COM-125 TIMESTAMP값구하기-박정규</option> 
				<option value="/EgovPageLink.do?link=cmm/utl/EgovMessage">REQ-COM-126 경고메시지-이삼섭</option> 
				<option value="/EgovPageLink.do?link=cmm/utl/EgovMessage">REQ-COM-127 에러메시지-이삼섭</option> 
				<option value="/EgovPageLink.do?link=cmm/utl/EgovMessage">REQ-COM-128 정보메시지-이삼섭</option> 
				<option value="/EgovPageLink.do?link=cmm/utl/EgovMessage">REQ-COM-129 확인메시지-이삼섭</option> 
				<option value="/EgovPageLink.do?link=cmm/utl/EgovDrctryCreat">REQ-COM-130(REQ-COM-077) 파일생성-조재영</option> 
				<option value="/EgovPageLink.do?link=cmm/utl/EgovDrctryMvmn">REQ-COM-131(REQ-COM-080) 파일이동-조재영</option> 
				<option value="/EgovPageLink.do?link=cmm/utl/EgovDrctryFileDelete">REQ-COM-132(REQ-COM-076) 파일삭제-조재영</option> 
				<option value="/EgovPageLink.do?link=cmm/utl/EgovFileUpload">REQ-COM-133 파일업로드-이삼섭</option> 
				<option value="/EgovPageLink.do?link=cmm/utl/EgovFileDown">REQ-COM-134 파일다운로드-이삼섭</option> 
				<option value="/EgovPageLink.do?link=cmm/utl/EgovFileCmprs">REQ-COM-135 파일압축/해제-박지욱</option> 
				<option value="/EgovPageLink.do?link=cmm/utl/EgovXMLDoc">REQ-COM-136 XML데이터파싱-박지욱</option>
				<option value="/EgovPageLink.do?link=cmm/utl/EgovXMLDoc">REQ-COM-137 XML데이터조립-박지욱</option> 
				<option value="/EgovPageLink.do?link=cmm/utl/EgovProperty">REQ-COM-138 프로퍼티-박지욱</option> 
				<option value="/EgovPageLink.do?link=cmm/utl/EgovStringCase">REQ-COM-139 문자열변환-이삼섭</option> 
				<option value="/EgovPageLink.do?link=cmm/utl/EgovStringReplace">REQ-COM-140 문자열치환-이삼섭</option> 
				<option value="/EgovPageLink.do?link=cmm/utl/EgovStringValidation">REQ-COM-141 문자열유효성체크-이삼섭</option> 
				<option value="/EgovPageLink.do?link=cmm/utl/EgovStringIndex">REQ-COM-142 문자열검색-이삼섭</option> 
                </select>
            </div>
        </td>
    </tr>
    <tr>
    	<TD colspan="2">
    	<TABLE width="724px" cellspacing="10">
			<TR>
				<TD bgcolor="#eaecf0"><IMG SRC="/images/egovframework/tit_icon_pop.gif" WIDTH="9" HEIGHT="9" BORDER="0" ALT="">현재 접속자수 : 20명</TD>
				<TD bgcolor="#eaecf0"><IMG SRC="/images/egovframework/tit_icon_pop.gif" WIDTH="9" HEIGHT="9" BORDER="0" ALT="">최고 Hit 서비스 : 환율계산</TD>
				<TD bgcolor="#eaecf0"><IMG SRC="/images/egovframework/tit_icon_pop.gif" WIDTH="9" HEIGHT="9" BORDER="0" ALT="">게시물 최다 게시판 : FAQ</TD>
			</TR>
		</TABLE>
    	</TD>
    </tr>
    <!-- top menu background -->
    <tr class="TopMenuBg">
    <td height="44" colspan="2">
        <!-- top menu start -->
        <table width="700px" border="0" cellspacing="0" cellpadding="0" style="padding-top:6px;">
            <tr>
                <td align="right" width="76"><a href="/sym/mms/EgovMainMenuHome.do" target="_top">HOME</a></td>
             <c:forEach var="result" items="${list_headmenu}" varStatus="status">
                <td align="center" width="100"><a href="javascript:fn_main_headPageMove('<c:out value="${result.menuNo}"/>','<c:out value="${result.chkURL}"/>')"><c:out value="${result.menuNm}"/></a></td>
             </c:forEach>
            </tr>
        </table>
       <!-- top menu end -->
    </td>
    </tr>
    </table>
</td>
</tr>
</table>
</form>
</body>
</html>

                <!--  td align="right" width="76"><a href="#">HOME</a></td>
                <td align="center" width="100"><a href="#">보안관리</a></td>
                <td align="center" width="88"><a href="#">사용자지원</a></td>
                <td align="center" width="85"><a href="#">사용자인증</a></td>
                <td align="center" width="86"><a href="#">시스템관리</a></td>
                <td align="center" width="66"><a href="#" onClick='javascript:fn_egov_mainPageMove("<c:url value='/cop/mainView.do'/>")'>협업</a></td>
                <td align="center" width="94"><a href="#">통계/리포팅</a></td>
                <td align="center" width="105"><a href="#">전자우편연계</a></td -->
