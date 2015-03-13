<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Site.Master" AutoEventWireup="true"
    CodeBehind="Account.aspx.cs" Inherits="Social_Media_Service_Panel.Admin.Account" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div id="content" class="span10">
        <!-- content starts -->
        <div>
            <ul class="breadcrumb">
                <li><a href="#">Home</a> <span class="divider">/</span> </li>
                <li><a href="#">Account</a> </li>
            </ul>
        </div>
        <div class="row-fluid sortable">
            <div class="box span12">
                <div class="box-header well" data-original-title>
                    <h2>
                        <i class="icon-edit"></i>Add Multiple Accounts</h2>
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
                                <label class="control-label" for="selectError3">
                                    Format</label>
                                <div class="controls">
                                Username:Password:Proxy:Port:ProxuUsername:ProxyPassword<br />
                                Username:Password:Proxy:Port<br />
                                Username:Password
                                </div>
                            </div>
                            <div class="control-group">
                                <label class="control-label" for="selectError3">
                                    Plain Select</label>
                                <div class="controls">
                                    <asp:DropDownList ID="ddlAccountType" runat="server">
                                    </asp:DropDownList>
                                </div>
                            </div>
                            <%--<div class="control-group">
                                <label class="control-label" for="focusedInput">
                                    Account</label>
                                <div class="controls">
                                    <asp:TextBox ID="txtAccounts" TextMode="MultiLine" Height="200px" CssClass="input-xlarge focused" runat="server"
                                        placeholder="Enter Accounts"></asp:TextBox>
                                     <span class="help-inline"><asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtAccounts"
                                                ErrorMessage="Please Enter Account" Font-Bold="True" ForeColor="Red"></asp:RequiredFieldValidator></span>
                                </div>
                            </div>--%>
                            <div class="control-group">
                                <label class="control-label" for="focusedInput">
                                    Account</label>
                                  <div class="controls">
                                     <asp:FileUpload id="FileUploadControl" runat="server" />
                                 </div>
                            </div>
                            <div class="control-group error">
                                <label class="control-label" for="inputError">
                                  <asp:Label ID="lblerror" runat="server" CssClass="control-label" for="inputError"></asp:Label></label>
                            </div>

                            <div class="form-actions">
                                <asp:Button ID="btnSubmit" runat="server" OnClick="btnSubmit_Click" Text="Save" CssClass="btn btn-primary" />
                                <asp:Button ID="btnReset" runat="server" CssClass="btn" OnClick="btnReset_Click" Text="Reset" />
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
