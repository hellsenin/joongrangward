<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<script type="text/javascript" src="/health/open_content/system/js/miya_validator.js"></script>

<script type="text/javascript">

	function checkForm(form) {
		var v = new MiyaValidator(form);
		
	    v.add("id", {
	    	required: true
	    });

	    v.add("passwd", {
	        required: true
	    });

	    var result = v.validate();
	    if (!result) {
	        alert(v.getErrorMessage());
	        v.getErrorElement().focus();
	        return false;
	    } 
	    else {
		    return true;
	    }
	}	

</script> 
<link href="/css/login.css" rel="stylesheet" type="text/css" media="screen" />
<dl id="login_Header">
  <dt><img src="/images/top_logo.gif" alt="서울중랑구 의약업소 자율점검 시스템" /></dt>
  <dd><strong><span>서울중랑구 의약업소 자율검검 시스템</span> 관리자 전용</strong> 페이지 입니다.</dd>

</dl>

<form id="frm" name="frm" method="post" onsubmit="return checkForm(this);" action="/admin/login.do" >
<div class="login_Bg">
  <p><img src="/images/admin/login_img_01.gif" width="302" height="55" alt="현재 보고 계신 페이지는 관리자 전용 페이지 입니다." /></p>
  <div class="login_Wrap">
    <div class="wrap_1000" style="background-color: #fff;">
      <p><img src="/images/admin/login_img_02.gif" width="435" height="195" alt="관리자 아이디로 로그인 하시기 바랍니다." /></p>
      <fieldset>
        <ul>
          <li>

            <label for="id"><img src="/images/admin/label_id.gif" width="54" height="11" alt="아이디" /></label>
            <input name="id" type="text" id="id" value="admin" class="txt txt_input" />
          </li>
          <li>
            <label for="password"><img src="/images/admin/label_pw.gif" width="54" height="11" alt="비밀번호" /></label>
            <input type="password" class="txt_input" name="passwd" id="password" title="비밀번호" value="admin"/>
          </li>
        </ul>
        <input type="image" src="/images/admin/btn_login.gif" class="login_btn" />

      </fieldset>
    </div>
  </div>
</div>
</form>

<div id="login_Footer">Copyright(C) <span>서울중랑구 의약업소 자율점검 시스템</span>. All Rights Reserved.</div>