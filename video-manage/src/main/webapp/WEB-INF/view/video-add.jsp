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
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title" id="myModalLabel">视频添加</h4>
            </div>
            <div class="modal-body">
                <form class="form-horizontal" id="video_add_form">
                    <div class="form-group">
                        <label class="col-sm-2 control-label">分类</label>
                        <div class="col-sm-9">
                            <input type="text" class="form-control" name="name" id="video_add_category" placeholder="分类">
                        </div>
                    </div>
                    <div class="form-group">
                        <label  class="col-sm-2 control-label">标题</label>
                        <div class="col-sm-9">
                            <input type="text" class="form-control" name="email" id="video_add_title" placeholder="标题">
                        </div>
                    </div>
                    <div class="form-group">
                        <label  class="col-sm-2 control-label">副标题</label>
                        <div class="col-sm-9">
                            <input type="text" class="form-control" name="email" id="video_add_subtitle" placeholder="副标题">
                        </div>
                    </div>
                    <div class="form-group">
                        <label  class="col-sm-2 control-label">播放地址</label>
                        <div class="col-sm-9">
                            <input type="text" class="form-control" name="email" id="video_add_url" placeholder="播放地址">
                        </div>
                    </div>
                    <div class="form-group">
                        <label  class="col-sm-2 control-label">图片</label>
                        <div class="col-sm-9">
                            <input type="text" class="form-control" name="email" id="video_add_pic" placeholder="图片">
                        </div>
                    </div>
                    <div class="form-group">
                        <label  class="col-sm-2 control-label">图片2</label>
                        <div class="col-sm-9">
                            <input type="text" class="form-control" name="email" id="video_add_pic2" placeholder="图片">
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
                if(result.code == "200"){
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