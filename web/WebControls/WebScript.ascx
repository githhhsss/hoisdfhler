<%@ Control Language="C#" AutoEventWireup="true" CodeFile="WebScript.ascx.cs" Inherits="WebControls_WebScript" %>
<script type="text/javascript" src="<%= MyPath %>JS/jq/jquery-1.11.2.min.js"></script>
<script type="text/javascript" src="<%= MyPath %>JS/com.js"></script>
<script type="text/javascript" src="<%= MyPath %>JS/ys.js"></script>
<script type="text/javascript" src="<%= MyPath %>JS/flexSlider/jquery.flexslider.js"></script>
<script type="text/javascript">
    $(function () {
        //顶部透明浮动在上面
        var left = document.getElementById("web-top").offsetLeft;
        $(".web-top").css({ position: "fixed" });
        document.getElementById("web-top").style.left = left;

        
    })
    function show() {
        setTimeout(function () {
            $(".fd-contact .acbtn").removeClass("zt");
        }, 400);
        $(".fd-contact").stop(true).animate({ right: 0 }, 400);
    }
    function hide() {
        setTimeout(function () {
            $(".fd-contact .acbtn").addClass("zt");
        }, 400);
        $(".fd-contact").stop(true).animate({ right: -w() }, 400);
    }
    function w() {
        return $(".fd-contact").width() - 26;
    }
    
</script>
