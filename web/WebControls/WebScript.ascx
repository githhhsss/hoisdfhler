<%@ Control Language="C#" AutoEventWireup="true" CodeFile="WebScript.ascx.cs" Inherits="WebControls_WebScript" %>
<script type="text/javascript" src="<%= MyPath %>JS/jq/jquery-1.4.1.min.js"></script>
<script type="text/javascript" src="<%= MyPath %>JS/com.js"></script>
<script type="text/javascript">
    $(function () {
        var left = document.getElementById("web-top").offsetLeft;
        $(".web-top").css({ position: "absolute" });
        document.getElementById("web-top").style.left = left;
    })
</script>
