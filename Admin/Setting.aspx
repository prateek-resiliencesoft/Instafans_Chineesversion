<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Site.Master" AutoEventWireup="true" CodeBehind="Setting.aspx.cs" Inherits="SocialPanel.Admin.Setting" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div id="content" class="span10">
        <!-- content starts -->
        <div>
            <ul class="breadcrumb">
                <li><a href="#">Home</a> <span class="divider">/</span> </li>
                <li><a href="#">Setting</a> </li>
            </ul>
        </div>
        <div class="row-fluid sortable">
            <div class="box span12">
                <div class="box-header well" data-original-title>
                    <h2>
                        <i class="icon-edit"></i>Setting</h2>
                    <div class="box-icon">
                        <%--<a href="#" class="btn btn-setting btn-round"><i class="icon-cog"></i></a>--%>
                        <a href="#" class="btn btn-minimize btn-round"><i class="icon-chevron-up"></i></a>
                        <%--<a href="#" class="btn btn-close btn-round"><i class="icon-remove"></i></a>--%>
                        
                    </div>
                </div>
                <div class="box-content">
                    <div class="form-horizontal">
                        <fieldset>
                            <legend>Setting</legend>
                            <div class="control-group">
                                <label class="control-label" for="focusedInput">
                                    Like Delay (Sec) </label>
                                <div class="controls">
                                    <asp:TextBox ID="txtLikeDelay" required="required" TextMode="Number" CssClass="input-xlarge focused" runat="server"
                                        placeholder="Enter Like Delay"></asp:TextBox>
                                </div>
                            </div>
                            <div class="control-group">
                                <label class="control-label" for="focusedInput">
                                    Follow Delay (Sec) </label>
                                <div class="controls">
                                    <asp:TextBox ID="txtFollowDelay" required="required" TextMode="Number" CssClass="input-xlarge focused" runat="server"
                                        placeholder="Enter Follow Delay"></asp:TextBox>
                                </div>
                            </div>
                            <div class="control-group">
                                <label class="control-label" for="focusedInput">
                                    Search Delay (Min) </label>
                                <div class="controls">
                                    <asp:TextBox ID="txtSearchDelay" required="required" TextMode="Number" CssClass="input-xlarge focused" runat="server"
                                        placeholder="Enter Search Delay"></asp:TextBox>
                                </div>
                            </div>

                            <div class="control-group error">
                                <label class="control-label" for="inputError">
                                  <asp:Label ID="lblerror" runat="server" CssClass="control-label" for="inputError"></asp:Label></label>
                            </div>

                            <div class="form-actions">
                                <asp:Button ID="btnSubmit" runat="server" Text="Save" 
                                    CssClass="btn btn-primary" onclick="btnSubmit_Click" />
                                <asp:Button ID="btnReset" runat="server" CssClass="btn"  Text="Reset" 
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
