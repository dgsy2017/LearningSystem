﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="JsApiPayPage.aspx.cs" Inherits="WxPayAPI.JsApiPayPage" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="content-type" content="text/html;charset=utf-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1"/> 
    <title>微信支付样例-JSAPI支付</title>
</head>

           <script type="text/javascript">

               //调用微信JS api 支付
               function jsApiCall()
               {
               //getBrandWCPayRequest
			   alert("开始支付");
                   WeixinJSBridge.invoke(
                   'getBrandWCPayRequest',
                   <%=wxJsApiParam%>,//josn串
                    function (res)
                    {
                        WeixinJSBridge.log(res.err_msg);
                        var msg="code:"+res.err_code+"\n";
                        msg+="desc:"+res.err_desc+"\n";
                        msg+="msg:"+res.err_msg+"\n";
                        alert(msg);
                     }
                    );
               }

               function callpay()
               {
                   if (typeof WeixinJSBridge == "undefined")
                   {
                       if (document.addEventListener)
                       {
                           document.addEventListener('WeixinJSBridgeReady', jsApiCall, false);
                       }
                       else if (document.attachEvent)
                       {
                           document.attachEvent('WeixinJSBridgeReady', jsApiCall);
                           document.attachEvent('onWeixinJSBridgeReady', jsApiCall);
                       }
                   }
                   else
                   {
                       jsApiCall();
                   }
                   return false;
               }
               
     </script>

<body>
    <form runat="server">
        <br/>
	    <div align="center">
		    <br/><br/><br/>
          <asp:Button ID="submit" runat="server" Text="立即支付" OnClientClick="return callpay()" style="width:210px; height:50px; border-radius: 15px;background-color:#00CD00; border:0px #FE6714 solid; cursor: pointer;  color:white;  font-size:16px;" />

	    </div>
    </form>
</body>
</html>