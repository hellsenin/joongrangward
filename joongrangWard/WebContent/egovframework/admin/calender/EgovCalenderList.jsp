<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ page language="java" import="java.util.*" %>
<%
 /**
  * @Class Name  : EgovCcmAdministCodeList.jsp
  * @Description : EgovCcmAdministCodeList 화면
  * @Modification Information
  * @
  * @  수정일             수정자                   수정내용
  * @ -------    --------    ---------------------------
  * @ 2009.12.14   김남수              최초 생성
  *
  *  @author 공통서비스팀 
  *  @since 2009.12.14
  *  @version 1.0
  *  @see
  *  
  *  Copyright (C) 2009 by MOPAS  All right reserved.
  */
  
  int year;
  int month = 0;
  int month1 = 0;
  String strYear = null;
  String strMonth = null;

  strYear = request.getParameter("year");
  strMonth = request.getParameter("month");

  if ((strYear != null) && (strMonth != null)) {
      year = Integer.parseInt(strYear);
      month = Integer.parseInt(strMonth);
      if (month < 1) {
          month = 12;
          year = year - 1;
      }
      if (month > 12) {
          month = 1;
          year = year + 1;
      }
      strYear = Integer.toString(year);
      strMonth = Integer.toString(month);
  }

  // 현재 연월일 설정
  Calendar myCalendar = Calendar.getInstance();
  if (strYear == null) {
      year = myCalendar.get(myCalendar.YEAR);
  }
  else {
      year = Integer.parseInt(strYear);
  }
  if (strMonth == null) {
      month = myCalendar.get(myCalendar.MONTH) + 1;
  }
  else {
      month = Integer.parseInt(strMonth);
  }

  //보이고자 하는 년도,월로 이동

  myCalendar.set(myCalendar.YEAR, year);
  myCalendar.set(myCalendar.MONTH, month-1);

	String curr_url="/admin/calender/EgovCalenderList.do";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/1999/REC-html401-19991224/loose.dtd">
<html>
<head>
<title>캘린더 목록</title>
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<link rel="stylesheet" type="text/css" href="/admin/common/css/common_style.css">
<link rel="stylesheet" type="text/css" href="/admin/common/css/board.css">
<script type="text/javaScript">
<!--
/* ********************************************************
 * 등록 처리 함수 
 ******************************************************** */
 function fn_egov_addNotice(strday) {
		document.frm.action = "<c:url value='/admin/calender/addCalender.do'/>";
		document.frm.selday.value = strday;
		document.frm.submit();
	}
/* ********************************************************
 * 상세회면 처리 함수
 ******************************************************** */
function fnDetail(cal_idx) {
	document.frm.action = "<c:url value='/admin/calender/EgovCalenderRead.do'/>";
	document.frm.sel_idx.value = cal_idx;
	document.frm.submit();
}
/* ********************************************************
* 목록페이지 이동
******************************************************** */
function goCalendar() {
	   document.frm.action = "<c:url value='/admin/calender/EgovCalenderList.do'/>";
	   document.frm.submit();
	}
//-->
</script>
</head>
<DIV id="content" style="display">
<form name="frm" action="<c:url value='/admin/calender/EgovCalenderList.do'/>" method="post">
	<input name="cmd" type="hidden" value="<c:out value=''/>"/>
	<input type="hidden" name="sel_idx">
	<input type="hidden" name="selyear" value="<%=year%>" />
	<input type="hidden" name="selmonth" value="<%=month%>" />
	<input type="hidden" name="selday" value="" />
	<!-- board list start -->
		<div class="calendar">
		<table width="550" border="0" cellspacing="0" cellpadding="0">
                <tr> 
                  <td> 
				  <table height="35" width="550" border="0" cellspacing="0" cellpadding="0" background="/portal/imgs/admin_info/month_plan_bg_01.gif">
                      <tr > 
                        <td width="228">&nbsp;</td>
                        <td width="191" valign="middle"><strong>
<!-- 이전,다음 날짜계산 -->
<% 
int nYear = 0;
int nMonth = 0;
int pYear = 0;
int pMonth = 0;
	  
      if (month == 1) {
    	  pMonth = 12 ;
          pYear = year - 1 ;
          nMonth = month + 1 ;
          nYear =  year;
      }
      else if (month == 12) {
    	  nMonth = 1;
          nYear = year + 1;
          pMonth = month - 1;
          pYear = year;
      }
      else{
    	  nMonth = month + 1 ;
          nYear =  year;
          pMonth = month - 1;
          pYear = year;
      }
%>
                        <a href="<%=curr_url%>?year=<%=pYear%>&month=<%=pMonth%>"><font color="1F618B" size="3">◀</font></a> 
                          <font color="1F618B" size="3"><%=year %>년 <%=month %>월</font> <a href="<%=curr_url%>?year=<%=nYear%>&month=<%=nMonth%>"><font color="1F618B" size="3">▶</font></a></strong></td>
                        <td width="181" align="left"> <div align="center"> 
                            <select name="year" class="view" onChange="goCalendar()">
                              <option value="2003" <%if (year == 2003) out.print("selected");%>>2003</option>
                              <option value="2004" <%if (year == 2004) out.print("selected");%>>2004</option>
                              <option value="2005" <%if (year == 2005) out.print("selected");%>>2005</option>
                              <option value="2006" <%if (year == 2006) out.print("selected");%>>2006</option>
                              <option value="2007" <%if (year == 2007) out.print("selected");%>>2007</option>
                              <option value="2008" <%if (year == 2008) out.print("selected");%>>2008</option>
                              <option value="2009" <%if (year == 2009) out.print("selected");%>>2009</option>
                              <option value="2010" <%if (year == 2010) out.print("selected");%>>2010</option>
                              <option value="2011" <%if (year == 2011) out.print("selected");%>>2011</option>
                              <option value="2012" <%if (year == 2012) out.print("selected");%>>2012</option>
                            </select>
                            년 
                            <select name="month" class="view" onChange="goCalendar()">
                              <option value="1" <%if (month == 1) out.print("selected");%>>1</option>
                              <option value="2" <%if (month == 2) out.print("selected");%>>2</option>
                              <option value="3" <%if (month == 3) out.print("selected");%>>3</option>
                              <option value="4" <%if (month == 4) out.print("selected");%>>4</option>
                              <option value="5" <%if (month == 5) out.print("selected");%>>5</option>
                              <option value="6" <%if (month == 6) out.print("selected");%>>6</option>
                              <option value="7" <%if (month == 7) out.print("selected");%>>7</option>
                              <option value="8" <%if (month == 8) out.print("selected");%>>8</option>
                              <option value="9" <%if (month == 9) out.print("selected");%>>9</option>
                              <option value="10" <%if (month == 10) out.print("selected");%>>10</option>
                              <option value="11" <%if (month == 11) out.print("selected");%>>11</option>
                              <option value="12" <%if (month == 12) out.print("selected");%>>12</option>
                            </select>
                            월 </div></td>
                      </tr>
                    </table>
                    <table width="550" border="0" cellspacing="0" cellpadding="0">
                      <tr> 
                        <td height="25" width="600" background="/portal/imgs/admin_info/month_plan_bg_03.gif">&nbsp;</td>
                      </tr>
                      <tr> 
                        <td height="1" colspan="2"></td>
                      </tr>
                      <tr> 
                        <td> <table width="550" border="0" cellpadding="0" cellspacing="1" bgcolor="D8E8F1">
                            <%
    String subject = "";
	String subject2 = "";
    String contents = "";
    int i = 0;
	String sel_day = "";
	    while (true) {
		    i++;
		    myCalendar.set(myCalendar.DAY_OF_MONTH, i);
		    if (i != myCalendar.get(myCalendar.DAY_OF_MONTH)) break;
		    if (i == 1)	{
%>
                            <tr> 
                              <%
                int b = myCalendar.get(myCalendar.DAY_OF_WEEK);
                if (b == myCalendar.SUNDAY) b = 8;
			    for(int j=2; j < b; j++) { // 달력 칸 맞춤(빈칸)
%>
                              <td width="86" height="100" valign="top" bgcolor="CDE2ED"> 
                                <table width="100%" height="100%" border="0" cellpadding="3" cellspacing="0">
                                  <tr> 
                                    <td height="20" align="center" bgcolor="F7FCFF">&nbsp; 
                                    </td>
                                  </tr>
                                  <tr> 
                                    <td height="80" valign="top" bgcolor="#FFFFFF"></td>
                                  </tr>
                                </table></td>
                              <%
			    }
		    }
%>
                              <td width="86" height="100" valign="top" > 
                                <table width="100%" height="100%" border="0" cellpadding="3" cellspacing="0">
                                  <tr> 
                                    <td height="20" align="center" bgcolor="F7FCFF">  
                                     <a href="javascript:fn_egov_addNotice(<%=myCalendar.get(myCalendar.DAY_OF_MONTH)%>);"> <%=myCalendar.get(myCalendar.DAY_OF_MONTH) %></a></td>
                                  </tr>
                                  <tr> 
                                    <td height="80" valign="top" bgcolor="#FFFFFF"> 
                                      <div align="justify">  
                                      <%
                                      sel_day = Integer.toString(year) + "-" + Integer.toString(month) + "-" + myCalendar.get(myCalendar.DAY_OF_MONTH);
                                      %>
                                      <c:set var="Sel_day" value="<%=sel_day %>" />
                                      <!-- 해당날짜에 일정이 있으면 제목을 출력함-->
                                      <c:forEach var="result" items="${resultList}" varStatus="status">
                                         <c:if test="${result.cal_date == Sel_day }">
                                         <a href="javascript:fnDetail('<c:out value="${result.cal_idx}"/>')">
									  		[일정이미지]
									  	 </a>
									  	 </c:if>
                                      </c:forEach>	
                                      </div>
                                     </td>
                                  </tr>
                                </table>
                               </td>
                              <%
		    if (myCalendar.get(myCalendar.DAY_OF_WEEK) == myCalendar.SUNDAY) {
%>
                            </tr>
                            <tr> 
                              <%
		    }
	    } // end of while (true)
	if (myCalendar.get(myCalendar.DAY_OF_WEEK) != myCalendar.MONDAY) {

        for(int j=myCalendar.get(myCalendar.DAY_OF_WEEK); j <=8; j++) { // 달력 칸 맞춤(빈칸)

            if (j == 2) break;

%>
                              <td width="86" height="100" valign="top" bgcolor="CDE2ED"> 
                                <table width="100%" height="100%" border="0" cellpadding="3" cellspacing="0">
                                  <tr> 
                                    <td height="20" align="center" bgcolor="F7FCFF">&nbsp; 
                                    </td>
                                  </tr>
                                  <tr> 
                                    <td height="80" valign="top" bgcolor="#FFFFFF"> 
                                      <div align="justify"></div></td>
                                  </tr>
                                </table></td>
                              <%
        }
		out.println("                                            </tr>");
	}
%>
                          </table>
                          <br></td>
                      </tr>
                    </table>
                    </td>
                </tr>
              </table>
</div>	
</form>			
<!-- board list end //-->
</DIV>
</html>

