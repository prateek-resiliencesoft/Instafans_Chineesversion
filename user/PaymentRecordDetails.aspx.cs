using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using SocialPanel.Model;
using Instafens;
using Instafens.Model;

namespace Social_Media_Service_Panel.User
{
    public partial class PaymentRecordDetails : System.Web.UI.Page
    {
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
                else
                {
                    tblPayment tblpay = pr.GetAmountDetail(HttpContext.Current.User.Identity.Name);
                    Session["Amount"] = tblpay.Amount;
                }
            }
            catch (Exception ex)
            {

            }
        }

      
    }
}