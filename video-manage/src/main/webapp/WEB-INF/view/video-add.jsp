<%--
  Created by IntelliJ IDEA.
  User: hongpy21691
  Date: 2020-03-08
  Time: 14:19
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set value="${pageContext.request.contextPath}" var="ctx"/>

<div class="modal fade" id="videoAddModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog" role="document" style="width:1000px" >
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title" id="myModalLabel">视频添加</h4>
            </div>
            <div class="modal-body">
                <form class="form-horizontal" id="video_add_form">
                    <div class="form-group">
                    <div class="col-md-6">
                        <div class="form-group">
                        <label class="col-md-2 control-label">分类</label>
                        <div class="col-md-9">
                            <input type="text" class="form-control" name="categoryId"  placeholder="分类">
                        </div>
                    </div>
                        <div class="form-group">
                        <label  class="col-md-2 control-label">标题</label>
                        <div class="col-md-9">
                            <input type="text" class="form-control" name="title"  placeholder="标题">
                        </div>
                    </div>
                        <div class="form-group">
                        <label  class="col-md-2 control-label">副标题</label>
                        <div class="col-md-9">
                            <input type="text" class="form-control" name="subTitle"  placeholder="副标题">
                        </div>
                    </div>
                        <div class="form-group">
                        <label  class="col-md-2 control-label">视频</label>
                        <div class="col-md-9">
                            <input type="text" class="form-control" name="url" id="video_add_url" placeholder="播放地址">
                        </div>
                    </div>
                        <div class="form-group">
                        <label  class="col-md-2 control-label">图片</label>
                        <div class="col-md-9">
                            <input type="text" class="form-control" name="pic" id="video_add_pic" placeholder="图片">
                        </div>
                    </div>
                        <div class="form-group">
                        <label  class="col-md-2 control-label">图片2</label>
                        <div class="col-md-9">
                            <input type="text" class="form-control" name="pic2" id="video_add_pic2" placeholder="图片">
                        </div>
                    </div>
                        <div class="form-group">
                            <label  class="col-md-2 control-label">描述</label>
                            <div class="col-md-9">
                                <input type="text" class="form-control" name="content" id="video_add_content" placeholder="简要描述">
                            </div>
                        </div>
                    </div>
                    <div class="col-md-6">
                        <div >
                            <div class="form-group">
                              <div class="file-loading">
                                <input id="uploadVideo" name="uploadVideos" type="file" class="file" multiple data-show-caption="true">
                              </div>
                            </div>
                        </div>
                        <div >
                            <div class="form-group">
                               <div class="file-loading">
                                 <input id="uploadFiles" name="uploadFiles" type="file" class="file" multiple data-show-caption="true">
                               </div>
                            </div>
                        </div>
                    </div>
                    </div>
                </form>

            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                <button type="button" class="btn btn-primary" id="video_save_btn">保存</button>
            </div>
        </div>
    </div>
</div>
<script>

    /**
     * 重置表单，并清空其子标签之前的样式
     */
    function form_reset(formElementId) {
        $(formElementId)[0].reset();
        // document.getElementById(formElementId).reset();
        // 清空输入框的校验状态类
        $(formElementId).find("*").removeClass("has-error has-success");
        // // 清空校验信息显示的span的内容
        $(formElementId).find(".help-block").text("");
    }

    //初始化fileinput控件（第一次初始化）
    function initFileInput(ctrlName, uploadUrl) {
        var control = $('#' + ctrlName);
        control.fileinput({
            language: 'zh', //设置语言
            uploadUrl: uploadUrl, //上传的地址
            allowedFileExtensions : ['jpg', 'png','gif'],//接收的文件后缀
            showUpload: true, //是否显示上传按钮
            showRemove:true,
            showCaption: false,//是否显示标题
            maxFileCount: 2,
            browseClass: "btn btn-primary", //按钮样式
            previewFileIcon: "<i class='glyphicon glyphicon-king'></i>",
        });

        //导入文件上传完成之后的事件
        control.on('fileuploaded', function(event, data, previewId, index){
            var response = data.response;
            $.each(response,function(id,path){//上传完毕，将文件名返回
                console.log("path:"+path.url);
                if(index==0) {
                    $("#video_add_pic").val(path.url);
                }else if(index==1) {
                    $("#video_add_pic2").val(path.url);
                }
                //$("#form").append("<input class='imgClass' name='filePath' type='hidden' value='"+path.url+"'>");
            });

        });
    }

    function initVideoInput(ctrlName, uploadUrl) {
        var control = $('#' + ctrlName);
        control.fileinput({
            dropZoneTitle : "请上传小于150M的视频！",
            uploadUrl : "uploadUrl",
            language : "zh",
            autoReplace : true,
            showCaption : false,
            showUpload : true,
            overwriteInitial : true,
            showUploadedThumbs : true,
            //showPreview:false,                   //显示上传图片的大小信息
            maxFileCount : 1,
            minFileCount:1,
            maxFileSize : 153600,//文件最大153600kb=150M
            initialPreviewShowDelete : false,
            showRemove : false,//是否显示删除按钮
            showClose : false,
            layoutTemplates : {
                actionUpload:'',
            },
            allowedFileExtensions : [ "mp4","avi","dat","3gp","mov","rmvb"],
            previewSettings : {
                image : {
                    width : "100%",
                    height : "100%"
                },
            }
        });

        //导入文件上传完成之后的事件
        control.on('fileuploaded', function(event, data, previewId, index){
            var response = data.response;
            $.each(response,function(id,path){//上传完毕，将文件名返回
                console.log("path:"+path.url);
                $("#video_add_url").val(path.url);
                //$("#form").append("<input class='imgClass' name='filePath' type='hidden' value='"+path.url+"'>");
            });
        });
    }


    //初始化
    initFileInput("uploadFiles", "${ctx}/image/upload");

    //初始化
    initVideoInput("uploadVideo", "${ctx}/image/upload");

    /**
     * 为信息新增按钮绑定点击事件
     */
    $("#video_btn_add").click(function () {
        // 打开用于新增的模态框，并设置属性，点击其他地方时此模态框不会关闭
        $("#videoAddModal").modal({
            backdrop:"static"
        });
    });

    /**
     * 为模态框中员工信息保存按钮绑定点击事件
     */
    $("#video_save_btn").click(function () {



        // 3.发送保存请求
        $.ajax({
            url:"${ctx}/video/save",
            type:"POST",
            // jquery提供的将表单数据序列化，作为ajax传输时的参数
            data:$("#videoAddModal form").serialize(),
            success:function (result) {
                // alert(result.msg);
                // 保存成功
                if(result.status == "200"){
                    // 保存成功后，关闭模态框，清除上一次的数据，跳转到最后一页
                    $('#videoAddModal').on('hidden.bs.modal', function () {
                        form_reset("#video_add_form");
                    });
                    $('#videoAddModal').modal('hide');
                }else{

                }
            }
        });
    });
</script>
