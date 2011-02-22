<%@ page language="java" contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<jsp:useBean id="today" class="java.util.Date" />
<%
	java.util.HashMap healthMenuCategoryMap = (java.util.HashMap)application.getAttribute("healthMenuCategoryMap");
	pageContext.setAttribute("healthMenuCategoryMap", healthMenuCategoryMap);

	int depth01 = 0;
	int depth02 = 0;
	int depth03 = 0;
	int depth04 = 0;
	int depth05 = 0;
	pageContext.setAttribute("depth01", depth01);
	pageContext.setAttribute("depth02", depth02);
	pageContext.setAttribute("depth03", depth03);
	pageContext.setAttribute("depth04", depth04);
	pageContext.setAttribute("depth05", depth05);
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>금천구 보건소</title>
<link href="/health/open_content/system/css/default.css" rel="stylesheet" type="text/css" />
<link href="/health/open_content/system/css/common.css" rel="stylesheet" type="text/css" />
<link href="/health/open_content/system/css/main.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="/health/open_content/system/js/main_ctrl.js"></script>
<script type="text/javascript" src="/health/open_content/system/js/jquery-1.4.2.min.js"></script>
<script type="text/javascript" src="/health/open_content/system/js/ui.js"></script>
<!--[if IE 7]><link rel="stylesheet" type="text/css" href="/health/open_content/system/css/ie67.css" /> <![endif]-->
<!--[if IE 6]><link rel="stylesheet" type="text/css" href="/health/open_content/system/css/ie67.css" />
			  <link rel="stylesheet" type="text/css" href="/health/open_content/system/css/ie6.css" /> 
<script type="text/javascript" src="/health/open_content/system/js/DD_belatedPNG_0.0.8a-min.js"></script>
<script>
  DD_belatedPNG.fix('#popup_area,#gnb ul li ul li ul li,img');
</script>
<![endif]--> 

</head>

<body>
<div id="warp">
	<ul id="skipnavi">
		<li><a href="#main_search">통합검색</a></li>
		<li><a href="#main_time">근무시간안내</a></li>
		<li><a href="#main_cal">캘린더</a></li>
		<li><a href="#notice_warp">최근게시물</a></li>
		<li><a href="#quickmenu">빠른서비스</a></li>
		<li><a href="#main_poll">설문조사</a></li>
	</ul>
	<div id="header" >
		<h1><a href="/health/main/main.do"><img src="/health/open_content/images/common/logo.gif" width="180" height="43" alt="서울특별시 금천구 보건소" /></a></h1>
		<ul id="global">
			<li><a href="#"><img src="/health/open_content/images/main/global/global_home.gif" alt="홈" /></a></li>
		<c:if test="${empty user.webMemId}">
			<li><a href="http://www.geumcheon.go.kr/member.do?method=loginPage&amp;fromLogin=health&amp;pageKey=08010101"><img src="/health/open_content/images/main/global/global_login.gif" alt="로그인" /></a></li>
		</c:if>
		<c:if test="${not empty user.webMemId}">
			<li><a href="/health/member/logout.do"><img src="/health/open_content/images/main/global/global_logout.gif" alt="로그아웃" /></a></li>
		</c:if>
			<li><a href="#"><img src="/health/open_content/images/main/global/global_join.gif" alt="회원가입" /></a></li>
			<li><a href="#"><img src="/health/open_content/images/main/global/global_sitemap.gif" alt="사이트맵" /></a></li>
			<li><a href="#"><img src="/health/open_content/images/main/global/global_guchung.gif" alt="금천구청" /></a></li>
			<li>
				<dl>
					<dt><img src="/health/open_content/images/main/global/font_title.gif" alt="글자크기" /></dt>
					<dd>
						<button type="button" class="btn_font_plus" >확대</button>
					</dd>
					<dd>
						<button type="button" class="btn_font_minus"  >축소</button>
					</dd>
					<dd>
						<button type="button" class="btn_font_reset"  >초기화</button>
					</dd>
				</dl>
			</li>
            <li><a href="#"><img src="/health/open_content/images/common/global/global_lang_1.gif" width="45" height="11" alt="ENGLISH" /></a></li>
            <li><a href="#"><img src="/health/open_content/images/common/global/global_lang_2.gif" width="33" height="11" alt="日本語" /></a></li>
            <li><a href="#"><img src="/health/open_content/images/common/global/global_lang_3.gif" width="25" height="11" alt="中文" /></a></li>
		</ul>
		<div id="gnb">
			<ul>
			<c:set var="curCategory" value="" />
			<c:set var="topCategories" value="${healthMenuCategoryMap['menu_0']}" />
			<c:if test="${fn:length(topCategories)>0}">
		 		<c:forEach var="x" begin="0" end="3">
                <li><a href="${topCategories[x].fullMenuLink}"><img src="/health/open_content/images/menu/gnb_tab_${x+1}_${x==depth01 ? 'on' : 'off'}.gif" alt="${topCategories[x].name}" /></a>
	 				<c:set var="imgIdx" value="${x+1}" />
	 				<c:if test="${imgIdx < 10 }" ><c:set var="imgIdx" value="0${x+1}" /></c:if>
	 				<c:set var="clss1" value="${x == depth01 ? 'class=\"current\"' : ''}"/>
                    <ul ${clss1} id="gnb_${imgIdx}">
					<c:set var="d02MenuKey" value="menu_${topCategories[x].categoryId}" />
					<c:set var="d02Categories" value="${healthMenuCategoryMap[d02MenuKey]}" />
					<c:if test="${fn:length(d02Categories)>0}">
			 			<c:forEach var="y" begin="0" end="${fn:length(d02Categories)-1}">
			 				<c:if test="${x == depth01 && y == depth02}"><c:set var="curCategory" value="${d02Categories[y]}" /><c:set var="curD02Category" value="${d02Categories[y]}" /></c:if>
	 						<c:set var="clss2" value="${x == depth01 && y == depth02 ? 'class=\"current\"' : ''}"/>
                        <li><a href="${d02Categories[y].fullMenuLink}"><img src="/health/open_content/images/menu/1depth_${depth01Color}_${y+1}_${x == depth01 && y == depth02 ? 'on' : 'off'}.gif" alt="${d02Categories[y].name}" /></a>
                            <ul id="smenu_${x+1}_${y+1}" ${clss2}>
							<c:set var="d03MenuKey" value="menu_${d02Categories[y].categoryId}" />
							<c:set var="d03Categories" value="${healthMenuCategoryMap[d03MenuKey]}" />
							<c:choose>
							<c:when test="${fn:length(d03Categories)>0}">
		 						<c:forEach var="z" begin="0" end="${fn:length(d03Categories)-1}">
			 						<c:if test="${x == depth01 && y == depth02 && z == depth03}"><c:set var="curCategory" value="${d03Categories[z]}" /></c:if>
	 								<c:set var="clss3" value="${x == depth01 && y == depth02 && z == depth03 ? 'class=\"current\"' : ''}"/>
	 								<c:choose>
	 								<c:when test="${z == 0}"><c:set var="liClss3" value="${'class=\"fir\"'}" /></c:when>
	 								<c:when test="${z == fn:length(d03Categories)-1}"><c:set var="liClss3" value="${'class=\"end\"'}" /></c:when>
	 								<c:otherwise><c:set var="liClss3" value="" /></c:otherwise>
	 								</c:choose>
                                <li ${liClss3}><a ${clss3} href="${d03Categories[z].fullMenuLink}">${d03Categories[z].name}</a></li>
                                </c:forEach>
                            </c:when>
                            </c:choose>
                            </ul>
                        </li>
                        </c:forEach>
                    </c:if>
                    </ul>
                </li>
                </c:forEach>
            </c:if>
			</ul>
		</div>
		<!-- gnb e --> 
	</div>
	<!-- header e -->
	<div id="maincontent">
		<div id="main_top">
			<div class="left_con">
				<div class="container_left_top">
					<h2><img src="/health/open_content/images/main/title_time.gif" alt="근무시간안내" /></h2>
						<ul class="text_titme">
							<li><img src="/health/open_content/images/main/text_titme01.gif" alt="평일 : 09~18시" /></li>
							<li><img src="/health/open_content/images/main/text_titme02.gif" alt="직장 임산부 진료 (예약제) 매월2,4주" /></li>
						</ul>
				</div>
				<div class="container_left_top_ares">
					<p class="deco_text2"><img src="/health/open_content/images/main/text_infor.gif" alt="지역주민의 건/강/증/진을 위해항상 노력하겠습니다." /></p>
					<ul class="btn_ares">
						<li><a href="#"><img src="/health/open_content/images/main/btn_infor.gif" alt="청사안내" /></a></li>
						<li><a href="#"><img src="/health/open_content/images/main/btn_map.gif" alt="오시는 길" /></a></li>
					</ul>
				</div>
				<ul class="clear"> 
					<li><a href="http://geumcheon.seouldementia.or.kr" target="_blank" title="새창열림"><img src="/health/open_content/images/main/btn_left_quick_3.gif" alt="치매지원센터" /></a></li>
					<li><a href="http://www.blutouch.net" target="_blank" title="새창열림"><img src="/health/open_content/images/main/btn_left_quick_4.gif" alt="정신보건센터" /></a></li>
				</ul>
			</div>
			<div id="popupzone" class="right_con">
				<div id="zonePannel">
					<ol id="bannerPaging">
					<c:forEach var="x" begin="1" end="${fn:length(portalAlertList)}">  
						<li><a href="#"><img src="/health/open_content/images/main/btn_popup_number_${x}_off.gif" alt="${x}번째팝업보기" /></a></li>
					</c:forEach>
					</ol>
					<ul id="controll">
						<li><a class="start" href="#"><img src="/health/open_content/images/main/controll_play.gif" alt="플레이" /></a></li>
						<li><a class="stop" href="#"><img src="/health/open_content/images/main/controll_stop.gif" alt="정지" /></a></li>
					</ul>
				</div>
				<div id="popuplist">
					<ul>
					<c:forEach items="${portalAlertList}" var="alertItem" varStatus="status">
						<li><a href="${alertItem.alert_url}" <c:if test="${alertItem.popup == 'Y'}"> target="_blank" title="새창열림" </c:if>><img src="/health/open_content/images/alert/${alertItem.img_nm}" alt="${status.count}번째팝업" /></a></li>
					</c:forEach>
					</ul>
				</div>
			</div>
		</div>

		<div id="main_center">
			<div class="main_center_search">
				<form class="main_total_search" name="frm" action="submit.jsp" onsubmit="">
					<fieldset >
						<legend>통합검색</legend>
						<label for="search_select">통합검색분류선택</label>
						<select id="search_select">
							<option>통합검색</option>
						</select>
						<label for="search_word_id">검색어입력</label>
						<input type="text" id="search_word_id" class="search_word" title="검색어" />
						<input type="image" src="/health/open_content/images/main/btn_search.gif" alt="검색" />
					</fieldset>
				</form>
				<div class="search_link">
						<h2>인기검색어 : </h2>
							<ul class="text_font">
								<li>보건,</li>
								<li>보건소,</li>
								<li>민원,</li>
								<li>건강검진</li>
							</ul>
				</div>
				<form class="main_gis_search" name="frm" action="submit.jsp" onsubmit="">
					<fieldset>
						<legend >GIS병의원/약국찾기</legend>
						<img src="/health/open_content/images/main/title_search_gs.gif" alt="GIS 병의원/약국찾기" />
						<label for="search_word2">검색어입력</label>
						<input type="text" id="search_word2" class="search_word2" />
						<input type="image" src="/health/open_content/images/main/btn_search.gif" alt="검색" />
						<input type="image" src="/health/open_content/images/main/btn_more0906.gif" alt="더보기" />
					</fieldset>
				</form>
			</div>
		</div>

		<div id="main_bottom">
			<div class="notice">
				<div id="notice_warp">
					<h2 class="text-indent">공지사항</h2>

						<div id="tab_noticewapper01">
							<h3 class="title"><a href="#tab_notice_01"><img src="/health/open_content/images/main/tab_notice_01_on.gif" alt="새소식" /></a></h3>
							<div id="tab_notice_01" style="top:0px;">
								<ul>
								<c:forEach var="result" items="${resultList}" varStatus="status">
									<li>
										<a href="/health/bbs/selectBoardArticle.do.do?bbsId=${result.bbsId}&amp;nttId=${result.nttId}&amp;categoryId=2568">
										<span class="text">
											<c:choose>
												<c:when test="${fn:length(result.nttSj) <20}" >
													<c:out value="${result.nttSj}" />
												</c:when>
												<c:otherwise>
													<c:out value="${fn:substring(result.nttSj,0,20)}" />...
												</c:otherwise>
											</c:choose>
										</span>	
										 
										<span class="date"><c:out value="${result.frstRegisterPnttm}"/></span>
										</a>
									</li>
								</c:forEach>
								</ul>
								<p class="more">
									<a href="/health/bbs/selectBoardList.do?bbsId=BBSMSTR_000000001151&amp;categoryId=2568"><img src="/health/open_content/images/main/btn_more.gif" width="27" height="5" alt="새소식더보기" /></a>
								</p>
							</div>
						</div>

						<div id="tab_noticewapper02">
							<h3 class="title"><a href="#tab_notice_02"><img src="/health/open_content/images/main/tab_notice_03_off.gif" alt="보건소식지" /></a></h3>
							<div id="tab_notice_02" style="top:0px;">
								<ul>
									<c:forEach var="result2" items="${resultList2}" varStatus="status">
									<li>
										<a href="/health/bbs/selectBoardArticle.do.do?bbsId=${result2.bbsId}&amp;nttId=${result2.nttId}&amp;categoryId=2569">
										<span class="text">
											<c:choose>
												<c:when test="${fn:length(result2.nttSj) <20}" >
													<c:out value="${result2.nttSj}" />
												</c:when>
												<c:otherwise>
													<c:out value="${fn:substring(result2.nttSj,0,20)}" />...
												</c:otherwise>
											</c:choose>
										</span>	
										
										<span class="date"><c:out value="${result2.frstRegisterPnttm}"/></span>
										</a>
									</li>
								</c:forEach>
								</ul>
								<p class="more">
									<a href="/health/bbs/selectBoardList.do?bbsId=BBSMSTR_000000001152&amp;categoryId=2569"><img src="/health/open_content/images/main/btn_more.gif" width="27" height="5" alt="새소식더보기" /></a>
								</p>
							</div>	
						</div>

						<div id="tab_noticewapper03">
							<h3 class="title"><a href="#tab_notice_03"><img src="/health/open_content/images/main/tab_notice_04_off.gif" alt="의약공람" /></a></h3>
							<div id="tab_notice_03" style="top:0px;">
								<ul>
									<c:forEach var="result3" items="${resultList3}" varStatus="status">
									<li>
										<a href="/health/bbs/selectBoardArticle.do.do?bbsId=${result3.bbsId}&amp;nttId=${result3.nttId}&amp;categoryId=2573">
										<span class="text">
											<c:choose>
												<c:when test="${fn:length(result3.nttSj) <20}" >
													<c:out value="${result3.nttSj}" />
												</c:when>
												<c:otherwise>
													<c:out value="${fn:substring(result3.nttSj,0,20)}" />...
												</c:otherwise>
											</c:choose>
										</span>	
										
										<span class="date"><c:out value="${result3.frstRegisterPnttm}"/></span>
										</a>
									</li>
								</c:forEach>	
								</ul>
								<p class="more">
									<a href="/health/bbs/selectBoardList.do?bbsId=BBSMSTR_000000001155&amp;categoryId=2573"><img src="/health/open_content/images/main/btn_more.gif" width="27" height="5" alt="새소식더보기" /></a>
								</p>
							</div>
						</div>

						<div id="tab_noticewapper04">
							<h3 class="title"><a href="#tab_notice_04"><img src="/health/open_content/images/main/tab_notice_05_off.gif" alt="식약청정보" /></a></h3>
							<div id="tab_notice_04" style="top:0px;">
								<ul>
									<c:forEach var="result4" items="${resultList4}" varStatus="status">
									<li>
										<a href="/health/bbs/selectBoardArticle.do.do?bbsId=${result4.bbsId}&amp;nttId=${result4.nttId}&amp;categoryId=2748">
										<span class="text">
											<c:choose>
												<c:when test="${fn:length(result4.nttSj) <20}" >
													<c:out value="${result4.nttSj}" />
												</c:when>
												<c:otherwise>
													<c:out value="${fn:substring(result4.nttSj,0,20)}" />...
												</c:otherwise>
											</c:choose>
										</span>	
										
										<span class="date"><c:out value="${result4.frstRegisterPnttm}"/></span>
										</a>
									</li>
								</c:forEach>
								</ul>
								<p class="more">
									<a href="/health/bbs/selectBoardList.do?bbsId=BBSMSTR_000000001163&amp;categoryId=2748"><img src="/health/open_content/images/main/btn_more.gif" width="27" height="5" alt="새소식더보기" /></a>
								</p>
							</div>							
						</div>

						<div id="tab_noticewapper05">
							<h3 class="title"><a href="#tab_notice_05" ><img src="/health/open_content/images/main/tab_notice_02_off.gif" alt="고시공고" /></a></h3>
							<div id="tab_notice_05" style="top:0px;">
								<ul>
									<c:forEach var="result5" items="${resultList5}" varStatus="status">
									<li>
										<a href="/health/bbs/selectBoardArticle.do.do?bbsId=${result5.bbsId}&amp;nttId=${result5.nttId}&amp;categoryId=2748">
										<span class="text">
											<c:choose>
												<c:when test="${fn:length(result5.nttSj) <20}" >
													<c:out value="${result5.nttSj}" />
												</c:when>
												<c:otherwise>
													<c:out value="${fn:substring(result5.nttSj,0,20)}" />...
												</c:otherwise>
											</c:choose>
										</span>	
										
										<span class="date"><c:out value="${result5.frstRegisterPnttm}"/></span>
										</a>
									</li>
								</c:forEach>
								</ul>
								<p class="more">
									<a href="/health/bbs/selectBoardList.do?bbsId=BBSMSTR_000000001163&amp;categoryId=2748"><img src="/health/open_content/images/main/btn_more.gif" width="27" height="5" alt="새소식더보기" /></a>
								</p>
							</div>								
						</div>
				</div>
				<div class="calendar_link">
					<div id="calendar_area">
						<h2><img src="/health/open_content/images/main/calender_h2.gif" alt="캘린더" /></h2>
						<div class="cal_eve">
							<h3 class="title"><a href="#edu_id"><img src="/health/open_content/images/main/title_date_1.gif" alt="교육" /></a></h3>
							${calendarStr}
							<p class="controll">
								<input type="button" value="이전달 보기" class="btn_calendar_pre" />
								<span class="now_date">2010년09월</span>
								<input type="button" value="다음달 보기" class="btn_calendar_nex" />
							</p>
						</div>
						<div class="cal_edu">
							<h3 class="title"><a href="#eve_id"><img src="/health/open_content/images/main/title_date_2.gif" alt="행사" /></a></h3>
							<table id="eve_id" width="100%" border="1" class="calendar" summary="요일별 행사 캘린더 정보제공">
								<caption>행사 캘린더</caption>
									<thead>
										<tr>
											<th scope="col"><img src="/health/open_content/images/main/date_1.gif" alt="일" /></th>
											<th scope="col"><img src="/health/open_content/images/main/date_2.gif" alt="월" /></th>
											<th scope="col"><img src="/health/open_content/images/main/date_3.gif" alt="화" /></th>
											<th scope="col"><img src="/health/open_content/images/main/date_4.gif" alt="수" /></th>
											<th scope="col"><img src="/health/open_content/images/main/date_5.gif" alt="목" /></th>
											<th scope="col"><img src="/health/open_content/images/main/date_6.gif" alt="금" /></th>
											<th scope="col"><img src="/health/open_content/images/main/date_7.gif" alt="토" /></th>
										</tr>
									</thead>
									<tbody>
										<tr>
											<td>&nbsp;</td>
											<td>1</td>
											<td>2</td>
											<td>3</td>
											<td>4</td>
											<td>5</td>
											<td>6</td>
										</tr>
										<tr>
											<td>7</td>
											<td>8</td>
											<td>9</td>
											<td>10</td>
											<td>11</td>
											<td>12</td>
											<td>13</td>
										</tr>
										<tr>
											<td>14</td>
											<td>15</td>
											<td>16</td>
											<td>17</td>
											<td>18</td>
											<td>19</td>
											<td>20</td>
										</tr>
										<tr>
											<td>21</td>
											<td>22</td>
											<td>23</td>
											<td>24</td>
											<td>25</td>
											<td>26</td>
											<td>27</td>
										</tr>
										<tr>
											<td>28</td>
											<td>29</td>
											<td>30</td>
											<td>31</td>
											<td>&nbsp;</td>
											<td>&nbsp;</td>
											<td>행사</td>
										</tr>
									</tbody>
							</table>
							<p class="controll">
								<input type="button" value="이전달 보기" class="btn_calendar_pre" />
								<span class="now_date">2010년09월</span>
								<input type="button" value="다음달 보기" class="btn_calendar_nex" />
							</p>
						</div>
					</div>
					<ul class="cont_link">
						<li><a><img src="/health/open_content/images/main/main_link01.gif" alt="식양청정보" /></a></li>
						<li><a><img src="/health/open_content/images/main/main_link02.gif" alt="가정간호의료기관" /></a></li>
					</ul>
				</div>
			</div>
		
			<div class="business">
				<div class="busi_cont">
					<h2 class="h2_float"><img src="/health/open_content/images/main/main_text_h2.gif" alt="주요사업안내" /></h2>
					<ul class="busi_list">
						<li><a href="/health/main/contents.do?categoryId=2464"><img src="/health/open_content/images/main/main_text_01.gif" alt="건강검진 바로가기" /></a></li>
						<li><a href="/health/main/contents.do?categoryId=2626"><img src="/health/open_content/images/main/main_text_02.gif" alt="모자보건 바로가기" /></a></li>
						<li><a href="/health/main/contents.do?categoryId=2627"><img src="/health/open_content/images/main/main_text_03.gif" alt="출산장려 바로가기" /></a></li>
						<li><a href="/health/main/contents.do?categoryId=2635"><img src="/health/open_content/images/main/main_text_04.gif" alt="치매관리 바로가기" /></a></li>
						<li><a href="/health/main/contents.do?categoryId=2640"><img src="/health/open_content/images/main/main_text_05.gif" alt="정신보건 바로가기" /></a></li>
						<li><a href="/health/main/contents.do?categoryId=2645"><img src="/health/open_content/images/main/main_text_06.gif" alt="방문보건 바로가기" /></a></li>
						<li><a href="/health/main/contents.do?categoryId=2648"><img src="/health/open_content/images/main/main_text_07.gif" alt="만성질환관리 바로가기" /></a></li>
						<li><a href="/health/main/contents.do?categoryId=2651"><img src="/health/open_content/images/main/main_text_08.gif" alt="방역관리 바로가기" /></a></li>
						<li><a href="/health/main/contents.do?categoryId=2657"><img src="/health/open_content/images/main/main_text_09.gif" alt="의료비지원 바로가기" /></a></li>
						<li><a href="/health/main/contents.do?categoryId=2617"><img src="/health/open_content/images/main/main_text_10.gif" alt="구강보건" /></a></li>
						<li><a href="#"><img src="/health/open_content/images/main/main_text_11.gif" alt="대사증후군" /></a></li>
                        <li><a href="#"><img src="/health/open_content/images/main/main_text_12.gif" alt="보건소이용만족도조사" /></a></li>
					</ul>
				</div>

				<div class="busi_tab" id="busi_id">
					<h2 class="text-indent">주요서비스</h2>
					<div id="busi_tabwrapper01">
						<h3 class="title"><a href="#busi_tab_cont01"><img src="/health/open_content/images/main/tab_cont_01_on.gif" alt="엄마랑 아가랑" /></a></h3>
						<ul id="busi_tab_cont01">
							<li><a href="#">임신단계별 체조</a></li>
							<li><a href="#">산전검사</a></li>
							<li><a href="#">병원진료</a></li>
							<li><a href="#">출산징후</a></li>
							<li><a href="#">출산준비물</a></li>
							<li><a href="#">출산 후 건강관리</a></li>
							<li class="back-none"><a href="#">유축기 대여</a></li>
							<li class="back-none"><a href="#">영양플러스사업</a></li>
						</ul>
					</div>

					<div id="busi_tabwrapper02">
						<h3 class="title"><a href="#busi_tab_cont02"><img src="/health/open_content/images/main/tab_cont_02_off.gif" alt="영유아" /></a></h3>
						<ul id="busi_tab_cont02">
							<li><a href="#">월령별 발달</a></li>
							<li><a href="#">소아발달표준치</a></li>
							<li><a href="#">예방접종</a></li>
							<li><a href="#">모유수유</a></li>
							<li><a href="#">응급처치</a></li>
							<li><a href="#">구강관리</a></li>
							<li class="back-none"><a href="#">영유아 건강관리</a></li>
							<li class="back-none" style="width:314px;"><a href="#">미숙아 및 선천성 이상아 지원</a></li>
						</ul>
					</div>

					<div id="busi_tabwrapper03">
						<h3 class="title"><a href="#busi_tab_cont03"><img src="/health/open_content/images/main/tab_cont_03_off.gif" alt="어린이" /></a></h3>
						<ul id="busi_tab_cont03">
							<li><a href="#">어린이 생활지침</a></li>
							<li><a href="#">어린이 안전교육</a></li>
							<li><a href="#">아토피 예방</a></li>
							<li><a href="#">알레르기</a></li>
							<li style="width:314px;"><a href="#">아토피 천식 검사</a></li>
						</ul>
					</div>

					<div id="busi_tabwrapper04">
						<h3 class="title"><a href="#busi_tab_cont04"><img src="/health/open_content/images/main/tab_cont_04_off.gif" alt="노인" /></a></h3>
						<ul id="busi_tab_cont04">
							<li><a href="#">심뇌혈관 예방관리</a></li>
							<li><a href="#">노인질병</a></li>
							<li><a href="#">치매 지원사업</a></li>
							<li><a href="#">치매 무료검진</a></li>
							<li><a href="#">치매예방 프로그램</a></li>
							<li><a href="#">경로당 순회진료</a></li>
							<li class="back-none"><a href="#">재가암 서비스</a></li>
							<li class="back-none"><a href="#">방문진료, 간호</a></li>
						</ul>
					</div>
					
				</div>

		<!-- middlecon e-->
		<div id="banner_bot" class="ad_area">
			<h2>배너존</h2>
			<div class="btn_set">
				<ul id="lbtn" class="controll">
					<li><a href="#" onclick="RollingTest2.prev(); return false;"><img src="/health/open_content/images/main/btn_prev01.gif" alt="이전" /></a></li>
					<li><a href="#" onclick="RollingTest2.play(); return false;"><img src="/health/open_content/images/main/btn_play01.gif" alt="플레이" /></a></li>
					<li><a href="#" onclick="RollingTest2.stop(); return false;"><img src="/health/open_content/images/main/btn_stop01.gif" alt="정지" /></a></li>
					<li><a href="#" onclick="RollingTest2.next(); return false;"><img src="/health/open_content/images/main/btn_next01.gif" alt="다음" /></a></li>
				</ul>
				<p><a href="#"><img src="/health/open_content/images/main/btn_more.gif" alt="모두보기" /></a></p>
			</div>
			<div class="ad_zone">
				<div id="RollingTest2" class="visible_area">
					<c:forEach items="${bannerList}" var="bannerArr1">
						<ul class="ad_list">
							<c:forEach items="${bannerArr1}" var="bannerArr2">
							<li><a href="${bannerArr2.bnr_url}" target="_blank" title="새창열림"><img src="/health/open_content/images/banner/${bannerArr2.bnr_img_nm}" width="105px" height="31px" alt="${bannerArr2.bnr_nm}(새창열림)" /></a></li>
							</c:forEach>
						</ul>
					</c:forEach>
				</div>
			</div>
			<script type="text/javascript"> 
				var RollingTest2=new _rotatecontents('RollingTest2');
				RollingTest2.rotatemethod='vertical';
				RollingTest2.initialize();
			</script>
		</div>

	</div>
	</div>

	</div>
</div>
	<div id="footer">
		<div class="area">
			<ul class="footer_menu">
				<li><a href="#"><img src="/health/open_content/images/common/footer_menu_1.gif" width="78" height="13" alt="개인정보보호방침" /></a></li>
				<li><a href="#"><img src="/health/open_content/images/common/footer_menu_2.gif" width="48" height="13" alt="저작권정책" /></a></li>
				<li><a href="#"><img src="/health/open_content/images/common/footer_menu_3.gif" width="81" height="13" alt="홈페이지 개선의견" /></a></li>
				<li><a href="#"><img src="/health/open_content/images/common/footer_menu_4.gif" width="60" height="13" alt="찾아오시는 길" /></a></li>
				<li><a href="#"><img src="/health/open_content/images/common/footer_menu_5.gif" width="58" height="13" alt="뷰어다운로드" /></a></li>
				<li class="end"><a href="#"><img src="/health/open_content/images/common/footer_menu_6.gif" width="38" height="13" alt="이용안내" /></a></li>
			</ul>
			<address>
			[153-701] 서울특별시 금천구 시흥동 1020   전화. (02)2627-2422, 2426   팩스. (02)2627-2101
			</address>
			<p class="copyright_text"> Copyright 2010 Geumcheon-Gu Public Health Center. All rights reserved.<br />
				본 웹사이트에 게시된 이메일 주소의 자동수집을 거부하며, 이를 위반 시 정보통신망법에 의해 처벌됨을 유념하시기 바랍니다. </p>
			<img class="footer_logo" src="/health/open_content/images/common/footer_logo.gif" width="130" height="32" alt="금천구 보건소" />
			<dl class="count_view">
				<dt><img src="/health/open_content/images/common/title_count_today.gif" width="24" height="9" alt="오늘 접속자" /> </dt>
				<dd class="today"><fmt:formatNumber value="${logCount.dayCount}" type="currency" pattern="#,###"/></dd>
				<dt><img src="/health/open_content/images/common/title_count_total.gif" width="24" height="9" alt="전체 접속자" /></dt>
				<dd><fmt:formatNumber value="${logCount.totalCount}" type="currency" pattern="#,###"/></dd>
			</dl>
		</div>
	</div>

<script type="text/javascript">
/*<![CDATA[*/

	var pzone = new popupzoneClass("#popupzone");
	pzone.pause = 2000;
	pzone.speed = 800;
	pzone.clickspeed = 500;
	pzone.start();

	var menu1 = new tabnavi("#notice_warp");
	var menu2 = new tabnavi("#busi_id");
	var menu3 = new tabnavi("#calendar_area");
	menu1.run();
	menu2.run();
	menu3.run();
/*]]>*/
</script>
</body>
</html>