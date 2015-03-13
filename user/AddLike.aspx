<%@ Page Title="" Language="C#" MasterPageFile="~/User/Site.Master" AutoEventWireup="true" CodeBehind="AddLike.aspx.cs" Inherits="Instafens.User.AddLike" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<div id="content" class="span10">
        <!-- content starts -->
        <div>
            <ul class="breadcrumb">
                <li><a href="#">首页</a> <span class="divider">/</span> </li>
                <li><a href="#">华人点赞</a> </li>
            </ul>
        </div>
        <div class="row-fluid sortable">
            <div class="box span6">
                <div class="box-header well" data-original-title>
                    <h2>
                        <i class="icon-edit"></i>华人点赞</h2>
                    <div class="box-icon">
                        <%--<a href="#" class="btn btn-setting btn-round"><i class="icon-cog"></i></a>--%>
                        <a href="#" class="btn btn-minimize btn-round"><i class="icon-chevron-up"></i></a>
                        <%--<a href="#" class="btn btn-close btn-round"><i class="icon-remove"></i></a>--%>
                    </div>
                </div>
                <div class="box-content">
                    <div class="form-horizontal">
                        <fieldset>
                            <legend>可以添加批量订单，一行一个</legend>
                            <%--<div class="control-group">
                                <label class="control-label" for="selectError3">
                                    Order Type</label>
                                <div class="controls">
                                    <asp:DropDownList ID="ddlOrderType" runat="server" AutoPostBack="True" 
                                        onselectedindexchanged="ddlOrderType_SelectedIndexChanged">
                                    </asp:DropDownList>
                                </div>
                            </div>--%>
                            <div class="control-group">
                                <label class="control-label" for="focusedInput">
                                    图片/视频连接</label>
                                <div class="controls">
                                    <asp:TextBox ID="txtUrl" runat="server" TextMode="MultiLine" Height="200px" CssClass="input-xlarge focused" placeholder=""></asp:TextBox>
                                    <span class="help-inline">
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtUrl"
                                            ErrorMessage="请输入图片/视频连接" Font-Bold="True" ForeColor="Red"></asp:RequiredFieldValidator></span>
                                </div>
                            </div>
                            <div class="control-group">
                                <label class="control-label" for="focusedInput">
                                    订单数量
</label>
                                <div class="controls">
                                    <asp:TextBox ID="txtAmount" TextMode="Number" CssClass="input-xlarge focused" placeholder=""
                                        runat="server"></asp:TextBox>
                                    <span class="help-inline">
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtAmount"
                                            ErrorMessage="请输入订单数量" Font-Bold="True" ForeColor="Red"></asp:RequiredFieldValidator></span>
                                </div>
                            </div>
                            <%--<div class="control-group">
                                <label class="control-label" for="focusedInput">
                                    Account</label>
                                <div class="controls">
                                    <asp:TextBox ID="txtMaxAccount" CssClass="input-xlarge focused"
                                        runat="server" placeholder="Enter Max Amount"></asp:TextBox>
                                    <span class="help-inline">
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txtMaxAccount"
                                            ErrorMessage="Please Enter Max Amount" Font-Bold="True" ForeColor="Red"></asp:RequiredFieldValidator></span>
                                </div>
                            </div>--%>
                            <div class="control-group error">
                                <label class="control-label" for="inputError">
                                    <asp:Label ID="lblErrorMessage" runat="server" CssClass="control-label" for="inputError"></asp:Label></label>
                            </div>
                            <div >
                                <asp:Button ID="btnSubmit" runat="server" style="margin-left:160px" Text="添加订单" 
                                    CssClass="btn btn-primary" onclick="btnSubmit_Click" />
                                <asp:Button ID="btnReset" runat="server" CssClass="btn" 
                                    Text="重置" onclick="btnReset_Click" />
                            </div>
                        </fieldset>
                    </div>
                </div>
                <!--/span-->
            </div>
            <div class="box span6" style="display:none">
                <div class="box-header well" data-original-title>
                    <h2>
                        <i class="icon-edit"></i>查看价格</h2>
                    <div class="box-icon">
                        <%--<a href="#" class="btn btn-setting btn-round"><i class="icon-cog"></i></a>--%>
                        <a href="#" class="btn btn-minimize btn-round"><i class="icon-chevron-up"></i></a>
                        <%--<a href="#" class="btn btn-close btn-round"><i class="icon-remove"></i></a>--%>
                    </div>
                </div>
                <div class="box-content">
                    <div class="form-horizontal">
                        <fieldset>
                            <legend>查看价格</legend>
                            <div class="control-group">
                                <label class="control-label" for="focusedInput">
                                    最小订单数量<div class="controls">
                                    <asp:TextBox ID="txtMinAmount" runat="server" CssClass="input-xlarge focused" Enabled="false"></asp:TextBox>
                                </div>
                            </div>
                            <div class="control-group">
                                <label class="control-label" for="focusedInput">
                                    最大订单数量<div class="controls">
                                    <asp:TextBox ID="txtMaxAmount" runat="server" CssClass="input-xlarge focused" Enabled="false"></asp:TextBox>
                                </div>
                            </div>
                            <div class="control-group">
                                <label class="control-label" for="focusedInput">
                                    价格</label>
                                <div class="controls">
                                    <asp:TextBox ID="txtPrice" runat="server" CssClass="input-xlarge focused" Enabled="false"></asp:TextBox>
                                </div>
                            </div>
                        </fieldset>
                    </div>
                </div>
                <!--/span-->
            </div><div class="box span6"style="margin-left:0px">
                <div class="box-header well" data-original-title>
                    <h2>
                        <i class="icon-edit"></i>如何下单</h2>
                    <div class="box-icon">
                        <%--<a href="#" class="btn btn-setting btn-round"><i class="icon-cog"></i></a>--%>
                        <a href="#" class="btn btn-minimize btn-round"><i class="icon-chevron-up"></i></a>
                        <%--<a href="#" class="btn btn-close btn-round"><i class="icon-remove"></i></a>--%>
                    </div>
                </div>
                <div class="box-content">
                    <div class="form-horizontal">
                        <fieldset style="color:red">
                         1.加粉丝可以直接填入用户名<br/>
<br/>
2.加赞请填入官方网址 https://instagram.com/p/gN39FYEr35/ modal=true 或 https://instagram.com/p/gN39FYEr35/ <br/>
<br/>
3.支持多订单,可同时加入50个订单<br/>
<br/>
4.请勿将帐号设置为私人贴,下单前请检查清楚,如因私人贴或者填错用户名导致粉赞没加成功,不予退款.<br/>
<br/>
5.每张图片最少10赞起做，少于10个的按10个算<br/>
                            
                        </fieldset>
                    </div>
                </div>
             
            <!--/row-->
            <!-- content ends -->
        </div>
    </div>
</asp:Content>
