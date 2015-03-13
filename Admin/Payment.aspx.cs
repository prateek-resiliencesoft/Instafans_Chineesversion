using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Social_Media_Service_Panel_With_Pintrest.Model;
using System.Web.Security;
using SocialPanel.Model;
using Instafens;
using Instafens.Model;

namespace Social_Media_Service_Panel.Admin
{
    public partial class Payment : System.Web.UI.Page
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
                    //Order_Types.GetUserAmountStatus();
                    //ddlStatus.DataSource = Order_Types.UserAmountStatus;
                    //ddlStatus.DataValueField = "Value";
                    //ddlStatus.DataBind();
                    var User = Roles.GetUsersInRole("User");
                    ddlUserName.DataSource = User;
                    ddlUserName.DataBind();
                    //Order_Types.GetManuallyAndAutomatically();
                    //ddlManuAuto.DataSource = Order_Types.ManuallyAndAutomatically;
                    //ddlManuAuto.DataValueField = "Value";
                    //ddlManuAuto.DataBind();
                }
            }
            catch (Exception ex)
            {
                lblerror.Text = ex.Message;
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
                Guid txnid = Guid.NewGuid();
                payment.AddPaymentRecord(ddlUserName.SelectedItem.Value, double.Parse(txtAmount.Text.Trim()), "True", dt, dt, UpdatedBy[0].Trim(), txnid.ToString(), "http://198.20.168.134/Admin/Payment.aspx", "Manually");
                lblSubmitmsg.Text = ddlUserName.SelectedItem.Value+" Payment Details Are Submit";
            }
            catch (Exception ex)
            {
                lblerror.Text = ex.Message;
            }
        }
    }
}