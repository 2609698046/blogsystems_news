<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<!doctype html>
<html>
<head>
    <meta charset="utf-8">
    <title>博主信息-于初个人博客后台管理</title>
    <meta name="renderer" content="webkit|ie-comp|ie-stand">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport"
          content="width=device-width,initial-scale=1,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no"/>
    <meta http-equiv="Cache-Control" content="no-siteapp"/>
    <meta name="keywords" content="个人博客,于云阔个人博客,个人博客系统,于初博客,于云阔">
    <meta name="description" content="于初博客系统，一个站在java开发之路上的草根程序员个人博客网站。">
    <LINK rel="Bookmark" href="${ctx}/favicon.ico">
    <LINK rel="Shortcut Icon" href="${ctx}/favicon.ico"/>
    <link rel="apple-touch-icon-precomposed" href="${ctx}/assets/i/app-icon72x72@2x.png">
    <meta name="apple-mobile-web-app-title" content="Amaze UI"/>
    <link rel="stylesheet" href="${ctx}/assets/css/amazeui.min.css"/>
    <link rel="stylesheet" href="${ctx}/assets/css/admin.css">
    <link rel="stylesheet" href="${ctx}/assets/css/app.css">
    <script src="${ctx}/js/jquery.slim.min.js"></script>
    <script type="text/javascript" src="${ctx}/js/wangEditor.min.js"></script>
</head>

<body data-type="generalComponents">


<!--头部-->
<jsp:include page="comm/header.jsp"/>

<div class="tpl-page-container tpl-page-header-fixed">
    <div class="tpl-left-nav tpl-left-nav-hover">
        <div class="tpl-left-nav-title">
            Blog`于初博客
        </div>
        <div class="tpl-left-nav-list">
            <ul class="tpl-left-nav-menu">
                <li class="tpl-left-nav-item">
                    <a href="${ctx}/admin/main" class="nav-link">
                        <i class="am-icon-home"></i>
                        <span>首页</span>
                    </a>
                </li>
                <li class="tpl-left-nav-item">
                    <a href="${ctx}/admin/article/search?word=" class="nav-link tpl-left-nav-link-list">
                        <i class="am-icon-file-powerpoint-o"></i>
                        <span>博客管理</span>
                    </a>
                </li>
                <li class="tpl-left-nav-item">
                    <a href="${ctx}/boardCheck" class="nav-link tpl-left-nav-link-list">
                        <i class="am-icon-comment"></i>
                        <span>留言管理</span>

                        <c:if test="${boardCount !=0}">
                            <i class="tpl-left-nav-content tpl-badge-danger">
                                    ${boardCount}
                            </i>
                        </c:if>
                    </a>
                </li>

                <!-- 电影管理 -->
                <li class="tpl-left-nav-item">
                    <a href="javascript:;" class="nav-link tpl-left-nav-link-list">
                        <i class="am-icon-group"></i>
                        <span>电影管理</span>
                        <i class="am-icon-angle-right tpl-left-nav-more-ico am-fr am-margin-right"></i>
                    </a>
                    <ul class="tpl-left-nav-sub-menu" style="display: block;">
                        <li>
                            <a href="${ctx }/movie_manager?categoryId=&categoryName=">
                                <i class="am-icon-angle-right"></i>
                                <span>电影列表</span>
                                <i class="am-icon-star tpl-left-nav-content-ico am-fr am-margin-right"></i>
                            </a>
                            <a href="${ctx}/movie_add" class="nav-link">
                                <i class="am-icon-angle-right"></i>
                                <span>发布电影</span>
                            </a>
                        </li>
                    </ul>
                </li>
                <!--end 电影管理 -->

                <!-- 电影分类 -->

                <li class="tpl-left-nav-item">
                    <a href="${ctx}/category_manager" class="nav-link tpl-left-nav-link-list">
                        <i class="am-icon-reorder"></i>
                        <span>分类管理</span>
                    </a>
                </li>
                <!--end 电影分类 -->

                <li class="tpl-left-nav-item">
                    <a href="javascript:;" class="nav-link tpl-left-nav-link-list">
                        <i class="am-icon-wpforms"></i>
                        <span>其他</span>
                        <i class="am-icon-angle-right tpl-left-nav-more-ico am-fr am-margin-right tpl-left-nav-more-ico-rotate"></i>
                    </a>
                    <ul class="tpl-left-nav-sub-menu" style="display: block;">
                        <li>
                            <a href="${ctx}/lable_manager">
                                <i class="am-icon-angle-right"></i>
                                <span>标签云</span>
                                <i class="am-icon-star tpl-left-nav-content-ico am-fr am-margin-right"></i>
                            </a>

                            <a href="${ctx}/link_manager">
                                <i class="am-icon-angle-right"></i>
                                <span>友情链接</span>
                            </a>

                            <a href="${ctx}/admin/bloger_manager" class="nav-link active">
                                <i class="am-icon-angle-right"></i>
                                <span>博主信息</span>
                            </a>
                        </li>
                    </ul>
                </li>
            </ul>
        </div>
    </div>


    <div class="tpl-content-wrapper">
        <div class="tpl-portlet-components">
            <div class="portlet-title">
                <div class="caption font-green bold">
                    <span class="am-icon-user"></span> 博主信息
                </div>
                <div class="tpl-portlet-input tpl-fz-ml">
                    <div class="portlet-input input-small input-inline">
                        <div class="input-icon right">
                            <i class="am-icon-search"></i>
                            <input type="text" class="form-control form-control-solid" placeholder="搜索..."></div>
                    </div>
                </div>
            </div>

            <div class="tpl-block">

                <div class="am-g">
                    <div class="tpl-form-body tpl-form-line">
                        <form class="am-form tpl-form-line-form" action="${ctx}/admin/updateBloger"
                              onsubmit="return sub()" method="post">
                            <input type="hidden" name="id" value="${bloger.id}"/>
                            <div class="am-form-group">
                                <label for="title" class="am-u-sm-3 am-form-label">博主姓名 <span
                                        class="tpl-form-line-small-title">Name</span></label>
                                <div class="am-u-sm-9">
                                    <input type="text" class="tpl-form-input" id="title" name="name"
                                           value="${bloger.name}" placeholder="博主姓名">
                                </div>
                            </div>
                            <div class="am-form-group">
                                <label for="title" class="am-u-sm-3 am-form-label">博主职业 <span
                                        class="tpl-form-line-small-title">ZhiYE</span></label>
                                <div class="am-u-sm-9">
                                    <input type="text" class="tpl-form-input" id="zhiye" name="zy" value="${bloger.zy}"
                                           placeholder="博主职业">
                                </div>
                            </div>
                            <div class="am-form-group">
                                <label for="title" class="am-u-sm-3 am-form-label">博主邮箱 <span
                                        class="tpl-form-line-small-title">Email</span></label>
                                <div class="am-u-sm-9">
                                    <input type="text" class="tpl-form-input" id="email" name="email"
                                           value="${bloger.email}" placeholder="博主邮箱">
                                </div>
                            </div>
                            <div class="am-form-group">
                                <label for="title" class="am-u-sm-3 am-form-label">所在地址 <span
                                        class="tpl-form-line-small-title">Address</span></label>
                                <div class="am-u-sm-9">
                                    <input type="text" class="tpl-form-input" id="address" name="address"
                                           value="${bloger.address}" placeholder="所在地址">
                                </div>
                            </div>
                            <div class="am-form-group">
                                <div class="am-u-sm-9 am-u-sm-push-3">
                                    <button type="submit" class="am-btn am-btn-primary tpl-btn-bg-color-success ">更新信息
                                    </button>
                                    <input type="reset"
                                           class="am-btn am-btn-primary tpl-btn-bg-color-success" value="重新填写"/>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<script type="text/javascript">
    function sub() {

        if ($("#title").val() == '') {
            return ale("博主姓名不能为空!");
        } else if ($("#zhiye").val() == '') {
            return ale("博主职业不能为空!");
        } else if ($("#email").val() == '') {
            return ale("博主邮箱不能为空!");
        } else if ($("#address").val() == '') {
            return ale("地址不能为空!");
        } else {
            return true;
            layer.open({
                type: 1
                ,
                title: false //不显示标题栏
                ,
                closeBtn: false
                ,
                area: '300px;'
                ,
                shade: 0.8
                ,
                id: 'LAY_layuipro' //设定一个id，防止重复弹出
                ,
                resize: false
                ,
                btn: ['好的']
                ,
                btnAlign: 'c'
                ,
                moveType: 0 //拖拽模式，0或者1
                ,
                content: '<div style="padding: 30px; line-height: 22px; background-color: #00CC99; color: #fff; font-weight: 300;">更新成功</div>'
                ,
                success: function (layero) {
                    var btn = layero.find('.layui-layer-btn');
                    btn.find('.layui-layer-btn0').click(function () {
                        window.location.reload();
                    });
                }
            });
        }
    }

    function ale(msg) {
        //示范一个公告层
        layer.open({
            type: 1
            ,
            title: false //不显示标题栏
            ,
            closeBtn: false
            ,
            area: '300px;'
            ,
            shade: 0.8
            ,
            id: 'LAY_layuipro' //设定一个id，防止重复弹出
            ,
            resize: false
            ,
            btn: ['知道了']
            ,
            btnAlign: 'c'
            ,
            moveType: 0 //拖拽模式，0或者1
            ,
            content: '<div style="padding: 30px; line-height: 22px; background-color: #a94442; color: #fff; font-weight: 300;">' + msg + '</div>'
            ,
            success: function (layero) {
                var btn = layero.find('.layui-layer-btn');
                btn.find('.layui-layer-btn0').click(function () {
                    layer.closeAll();
                });
            }
        });
        return false;
    }
</script>
<script src="${ctx}/assets/js/jquery.min.js"></script>
<script src="${ctx}/assets/js/amazeui.min.js"></script>
<script src="${ctx}/assets/js/app.js"></script>
</body>
</html>