<%@ Page Title="New User" Language="C#" MasterPageFile="~/Admin/Site.Master" AutoEventWireup="true"
    CodeBehind="User.aspx.cs" Inherits="Social_Media_Service_Panel.Admin.User" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div id="content" class="span10">
        <!-- content starts -->
        <div>
            <ul class="breadcrumb">
                <li><a href="#">Home</a> <span class="divider">/</span> </li>
                <li><a href="#">User</a> </li>
            </ul>
        </div>
        <div class="row-fluid sortable">
            <div class="box span12">
                <div class="box-header well" data-original-title>
                    <h2>
                        <i class="icon-edit"></i>Add User</h2>
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
                            <div class="control-group">
                                <label class="control-label" for="focusedInput">
                                    Username</label>
                                <div class="controls">
                                    <asp:TextBox ID="txtUserName" runat="server" CssClass="input-xlarge focused" placeholder="Enter Username"></asp:TextBox>
                                    <span class="help-inline">
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtUserName"
                                            ErrorMessage="Please Enter Username" Font-Bold="True" ForeColor="Red"></asp:RequiredFieldValidator></span>
                                </div>
                            </div>
                            <div class="control-group">
                                <label class="control-label" for="focusedInput">
                                    Email</label>
                                <div class="controls">
                                    <asp:TextBox ID="txtemail" TextMode="Email" runat="server" CssClass="input-xlarge focused" placeholder="Enter Email"></asp:TextBox>
                                    <span class="help-inline">
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="txtemail"
                                            ErrorMessage="Please Enter Email" Font-Bold="True" ForeColor="Red"></asp:RequiredFieldValidator></span>
                                </div>
                            </div>
                            <div class="control-group">
                                <label class="control-label" for="focusedInput">
                                    Password</label>
                                <div class="controls">
                                    <asp:TextBox ID="txtPassword" TextMode="Password" CssClass="input-xlarge focused" placeholder="Enter Password"
                                        runat="server"></asp:TextBox>
                                    <span class="help-inline">
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtPassword"
                                            ErrorMessage="Please Enter Password" Font-Bold="True" ForeColor="Red"></asp:RequiredFieldValidator></span>
                                </div>
                            </div>
                            <div class="control-group">
                                <label class="control-label" for="focusedInput">
                                    Confirm Password</label>
                                <div class="controls">
                                    <asp:TextBox ID="txtrepassword" TextMode="Password" CssClass="input-xlarge focused" placeholder="Enter Confirm Password"
                                        runat="server"></asp:TextBox>
                                    <span class="help-inline">
                                        <asp:CompareValidator ID="CompareValidator1" runat="server" ErrorMessage="Please Enter Same Password"
                                            ControlToValidate="txtrepassword" Font-Bold="True" ForeColor="Red" ControlToCompare="txtPassword"></asp:CompareValidator></span>
                                </div>
                            </div>
                            <div class="control-group">
                                <label class="control-label" for="selectError3">
                                    User Type</label>
                                <div class="controls">
                                    <asp:DropDownList ID="ddlUserType" runat="server">
                                    </asp:DropDownList>
                                </div>
                            </div>
                            <div class="control-group">
                                <label class="control-label">
                                    Gender</label>
                                <div class="controls">
                                    <asp:RadioButtonList ID="rblmalefemale" runat="server" RepeatDirection="Horizontal"
                                        Font-Bold="True" ForeColor="Black">
                                        <asp:ListItem>Male</asp:ListItem>
                                        <asp:ListItem>Female</asp:ListItem>
                                    </asp:RadioButtonList>
                                </div>
                            </div>
                            <div class="control-group error">
                                <label class="control-label" for="inputError">
                                    <asp:Label ID="lblErrorMessage" runat="server" CssClass="control-label" for="inputError"></asp:Label></label>
                            </div>
                            <div class="form-actions">
                                <asp:Button ID="btnSubmit" runat="server" OnClick="btnSubmit_Click" Text="Save" CssClass="btn btn-primary" />
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
