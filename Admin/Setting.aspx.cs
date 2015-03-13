using System;
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
    public partial class Setting : System.Web.UI.Page
    {
        OperationSettingRepository oprRepo = new OperationSettingRepository();

        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                if (HttpContext.Current.User.Identity.IsAuthenticated)
                {
                    if (!IsPostBack)
                    {
                        OperationSetting oprSetting = oprRepo.GetSetting(1);

                        txtLikeDelay.Text = oprSetting.LikeDelay.ToString();
                        txtFollowDelay.Text = oprSetting.FollowDelay.ToString();
                        txtSearchDelay.Text = oprSetting.SearchDelay.ToString(); 
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

            }
        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            try
            {
                oprRepo.UpdateDelay(1,int.Parse(txtLikeDelay.Text.Trim()),int.Parse(txtFollowDelay.Text.Trim()),int.Parse(txtSearchDelay.Text.Trim()));
                lblerror.Text = "Records Updated";
            }
            catch (Exception ex)
            {
                lblerror.Text = ex.Message;
            }
        }

        protected void btnReset_Click(object sender, EventArgs e)
        {

        }
    }
}