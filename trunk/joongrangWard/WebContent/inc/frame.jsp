<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD html 4.0 Transitional//EN">
<html>
 <head>
  <TITLE>서울 중랑구 의약업소 자율점검 시스템</TITLE>
  <meta name="Generator" content="EditPlus">
  <meta name="Author" content="JUNGNANG-GU">
  <meta name="Keywords" content="JUNGNANG-GU">
  <meta name="Description" content="서울 중랑구 의약업소 자율점검 시스템 홈페이지 입니다.">
  <meta name="copyright" content="copyrights 중랑구청">

  <link href="/css/common.css" rel="stylesheet" type="text/css" />

 </head>

 <body>

	<div id="wrap">
		<div id="headermain">
			<h1><a href="#"><img src="/images/top_logo.gif" width="293" height="35" alt="서울 중랑구 의약업소 자율점검 시스템" /></a></h1>
			<div id="gnb">
					<div class="top_menu">
							<h2><a href="/health/freecheck/list.do" ><img src="/images/top_menu_on_01.gif" alt="인터넷자율점검" /></a></h2>
							<h2><a href="#" ><img src="/images/top_menu_off_02.gif" alt="자율점검서식" /></a></h2>
							<h2><a href="#" ><img src="/images/top_menu_off_03.gif" alt="자율점검작성방법" /></a></h2>
					</div>
			</div>

			<div class="img_txt"><img src="/images/visual_txt.gif" alt="중랑구청 의약업소 자율점검 시스템 홈페이지입니다." /></div>
		</div>
		<!-- 컨텐츠 시작 -->		
		<jsp:include page="${includePage}" flush="true" />
		<!-- 컨텐츠 끝 -->
	</div>
	<!-- 푸터 -->
	<div id="footer">
		<p class="logo"><img src="/images/foot_logo.gif" alt="중랑구청 로고" /></p>
			<div>
				<p class="add">서울특별시 중랑구 봉화산로 179(신내동)  ☎ 문의사항 : 보건소 02) 2094 - 0710</p>
				<p class="copy">JUNGNANG-GU OFFICE ALL Rights RESERVED.</p>
			</div>
	</div>




  
 </body>
</html>
