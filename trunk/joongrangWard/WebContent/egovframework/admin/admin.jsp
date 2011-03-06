<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="validator" uri="http://www.springmodules.org/tags/commons-validator" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>종로구청 관리자</title>
<link rel="stylesheet" type="text/css" href="css/common_style.css">
<script language="JavaScript" type="text/JavaScript">
<!--
function MM_swapImgRestore() { //v3.0
  var i,x,a=document.MM_sr; for(i=0;a&&i<a.length&&(x=a[i])&&x.oSrc;i++) x.src=x.oSrc;
}

function MM_preloadImages() { //v3.0
  var d=document; if(d.images){ if(!d.MM_p) d.MM_p=new Array();
    var i,j=d.MM_p.length,a=MM_preloadImages.arguments; for(i=0; i<a.length; i++)
    if (a[i].indexOf("#")!=0){ d.MM_p[j]=new Image; d.MM_p[j++].src=a[i];}}
}

function MM_findObj(n, d) { //v4.01
  var p,i,x;  if(!d) d=document; if((p=n.indexOf("?"))>0&&parent.frames.length) {
    d=parent.frames[n.substring(p+1)].document; n=n.substring(0,p);}
  if(!(x=d[n])&&d.all) x=d.all[n]; for (i=0;!x&&i<d.forms.length;i++) x=d.forms[i][n];
  for(i=0;!x&&d.layers&&i<d.layers.length;i++) x=MM_findObj(n,d.layers[i].document);
  if(!x && d.getElementById) x=d.getElementById(n); return x;
}

function MM_swapImage() { //v3.0
  var i,j=0,x,a=MM_swapImage.arguments; document.MM_sr=new Array; for(i=0;i<(a.length-2);i+=3)
   if ((x=MM_findObj(a[i]))!=null){document.MM_sr[j++]=x; if(!x.oSrc) x.oSrc=x.src; x.src=a[i+2];}
}

function MM_reloadPage(init) {  //reloads the window if Nav4 resized
  if (init==true) with (navigator) {if ((appName=="Netscape")&&(parseInt(appVersion)==4)) {
    document.MM_pgW=innerWidth; document.MM_pgH=innerHeight; onresize=MM_reloadPage; }}
  else if (innerWidth!=document.MM_pgW || innerHeight!=document.MM_pgH) location.reload();
}
MM_reloadPage(true);

function MM_showHideLayers() { //v6.0
  var i,p,v,obj,args=MM_showHideLayers.arguments;
  for (i=0; i<(args.length-2); i+=3) if ((obj=MM_findObj(args[i]))!=null) { v=args[i+2];
    if (obj.style) { obj=obj.style; v=(v=='show')?'visible':(v=='hide')?'hidden':v; }
    obj.visibility=v; }
}

function ClickMenu(Lab){
	MenuHidden();
	var mUse1 	= document.all['menu_use1'];
	var mUse2 	= document.all['menu_use2'];
	var mUse3 	= document.all['menu_use3'];
	var mUse4 	= document.all['menu_use4'];
	var mUse5 	= document.all['menu_use5'];
	var mUse6 	= document.all['menu_use6'];
	var mUse7 	= document.all['menu_use7'];
	var mUse8 	= document.all['menu_use8'];
	var mUse9 	= document.all['menu_use9'];
	if(Lab == 1){
		mUse1.style.display="block";
	}else if(Lab == 2){
		mUse2.style.display="block";
	}else if(Lab == 3){
		mUse3.style.display="block";
	}else if(Lab == 4){
		mUse4.style.display="block";
	}else if(Lab == 5){
		mUse5.style.display="block";
	}else if(Lab == 6){
		mUse6.style.display="block";
	}else if(Lab == 7){
		mUse7.style.display="block";
	}else if(Lab == 8){
		mUse8.style.display="block";
	}else if(Lab == 9){
		mUse9.style.display="block";
	}

var mUse1 	= document.all['menu_use1'];
	var mUse2 	= document.all['menu_use2'];
	var mUse3 	= document.all['menu_use3'];
	var mUse4 	= document.all['menu_use4'];
	var mUse5 	= document.all['menu_use5'];
	var mUse6 	= document.all['menu_use6'];
	var mUse7 	= document.all['menu_use7'];
	var mUse8 	= document.all['menu_use8'];
	var mUse9 	= document.all['menu_use9'];
	
	if(Lab == 1){
		mUse1.style.display="block";
	}else if(Lab == 2){
		mUse2.style.display="block";
	}else if(Lab == 3){
		mUse3.style.display="block";
	}else if(Lab == 4){
		mUse4.style.display="block";
	}else if(Lab == 5){
		mUse5.style.display="block";
	}else if(Lab == 6){
		mUse6.style.display="block";
	}else if(Lab == 7){
		mUse7.style.display="block";
	}else if(Lab == 8){
		mUse8.style.display="block";
	}else if(Lab == 9){
		mUse9.style.display="block";
	}

}

function MenuHidden(){
	var mUse1 	= document.all['menu_use1'];
	var mUse2 	= document.all['menu_use2'];
	var mUse3 	= document.all['menu_use3'];
	var mUse4 	= document.all['menu_use4'];
	var mUse5 	= document.all['menu_use5'];
	var mUse6 	= document.all['menu_use6'];
	var mUse7 	= document.all['menu_use7'];
	var mUse8 	= document.all['menu_use8'];
	var mUse9 	= document.all['menu_use9'];
	
	mUse1.style.display="none";
	mUse2.style.display="none";
	mUse3.style.display="none";
	mUse4.style.display="none";
	mUse5.style.display="none";
	mUse6.style.display="none";
	mUse7.style.display="none";
	mUse8.style.display="none";
	mUse9.style.display="none";
}
//-->
</script>
</head>

<body topmargin="0" leftmargin="0" rightmargin="0">
<table width="995" border="0" cellspacing="0" cellpadding="0" height="100%">
	<tr>
		<td valign="top"><table width="995" border="0" cellspacing="0" cellpadding="0">
			<tr>
				<td width="3"><img src="/images/top_left.jpg" width="3" height="40"></td>
				<td valign="top"><table width="989" border="0" cellspacing="0" cellpadding="0" height="40">
	<tr>
		<td width="11">&nbsp;</td>
		<td valign="top" style="padding-top:4px;" width="163"><img src="/images/logo.jpg" width="163" height="29"></td>
		<td align="right" style="padding-right:13px;" class="admin_login"><span class="admin_login_id">네모</span>님이 로그인하셨습니다.</td>
		<td width="71"><a href="#"><img src="/images/btn_logout.jpg" width="71" height="21" border="0"></a></td>
		<td width="4">&nbsp;</td>
		<td width="71"><a href="#"><img src="/images/btn_info_modify.jpg" width="71" height="21" border="0"></a></td>
		<td width="6">&nbsp;</td>
	</tr>
</table>
</td>
				<td width="3"><img src="/images/top_right.jpg" width="3" height="40"></td>
			</tr>
		</table></td>
	</tr>
	<tr>
		<td height="50" valign="top"><table width="995" border="0" cellspacing="0" cellpadding="0" height="50">
			<tr>
				<td width="3"><img src="/images/bar_left.jpg" width="3" height="50"></td>
				<td width="989" background="/images/bar_center.jpg" valign="top">
				<table width="100%" border="0" cellspacing="0" cellpadding="0" height="50">
					<tr>
						<td width="20%">&nbsp;</td>
					<c:set var="topCategory" value="${menuCategoryMap['0']}" />
					<c:forEach var="x" begin="0" end="${fn:length(topCategory)-1}" > 
						<td><a href="${topCategory[x].menuLink}" onMouseOver="MM_swapImage('Image${x+1}','','/images/1depth_01_over.gif',1);MM_showHideLayers('Layer1','','show','Layer2','','hide','Layer3','','hide','Layer4','','hide','Layer5','','hide','Layer6','','hide','Layer7','','hide')" onMouseOut="MM_swapImgRestore();MM_showHideLayers('Layer1','','hide','Layer2','','hide','Layer3','','hide','Layer4','','hide','Layer5','','hide','Layer6','','hide','Layer7','','hide')" onFocus="this.blur()">${topCategory[x].menuNm}</a></td>
					</c:forEach>
						<td width="25%">&nbsp;</td>
					</tr>
				</table>
				</td>
				<td width="3"><img src="/images/bar_right.jpg" width="3" height="50"></td>
			</tr>
		</table></td>
	</tr>
	<tr>
		<td valign="top">
<c:forEach var="x" begin="0" end="${fn:length(topCategory)-1}" > 
		<div id="Layer1" style="position:absolute; left:61; top:90; width:420; z-index:1; visibility: hidden;" onMouseOver="MM_showHideLayers('Layer1','','show','Layer2','','hide','Layer3','','hide','Layer4','','hide','Layer5','','hide','Layer6','','hide','Layer7','','hide');MM_swapImage('Image1','','/images/1depth_01_over.gif',1)" onMouseOut="MM_showHideLayers('Layer1','','hide','Layer2','','hide','Layer3','','hide','Layer4','','hide','Layer5','','hide','Layer6','','hide','Layer7','','hide');MM_swapImgRestore()">
		  <table width="420" border="0" cellspacing="0" cellpadding="0" height="40">
    <tr> 
	<c:set var="leftCategory" value="${menuCategoryMap[topCategory.menuNo]}" />
	<c:forEach var="y" begin="0" end="${fn:length(leftCategory)-1}" > 
      <td align="center" width="70" style="padding-bottom:5px;"><a href="${leftCategory[y].menuLink}" class="menu" onFocus="this.blur()">${leftCategory[y].menuNm}</a></td>
    </c:forEach>
    </tr>
  </table>
  </div>
</c:forEach>
		</td>
	</tr>
	<tr>
		<td height="37">&nbsp;</td>
	</tr>
	<tr>
		<td valign="top" height="100%"><table width="995" border="0" cellspacing="0" cellpadding="0" height="100%">
			<tr>
				<td width="174" valign="top"><table width="174" border="0" cellspacing="0" cellpadding="0" height="100%">
					<tr>
						<td height="83"><img src="/images/bg_title_01.jpg" width="174" height="83"></td>
					</tr>
					<tr>
						<td height="100%" bgcolor="#bcdb67" valign="top"><table width="174" border="0" cellspacing="0" cellpadding="0">
							<tr>
								<td width="14">&nbsp;</td>
								<td width="160"><table width="160" border="0" cellspacing="0" cellpadding="0">
									<tr>
										<td height="7"><img src="/images/left_menu_top.gif" width="160" height="7"></td>
										
									</tr>
									<tr>
										<td bgcolor="#ffffff" valign="top">
										<table width="160" border="0" cellspacing="0" cellpadding="0">
											<tr>
												<td width="8">&nbsp;</td>
												<td>
												<!-- left_menu 시작 -->
												<div class="markermenu">
												<table width="132" border="0" cellspacing="0" cellpadding="0">
												
													<tr>
														<td><table width="132" border="0" cellspacing="0" cellpadding="0">
															<tr>
																<td width="22"><img src="/images/icon_left_menu.gif" width="22" height="23"></td>
																<td height="23"><a href="javascript:ClickMenu('1');" onFocus="this.blur()"><img src="/images/menu_01.gif" width="110" height="23"></a></td>
															</tr>
														</table>
														 
														</td>
													</tr>
													<tr>
														<td><img src="/images/line_menu.gif" width="132" height="1"></td>
													</tr>
													<tr>
													<td>
														<table id="menu_use1" style="DISPLAY:none">
														<tr>
														<td style="padding-left:17px;"><a href="/jsp/man/KMnSpBraMemU.jsp" class="sub_menu" onFocus="this.blur()"><img src="/images/icon_submenu_down.gif" align="absmiddle" onFocus="this.blur()">&nbsp;서브메뉴1-1</a></td>
														</tr>
														<tr>
														<td style="padding-left:17px;"><a href="/jsp/man/KMnBeMemU.jsp" class="sub_menu" onFocus="this.blur()"><img src="/images/icon_submenu_down.gif" align="absmiddle" onFocus="this.blur()">&nbsp;서브메뉴1-2</a></td>
														</tr>
														</table>
												  </td>
												  </tr>
													<tr>
														<td height="23">
														<table width="132" border="0" cellspacing="0" cellpadding="0">
															<tr>
																<td width="22"><img src="/images/icon_left_menu.gif" width="22" height="23"></td>
																<td height="23"><a href="javascript:ClickMenu('2');" onFocus="this.blur()"><img src="/images/menu_02.gif" width="110" height="23"></a></td>
															</tr>
														</table>
														</td>
													</tr>
													<tr>
														<td><img src="/images/line_menu.gif" width="132" height="1"></td>
													</tr>
													<tr>
													<td>
														<table id="menu_use2" style="DISPLAY:none">
														<tr>
														<td style="padding-left:17px;"><a href="/jsp/man/KMnMemApprovalS.jsp" class="sub_menu" onFocus="this.blur()"><img src="/images/icon_submenu_down.gif" align="absmiddle" onFocus="this.blur()">&nbsp;서브메뉴2-1</a></td>
														</tr>
														<tr>
														<td style="padding-left:17px;"><a href="/jsp/man/KMnIdApprovalS.jsp" class="sub_menu" onFocus="this.blur()"><img src="/images/icon_submenu_down.gif" align="absmiddle" onFocus="this.blur()">&nbsp;서브메뉴2-2</a></td>
														</tr>
														</table>
													</td>
													</tr>
													<tr>
														<td valign="top">
															<table width="132" border="0" cellspacing="0" cellpadding="0">
															<tr>
															<td width="22"><img src="/images/icon_left_menu.gif" width="22" height="23"></td>
															<td><a href="javascript:ClickMenu('3');" onFocus="this.blur()"><img src="/images/menu_03.gif" width="110" height="23"></a></td>
															</tr>
															</table>
														</td>
													</tr>
													<tr>
													<td>
          <table id="menu_use3" style="DISPLAY:none">
                <tr>
                  <td style="padding-left:17px;"><a href="/jsp/trade/KTraComS.jsp" class="sub_menu" onFocus="this.blur()"><img src="/images/icon_submenu_down.gif" align="absmiddle" onFocus="this.blur()">&nbsp;서브메뉴3-1</a></td>
                </tr>
                <tr>
                  <td style="padding-left:17px;"><a href="/jsp/trade/KTraSearchS.jsp" class="sub_menu" onFocus="this.blur()"><img src="/images/icon_submenu_down.gif" align="absmiddle" onFocus="this.blur()">&nbsp;서브메뉴3-2</a></td>
                </tr>          
              </table> 
													</td>
													</tr>
													<tr>
														<td><img src="/images/line_menu.gif" width="132" height="1"></td>
													</tr>
													<tr>
														<td><table width="132" border="0" cellspacing="0" cellpadding="0">
															<tr>
																<td width="22"><img src="/images/icon_left_menu.gif" width="22" height="23"></td>
																<td><a href="javascript:ClickMenu('4');" onFocus="this.blur()"><img src="/images/menu_04.gif" width="110" height="23"></a></td>
															</tr>
														</table></td>
													</tr>
													<tr>
													<td><table id="menu_use4" style="DISPLAY:none">
                <tr>
                  <td style="padding-left:17px;"><a href="/jsp/fee/KArrearListS.jsp" class="sub_menu"><img src="/images/icon_submenu_down.gif" align="absmiddle" onFocus="this.blur()">&nbsp;서브메뉴4-1</a></td>
                </tr>
                <tr>
                  <td style="padding-left:17px;"><a href="javascript:NewWindowCard();" class="sub_menu"><img src="/images/icon_submenu_down.gif" align="absmiddle" onFocus="this.blur()">&nbsp;서브메뉴4-2</a></td>
                </tr>
              </table></td>
													</tr>
													<tr>
														<td><img src="/images/line_menu.gif" width="132" height="1"></td>
													</tr>
													<tr>
														<td><table width="132" border="0" cellspacing="0" cellpadding="0">
															<tr>
																<td width="22"><img src="/images/icon_left_menu.gif" width="22" height="23"></td>
																<td><a href="javascript:ClickMenu('5');" onFocus="this.blur()"><img src="/images/menu_05.gif" width="110" height="23"></a></td>
															</tr>
														</table></td>
													</tr>
													<tr>
													<td><table id="menu_use5" style="DISPLAY:none">
                <tr>
                  <td style="padding-left:17px;"><a href="/jsp/cert/KWaLiS.jsp" class="sub_menu" onFocus="this.blur()"><img src="/images/icon_submenu_down.gif" align="absmiddle">&nbsp;서브메뉴5-1</a></td>
                </tr>
                <tr>
                  <td style="padding-left:17px;"><a href="/jsp/cert/KExpImpLiS.jsp"  class="sub_menu" onFocus="this.blur()"><img src="/images/icon_submenu_down.gif" align="absmiddle">&nbsp;서브메뉴5-2</a></td>
                </tr>
              </table></td>
													</tr>
													<tr>
														<td><img src="/images/line_menu.gif" width="132" height="1"></td>
							</tr>
																										<tr>
														<td><table width="132" border="0" cellspacing="0" cellpadding="0">
															<tr>
																<td width="22"><img src="/images/icon_left_menu.gif" width="22" height="23"></td>
																<td><a href="javascript:ClickMenu('6');" onFocus="this.blur()"><img src="/images/menu_06.gif" width="110" height="23"></a></td>
															</tr>
														</table></td>
													</tr>
													<tr>
													<td>          <table id="menu_use6" style="DISPLAY:none">
				  <tr>
                  <td style="padding-left:17px;"><a href="/jsp/kgov/KGovFusercmS.jsp" class="sub_menu" onFocus="this.blur()"><img src="/images/icon_submenu_down.gif" align="absmiddle">&nbsp;서브메뉴6-1</a></td>
                </tr>
				 <tr>
                  <td style="padding-left:17px;"><a href="/jsp/kgov/KGovApecS.jsp" class="sub_menu" onFocus="this.blur()"><img src="/images/icon_submenu_down.gif" align="absmiddle">&nbsp;서브메뉴6-2</a></td>
                </tr>
				<tr>
                  <td style="padding-left:17px;"><a href="/jsp/kgov/KGovApecS.jsp" class="sub_menu" onFocus="this.blur()"><img src="/images/icon_submenu_down.gif" align="absmiddle">&nbsp;서브메뉴6-3</a></td>
                </tr>
              </table></td>
													</tr>
													<tr>
														<td><img src="/images/line_menu.gif" width="132" height="1"></td>
							</tr>
																										<tr>
														<td><table width="132" border="0" cellspacing="0" cellpadding="0">
															<tr>
																<td width="22"><img src="/images/icon_left_menu.gif" width="22" height="23"></td>
																<td><a href="javascript:ClickMenu('7');" onFocus="this.blur()"><img src="/images/menu_07.gif" width="110" height="23"></a></td>
															</tr>
														</table></td>
													</tr>
													<tr>
													<td><table id="menu_use7" style="DISPLAY:none">
				  <tr>
                  <td style="padding-left:17px;"><a href="/jsp/kgov/KGovFusercmS.jsp" class="sub_menu" onFocus="this.blur()"><img src="/images/icon_submenu_down.gif" align="absmiddle">&nbsp;서브메뉴7-1</a></td>
                </tr>
				 <tr>
                  <td style="padding-left:17px;"><a href="/jsp/kgov/KGovApecS.jsp" class="sub_menu" onFocus="this.blur()"><img src="/images/icon_submenu_down.gif" align="absmiddle">&nbsp;서브메뉴7-2</a></td>
                </tr>
				<tr>
                  <td style="padding-left:17px;"><a href="/jsp/kgov/KGovApecS.jsp" class="sub_menu" onFocus="this.blur()"><img src="/images/icon_submenu_down.gif" align="absmiddle">&nbsp;서브메뉴7-3</a></td>
                </tr>
              </table></td>
													</tr>
													<tr>
														<td><img src="/images/line_menu.gif" width="132" height="1"></td>
							</tr>
																										<tr>
														<td><table width="132" border="0" cellspacing="0" cellpadding="0">
															<tr>
																<td width="22"><img src="/images/icon_left_menu.gif" width="22" height="23"></td>
																<td><a href="javascript:ClickMenu('8');" onFocus="this.blur()"><img src="/images/menu_08.gif" width="110" height="23"></a></td>
															</tr>
														</table></td>
													</tr>
													<tr>
													<td><table id="menu_use8" style="DISPLAY:none">
				  <tr>
                  <td style="padding-left:17px;"><a href="/jsp/kgov/KGovFusercmS.jsp" class="sub_menu" onFocus="this.blur()"><img src="/images/icon_submenu_down.gif" align="absmiddle">&nbsp;서브메뉴8-1</a></td>
                </tr>
				 <tr>
                  <td style="padding-left:17px;"><a href="/jsp/kgov/KGovApecS.jsp" class="sub_menu" onFocus="this.blur()"><img src="/images/icon_submenu_down.gif" align="absmiddle">&nbsp;서브메뉴8-2</a></td>
                </tr>
				<tr>
                  <td style="padding-left:17px;"><a href="/jsp/kgov/KGovApecS.jsp" class="sub_menu" onFocus="this.blur()"><img src="/images/icon_submenu_down.gif" align="absmiddle">&nbsp;서브메뉴8-3</a></td>
                </tr>
              </table></td>
													</tr>
													<tr>
														<td><img src="/images/line_menu.gif" width="132" height="1"></td>
													</tr>
																										<tr>
														<td><table width="132" border="0" cellspacing="0" cellpadding="0">
															<tr>
																<td width="22"><img src="/images/icon_left_menu.gif" width="22" height="23"></td>
																<td><a href="javascript:ClickMenu('9');" onFocus="this.blur()"><img src="/images/menu_09.gif" width="110" height="23"></a></td>
															</tr>
														</table></td>
													</tr>
													<tr>
													<td><table id="menu_use9" style="DISPLAY:none">
				  <tr>
                  <td style="padding-left:17px;"><a href="/jsp/kgov/KGovFusercmS.jsp" class="sub_menu" onFocus="this.blur()"><img src="/images/icon_submenu_down.gif" align="absmiddle">&nbsp;서브메뉴9-1</a></td>
                </tr>
				 <tr>
                  <td style="padding-left:17px;"><a href="/jsp/kgov/KGovApecS.jsp" class="sub_menu" onFocus="this.blur()"><img src="/images/icon_submenu_down.gif" align="absmiddle">&nbsp;서브메뉴9-2</a></td>
                </tr>
				<tr>
                  <td style="padding-left:17px;"><a href="/jsp/kgov/KGovApecS.jsp" class="sub_menu" onFocus="this.blur()"><img src="/images/icon_submenu_down.gif" align="absmiddle">&nbsp;서브메뉴9-3</a></td>
                </tr>
              </table></td>
													</tr>
												</table>
												</div>
												</td>
												<td width="14">&nbsp;</td>
											</tr>
										</table></td>
										
									</tr>
									<tr>
										<td height="7"><img src="/images/left_menu_bottom.gif" width="160" height="7"></td>
										
									</tr>
								</table></td>
							</tr>
						</table></td>
					</tr>
					<tr><td><img src="/images/bg_left.jpg" width="174" height="237"></td>
					</tr>
				</table></td>
				<td width="11" valign="top"><img src="/images/bg_content_02.jpg" width="11" height="50"></td>
				<td width="810" valign="top"><img src="/images/bg_content_01.jpg" width="810" height="45">
					<table width="810" border="0" cellspacing="0" cellpadding="0">
						<tr>
							<td>&nbsp;</td>
					</tr>
						<tr>
							<td>&nbsp;</td>
						</tr>
						<tr>
							<td>&nbsp;</td>
						</tr>
					</table></td></tr>
		</table></td>
	</tr>
	
	<tr>
		<td><img src="/images/bottom.gif" width="995" height="117"></td>
	</tr>
</table>
</body>
</html>
