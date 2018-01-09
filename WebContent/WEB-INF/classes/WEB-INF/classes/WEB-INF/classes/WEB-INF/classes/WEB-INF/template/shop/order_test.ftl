<#assign s=JspTaglibs["/WEB-INF/struts-tags.tld"] />
<!DOCTYPE html >
<!--<%@ taglib prefix="s" uri="/struts-tags" %>-->
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<title>填写投保信息</title>
<meta name="Author" content="SINOSOFT Team" />
<meta name="Copyright" content="SINOSOFT" />
<link rel="icon" href="favicon.ico" type="image/x-icon" />
<link href="${base}/template/shop/css/login.css" rel="stylesheet" type="text/css" />
<link href="${base}/template/shop/css/register.css" rel="stylesheet" type="text/css" />
<link rel="stylesheet" type="text/css" href="${base}/template/shop/css/insure.css" />
<link rel="stylesheet" type="text/css" href="${base}/template/shop/css/insure_table.css" />
<link rel="stylesheet" type="text/css" href="${base}/wwwroot/kxb/style/commonality.css" />
<link rel="stylesheet" type="text/css" href="${base}/wwwroot/kxb/style/redesign/re_header.css" />

<style type="text/css">
<!--
table.datagrid3 { table-layout: fixed; } 
table.datagrid3 td {overflow:hidden; white-space:nowrap; text-overflow:ellipsis;}

.btn1_mouseout {
	 BORDER-RIGHT: #7EBF4F 1px solid; PADDING-RIGHT: 2px; BORDER-TOP: #7EBF4F 1px solid; PADDING-LEFT: 2px; FONT-SIZE: 12px; FILTER: progid:DXImageTransform.Microsoft.Gradient(GradientType=0, StartColorStr=#ffffff, EndColorStr=#B3D997); BORDER-LEFT: #7EBF4F 1px solid; CURSOR: hand; PADDING-TOP: 2px; BORDER-BOTTOM: #7EBF4F 1px solid
} 
.btn1_mouseover {
BORDER-RIGHT: #7EBF4F 1px solid; PADDING-RIGHT: 2px; BORDER-TOP: #7EBF4F 1px solid; PADDING-LEFT: 2px; FONT-SIZE: 12px; FILTER: progid:DXImageTransform.Microsoft.Gradient(GradientType=0, StartColorStr=#ffffff, EndColorStr=#CAE4B6); BORDER-LEFT: #7EBF4F 1px solid; CURSOR: hand;PADDING-TOP: 2px; BORDER-BOTTOM: #7EBF4F 1px solid
} 
label.error {   
    color: red;display: none;  font-size:12px; 
}

.btn-more{padding:10px 0}
	.btn-more label{margin:0 7px}
	.button{padding-bottom:20px;margin-top:10px;overflow:hidden;zoom:1;}
	.butL,.butM,.butS,.butB,.butMax{background-image:url(/images/buts.png);background-color:#fd623c;cursor:pointer;height:27px;line-height:26px;border:0;padding:0;font-size:14px;color:#fff;font-weight:bold;text-shadow:1px 1px #c62a0a;}
	
-->
</style>

</head>
<body onLoad="loadRelation()">
<#include "/wwwroot/kxb/block/kxb_header_index_new_v2.shtml">
<div class="wrapper">



<div class="line_log">
<div class="sdong"></div>

</div>
 
    <#if (status =="update")!>
 	<form id="orderInfoForm" action="order!bbxinfoUpdate.action?" method="post" enctype ="multipart/form-data" onsubmit="insuredAndDuty();">
 	</#if>
 	<#if (status =="")!>
 	<form id="orderInfoForm" action="order!bbxinfosave.action?" method="post" enctype ="multipart/form-data" onsubmit="insuredAndDuty();">
   </#if>
   
    <div class="line_a">
	    <div class="pri">
	    ${productName}&nbsp;&nbsp;&nbsp;
	    <span>【${insuranceCompany}】</span>  
	    &nbsp;&nbsp;&nbsp;
	    <font   color="red">
	    ￥<#if (information.protectionPeriod)??>${order.productTotalPrice}<#else>${price}</#if>
	    </font>
	    
	    </div>
    </div>
    
    <div>&nbsp;</div>
       <div class="line_a">
            <div  class="line_at">投保要素信息</div>
            <div class="form">
            	 <#if (planList.size()>0)!>
                    <p>
                        <span>投保计划</span> 
                        <select name="plan"  id="plan">
								<#list planList as list>
									<option value="${list.factorValue}">
										${list.factorDisplayValue}
									</option>
								</#list>
						 </select>
                    </p>
                 </#if>
                 
            
                 <#if (gradeList.size()>0)!>
                    <p>
                        <span>产品级别</span> 
                        <select name="grade"  id="grade">
							<#list gradeList as list>
								<option value="${list.factorValue}">
									${list.factorDisplayValue}
								</option>
							</#list>
						</select>
                    </p>
                 </#if>
                 <#if (feeYearList.size()>0)!>
					<p>
						<span>缴费年期</span>
						<select name="feeYear"  id="feeYear">
							<#list feeYearList as list>
								<option value="${list.factorValue}">
									${list.factorDisplayValue}
								</option>
							</#list>
						</select>
					</p>
				  </#if>
				  <#if (appLevelList.size()>0)!>
				      <p>
				         <span>缴费方式</span>
				         <select name="appLevel"  id="appLevel">
								<#list appLevelList as list>
									<option value="${list.factorValue}">
										${list.factorDisplayValue}
									</option>
								</#list>
						 </select>
				      </p>
				  </#if>
				  <#if (appTypeList.size()>0)!>
				      <p>
				          <span>投保类别</span>
				          <select name="appType"  id="appType">
								<#list appTypeList as list>
									<option value="${list.factorValue}">
										${list.factorDisplayValue}
									</option>
								</#list>
						  </select>
				      </p>
				  </#if>
				  <#if (periodList.size()>0)!>
				      <p>
				          <span>保险期限</span>
				          <select name="period"  id="period">
								<#list periodList as list>
									<!-- zhangjinquan 11180 bug880 通过字符串包含判断是否为选中的保险期限 2012-10-11 -->
									<#if (information.protectionPeriod)??>
											<#if (list.factorValue)?contains("-")>
												<#assign subPeriod="-"+information.protectionPeriod+(information.protectionPeriodTy?upper_case) >
												<option value="${list.factorValue}" <#if (list.factorValue?contains(subPeriod)) >selected="selected"</#if> >
											<#else>
												<#assign subPeriod=information.protectionPeriod+(information.protectionPeriodTy?upper_case) >
												<option value="${list.factorValue}" <#if (list.factorValue?index_of(subPeriod)==0) >selected="selected"</#if> >
											</#if>
									<#else>
									<option value="${list.factorValue}">
									</#if>
										${list.factorDisplayValue}
									</option>
								</#list>
						  </select>
				      </p>
				  </#if>
				 <p>
                    <span>保单起保日期:</span> 
                    <input id="effective" name="effective" type="text" onclick="WdatePicker({skin:'whyGreen',minDate:'%y-%M-{%d+1}'})"  onchange = "effchange()" value="${(information.effective)!}"  />
                 </p>
                 <p>
                    <span>保单终止日期:</span> 
                    <input id="fail" name="fail" type="text"   onclick="WdatePicker({skin:'whyGreen',minDate:'#F{$dp.$D(\'effective\')}'})" onchange = "failchange()" value="${(information.fail)!}" />
                 </p>
                 
            </div>
       </div>
       
       
       <div class="line_a">
       		<div  class="line_at">投保人信息</div>
       		<div class="form">
            <p>
               <span>投保人姓名:</span> 
               <input type="text" id="applicantName" name="informationAppnt.applicantName" value="${(informationAppnt.applicantName)!}"  class="required"  maxlength=50/>
               <label class="requireField">*</label>
           </p>
            <p>
               <span>投保人地区:</span>
               <select id="applicantArea1" name="informationAppnt.applicantArea1" onchange="getChildrenArea(this.value,'applicantArea2','-1');" style="width:125px;">
                       <option value="-1">--请选择--</option>
                       <#list areas as list>
                       	<option value="${list.get('id')}">${list.get("name")}</option>
                       </#list>
                  </select>
                  <select id="applicantArea2" name="informationAppnt.applicantArea2" class="selectTest {selectTest:false, messages: {selectTest: '请选择地区'}}" style="width:125px;">
                      <option value="-1">--请选择--</option>
                  </select>
			      <label class="requireField">*</label>
            </p>
            <p>
               <span>投保人证件类型:</span>
               <select id="applicantTypeId" name="informationAppnt.applicantIdentityType" style="width:125px;" onchange="changeVerification('applicantTypeId','applicantId','changeApplicantInF');">
                   <#list certificateCode as list>
                       <option value="${list.get('codeValue')}"  <#if (informationAppnt.applicantIdentityType==list.get('codeValue'))>selected="selected"</#if>>${list.get("codeName")}</option>
                   </#list>
				</select>
				<label class="requireField">*</label>
            </p>
            <p>
               <span>投保人证件号码:</span>   
               <input id="applicantId" name="informationAppnt.applicantIdentityId" maxlength=64 type="text" value="${(informationAppnt.applicantIdentityId)!}" name="informationAppnt.applicantIdentityId" onblur="idcheck('applicantId','applicantBirthday','applicantSex');"  class="required isIdCardNo"/>
           	   <label class="requireField">*</label>
            </p>
            <div id="changeApplicantInF" style="display:none;">
                <p>
	                 <span>投保人证件性别:</span>
		                <select id="applicantSex" name="informationAppnt.applicantSex" style="width:125px;">
		                  <#list sexs as list>
		                      <option value="${list.get('codeValue')}" <#if (informationAppnt.applicantSex==list.get('codeValue'))>selected="selected"</#if>>${list.get("codeName")}</option>
		                  </#list>
		                </select>
	                 <label class="requireField">*</label>
                </p>
                <p>
                   <span>投保人出生日期:</span> 
                   <input id="applicantBirthday" name="informationAppnt.applicantBirthday" type="text" onclick="WdatePicker({skin:'whyGreen',startDate:'1980-01-01'})"  value="${(informationAppnt.applicantBirthday)!}"  class="required"/>
                	<label class="requireField">*</label>
                </p>
            </div>
            <p>
               <span>投保人手机号码:</span>
               <input type="text" id="applicantMobile" name="informationAppnt.applicantMobile" value="${(informationAppnt.applicantMobile)!}"  class="required mobile" />
           	<label class="requireField">*</label>
			</p>
            <p>
               <span>投保人电子邮箱:</span>
               <input type="text" id="applicantMail" name="informationAppnt.applicantMail" value="${(informationAppnt.applicantMail)!}" class="required email"/>
               <label class="requireField">*</label>
           </p>
           <p>
	           <span>投保人联系地址:</span> 
	           <input type="text" id="applicantLiveAddress" maxlength=200 name="informationAppnt.applicantLiveAddress" value="${(informationAppnt.applicantLiveAddress)!}" class="required"/>
	           <label class="requireField">*</label>
	       </p>
	       <p>
	           <span>投保人邮编:</span> 
	           <input type="text" id="recognizeeZipCode1" name="informationAppnt.applicantZipCode" value="${(informationAppnt.applicantZipCode)!}" class="required zipCode"/>
	           <label class="requireField">*</label>
	       </p>
	       <p>
	            <span>投保人居住地址:</span> 
		       	<input type="text" id="recognizeeLiveAddress1" maxlength=200 name="informationAppnt.applicantLiveAddress" value="${(informationAppnt.applicantLiveAddress)!}" class="required"/>
		       	<label class="requireField">*</label>
	       </p>
      </div>
  </div>
  
  <div class="line_a">
     <div  class="line_at">被保人信息</div>
     <div class="form">
       <p>
           <span>与投保人关系:</span> 
           <select name="informationInsureds1.recognizeeAppntRelation"  id="relation1" class = "selectTest {selectTest:false, messages: {selectTest: '请选择投保人关系'}}" onchange="changeInformation(this.form,'insurancedOne');" style="width:125px;">
					<#list listRelation as list>
						<option value="${list.get('codeValue')}" <#if (informationInsureds1.recognizeeAppntRelation==list.get('codeValue'))>selected="selected"</#if>>
							${list.get("codeName")}
						</option>
					</#list>
			 </select>
			 <input type="hidden" id="relationFlag1" name="relationFlag1" value=""/>
			 <label class="requireField">*</label>
        </p>
        <p>
	    	<span>被保人职业:</span>
	         <select name="informationInsureds1.occupation1" id="s1" onchange="getChildrenOPT(this.value,'s2');" style="width:125px;_width:180px;">
	         	<option value="-1">--请选择--</option>
	         	<#list opts as list>
	         		<option value="${list.get('id')}">${list.get("name")}</option>	
	    		</#list>
	         </select> 
	         <select name="informationInsureds1.occupation2" id="s2" onchange="getChildrenOPT(this.value,'s3');" style="width:125px;_width:200px;">
	         		<option value="-1">--请选择--</option>
	         </select>
	         <select name="informationInsureds1.occupation3" id="s3" style="width:125px;_width:200px;">
	         		<option value="-1">--请选择--</option>
	         </select>
	         <label class="requireField">*</label>
	    </p>
        <div id="insurancedOne"  style="display:none;">
             <p>
                <span>被保人姓名:</span> 
                <input type="text" id="recognizeeName1" name="informationInsureds1.recognizeeName" value="${(informationInsureds1.recognizeeName)!}" maxlength=50/>
            	 <label class="requireField">*</label>
             </p>
            <p>
               <span>被保人地区:</span> 
                 <select id="insuredAreaA1" name="informationInsureds1.recognizeeArea1" onchange="getChildrenArea(this.value,'insuredAreaA2','-1');" style="width:125px;">
                       <option value="-1">--请选择--</option>
                       <#list areas as list>
                       	<option value="${list.get('id')}">${list.get("name")}</option>
                       </#list>
                  </select>
                  <select id="insuredAreaA2" name="informationInsureds1.recognizeeArea2" style="width:125px;">
                      <option value="-1">--请选择--</option>
                  </select>
                  <label class="requireField">*</label>
            </p>
            <p>
               <span>被保人证件类型:</span> 
               <select id="recognizeeTypeId1" name="informationInsureds1.recognizeeIdentityType" style="width:125px;" onchange="changeVerification('recognizeeTypeId1','recognizeeId1','changerecognizeeInF1');">
					<#list certificateCode as list>
                    <option value="${list.get('codeValue')}" <#if (informationInsureds1.recognizeeIdentityType==list.get('codeValue'))>selected="selected"</#if>>${list.get("codeName")}</option>
                </#list>
					<label class="requireField">*</label>
				</select>
				<label class="requireField">*</label>	
            </p>
            <p>
                <span>被保人证件号码:</span> 
                <input id="recognizeeId1" type="text" name="informationInsureds1.recognizeeIdentityId" value="${(informationInsureds1.recognizeeIdentityId)!}"  onblur="idcheck('recognizeeId1','recognizeeBirthday1','recognizeeSex1');"/>
            	<label class="requireField">*</label>
            </p>
            <div id="changerecognizeeInF1" style="display:none;">
	             <p>
	             	<span>被保人证件性别:</span> 
		             <select id="recognizeeSex1" name="informationInsureds1.recognizeeSex" style="width:125px;">
		             	<#list sexs as list>
		             		<option value="${list.get('codeValue')}" <#if (informationInsureds1.recognizeeSex==list.get('codeValue'))>selected="selected"</#if>>${list.get("codeName")}</option>
		             		</#list>
		             </select>
		             <label class="requireField">*</label>
	             </p>
	             <p>
	                 <span>被保人出生日期:</span> 
	                 <input id="recognizeeBirthday1" name="informationInsureds1.recognizeeBirthday"  type="text" onclick="WdatePicker({skin:'whyGreen',startDate:'1980-01-01'})"  value="${informationInsureds1.recognizeeBirthday}" />
	            	 <label class="requireField">*</label>
	             </p>
            </div>
            <p>
                <span>被保人手机号码:</span> 
                <input type="text" id="recognizeeMobile1" name="informationInsureds1.recognizeeMobile" value="${(informationInsureds1.recognizeeMobile)!}" />
                <label class="requireField">*</label>
            </p>
            <p>
                <span>被保人电子邮箱:</span> 
                <input type="text" id="recognizeeMail1" name="informationInsureds1.recognizeeMail" value="${(informationInsureds1.recognizeeMail)!}" />
            	<label class="requireField">*</label>
            </p>
            <p>
	            <span>被保人联系地址:</span> 
	            <input type="text" id="recognizeeAddress1" maxlength=200 name="informationInsureds1.recognizeeAddress" value="${(informationInsureds1.recognizeeAddress)!}"/>
	            <label class="requireField">*</label>
            </p>
            <p>
	            <span>被保人邮编:</span> 
	            <input type="text" id="recognizeeZipCode1" name="informationInsureds1.recognizeeZipCode" value="${(informationInsureds1.recognizeeZipCode)!}"/>
	            <label class="requireField">*</label>
            </p>
	        <p>
	            <span>被保人居住地址:</span> 
	        	<input type="text" id="recognizeeLiveAddress1" maxlength=200 name="informationInsureds1.recognizeeLiveAddress" value="${(informationInsureds1.recognizeeLiveAddress)!}"/>
	        	<label class="requireField">*</label>
	        </p>
        </div>
      </div>
   </div>

 <div class="line_a">
 <div  class="line_at">受益人</div>
 <div class="syr">
法定继承人<img title="点击了解什么是法定继承人" src="${base}/template/shop/images/wen_a.png"/>
     </div>
     </div>
 <div class="clear"></div>
 
 
 <div class="line_a">
     <div class="line_at">保障内容信息</div>
     <div>
     <table id="mytable" cellspacing="1" class="datagrid3"> 
     <tr> 
     <th scope="col" >保障项目</th> 
     <th scope="col" >保额</th> 
     <th scope="col" >保障内容</th> 
     </tr> 
 		<caption> </caption> 
			<#assign index = 1 />
				<#list dutyFactor as list>
					<tr  style="background-color: #EFEFEF; " >
						<td width="25%">
							${list.dudtyFactorName}
						</td>
						<td style="padding-left:135px" align="left" width="25%">
						    <#if (list.fdAmntPremList.size()>0)!>
						        <#if (list.fdAmntPremList.size()>1)>
								    <select onchange="changeAmnt('amnt${index}','amntDis${index}');">
										<#list list.fdAmntPremList as list1>
											<option value="${list1.backUp1}">
												${list1.amnt}
											</option>
										</#list>
									</select>
									<input type="hidden" id="amnt${index}" name="amnt${index}" value="${list.fdAmntPremList.get(0).backUp1}">
									<input type="hidden" id="amntDis${index}" name="amntDis${index}" value="${list.fdAmntPremList.get(0).amnt}">
								<#else>
						            <#list list.fdAmntPremList as list2>
						                ${list2.amnt}
						                <input type="hidden" id="amnt${index}" name="amnt${index}" value="${list2.backUp1}">
						                <input type="hidden" id="amntDis${index}" name="amntDis${index}" value="${list2.amnt}">
						            </#list>
						         </#if>
						    </#if>
						</td>
						<td width="25%">
						${list.define}
					</td>
						<input type="hidden" id="dutyCode${index}" name="dutyCode${index}" value="${list.dutyCode}" />
					</tr>
			<#assign index=index+1 />
				</#list>
		</table>
			</div>
			<br>
			<input type="hidden" id="dutyFactorSize" name="dutyFactorSize" value="${dutyFactor.size()}" />
 </div>
 <div class="syr2">
 <#if (loginFlag =="true")!>
 <input  id="comfirmToPay" class="butM dev_submitButton" onclick="temptorysave();" type="button" value="   暂存   " >
</#if>
 <input type="submit" value="  下一步  "  class="butM dev_submitButton" style="height=20px;width=100px;" >
 &nbsp; &nbsp; &nbsp; 

 </div>
 <div class="clear"></div>
 
        <input type="hidden" id="price"  name="price" value="<#if (information.protectionPeriod)??>${order.productTotalPrice}<#else>${price}</#if>" />
	    <input type ="hidden" name="productName" value="${productName}">
	    <input type ="hidden" name="productId" value="${productId}">
	    <input type ="hidden" name="insurType" value="${insurType}">
	    <input type ="hidden" id="orderStatus" name="orderStatus" value="${orderstatus}" />
	    <input type ="hidden"  name="insurType" value="${insurType}" />
	    <input type ="hidden"  id ="status" name="status" value="${status}" />
	    <input type ="hidden"  id ="orderId" name="orderId" value="${orderId}" />
	    <input type ="hidden"  id ="dutyReq" name="dutyReq" value="${dutyReq}" />
	    <input type ="hidden"  id ="dutyDisReq" name="dutyDisReq" value="${dutyDisReq}" />
	    <input type ="hidden"  id ="insureReq" name="insureReq" value="${insureReq}" />
	    <input type ="hidden" id="insuranceCompany" name="insuranceCompany" value="${insuranceCompany}">
	    <input type ="hidden" id="insuranceCompanySn" name="insuranceCompanySn" value="${insuranceCompanySn}">
	    <input type ="hidden" id="outRiskCode" name="outRiskCode" value="${outRiskCode}">
	    <input type ="hidden" id="protectionPeriodTy" name="protectionPeriodTy" value="${protectionPeriodTy}">
	    <input type ="hidden" id="protectionPeriodLast" name="protectionPeriodLast" value="${protectionPeriodLast}">
	    <input type ="hidden" id="protectionPeriodFlag" name="protectionPeriodFlag" value="${protectionPeriodFlag}">
 
   </form>

 <#include "/wwwroot/kxb/block/kxb_footer_new_common.shtml">
 <script type="text/javascript" src="${base}/template/shop/js/calendar.js"></script>
<script type="text/javascript" src="${base}/template/shop/js/My97DatePicker/WdatePicker.js"></script>
<script type="text/javascript" src="${base}/template/common/js/json2.js"></script>
<script type="text/javascript" src="${base}/wwwroot/kxb/js/productDuty.js"></script>

if ("${informationAppnt.applicantArea1}" != "-1")
	{
		getChildrenArea("${informationAppnt.applicantArea1}",'applicantArea2',"${informationAppnt.applicantArea2}");
	}
	if ("${informationInsureds1.recognizeeArea1}" != "-1")
	{
		getChildrenArea("${informationInsureds1.recognizeeArea1}",'insuredAreaA2',"${informationInsureds1.recognizeeArea2}");
	}
	
function idcheck(idCode,birthdayId,sexId){
    str=document.getElementById(idCode).value;
    if(str.length==15 || str.length==18){
    	if(str.length==18){
    		var sex;
    		if(str.substring(16,17)%2==0){   
    			sex = "1";   
            }else{   
            	sex = "0";   
            }   
    		var re=/\d{6}([12]\d{3})([01]\d)([0123]\d)\d{4}/;
    		var id=re.exec(str);
    		document.getElementById(birthdayId).value = id[1]+"-"+id[2]+"-"+id[3];
    		document.getElementById(sexId).value = sex;
    	}else{
    		var sex;
    		if(str.substring(14,15)%2==0){   
    			sex = "1";   
            }else{   
            	sex = "0";   
            }   
    		var year = "19"+str.substring(6, 8);      
            var month = str.substring(8, 10);      
    		var day = str.substring(10, 12);      
    		document.getElementById(birthdayId).value = year+"-"+month+"-"+day;
    		document.getElementById(sexId).value = sex;
    	}
    }   
}

 </div>
</body>
</html>