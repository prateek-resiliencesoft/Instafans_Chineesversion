using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Instafens.Model;
using System.Web.Security;
using Social_Media_Service_Panel_With_Pintrest.Model;
using SocialPanel.Model;

namespace Instafens.Admin
{
    public partial class UserPayment : System.Web.UI.Page
    {
        DataClassesDataContext Dbcontext = new DataClassesDataContext();
        PaymentRepository payment = new PaymentRepository();

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
                    Order_Types.GetUserAmountStatus();
                    ddlStatus.DataSource = Order_Types.UserAmountStatus;
                    ddlStatus.DataValueField = "Value";
                    ddlStatus.DataBind();
                    var User = Roles.GetUsersInRole("User");
                    ddlUserName.DataSource = User;
                    ddlUserName.DataBind();
                    Order_Types.GetManuallyAndAutomatically();
                    ddlManuAuto.DataSource = Order_Types.ManuallyAndAutomatically;
                    ddlManuAuto.DataValueField = "Value";
                    ddlManuAuto.DataBind();
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
                bool Result = payment.GetPaymentDetail(ddlUserName.SelectedItem.Value);
                string[] UpdatedBy = Roles.GetRolesForUser(HttpContext.Current.User.Identity.Name);

                DateTime dt = DateTime.Now;

                if (Result == true)
                {
                    tblPayment Payment = payment.GetAmountDetail(ddlUserName.SelectedItem.Value);
                    double Amount = Convert.ToDouble(Payment.Amount);
                    double Total = double.Parse(txtAmount.Text.Trim()) + Amount;
                    payment.UpdatePayment(ddlUserName.SelectedItem.Value, Total);
                }
                else
                {
                    payment.AddPayment(ddlUserName.SelectedItem.Value, double.Parse(txtAmount.Text.Trim()), dt);
                }

                payment.AddPaymentRecord(ddlUserName.SelectedItem.Value, double.Parse(txtAmount.Text.Trim()), ddlStatus.SelectedItem.Text, dt, dt, UpdatedBy[0].Trim(), txtTransactionId.Text.Trim(), txtPaymentSite.Text.Trim(), ddlManuAuto.SelectedItem.Text);
                lblErrorMessage.Text = ddlUserName.SelectedItem.Value + " Payment Details Are Submit";
            }
            catch (Exception ex)
            {
                lblErrorMessage.Text = ex.Message;
            }
        }

        protected void btnReset_Click(object sender, EventArgs e)
        {

        }
    }
}