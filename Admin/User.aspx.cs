using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using SocialPanel.Model;
using Social_Media_Service_Panel_With_Pintrest.Model;
using System.Web.Security;
using Social_Media_Service_Panel_With_Pintrest.Helper;
using System.Drawing;

namespace Social_Media_Service_Panel.Admin
{
    public partial class User : System.Web.UI.Page
    {
        MailFormats Mail = new MailFormats();
        PaymentRepository pr = new PaymentRepository();

        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {

                if (!HttpContext.Current.User.Identity.IsAuthenticated)
                {
                    Response.Redirect("~/Login.aspx", false);
                    return;
                }
                if (!IsPostBack)
                {
                    rblmalefemale.SelectedValue = "Male";
                    rblmalefemale.ForeColor = Color.Black;
                    List<string> type = Roles.GetAllRoles().ToList();
                    ddlUserType.DataSource = type;
                    ddlUserType.DataBind();
                    ddlUserType.Items.FindByText("User").Selected = true;
                }

            }
            catch (Exception ex)
            {
                lblErrorMessage.Text += ex.Message;
            }
        }
        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            try
            {
                bool IsExistUser = Membership.ValidateUser(txtUserName.Text.Trim(), txtPassword.Text.Trim());

                if (!IsExistUser)
                {
                    MembershipCreateStatus status = MembershipCreateStatus.Success;
                    Membership.CreateUser(txtUserName.Text.Trim(), txtPassword.Text.Trim(), txtemail.Text.Trim(), "my question", "answer", true, out status);

                    if (status == MembershipCreateStatus.Success)
                    {
                        try
                        {
                            pr.AddPayment(txtUserName.Text.Trim(), 0, DateTime.Now);
                        }
                        catch (Exception ex)
                        {

                        }

                        Roles.AddUserToRole(txtUserName.Text.Trim(), ddlUserType.SelectedItem.Value);
                        lblErrorMessage.Text = "User Create successfully";
                        string Body = Mail.RegistrationMail(txtUserName.Text.Trim(), txtemail.Text.Trim(), txtPassword.Text.Trim());
                        Mail.SendRegistrationMailWithFormat(txtemail.Text.Trim(), Body);
                    }
                    else
                    {
                        lblErrorMessage.Text = status.ToString();
                    }

                }
                else
                {
                    lblErrorMessage.Text = "User Already Exist";
                }

            }
            catch (Exception ex)
            {
                lblErrorMessage.Text += ex.Message;
            }
        }

        protected void btnReset_Click(object sender, EventArgs e)
        {

        }
    }
}