// Place your application-specific JavaScript functions and classes here
//// This file is automatically included by javascript_include_tag :defaults

/* placeholder polyfill plugin */
/*! http://mths.be/placeholder v2.0.7 by @mathias */
//浏览器关闭监听事件
//window.onbeforeunload = function(){
//    $.ajax({
//        url: "/users/browser_out/"
//    });
//}
function province_changed(obj, city_field_id) {
    var p_id = $(obj).val();
    $('#' + city_field_id.toString()).load('/firm/firms/get_cities_options?p_id=' + p_id.toString());
}
function city_changed(obj, district_field_id) {
    var c_id = $(obj).val();
    $('#' + district_field_id.toString()).load('/firm/firms/get_district_options?c_id=' + c_id.toString());
}

function setImagePreview() {
    var docObj=document.getElementById("doc");
    var imgObjPreview=document.getElementById("preview");
    if(docObj.files && docObj.files[0]){
//火狐下，直接设img属性
        imgObjPreview.style.display = 'block';
        imgObjPreview.style.width = '200px';
        imgObjPreview.style.height = '120px';
//imgObjPreview.src = docObj.files[0].getAsDataURL();
//火狐7以上版本不能用上面的getAsDataURL()方式获取，需要一下方式
        imgObjPreview.src = window.URL.createObjectURL(docObj.files[0]);
    }else{
//IE下，使用滤镜
        docObj.select();
        var imgSrc = document.selection.createRange().text;
        var localImagId = document.getElementById("localImag");
//必须设置初始大小
        localImagId.style.width = "250px";
        localImagId.style.height = "200px";
//图片异常的捕捉，防止用户修改后缀来伪造图片
        try{
            localImagId.style.filter="progid:DXImageTransform.Microsoft.AlphaImageLoader(sizingMethod=scale)";
            localImagId.filters.item("DXImageTransform.Microsoft.AlphaImageLoader").src = imgSrc;
        }catch(e){
            alert("您上传的图片格式不正确，请重新选择!");
            return false;
        }
        imgObjPreview.style.display = 'none';
        document.selection.empty();
    }
    return true;
}
var FitWidth = 130;
var FitHeight = 110;
function ResizePic(ImgTag)
{
    var image = new Image();
    image.src = ImgTag.src;
    if(image.width>0 && image.height>0){
        if(image.width/image.height >= FitWidth/FitHeight){
            if(image.width > FitWidth){
                $(ImgTag).css({width:FitWidth.toString()+'px',height:(image.height*FitWidth)/image.width.toString()+'px'})
            } else{
                $(ImgTag).css({width:image.width.toString()+'px',height:image.height.toString()+'px'})
            }
        }
        else{
            if(image.height > FitHeight){
                $(ImgTag).css({width:(image.width*FitHeight)/image.height.toString()+'px',height:FitHeight.toString()+'px'})
            }
            else{
                $(ImgTag).css({width:image.width.toString()+'px',height:image.height.toString()+'px'})
            }
        }
    }
}
function AddFavorite(sURL, sTitle) {
    sURL = encodeURI(sURL);
    try{
        window.external.addFavorite(sURL, sTitle);
    }catch(e) {
        try{
            window.sidebar.addPanel(sTitle, sURL, "");
        }catch (e) {
            alert("加入收藏失败，请使用Ctrl+D进行添加,或手动在浏览器里进行设置.");
        }
    }
}

/*
 * Registers a callback which copies the csrf token into the
 * X-CSRF-Token header with each ajax request.  Necessary to
 * work with rails applications which have fixed
 * CVE-2011-0447
 */
//Ajax.Responders.registers({
//    onCreate: function(request) {
//        var csrf_meta_tag = $$('meta[name=csrf-token]')[0];
//
//        if (csrf_meta_tag) {
//            var header = 'X-CSRF-Token',
//                token = csrf_meta_tag.readAttribute('content');
//
//            if (!request.options.requestHeaders) {
//                request.options.requestHeaders = {};
//            }
//            request.options.requestHeaders[header] = token;
//        }
//    }
//});



function changed_first_category(obj, id_selector) {
    var first_category_val = $(obj).val();
    if (first_category_val == "" || first_category_val == undefined) {
        $('#' + id_selector).css("display", "none");
    } else {
        $('#' + id_selector).load('/site/get_categories_options/' + first_category_val.toString());
        $('#' + id_selector).css('display', 'inline-block');
    }
}

function show_dialog(id, width, height, title) {
    if ($("#" + id.toString())) {
        $("#" + id.toString()).remove();
    }

    $("body").append("<div id='" + id.toString() + "' style='padding:0'></div>");
    $("#" + id.toString()).dialog({autoOpen: true, width: width, height: height, title: title});
}

function go_url(url) {
    window.location.href = url;
}

function open_url(url) {
    window.open(url, "_blank");
}

function brow_show_category(lang) {
    if (lang == undefined || lang == '') lang = 'cn';
    show_dialog("brow_show_category", 740, 260, '选择从事职业');
    $('#brow_show_category').load('/resume/brow_show_category/?lan_type=' + lang.toString());
}

function brow_show_work_place(lang) {
    if (lang == undefined || lang == '') lang = 'cn';
    if (lang == 'cn'){
        show_dialog("brow_show_work_place", 400, 200, '选择工作地点');
    } else {
        show_dialog("brow_show_work_place", 454, 203, '选择工作地点');
    }
    $('#brow_show_work_place').load('/resume/brow_show_workplace/?lan_type=' + lang.toString())
}

function brow_show_business_scope(lang) {
    if (lang == undefined || lang == '') lang = 'cn';
    if (lang == 'cn'){
       show_dialog("brow_show_business_scope", 550, 180, '请选择公司业务领域');
    } else {
       show_dialog("brow_show_business_scope", 652, 214, '请选择公司业务领域');
    }

    $('#brow_show_business_scope').load('/resume/brow_show_business_scope/?lan_type=' + lang.toString())
}

function show_qualification(lang) {
    if (lang == undefined || lang == '') lang = 'cn';
    if (lang == 'cn') {
        show_dialog("brow_show_qualification", 550, 200, '资格证书选择');
    } else {
        show_dialog("brow_show_qualification", 704, 210, '资格证书选择');
    }


    $('#brow_show_qualification').load('/resume/brow_show_qualification?use_for_search=1&lan_type=' + lang.toString())
}

function setCookie(name, value) {
    var duration_days = 30;
    var exp = new Date();
    exp.setTime(exp.getTime() + duration_days*24*60*60*1000);
    document.cookie = name + '=' + escape(value) + ';expires=' + exp.toGMTString();
}

function getCookie(name) {
    var arr,reg=new RegExp("(^| )"+name+"=([^;]*)(;|$)");
    if(arr=document.cookie.match(reg)) {
        return unescape(arr[2]);
    }
    else {
        return null;
    }
}

function delCookie(name){
    var exp = new Date();
    exp.setTime(exp.getTime() - 1);
    var cval=getCookie(name);
    if(cval!=null) {
        document.cookie= name + "="+cval+";expires="+exp.toGMTString();
    }
}

//function input_placeholder(obj,val){
//    if(obj.value==val){
//        obj.value="";
//    }
//    obj.onblur = function(){
//        if($(obj).val()==''){
//            $(obj).val(val);
//        }else if($(obj).val()==val){
//            $(obj).val('')
//        }
//    }
//}

function load_firm_reclaim_pop(obj) {
    show_dialog("load_firm_reclaim_pop", 400, 360, "找回密码");
    $('#load_firm_reclaim_pop').load('/site/reclaim_pass')
}


// 企业用户取消收藏按钮
function quit_favorite_resume(obj, record_id) {
    $(obj).parent('span').remove();

    $.ajax({
        url: '/enterprise/manage/resumes/ ' + record_id + '/ajax_remove_favorite',
        type: 'get',
        dataType: 'json',
        data: {},
        beforeSend: function(){},
        success: function(json){}
    });
}