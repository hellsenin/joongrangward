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
<h4>로그인</h4>
<div class="comment_box">
<div class="comment_box_top"></div>
<div class="comment_box_in">
	<div class="list_area">
    	<ul class="login_list">
        	<li class="tit"><img src="/health/open_content/images/comment/comment_tit_freecheck_login.gif" alt="아이디와 비밀번호를 입력해 주세요." /></li>
            <li>아이디는 영문과 숫자만 입력가능</li>
        </ul>
    </div>
    <div class="login_area">
    
        <form id="frm" name="frm" method="post" onsubmit="return checkForm(this);" action="/admin/loginPage.do" >
    
        <fieldset>
        	<div class="login">
            <ul>
                <li>
                <span style="width: 250px">
                	<label for="id"><img src="/health/open_content/images/comment/login_id.gif" alt="아이디" /></label> 
                	<input name="id" type="text" id="id" value="2010010563" class="txt" style="width:150px;"/>
                </span>					
                <span style="width: 250px">
                	<label for="password"><img src="/health/open_content/images/comment/login_pw.gif" alt="비밀번호" /></label>
                	<input name="passwd" type="password" id="password" value="680216" class="txt" style="width:150px;"/>
                </span>
                	<input type="image" src="/health/open_content/images/btn/btn_l_login.gif" alt="로그인" class="inbtn" />
                </li>	
            </ul>
            </div>
        </fieldset>	
    
        </form>

    </div>
</div>
<div class="comment_box_bottom"></div>
</div>

