<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html lang="en">
  <head>
  <base href="<%=basePath%>">
  <meta charset="utf-8" />
  <meta http-equiv="x-ua-compatible" content="ie=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="description" content="A simple jQuery image cropping plugin.">
  <meta name="keywords" content="HTML, CSS, JS, JavaScript, jQuery plugin, image cropping, image crop, image move, image zoom, image rotate, image scale, front-end, frontend, web development">
  <meta name="author" content="Fengyuan Chen">
  <title>Cropper</title>
  <link rel="apple-touch-icon" href="apple-touch-icon.png">
  <link rel="shortcut icon" href="favicon.ico">
  <link rel="icon" href="favicon.ico">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/tether/1.4.0/css/tether.min.css">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-alpha.6/css/bootstrap.min.css">
  <link rel="stylesheet" href="static/cropper/css/cropper.css">
  <link rel="stylesheet" href="static/cropper/css/main.css">
</head>
<body>
<br><br>
  <!-- Content -->
<form action="<%=basePath%>app/zjh/test/ceshi.do" method="post" enctype="multipart/form-data" id="myForm">
  <div class="container">
    <div class="row">
      <div class="col-md-9">
        <!-- <h3>Demo:</h3> -->
        <div class="img-container">
          <img id="image" src="">
        </div>
      </div>
      <div class="col-md-3">
        <!-- <h3>Preview:</h3> -->
        <div class="docs-preview clearfix">
          <div class="img-preview preview-lg"></div>
          <div class="img-preview preview-md"></div>
          <div class="img-preview preview-sm"></div>
          <div class="img-preview preview-xs"></div>
        </div>

        <!-- <h3>Data:</h3> -->
        <div class="docs-data" style="display: block;">
          <div class="input-group input-group-sm">
            <label class="input-group-addon" for="dataX">X</label>
            <input type="text" class="form-control" id="dataX" name="dataX" placeholder="x" readonly="readonly">
            <span class="input-group-addon">px</span>
          </div>
          <div class="input-group input-group-sm">
            <label class="input-group-addon" for="dataY">Y</label>
            <input type="text" class="form-control" id="dataY" name="dataY" placeholder="y" readonly="readonly">
            <span class="input-group-addon">px</span>
          </div>
          <div class="input-group input-group-sm">
            <label class="input-group-addon" for="dataWidth">Width</label>
            <input type="text" class="form-control" id="dataWidth" name="dataWidth" placeholder="width" readonly="readonly">
            <span class="input-group-addon">px</span>
          </div>
          <div class="input-group input-group-sm">
            <label class="input-group-addon" for="dataHeight">Height</label>
            <input type="text" class="form-control" id="dataHeight" name="dataHeight"  placeholder="height" readonly="readonly">
            <span class="input-group-addon">px</span>
          </div>
          <div class="input-group input-group-sm">
            <label class="input-group-addon" for="dataRotate">Rotate</label>
            <input type="text" class="form-control" id="dataRotate" name="dataRotate" placeholder="rotate" readonly="readonly">
            <span class="input-group-addon">deg</span>
          </div>
          <%-- 截取器的大小 --%>
          <input type="hidden" name="boxWidth" id="boxWidth">
          <input type="hidden" name="boxHeigth" id="boxHeigth">
           
          <div class="input-group input-group-sm">
            <label class="input-group-addon" for="dataScaleX">ScaleX</label>
            <input type="text" class="form-control" id="dataScaleX" placeholder="scaleX" readonly="readonly">
          </div>
          <div class="input-group input-group-sm">
            <label class="input-group-addon" for="dataScaleY">ScaleY</label>
            <input type="text" class="form-control" id="dataScaleY" placeholder="scaleY" readonly="readonly">
          </div>
         
        </div>
      </div>
    </div>
    <div class="row">
      <div class="col-md-9 docs-buttons">
        <!-- <h3>Toolbar:</h3> -->
        <div class="btn-group">
          <button type="button" class="btn btn-primary" data-method="setDragMode" data-option="move" title="Move">
            <span class="docs-tooltip" data-toggle="tooltip" data-animation="false" title="选择移动光标">
              <span class="fa fa-arrows"></span>
            </span>
          </button>
          <button type="button" class="btn btn-primary" data-method="setDragMode" data-option="crop" title="Crop">
            <span class="docs-tooltip" data-toggle="tooltip" data-animation="false" title="选择截取光标">
              <span class="fa fa-crop"></span>
            </span>
          </button>
        </div>

        <div class="btn-group">
          <button type="button" class="btn btn-primary" data-method="zoom" data-option="0.1" title="Zoom In">
            <span class="docs-tooltip" data-toggle="tooltip" data-animation="false" title="放大">
              <span class="fa fa-search-plus"></span>
            </span>
          </button>
          <button type="button" class="btn btn-primary" data-method="zoom" data-option="-0.1" title="Zoom Out">
            <span class="docs-tooltip" data-toggle="tooltip" data-animation="false" title="缩小">
              <span class="fa fa-search-minus"></span>
            </span>
          </button>
        </div>

        <div class="btn-group">
          <button type="button" class="btn btn-primary" data-method="move" data-option="-10" data-second-option="0" title="Move Left">
            <span class="docs-tooltip" data-toggle="tooltip" data-animation="false" title="左移">
              <span class="fa fa-arrow-left"></span>
            </span>
          </button>
          <button type="button" class="btn btn-primary" data-method="move" data-option="10" data-second-option="0" title="Move Right">
            <span class="docs-tooltip" data-toggle="tooltip" data-animation="false" title="右移">
              <span class="fa fa-arrow-right"></span>
            </span>
          </button>
          <button type="button" class="btn btn-primary" data-method="move" data-option="0" data-second-option="-10" title="Move Up">
            <span class="docs-tooltip" data-toggle="tooltip" data-animation="false" title="上移">
              <span class="fa fa-arrow-up"></span>
            </span>
          </button>
          <button type="button" class="btn btn-primary" data-method="move" data-option="0" data-second-option="10" title="Move Down">
            <span class="docs-tooltip" data-toggle="tooltip" data-animation="false" title="下移">
              <span class="fa fa-arrow-down"></span>
            </span>
          </button>
        </div>

        <div class="btn-group">
          <button type="button" class="btn btn-primary" data-method="rotate" data-option="-45" title="Rotate Left">
            <span class="docs-tooltip" data-toggle="tooltip" data-animation="false" title="左旋转">
              <span class="fa fa-rotate-left"></span>
            </span>
          </button>
          <button type="button" class="btn btn-primary" data-method="rotate" data-option="45" title="Rotate Right">
            <span class="docs-tooltip" data-toggle="tooltip" data-animation="false" title="右旋转">
              <span class="fa fa-rotate-right"></span>
            </span>
          </button>
        </div>
		<%-- 
        <div class="btn-group">
          <button type="button" class="btn btn-primary" data-method="scaleX" data-option="-1" title="Flip Horizontal">
            <span class="docs-tooltip" data-toggle="tooltip" data-animation="false" title="$().cropper(&quot;scaleX&quot;, -1)">
              <span class="fa fa-arrows-h"></span>
            </span>
          </button>
          <button type="button" class="btn btn-primary" data-method="scaleY" data-option="-1" title="Flip Vertical">
            <span class="docs-tooltip" data-toggle="tooltip" data-animation="false" title="$().cropper(&quot;scaleY&quot;, -1)">
              <span class="fa fa-arrows-v"></span>
            </span>
          </button>
        </div>
		--%>
        <div class="btn-group">
          <button type="button" class="btn btn-primary" data-method="crop" title="Crop">
            <span class="docs-tooltip" data-toggle="tooltip" data-animation="false" title="显示截取框">
              <span class="fa fa-check"></span>
            </span>
          </button>
          <button type="button" class="btn btn-primary" data-method="clear" title="Clear">
            <span class="docs-tooltip" data-toggle="tooltip" data-animation="false" title="清除截取框">
              <span class="fa fa-remove"></span>
            </span>
          </button>
        </div>

        <div class="btn-group">
          <button type="button" class="btn btn-primary" data-method="disable" title="Disable">
            <span class="docs-tooltip" data-toggle="tooltip" data-animation="false" title="解锁">
              <span class="fa fa-lock"></span>
            </span>
          </button>
          <button type="button" class="btn btn-primary saveImg" data-method="enable" title="Enable">
            <span class="docs-tooltip" data-toggle="tooltip" data-animation="false" title="锁定">
              <span class="fa fa-unlock"></span>
            </span>
          </button>
        </div>

        <div class="btn-group">
          <button type="button" class="btn btn-primary" data-method="reset" title="Reset">
            <span class="docs-tooltip" data-toggle="tooltip" data-animation="false" title="重置">
              <span class="fa fa-refresh"></span>
            </span>
          </button>
          
          <%-- 选择图片 --%>
          <label class="btn btn-primary btn-upload" for="inputImage" title="Upload image file">
            <input type="file" class="sr-only" id="inputImage" name="file" accept=".jpg,.jpeg,.png,.gif,.bmp,.tiff">
            <span class="docs-tooltip" data-toggle="tooltip" data-animation="false" title="选择图片">
              <span class="fa fa-upload"></span>
            </span>
          </label>
          <%-- 
          <button type="button" class="btn btn-primary" data-method="destroy" title="Destroy">
            <span class="docs-tooltip" data-toggle="tooltip" data-animation="false" title="$().cropper(&quot;destroy&quot;)">
              <span class="fa fa-power-off"></span>
            </span>
          </button>
          --%>
        </div>
        <div class="btn-group">
        	<button type="button" class="btn btn-primary dianjia" data-method="destroy" title="Destroy" style="width: 123px;">
            <span class="docs-tooltip" data-toggle="tooltip" data-animation="false" title="保存裁剪图片">
              <span>保存</span>
            </span>
          </button>
        </div>
        <!-- Show the cropped image in modal显示图片的画布 -->
        <div class="modal fade docs-cropped" id="getCroppedCanvasModal" aria-hidden="true" aria-labelledby="getCroppedCanvasTitle" role="dialog" tabindex="-1">
          <div class="modal-dialog">
            <div class="modal-content">
              <div class="modal-header">
                <h5 class="modal-title" id="getCroppedCanvasTitle">Cropped</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                  <span aria-hidden="true">&times;</span>
                </button>
              </div>
              <div class="modal-body"></div>
              <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                <a class="btn btn-primary" id="download" href="javascript:void(0);" download="cropped.jpg">Download</a>
              </div>
            </div>
          </div>
        </div><!-- /.modal -->
        <%--
        <input type="text" class="form-control" id="putData" placeholder="Get data to here or set data with this value">
        --%>
      </div><!-- /.docs-buttons -->

      <div class="col-md-3 docs-toggles">
        <!-- <h3>Toggles:</h3> -->
        <div class="btn-group d-flex flex-nowrap" data-toggle="buttons">
          <label class="btn btn-primary active">
            <input type="radio" class="sr-only" id="aspectRatio0" name="aspectRatio" value="1.7777777777777777">
            <span class="docs-tooltip" data-toggle="tooltip" data-animation="false" title="截取比例 16/9">
              16:9
            </span>
          </label>
          <label class="btn btn-primary">
            <input type="radio" class="sr-only" id="aspectRatio1" name="aspectRatio" value="1.3333333333333333">
            <span class="docs-tooltip" data-toggle="tooltip" data-animation="false" title="截取比例 4/3">
              4:3
            </span>
          </label>
          <label class="btn btn-primary">
            <input type="radio" class="sr-only" id="aspectRatio2" name="aspectRatio" value="1">
            <span class="docs-tooltip" data-toggle="tooltip" data-animation="false" title="截取比例 1/1">
              1:1
            </span>
          </label>
          <label class="btn btn-primary">
            <input type="radio" class="sr-only" id="aspectRatio3" name="aspectRatio" value="0.6666666666666666">
            <span class="docs-tooltip" data-toggle="tooltip" data-animation="false" title="截取比例 2/3">
              2:3
            </span>
          </label>
          <label class="btn btn-primary">
            <input type="radio" class="sr-only" id="aspectRatio4" name="aspectRatio" value="NaN">
            <span class="docs-tooltip" data-toggle="tooltip" data-animation="false" title="截取比例 (任意)">
              Free
            </span>
          </label>
        </div>
      </div><!-- /.docs-toggles -->
    </div>
  </div>
  </form>
  <!-- Scripts -->
  <script src="https://code.jquery.com/jquery-3.1.1.slim.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/tether/1.4.0/js/tether.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-alpha.6/js/bootstrap.min.js"></script>
  <script src="https://fengyuanchen.github.io/js/common.js"></script>
  <script src="static/cropper/js/cropper.js"></script>
  <script src="static/cropper/js/main.js"></script>
  <script>
    $(function () {
        $(".dianjia").click(function () {
            var width=parseInt($(".cropper-crop-box").css("width").substring(0,$(".cropper-crop-box").css("width").length-2));
            var height=parseInt($(".cropper-crop-box").css("height").substring(0,$(".cropper-crop-box").css("height").length-2));
            $("#boxWidth").val(width);
            $("#boxHeigth").val(height);
            alert($("#inputImage").val());
           $("#myForm").submit();
        });
    });
	</script>
</body>
</html>
