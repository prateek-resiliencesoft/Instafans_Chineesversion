﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using SocialPanel.Model;
using Instafens;
using Instafens.Model;

namespace SocialPanel.Admin
{
    public partial class InstagramUser : System.Web.UI.Page
    {
        AutoLikeRepository autoLikeRepo = new AutoLikeRepository();

        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                if (HttpContext.Current.User.Identity.IsAuthenticated)
                {
                    if (!IsPostBack)
                    {
                        ddlStatus.Items.Add("Active");
                        ddlStatus.Items.Add("InActive");

                        if (Request.QueryString["ID"] != null)
                        {
                            int OrderId = int.Parse(Request.QueryString["ID"]);

                            tblAutoLikeUser likeUser = autoLikeRepo.GetUser(OrderId);
                            
                            txtUsername.Text = likeUser.Insta_Username;
                            txtUsername.Enabled = false;
                            txtMinCount.Text = likeUser.MinCount.ToString();
                            txtMaxCount.Text = likeUser.MaxCount.ToString();

                            this.ddlStatus.Items.FindByText(likeUser.Status).Selected = true;
                        }
                    }
                }
                else
                {
                    Response.Redirect("~/Login.aspx", false);
                    return;
                }
            }
            catch (Exception ex)
            {
                lblErrorMessage.Text = ex.Message;
            }
        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            try
            {

                if (Request.QueryString["ID"] != null)
                {
                    int OrderId = int.Parse(Request.QueryString["ID"]);
                    autoLikeRepo.UpdateInstagramUser(OrderId, ddlStatus.SelectedValue, int.Parse(txtMinCount.Text.Trim()), int.Parse(txtMaxCount.Text.Trim()));
                    lblErrorMessage.Text = "Instagram User Accounts Updated Successfully";
                }
                else
                {
                    bool IsUserExist = autoLikeRepo.IsInstagramUserExist(txtUsername.Text.Trim());

                    if (!IsUserExist)
                    {
                        autoLikeRepo.AddInstagramUser(HttpContext.Current.User.Identity.Name, txtUsername.Text.Trim(), int.Parse(txtMinCount.Text.Trim()), int.Parse(txtMaxCount.Text.Trim()), ddlStatus.SelectedValue);
                        lblErrorMessage.Text = "Instagram User Accounts Added Successfully";
                    }
                    else
                    {
                        lblErrorMessage.Text = txtUsername.Text.Trim() + " is allready added.";
                    }
                }

                
            }
            catch (Exception ex)
            {
                lblErrorMessage.Text = ex.Message;
            }
        }
    }
}