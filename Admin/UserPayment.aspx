<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Site.Master" AutoEventWireup="true" CodeBehind="UserPayment.aspx.cs" Inherits="Instafens.Admin.UserPayment" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<div id="content" class="span10">
        <!-- content starts -->
        <div>
            <ul class="breadcrumb">
                <li><a href="#">Home</a> <span class="divider">/</span> </li>
                <li><a href="#">Add Payment</a> </li>
            </ul>
        </div>
        <div class="row-fluid sortable">
            <div class="box span12">
                <div class="box-header well" data-original-title>
                    <h2>
                        <i class="icon-edit"></i>Add Payment</h2>
                    <div class="box-icon">
                        <%--<a href="#" class="btn btn-setting btn-round"><i class="icon-cog"></i></a>--%>
                        <a href="#" class="btn btn-minimize btn-round"><i class="icon-chevron-up"></i></a>
                        <%--<a href="#" class="btn btn-close btn-round"><i class="icon-remove"></i></a>--%>
                    </div>
                </div>
                <div class="box-content">
                    <div class="form-horizontal">
                        <fieldset>
                            <legend>Add Multiple Accounts</legend>
                           <%-- <div class="control-group">
                                <label class="control-label" for="selectError3">
                                    Order Type</label>
                                <div class="controls">
                                    <asp:DropDownList ID="ddlOrderType" runat="server">
                                    </asp:DropDownList>
                                </div>
                            </div>--%>
                            <div class="control-group">
                                <label class="control-label" for="selectError3">
                                    User</label>
                                <div class="controls">
                                  <asp:DropDownList ID="ddlUserName" runat="server" class="styledselect_form_1" >
            </asp:DropDownList>	
                                </div>
                            </div>
                            <div class="control-group">
                                <label class="control-label" for="focusedInput">
                                    Amount</label>
                                <div class="controls">
                                    <asp:TextBox ID="txtAmount" runat="server" CssClass="input-xlarge focused" placeholder="Enter Url"></asp:TextBox>
                                    <span class="help-inline">
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                                           ControlToValidate="txtAmount" ErrorMessage="*" Font-Bold="True" 
                                           ForeColor="Red"></asp:RequiredFieldValidator>

                                           <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" 
        ControlToValidate="txtAmount" ErrorMessage="Enter Number" 
        ValidationExpression="^\d{1,8}(\.\d{1,2})?$" 
        Font-Bold="True"></asp:RegularExpressionValidator>
           </span>
                                </div>
                            </div>
                            <div class="control-group">
                                <label class="control-label" for="focusedInput">
                                    Payment Site</label>
                                <div class="controls">
                                    <asp:TextBox ID="txtPaymentSite" CssClass="input-xlarge focused" placeholder="Enter Amount"
                                        runat="server"></asp:TextBox>
                                    <span class="help-inline">
                                       <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" 
           ControlToValidate="txtPaymentSite" ErrorMessage="*" Font-Bold="True" 
           ForeColor="Red"></asp:RequiredFieldValidator></span>
                                </div>
                            </div>
                            <div class="control-group">
                                <label class="control-label" for="focusedInput">
                                    Transaction Id</label>
                                <div class="controls">
                                    <asp:TextBox ID="txtTransactionId" class="input-xlarge focused"
                                        runat="server" placeholder=""></asp:TextBox>
                                    <span class="help-inline">
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" 
           ControlToValidate="txtTransactionId" ErrorMessage="*" Font-Bold="True" 
           ForeColor="Red"></asp:RequiredFieldValidator></span>
                                </div>
                            </div>
                            <div class="control-group">
                                <label class="control-label" for="focusedInput">
                                    Manually OR Automatically</label>
                                <div class="controls">
                                    <asp:DropDownList ID="ddlManuAuto" runat="server" class="styledselect_form_1" >
            </asp:DropDownList>	
                                    <span class="help-inline">
                                        </span>
                                </div>
                            </div>

                            <div class="control-group">
                                <label class="control-label" for="focusedInput">
                                    Status</label>
                                <div class="controls">
                                    <asp:DropDownList ID="ddlStatus" runat="server" class="styledselect_form_1" >
            </asp:DropDownList>	
                                    <span class="help-inline">
                                        </span>
                                </div>
                            </div>

                            <div class="control-group error">
                                <label class="control-label" for="inputError">
                                    <asp:Label ID="lblErrorMessage" runat="server" CssClass="control-label" for="inputError"></asp:Label></label>
                                <asp:HiddenField ID="hfUser" runat="server" />
                            </div>
                            <div class="form-actions">
                                <asp:Button ID="btnSubmit" runat="server" Text="Save" 
                                    CssClass="btn btn-primary" onclick="btnSubmit_Click" />
                                <asp:Button ID="btnReset" runat="server" CssClass="btn" 
                                    Text="Reset" onclick="btnReset_Click" />
                            </div>
                        </fieldset>
                    </div>
                </div>
                <!--/span-->
            </div>
            <!--/row-->
            <!-- content ends -->
        </div>
    </div>
</asp:Content>
