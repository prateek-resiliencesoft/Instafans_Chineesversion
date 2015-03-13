<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebForm1.aspx.cs" Inherits="SocialPanel.WebForm1" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    <asp:TextBox ID="txtUrl" runat="server" CssClass="input-xlarge focused" placeholder="Enter Url"></asp:TextBox>
    <asp:Button ID="btnSubmit" 
        runat="server" Text="Save" 
                                    CssClass="btn btn-primary" 
            onclick="btnSubmit_Click" />
    </div>
    </form>
</body>
</html>
