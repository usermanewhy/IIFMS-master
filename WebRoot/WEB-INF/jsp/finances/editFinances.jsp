<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
    <title>新增/修改财物</title>
    <%@include file="/WEB-INF/jsp/common/common.jsp" %>
    <style type="text/css">
	*{
		margin-bottom:5px;
	}
	.float_div
	{
		position:absolute;
		z-index:100;
		margin-left: 50px;
		background: url(../upload/images/bgblack.png);
		font-size: 12px;
		text-align: center;
		color: #fff;
		width: 124px;
    	height: 20px;
    	margin-bottom: 10px;
    	margin-left: 5px;
    	margin-top: -25;
    	cursor:pointer;
		}
</style>
    <link rel="stylesheet" type="text/css" href="http://www.java1234.com/jquery-easyui-1.3.3/themes/icon.css">
    <link rel="stylesheet" type="text/css" href="http://www.java1234.com/jquery-easyui-1.3.3/demo/demo.css">

</head>
<body>
<form id="edit" name="editForm" method="post" enctype="multipart/form-data" >

    <input type="submit" class="t_btnsty02" id="saveBtn" value="保存">
    <input type="button" id="cancel" class="t_btnsty02" onclick="cancelAddOrEdit();" value="取消">
    <input type="hidden" name="id" id="id" value="${finances.id}">
    <input type="hidden" name="fromSource" id="fromSource" value="${fromSource}"/>
    <input type="hidden" name="caseId" id="caseId" value="${finances.cases.id}"/>
    <br>
    <table border="0">
        <tr>
            <td class="tr" width=100><span class="t_span01">案件名称：</span></td>
            <td>
                <input class="easyui-validatebox t_text w180" data-options="required:true,missingMessage:'请输入案件名称'"
                       name="caseName" type="text" value="${finances.cases.caseName}" readonly="readonly"/><span class="t_span02">*</span>
            </td>
            <td><input type="button" class="t_btnsty01" id="toSelectCase" onclick="toSelectCases()" value="选择"></td>
            <td class="tr" width=100><span class="t_span01">案件编号：</span></td>
            <td>
                <input class="easyui-validatebox t_text w180" data-options="required:true,missingMessage:'请输入案件编号'"
                       name="caseNum" type="text" value="${finances.cases.caseNum}" readonly="readonly"/><span class="t_span02">*</span>
            </td>
            <td><input type="button" class="t_btnsty01" id="toAddCase" onclick="toAddCases()" value="添加"></td>
        </tr>
        <tr>
            <td class="tr" width=100><span class="t_span01">财物名称：</span></td>
            <td colspan="2">
                <input class="easyui-validatebox t_text w180" data-options="required:true,missingMessage:'请输入财物名称'"
                       name="financeName" type="text" value="${finances.financeName}"/><span class="t_span02">*</span>
            </td>
            <td class="tr" width=100><span class="t_span01">财物种类：</span></td>
            <td colspan="2">
                <input type="hidden" name="financeTypeHid" id="financeTypeHid" value="${finances.financeType}">
                <select class="w180" name="financeType" id="financeType" required="true">
                    <option value="">请选择</option>
                    <c:forEach items="${financeTypeList}" var="object">
                        <option value="${object.key}">${object.value}</option>
                    </c:forEach>
                </select>
                <span class="t_span02">*</span>
            </td>
        </tr>
        <tr>
            <td class="tr" width=100><span class="t_span01">财物编号：</span></td>
            <td colspan="2">
                <input class="easyui-validatebox t_text w180" data-options="" name="financeNum" type="text"
                       value="${finances.financeNum}"/>
            </td>
            <td class="tr" width=100><span class="t_span01">财物来源：</span></td>
            <td colspan="2">
                <input type="hidden" name="financeSourceHid" id="financeSourceHid" value="${finances.financeSource}">
                <select class="w180" name="financeSource" id="financeSource">
                    <option value="">请选择</option>
                    <c:forEach items="${financeSourceList}" var="object">
                        <option value="${object.key}">${object.value}</option>
                    </c:forEach>
                </select>
            </td>
        </tr>
        <tr>
            <td class="tr" width=100><span class="t_span01">查获人：</span></td>
            <td colspan="2">
                <input class="easyui-validatebox t_text w180" data-options="" name="seizedMan" type="text"
                       value="${finances.seizedMan}"/>
            </td>
            <td class="tr" width=100><span class="t_span01">来源单位：</span></td>
            <td colspan="2">
                <input type="hidden" name="sourceOfficeHid" id="sourceOfficeHid" value="${finances.sourceOffice}">
                <select class="w180" name="sourceOffice" id="sourceOffice">
                    <option value="">请选择</option>
                    <c:forEach items="${sourceOfficeList}" var="object">
                        <option value="${object.key}">${object.value}</option>
                    </c:forEach>
                </select>
            </td>
        </tr>
        <tr>
            <td class="tr" width=100><span class="t_span01">查获时间：</span></td>
            <td colspan="3">
                <div id="test1">
                    <input class="easyui-datetimebox w180" data-options="" name="seizedTimeStart" id="seizedTimeStart"
                           type="text" value="${finances.seizedTimeStart}"/><span class="t_span01">起</span>
                    <!-- <input type="button" class="t_btnsty01" id="changeTimeStart1" value="模糊"/> -->
                </div>
                <div id="test2" hidden="true">
                    <input class="easyui-datebox w180" data-options="" name="seizedTimeStart" id="seizedTimeStart"
                           type="text" value="${finances.seizedTimeStart}"/><span class="t_span01">起</span>
                    <input type="button" class="t_btnsty01" id="changeTimeStart2" value="精确"/>
                </div>
            </td>
            <td colspan="2">
                <input class="easyui-datetimebox w180" data-options="" name="seizedTimeEnd" id="seizedTimeEnd"
                       type="text" value="${finances.seizedTimeEnd}"/><span class="t_span01">止</span>
            </td>
        </tr>
        <tr>
            <td class="tr" width=100><span class="t_span01">财物说明：</span></td>
            <td colspan="5">
                <input class="easyui-validatebox t_text w520" data-options="" name="financeDesc" type="text" value="${finances.financeDesc}"/>
            </td>
        </tr>
        <tr>
            <td class="tr" width=100><span class="t_span01">备注：</span></td>
            <td colspan="5">
                <input class="easyui-validatebox t_text w520" data-options="" name="financeMemo" type="text" value="${finances.financeMemo}"/>
            </td>
        </tr>
        <tr>
            <td class="tr" width=100><span class="t_span01">财物照片：</span></td>
            <td colspan="4" class="t_text w520">
                <div id="dd" style=" width:520px;" class="">
                <!-- 图片start -->              
                <c:forEach items="${financesImg}" var="image">
                <div style="float:left"> 
	                <img id="img${image.id}" src="http://localhost:8080/IIFMS${image.imageUrl}" style="display: block; width: 124px; height: 150px; margin-top: 5px; margin-left: 5px;">
	                <div class="float_div" onclick="remmoveServerImg(this,'${image.id}')">
	                	<span>移除</span>
	                </div> 
                </div>        
				</c:forEach>
				 <!-- 图片End -->
                </div>
                          
	            </td>
            <td>
                <input type="submit" class="t_btnsty01" id="capturePicture" onclick="takePhoto()" value="拍照"><br>
                <!--<input type="file" class="t_btnsty01" id="importPicture"    accept="image/*" multiple="multiple" onchange="uploadImage()" value="导入"  style="width:70px"><br>-->
                <input type="file" class="t_btnsty01" id="doc" accept="image/*" multiple="multiple" onchange="javascript:setImagePreviews();" value="${finances.financeMemo}" style="width:150px;"  name="file" /><br>
                <input type="button" class="t_btnsty01" id="removePicture" value="移除" onclick="remmoveAllImg()">
            </td>
        </tr>
        <tr>
            <td class="tr" width=100><span class="t_span01">存放位置：</span></td>
            <td colspan="4">
                <input class="easyui-validatebox t_text w520" data-options="" name="storeLocation" type="text"
                       value="${finances.storeLocation}"/>
            </td>
            <td><input type="button" class="t_btnsty01" id="chooseLocation" value="选择" onclick="chooseStorage()"></td>
        </tr>
        <tr>
            <td class="tr" width=100><span class="t_span01">财物识别码：</span></td>
            <td colspan="4">
                <input class="easyui-validatebox t_text w520" data-options="" name="financeCode" type="text"
                       value="${finances.financeCode}"/>
            </td>
            <td><input type="submit" class="t_btnsty01" id="print" value="打印"></td>
        </tr>
        <tr>
            <td class="tr" width=100><span class="t_span01">电子识别码：</span></td>
            <td colspan="4">
                <input class="easyui-validatebox t_text w520" data-options="" name="digitalCode" type="text"
                       value="${finances.digitalCode}"/>
            </td>
            <td><input type="submit" class="t_btnsty01" id="write" value="写入"></td>
        </tr>
    </table>
</form>

<%--案件列表--%>
<div id="selectCase" class="easyui-window" title="案件信息" data-options="modal:true,closed:true,iconCls:'icon-save'" style="width: 480px; height: 340px; padding: 20px;">
    <iframe id="frame_selectCase" width="400" height="270" scrolling="no" src="" frameborder="0"> </iframe>

</div>
<%--添加案件--%>
<div id="addCase" class="easyui-window" title="新增案件信息" data-options="modal:true,closed:true,iconCls:'icon-save'" style="width: 600px; height: 500px; padding: 20px;">
    <iframe id="frame_addCase" width="520" height="404" scrolling="no" src="" frameborder="0"> </iframe>
</div>

<div id="addStorage" class="easyui-window" title="选择存储位置" data-options="modal:true,closed:true,iconCls:'icon-save'" style="width: 710px; height: 500px; padding: 20px;">
    <iframe id="frame_addStorage" width="680" height="400" scrolling="no" src="" frameborder="0"> </iframe>
</div>

<script type="text/javascript">
    $(document).ready(function () {
        // 财物来源
        var financeSourceValue = $("#financeSourceHid").val();
        $("#financeSource").val(financeSourceValue);
        // 来源单位
        var sourceOfficeValue = $("#sourceOfficeHid").val();
        $("#sourceOffice").val(sourceOfficeValue);
        // 财物种类
        var financeTypeValue = $("#financeTypeHid").val();
        $("#financeType").val(financeTypeValue);

        // 初始化第二个隐藏时间控件的值
        $("input[textboxname='seizedTimeStart']:eq(1)").attr("value", "");
        $("#test2").hide();
        $("#changeTimeStart1").click(function () {
            $("input[textboxname='seizedTimeStart']").attr("value", "");
            $("input[name='seizedTimeStart']").attr("value", "");
            $("#test1").hide();
            $("#test2").show();
        });
        $("#changeTimeStart2").click(function () {
            $("input[textboxname='seizedTimeStart']").attr("value", "");
            $("input[name='seizedTimeStart']").attr("value", "");
            $("#test2").hide();
            $("#test1").show();
        });
    });


    //表单提交
    $('#edit').form({
        url: '${path}/finances/saveFinances.action',
        onSubmit: function () {
        	var startseizedTime = $("input[name='seizedTimeStart']").val();
	        var endseizedTime = $("input[name='seizedTimeEnd']").val();
	        if(startseizedTime>endseizedTime) {
	        	alert("查获开始时间不能早于查获结束时间");
	        	return false;
	        }
            return $(this).form('validate');
        },
        success: function (returnData) {
            data = JSON.parse(returnData); // 转换成json对象
            if (data.status == "success") {
                parent.alertInfo(data.data);
                if(!($("#fromSource").val() == '')) {
                	parent.afterCloseFinPage();
                	return true;
                }
                if ($("#id").val() == '') {
                    parent.afterCloseAddWindow();
                } else {
                    parent.afterCloseEditWindow();
                }
            } else if (data.status = "fail") {
                alertInfo(data.data);
            } else {
                alertInfo("未知错误");
            }
        }
    });
    function setVal() {
        if (true == $("#isMurder").is(':checked')) {
            $("#isMurder").attr("value", "1");
        } else {
            $("#isMurder").attr("value", "0");
        }
    }

    // 取消新增或修改操作
    function cancelAddOrEdit() {
    	if(!($("#fromSource").val() == '')) {
        	parent.afterCloseFinPage();
        	return;
        }
    	
        if ($("#id").val() == '') {
            parent.afterCloseAddWindow();
        } else {
            parent.afterCloseEditWindow();
        }
    }
    
  	// 案件信息
	function toSelectCases(){
		// 添加iframeSrc
		$("#frame_selectCase").attr("src", "${path}/cases/toSelectCase.action");
		// 打开弹出框
		$("#selectCase").window('open');
		adjustTanboxCenter(); // 弹窗位置居中
	}
  	
	function handleSelectCase(data) {
		$("input[name='caseName']").attr("value", data.caseName);
		$("input[name='caseNum']").attr("value", data.caseNum);
        $("input[name='caseId']").attr("value", data.id);

		afterCloseSelectWindow();
	}

	function handleAddCaseBack(caseId,caseName, caseNum) {
		$("input[name='caseName']").attr("value", caseName);
		$("input[name='caseNum']").attr("value", caseNum);
        $("input[name='caseId']").attr("value", caseId);

		afterCloseAddCases();
	}
	
	// 修改之后返回
	function afterCloseSelectWindow() {
		$("#selectCase").window('close');
	}
	
	// 新增案件信息跳转
	function toAddCases() {
		// 添加iframeSrc
		$("#frame_addCase").attr("src", "${path}/cases/toEditCases.action?fromSource="+"editFinances");
		// 打开弹出框
		$("#addCase").window('open');
		adjustTanboxCenter(); // 弹窗位置居中
	}
	
	// 添加之后返回
	function afterCloseAddCases() {
		$("#addCase").window('close');
	}

	// 选择存储位置
    function chooseStorage(){
        // 添加iframeSrc
        $("#frame_addStorage").attr("src", "${path}/storage/toSelectStorage.action");
        // 打开弹出框
        $("#addStorage").window('open');
        adjustTanboxCenter(); // 弹窗位置居中
    }


    function uploadImage(){
        var imagePath=$('#doc').val();
        if(!imagePath){
            alert('请上传文件！');
            return;
        }
        //判断上传文件的后缀名
        var strExtension = imagePath.substr(imagePath.lastIndexOf('.') + 1);
        if (strExtension != 'jpg' && strExtension != 'gif'
            && strExtension != 'png' && strExtension != 'bmp') {
            alert("请选择图片文件");
            return;
        }
        debugger;
        //alert(imagePath);
        var formData = new FormData($( "#editUpload" )[0]); 
        //获取上传的路径      
        $.ajax({
             url: '${path}/finances/upload.action' ,  
             type: 'POST',  
             data: formData,  
             async: false,  
             cache: false,  
             contentType: false,  
             processData: false,  
             success: function (data) {  
             alert("上传成功");  
          },
            error: function(XMLHttpRequest, textStatus, errorThrown) {
                alert("上传失败，请检查网络后重试");
            }
        });
    }

    function handleSelectStorage(data) {
		$("input[name='storeLocation']").attr("value", data.name);
		afterCloseSelectStorageWindow();
	}
	
	// 选择之后返回
	function afterCloseSelectStorageWindow() {
		$("#addStorage").window('close');
	}
	
	function takePhoto() {
		//弹出高拍仪控件，返回图片物理路径跟图片base64编码
		window.open("${path}/resources/html/eloamScan.html","","width=600px; height=800px;");	
	}
	
</script>

<!--Test imgUpload-->
<script type="text/javascript">

    //下面用于多图片上传预览功能

    function setImagePreviews(avalue) {

        var docObj = document.getElementById("doc");

        var dd = document.getElementById("dd");

        //dd.innerHTML = "";

        var fileList = docObj.files;

        for (var i = 0; i < fileList.length; i++) {            



            dd.innerHTML += "<div style='float:left' > <img  id='img" + i + "'  /> <div class='float_div' onclick='removeImg(this)'><span>移除</span></div> </div> ";

            var imgObjPreview = document.getElementById("img"+i); 

            if (docObj.files && docObj.files[i]) {

                //火狐下，直接设img属性

                imgObjPreview.style.display = 'block';

                imgObjPreview.style.width = '124px';

                imgObjPreview.style.height = '150px';
                
                imgObjPreview.style.marginTop='5px';
                
                imgObjPreview.style.marginLeft='5px';

                //imgObjPreview.src = docObj.files[0].getAsDataURL();

                //火狐7以上版本不能用上面的getAsDataURL()方式获取，需要一下方式

                imgObjPreview.src = window.URL.createObjectURL(docObj.files[i]);

            }
            

            else {

                //IE下，使用滤镜

                docObj.select();

                var imgSrc = document.selection.createRange().text;

                alert(imgSrc)

                var localImagId = document.getElementById("img" + i);

                //必须设置初始大小

                localImagId.style.width = "150px";

                localImagId.style.height = "180px";

                //图片异常的捕捉，防止用户修改后缀来伪造图片

                try {

                    localImagId.style.filter = "progid:DXImageTransform.Microsoft.AlphaImageLoader(sizingMethod=scale)";

                    localImagId.filters.item("DXImageTransform.Microsoft.AlphaImageLoader").src = imgSrc;

                }

                catch (e) {

                    alert("您上传的图片格式不正确，请重新选择!");

                    return false;

                }

                imgObjPreview.style.display = 'none';

                document.selection.empty();

            }

        }  
        //uploadImage();
        return true;
    }

	//本地删除图片;	
	function removeImg (el) {
		el.parentElement.remove();		
	}

	//删除服务器图片
	function remmoveServerImg(el,id){
		 //获取上传的路径   
		var el = el;//获取当前图片的DOM
		 //获取上传的路径   
		 $.post("${path}/finances/remmoveImg.action", {
               imgId : id
           }, function(data, textStatus) {
        	   if(data == "true" ){
        		   removeImg (el);
        		   alert('移除成功');
        	   }else{
        		   alert('移除失败，请检查网络');
        	   }
           	
           });	
	}
	function remmoveAllImg(){
		$('.float_div').trigger("click");
	}
</script>

</body>
</html>