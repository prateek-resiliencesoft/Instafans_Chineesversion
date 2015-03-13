<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Site.Master" AutoEventWireup="true" CodeBehind="Payment.aspx.cs" Inherits="Social_Media_Service_Panel.Admin.Payment" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
  


    <div id="content" class="span10">
    <div>
            <ul class="breadcrumb">
                <li><a href="#">Add Funds</a> <span class="divider">/</span> </li>
                <li><a href="#">Payment</a> </li>
            </ul>
        </div>

           <div class="row-fluid sortable">
           <div class="box span12">
           <div class="box-header well" data-original-title>
                    <h2>
                        <i class="icon-edit"></i>Add Fund</h2>
                    <div class="box-icon">
                      
                        <a href="#" class="btn btn-minimize btn-round"><i class="icon-chevron-up"></i></a>
                        
                    </div>
                </div>


                <div class="box-content">
                 <div class="form-horizontal">

                    <fieldset>


                    <legend>Add Fund To User Accounts</legend>

                    <div class="control-group">
                    <label class="control-label" for="selectError3">
                                    Select User</label>

                                    <div class="controls">
                                    <asp:DropDownList ID="ddlUserName" runat="server" class="styledselect_form_1" >
            </asp:DropDownList>
            </div>	
                    </div>

                    <div class="control-group">
                    <label class="control-label" for="selectError3">
                                    Amount</label>
                                     <div class="controls">

                                     <asp:TextBox ID="txtAmount" 
           runat="server"  Width="184px" ></asp:TextBox>
           <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
           ControlToValidate="txtAmount" ErrorMessage="*" Font-Bold="True" 
           ForeColor="Red"></asp:RequiredFieldValidator>
           <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" 
        ControlToValidate="txtAmount" ErrorMessage="Enter Number" 
        ValidationExpression="^\d{1,8}(\.\d{1,2})?$" 
        Font-Bold="True"></asp:RegularExpressionValidator>
                                     </div>

                                    </div>


                                     <div class="control-group error">
                                      <label class="control-label" for="inputError">
                                      <asp:Label ID="lblSubmitmsg" runat="server" Font-Bold="True" ForeColor="Lime"></asp:Label>
                                       <asp:Label ID="lblerror" runat="server" Font-Bold="True" ForeColor="Red"></asp:Label>
                                      </label>
                                     </div>
                                     <div class="form-actions">
                                      <asp:Button ID="btnSubmit" runat="server" onclick="btnSubmit_Click"  Text="Add Fund" CssClass="btn btn-primary" />
                                     </div>
                    </fieldset>
                 </div>

                  </div>
           </div>
           </div>
    </div>
    
    
  
</asp:Content>
