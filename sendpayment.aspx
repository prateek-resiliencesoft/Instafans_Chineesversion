<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="sendpayment.aspx.cs" Inherits="SocialPanel.sendpayment" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
   <form action="https://www.sandbox.paypal.com/cgi-bin/webscr" method="post" id="form1"
        name="form1">
        <input type="hidden" name="cmd" value="_xclick">
        <input type="hidden" name="business" value="myappdeveloper27-facilitator@gmail.com"><!--Paypal or sandbox Merchant account -->
        <input type="hidden" name="item_name" value="<%=Session["orderID"]%>_Books">
        <input type="hidden" name="item_number" value="1">
        <input type="hidden" name="amount" value="<%=Session["totalShoppingAmt"]%>">
        <input type="hidden" name="return" value="http://198.20.168.145/user/PaymentRecordDetails.aspx?Status=Success"><!--this page will be your redirection page -->
        <input type="hidden" name="cancel_return" value="http://198.20.168.145/user/PaymentRecordDetails.aspx?Status=Cancel">
        <input type="hidden" name="currency_code" value="USD">
        <input type="hidden" name="custom" value="<%= HttpContext.Current.User.Identity.Name%>">
        <input type="hidden" name="notify_url" value="http://198.20.168.145/ipn.aspx "><!--this should be your domain web page where you going to receive all your transaction variables -->
    </form>

    <img src="../images/image.gif" alt="Processing for paypal" />
    <script language="javascript">
        document.form1.submit();   
    </script>
</body>
</html>
