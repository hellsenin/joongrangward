<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%
 /**
  * @Class Name : EgovLoginUsr.jsp
  * @Description : Login 인증 화면
  * @Modification Information
  * @
  * @  수정일         수정자                   수정내용
  * @ -------    --------    ---------------------------
  * @ 2009.03.03    박지욱          최초 생성
  *
  *  @author 공통서비스 개발팀 박지욱
  *  @since 2009.03.03
  *  @version 1.0
  *  @see
  *  
  *  Copyright (C) 2009 by MOPAS  All right reserved.
  */
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link rel="stylesheet" href="/css/egovframework/cmm/uat/uia/com.css" type="text/css">
<script language='javascript' src='/js/egovframework/cmm/uat/uia/EgovGpkiVariables.js'></script>
<script language='javascript' src='/js/egovframework/cmm/uat/uia/EgovGpkiInstall.js'></script>
<script language='javascript' src='/js/egovframework/cmm/uat/uia/EgovGpkiFunction.js'></script>
<OBJECT ID="GPKISecureWeb" CLASSID = "CLSID:C8223F3A-1420-4245-88F2-D874FC081572">
</OBJECT>
<title>MOPAS 로그인</title>
<script>

function checkLogin(userSe) {
	// 일반회원
	if (userSe == "GNR") {
		document.loginForm.rdoSlctUsr[0].checked = true;
		document.loginForm.rdoSlctUsr[1].checked = false;
		document.loginForm.rdoSlctUsr[2].checked = false;
		document.loginForm.userSe.value = "GNR";
	// 기업회원
	} else if (userSe == "ENT") {
		document.loginForm.rdoSlctUsr[0].checked = false;
		document.loginForm.rdoSlctUsr[1].checked = true;
		document.loginForm.rdoSlctUsr[2].checked = false;
		document.loginForm.userSe.value = "ENT";	
	// 업무사용자	
	} else if (userSe == "USR") {
		document.loginForm.rdoSlctUsr[0].checked = false;
		document.loginForm.rdoSlctUsr[1].checked = false;
		document.loginForm.rdoSlctUsr[2].checked = true;
		document.loginForm.userSe.value = "USR";
	}
}

function actionLogin() {

	if (document.loginForm.id.value =="") {
		alert("아이디를 입력하세요");
	} else if (document.loginForm.password.value =="") {
		alert("비밀번호를 입력하세요");
	} else {
        document.loginForm.action="<c:url value='/uat/uia/actionLogin.do'/>";
		//document.loginForm.j_username.value = document.loginForm.userSe.value + document.loginForm.username.value;
		//document.loginForm.action="<c:url value='/j_spring_security_check'/>";
		document.loginForm.submit();
	}
}

function actionCrtfctLogin() {
	document.defaultForm.action="<c:url value='/uat/uia/actionCrtfctLogin.action'/>";
	document.defaultForm.submit();
}

function goFindId() {
	document.defaultForm.action="<c:url value='/uat/uia/egovIdPasswordSearch.do'/>";
	document.defaultForm.submit();
}

function goRegiUsr() {
	var userSe = document.loginForm.userSe.value;
	// 일반회원
	if (userSe == "GNR") {
		document.loginForm.action="<c:url value='/uss/umt/cmm/EgovStplatCnfirmMber.do'/>";
		document.loginForm.submit();
	// 기업회원
	} else if (userSe == "ENT") {
		document.loginForm.action="<c:url value='/uss/umt/cmm/EgovStplatCnfirmEntrprs.do'/>";
		document.loginForm.submit();
	// 업무사용자	
	} else if (userSe == "USR") {
		alert("업무사용자는 별도의 회원가입이 필요하지 않습니다.");
	}
}

function goGpkiIssu() {
	document.defaultForm.action="<c:url value='/uat/uia/egovGpkiIssu.do'/>";
	document.defaultForm.submit();
}

function setCookie (name, value, expires) {
	document.cookie = name + "=" + escape (value) + "; path=/; expires=" + expires.toGMTString();
}

function getCookie(Name) {
	var search = Name + "="
	if (document.cookie.length > 0) { // 쿠키가 설정되어 있다면
		offset = document.cookie.indexOf(search)
		if (offset != -1) { // 쿠키가 존재하면
			offset += search.length
			// set index of beginning of value
			end = document.cookie.indexOf(";", offset)
			// 쿠키 값의 마지막 위치 인덱스 번호 설정
			if (end == -1)
				end = document.cookie.length
			return unescape(document.cookie.substring(offset, end))
		}
	}
	return "";
}

function saveid(form) {
	var expdate = new Date();
	// 기본적으로 30일동안 기억하게 함. 일수를 조절하려면 * 30에서 숫자를 조절하면 됨
	if (form.checkId.checked)
		expdate.setTime(expdate.getTime() + 1000 * 3600 * 24 * 30); // 30일
	else
		expdate.setTime(expdate.getTime() - 1); // 쿠키 삭제조건
	setCookie("saveid", form.id.value, expdate);
}

function getid(form) {
	form.checkId.checked = ((form.id.value = getCookie("saveid")) != "");
}

function fnInit() {
	var message = document.loginForm.message.value;
	if (message != "") {
		alert(message);
	}
	
	getid(document.loginForm);
	// 포커스
	//document.loginForm.rdoSlctUsr.focus();
}

</script>
</head>
<body>
  <table width="700">
    <tr>
      <td width="350" height="250">
	      <!--일반로그인 테이블 시작-->
	      <form name="loginForm" action ="<c:url value='/uat/uia/actionLogin.do'/>" method="post">
	        <input type="hidden" name="message" value="${message}">
			<table width="303" border="0" cellspacing="8" cellpadding="0">
		      <tr>
				<td width="40%"class="title_left"><img src="/images/egovframework/cmm/uat/uia/tit_icon.gif" width="16" height="16" hspace="3" align="absmiddle">&nbsp;일반로그인</td>
		      </tr>
		      <tr>
				<td width="303" height="210" valign="top" style="background-image: url(/images/egovframework/cmm/uat/uia/login_bg01.gif);">
					<table width="303" border="0" align="center" cellpadding="0" cellspacing="0">
					  <tr>
					    <td height="70">&nbsp;</td>
					  </tr>
					  <tr>
					    <td>
					    	<table border="0" cellpadding="0" cellspacing="0" style="width:250px;margin-left:20px;">					
				              <tr>
				                <td width="30"></td>
				                <td class="title" nowrap><input name="rdoSlctUsr" type=radio value=radio checked onClick="checkLogin('GNR');" style="border:0;" tabindex="1">일반</td>
				                <td class="title" nowrap><input name="rdoSlctUsr" type=radio value=radio unchecked onClick="checkLogin('ENT');" style="border:0;" tabindex="2">기업</td>
				                <td class="title" nowrap><input name="rdoSlctUsr" type=radio value=radio unchecked onClick="checkLogin('USR');" style="border:0;" tabindex="3">업무</td>
				              </tr>
				              <tr>
							    <td height="1">&nbsp;</td>
							  </tr>
				            </table>
						    <table border="0" cellpadding="0" cellspacing="0" style="width:250px;margin-left:20px;">
						      <tr>
								<td>
									<table width="250" border="0" cellpadding="0" cellspacing="0">
									  <tr>
									    <td class="required_text" nowrap>아이디&nbsp;&nbsp;</td>
									    <td><input type="text" name="id" value="gogo" style="height: 16px; width: 85px; border: 1px solid #CCCCCC; margin: 0px; padding: 0px; ime-mode: disabled;" tabindex="4" maxlength="10"/></td>
									    <td/>
									  </tr>
									  <tr>
									    <td class="required_text" nowrap>비밀번호&nbsp;&nbsp;</td>
									    <td><input type="password" name="password" value="1234" style="height: 16px; width: 85px; border: 1px solid #CCCCCC; margin: 0px; padding: 0px; ime-mode: disabled;" maxlength="12" tabindex="5" onKeyDown="javascript:if (event.keyCode == 13) { actionLogin(); }"/></td>
									    <td class="title"><input type="checkbox" name="checkId" class="check2" onClick="javascript:saveid(document.loginForm);" tabindex="6"/>ID저장</td>
									  </tr>
									</table>
								</td>
					  		  </tr>
					  		  <tr>
					  		  	<td height="10">&nbsp;</td>
					  		  </tr>
					  		  <tr>
							    <td>
									<table border="0" cellspacing="0" cellpadding="0">
									  <tr>
									    <td><img src="/images/egovframework/cmm/uat/uia/bu2_left.gif" width="8" height="20"></td>
										<td background="/images/egovframework/cmm/uat/uia/bu2_bg.gif" class="text_left" nowrap><center><a href="javascript:actionLogin();">로그인</a></center></td>
										<td><img src="/images/egovframework/cmm/uat/uia/bu2_right.gif" width="8" height="20"></td>
										<td>&nbsp;</td>
										<td><img src="/images/egovframework/cmm/uat/uia/bu2_left.gif" width="8" height="20"></td>
										<td background="/images/egovframework/cmm/uat/uia/bu2_bg.gif" class="text_left" nowrap><center><a href="javascript:goRegiUsr();">회원가입</a></center></td>
										<td><img src="/images/egovframework/cmm/uat/uia/bu2_right.gif" width="8" height="20"></td>
										<td>&nbsp;</td>
										<td><img src="/images/egovframework/cmm/uat/uia/bu2_left.gif" width="8" height="20"></td>
										<td background="/images/egovframework/cmm/uat/uia/bu2_bg.gif" class="text_left" nowrap><center><a href="javascript:goFindId();">아이디/비밀번호찾기</a></center></td>
										<td><img src="/images/egovframework/cmm/uat/uia/bu2_right.gif" width="8" height="20"></td>
									  </tr>
									</table>
								</td>
							  </tr>
							  <tr>
							    <td height="3"></td>
							  </tr>
							  <tr>
							    <td>
									<table border="0" cellspacing="0" cellpadding="0">
									  <tr>
									    <td><img src="/images/egovframework/cmm/uat/uia/bu2_left.gif" width="8" height="20"></td>
										<td background="/images/egovframework/cmm/uat/uia/bu2_bg.gif" class="text_left" nowrap><center><a href="javascript:Login(document.GpkiLoginForm);">인증서로그인</a></center></td>
										<td><img src="/images/egovframework/cmm/uat/uia/bu2_right.gif" width="8" height="20"></td>
										<td>&nbsp;</td>
										<td><img src="/images/egovframework/cmm/uat/uia/bu2_left.gif" width="8" height="20"></td>
										<td background="/images/egovframework/cmm/uat/uia/bu2_bg.gif" class="text_left" nowrap><center><a href="javascript:goGpkiIssu();">인증서안내</a></center></td>
										<td><img src="/images/egovframework/cmm/uat/uia/bu2_right.gif" width="8" height="20"></td>
									  </tr>
									</table>
								</td>
							  </tr>
							</table>
			    		</td>
			  		  </tr>
			  		  <tr>
					    <td height="2">&nbsp;</td>
					  </tr>
					</table>
				</td>
		      </tr>
		    </table>
		    <input name="userSe" type="hidden" value="GNR"/>
		    <input name="j_username" type="hidden"/>
	    </form>
	    <!--일반로그인 테이블 끝-->
      </td>
      <td width="350" height="250">
        
      	<!--인증서로그인 테이블 시작-->
	    <form name="GpkiLoginForm" action ="<c:url value='/uat/uia/actionCrtfctLogin.action'/>" method="post">
			<table width="303" border="0" cellspacing="8" cellpadding="0">
		      <tr height="10">
		      </tr>
		      <tr>
				<td width="40%"class="title_left"><img src="/images/egovframework/cmm/uat/uia/tit_icon.gif" width="16" height="16" hspace="3" align="absmiddle">&nbsp;인증서 로그인</td>
		      </tr>
		      <tr>
				<td width="303" height="210" valign="top" style="background-image: url(/images/egovframework/cmm/uat/uia/login_bg01.gif);">
					<table width="303" border="0" align="center" cellpadding="0" cellspacing="0">
					  <tr height="20">
					    <td width="30">
		      		  </tr>
					  <tr>
					    <table height="150" border="0" cellspacing="0" cellpadding="0" align="center">
						  <tr>
						  <td>
			                <!-- 인증서 ActiveX 삽입 -->
			                <object id="EMX" classid="CLSID:4725E26C-87F5-4D06-B743-A645DC6623D9" width = "285" height = "145">
			                  <param name="GNTYPE", value=GNCertType>
			                  <param name="WORKDIR", value=WorkDir>
			                  <param name="CERTTYPE", value=ReadCertType>
			                  <param name="VALIDCERTOIDINFO", value=ValidCertInfo>
			                </object> 
			                <!-- 인증서 ActiveX 삽입 끝-->
		                  </td>
		                  </tr>
		                </table>
			  		  </tr>
					</table width="303" border="0" align="center" cellpadding="0" cellspacing="0">
					<table>
					  <tr>
			  		    <table border="0" cellspacing="0" cellpadding="0" align="center">
						  <tr>
						    <td class="required_text">비밀번호&nbsp;&nbsp;
			                <input type="password" size="13" maxlength="16" name="pwd" onkeydown="embeddedEnterEvent(this.form)" style="ime-mode: disabled;" tabindex="7">&nbsp;&nbsp;
							<td><img src="/images/egovframework/cmm/uat/uia/bu2_left.gif" width="8" height="20"></td>
							<td background="/images/egovframework/cmm/uat/uia/bu2_bg.gif" class="text_left" nowrap><center><a href="javascript:LoginEmbedded(document.GpkiLoginForm);">인증서로그인</a></center></td>
							<td><img src="/images/egovframework/cmm/uat/uia/bu2_right.gif" width="8" height="20"></td>
			                <input type="hidden" name="challenge" value='<c:out value="${challenge}"/>'>
			              </tr>
			            </table> 
					  </tr>
					</table>
				</td>
		      </tr>
		    </table>
		    <input name="userSe" type="hidden" value="GNR">
	    </form>
	    <!--인증서로그인 테이블 끝-->
	    <!-- 팝업 폼 -->
	    <form name="defaultForm" action ="<c:url value='/uat/uia/egovGpkiIssu.do'/>" method="post" target="_blank">
	    </form>
      </td>
    </tr>
  </table>
  <table width="700">
    <tr>
	  <td class="title_left"><img src="/images/egovframework/cmm/uat/uia/tit_icon.gif" width="16" height="16" hspace="3" align="absmiddle">&nbsp;인증서 로그인을 위한 설치</td>
    </tr>
    <tr>					
	  <td valign="top">&nbsp;-&nbsp;<a href="http://www.gpki.go.kr" target="blank">GPKI 인증센터</a></td>
	</tr>
  </table>
</body>
</body>
</html>