using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SocialPanel.User
{
    public partial class Payment : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            try
            {
                Guid guid = Guid.NewGuid();
                Session["totalShoppingAmt"] = txtAmount.Text;
                Session["orderID"] = guid.ToString();
                Response.Redirect("~/sendpayment.aspx");
            }
            catch (Exception ex)
            {

            }
        }

        protected void btnReset_Click(object sender, EventArgs e)
        {
            try
            {
                txtAmount.Text = string.Empty;
            }
            catch (Exception ex)
            {

            }
        }
    }
}