<%@ Page Title="" Language="C#" MasterPageFile="~/User/Site.Master" AutoEventWireup="true" CodeBehind="InstagramUser.aspx.cs" Inherits="SocialPanel.User.InstagramUser" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<div id="content" class="span10">
        <!-- content starts -->
        <div>
            <ul class="breadcrumb">
                <li><a href="#">Home</a> <span class="divider">/</span> </li>
                <li><a href="#">Order</a> </li>
            </ul>
        </div>
        <div class="row-fluid sortable">
            <div class="box span12">
                <div class="box-header well" data-original-title>
                    <h2>
                        <i class="icon-edit"></i>Add Order</h2>
                    <div class="box-icon">
                        <%--<a href="#" class="btn btn-setting btn-round"><i class="icon-cog"></i></a>--%>
                        <a href="#" class="btn btn-minimize btn-round"><i class="icon-chevron-up"></i></a>
                        <%--<a href="#" class="btn btn-close btn-round"><i class="icon-remove"></i></a>--%>
                    </div>
                </div>
                <div class="box-content">
                    <div class="form-horizontal">
                        <fieldset>
                            <legend>Add Accounts</legend>
                            
                            
                            <div class="control-group">
                                <label class="control-label" for="focusedInput">
                                     Instagram Username</label>
                                <div class="controls">
                                    <asp:TextBox ID="txtUsername" runat="server" required="required" CssClass="input-xlarge focused" placeholder="Enter Username"></asp:TextBox>
                                </div>
                            </div>
                            <div class="control-group">
                                <label class="control-label" for="focusedInput">
                                    MinCount</label>
                                <div class="controls">
                                    <asp:TextBox ID="txtMinCount" TextMode="Number" required="required" CssClass="input-xlarge focused" placeholder="Enter Mincount"
                                        runat="server"></asp:TextBox>
                                    
                                </div>
                            </div>
                            <div class="control-group">
                                <label class="control-label" for="focusedInput">
                                    MaxCount</label>
                                <div class="controls">
                                    <asp:TextBox ID="txtMaxCount" TextMode="Number" required="required" CssClass="input-xlarge focused" placeholder="Enter Maxcount"
                                        runat="server"></asp:TextBox>
                                    
                                </div>
                            </div>
                            <div class="control-group">
                                <label class="control-label" for="selectError3">
                                    Status</label>
                                <div class="controls">
                                     <asp:DropDownList ID="ddlStatus" runat="server">
                                        
                                    </asp:DropDownList>
                                </div>
                            </div>
                            
                            <div class="control-group error">
                                <label class="control-label" for="inputError">
                                    <asp:Label ID="lblErrorMessage" runat="server" CssClass="control-label" for="inputError"></asp:Label></label>
                            </div>
                           <div class="form-actions">
                                <asp:Button ID="btnSubmit" runat="server" Text="Save" 
                                    CssClass="btn btn-primary" onclick="btnSubmit_Click"/>
                                <asp:Button ID="btnReset" runat="server" CssClass="btn" 
                                    Text="Reset" />
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
