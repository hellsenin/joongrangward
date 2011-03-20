<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<script type="text/javascript" src="/health/open_content/system/js/miya_validator.js"></script>
<script type="text/javascript" src="/health/open_content/system/js/jquery-1.4.2.js"></script>
<script type="text/javascript" src="/health/open_content/system/js/jslb_ajax.js"></script>

<script type="text/javascript">

	function selectCompanyList(obj) 
	{
		var url = "/health/freecheck/selectCompanyList.do";
		var param = "&industry_cd="+obj.value;  
		sendRequest(callbackSelectCompanyList, param, 'POST', url, true, true);
	}
	
	function callbackSelectCompanyList(oj)
	{
	    try 
	    {
	        var selectObj = document.getElementById("company");
	    	var jsonData = oj.responseText;
	        var j = eval('(' + jsonData + ')');
	        var _company = j.company;
	        if(_company)
	        {
		        var companyData = _company.split("|");;
			  	var opt = document.createElement("OPTION");
				selectObj.innerHTML = "";
			  	selectObj.options.add(opt);
			  	opt.innerText = "업소명을 선택하세요";
			  	opt.value = "";
		        
		        for(i=0;i<companyData.length;i++)
		        {
		        	var opt = document.createElement("OPTION");
		        	selectObj.options.add(opt);
		        	opt.innerText = companyData[i];
		        	opt.value = companyData[i];
		        }
	        }
	        else
	        {
			  	var opt = document.createElement("OPTION");
				selectObj.innerHTML = "";
			  	selectObj.options.add(opt);
			  	opt.innerText = "업소명을 선택하세요";
			  	opt.value = "";
	        }
	    } 
	    catch (err)
	    {
	        alert("FUNCTION : callbackSelectCompanyList() " + err.description);
	    }
	}

	function checkForm(form)
	{
		var v = new MiyaValidator(form);
	    v.add("industryCd", {
	    	required: true
	    });
	    v.add("company", {
	        required: true
	    });
	    v.add("ceoName", {
	        required: true
	    });
	    v.add("saNo", {
	        required: true
	    });

	    var result = v.validate();
	    if (!result) {
	        alert(v.getErrorMessage());
	        v.getErrorElement().focus();
	        return false;
	    } 
	    else
	    {
		    return true;
	    }

	}	

</script> 
        <form id="frm" name="frm" method="post" onsubmit="return checkForm(this);" action="/health/freecheck/login.do?categoryId=${param.categoryId}" >
		<div id="contents">
			<div id="location">HOME > 인터넷 자율점검</div>
			<h3><img src="/images/h3_01.gif" alt="인터넷 자율점검" /></h3>
				<div class="top_txt"><img src="/images/top_txt.gif" alt="의료기관 등 자율점검을 인터넷 방식으로 변경하였습니다. 의료기관 및 약국 등 각 업소 개설자(대표자)의 적극적인 협조를 부탁드리며, 발송된 공문과 서식 등을 참고하여 자율점검표를 성실히 기한 내에 입력하여 주시기 바랍니다." /></div>
				<p class="btn_ri mb15"><a href="/health/bbs/selectBoardList.do?bbsId=BBSMSTR_000000001156"><img src="/images/btn_01.gif" alt="인터넷자율점검 작성방법 보기" /></a></p>
			
			<div class="notice ">지금은 자율점검 기간이 아닙니다.</div>
			
			<h4 class="mt15">자율점검 시스템 로그인</h4>
				<div class="login_box mt15">
				<div class="btn_login"><input type="image" src="/images/btn_login.gif" alt="로그인" /></div>
					<dl>
						<dt><label for="industryCd">업종명</label></dt>
						<dd>
							<select id="industryCd" name="industry_cd" onchange="selectCompanyList(this)">
								<option>업종선택</option>
							<c:forEach var="industry" items="${industryList}">
								<option value="${industry.industryCd}">${industry.name}</option>
							</c:forEach>
							</select>
						</dd>
					</dl>
					<dl>
						<dt>업소명</dt>
						<dd>
							<select id="company" name="company" class="txt" >
								<option value="">업소명을 선택하세요</option>
							</select>
						</dd>
					</dl>
					<dl>
						<dt>대표자성명</dt>
						<dd><input id="ceoName" name="ceo_name" type="text" class="txt" /></dd>
					</dl>
					<dl>
						<dt>허가<br/>(등록&middot;신고)번호 </dt>
						<dd><input id="saNo" name="sa_no" type="text" class="txt" /></dd>
					</dl>
					
					<div class="bt_txt cb">
						<p>※ 이곳은 중랑구 내의 병&middot;의원, 약국, 의약품 도매업, 의료기기판매업, 치과기공소, 안경업소 등의 관계자 여러분들만 이용이 가능한 페이지 입니다.</p>
					</div>
				</div>
			<h4 class="mt15">자율점검 접속입력 담당자문의</h4>
				<ul class="list_01 mt10">
					<li>병&middot;의원, 안경업소, 치과기공소 담당자 :
						<ul>
							<li>김중랑 (☎ 02-123-1234),  김그린 (☎ 02-123-1234)</li>
						</ul>
					</li>
					<li>도매상, 약국, 마약류취급자, 의료기기, 한약재 담당자 : 
						<ul>
							<li>김중랑 (☎ 02-123-1234),  김그린 (☎ 02-123-1234)</li>
						</ul>
					</li>
				</ul>
		</div>
        </form>