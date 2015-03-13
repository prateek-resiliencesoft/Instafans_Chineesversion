using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Social_Media_Service_Panel.User
{
    public partial class PaymentDetails : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //try
            //{
            //    if (!HttpContext.Current.User.Identity.IsAuthenticated)
            //    {
            //        Response.Redirect("~/Login.aspx", false);
            //        return;
            //    }
            //}
            //catch (Exception ex)
            //{

            //}
        }

        protected void sdsPaymentDetails_Selecting(object sender, SqlDataSourceSelectingEventArgs e)
        {
            //try
            //{
            //    e.Command.Parameters["@UserName"].Value = HttpContext.Current.User.Identity.Name;
            //}
            //catch (Exception ex)
            //{

            //}
        }
    }
}