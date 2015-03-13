<%@ Page Title="" Language="C#" MasterPageFile="~/User/Site.Master" AutoEventWireup="true" CodeBehind="ChangePassword.aspx.cs" Inherits="SocialPanel.User.ChangePassword" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<div id="content" class="span10">
        <!-- content starts -->
        <div>
            <ul class="breadcrumb">
                <li><a href="#">首页</a> <span class="divider">/</span> </li>
                <li><a href="#">修改密码</a> </li>
            </ul>
        </div>
        <div class="row-fluid sortable">
            <div class="box span12">
                <div class="box-header well" data-original-title>
                    <h2>
                        <i class="icon-edit"></i>修改密码</h2>
                    <div class="box-icon">
                        <%--<a href="#" class="btn btn-setting btn-round"><i class="icon-cog"></i></a>--%>
                        <a href="#" class="btn btn-minimize btn-round"><i class="icon-chevron-up"></i></a>
                        <%--<a href="#" class="btn btn-close btn-round"><i class="icon-remove"></i></a>--%>
                    </div>
                </div>
                <div class="box-content">
                    <div class="form-horizontal">
                        <fieldset>
                            <legend>修改密码</legend>
                            <div class="control-group">
                                <label class="control-label" for="focusedInput">
                                    现在的密码</label>
                                <div class="controls">
                                    <asp:TextBox ID="txtOldPassword" runat="server" required="required" CssClass="input-xlarge focused"
                                        placeholder="请输入现在的密码"></asp:TextBox>
                                </div>
                            </div>
                            <div class="control-group">
                                <label class="control-label" for="focusedInput">
                                    新的密码</label>
                                <div class="controls">
                                    <asp:TextBox ID="txtNewPassword" runat="server" required="required" CssClass="input-xlarge focused"
                                        placeholder="请输入新的密码"></asp:TextBox>
                                </div>
                            </div>
                            <div class="control-group error">
                                <label class="control-label" for="inputError">
                                    <asp:Label ID="lblErrorMessage" runat="server" CssClass="control-label" for="inputError"></asp:Label></label>
                            </div>
                            <div class="form-actions">
                                <asp:Button ID="btnSubmit" runat="server" CssClass="btn btn-primary"
                                    Text="修改密码" onclick="btnSubmit_Click" />
                                <asp:Button ID="btnReset" runat="server" CssClass="btn" 
                                    onclick="btnReset_Click" />
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
