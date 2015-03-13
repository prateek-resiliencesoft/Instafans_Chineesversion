using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Web.Security;

namespace Social_Media_Service_Panel.Admin
{
    public partial class Users : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                if (!HttpContext.Current.User.Identity.IsAuthenticated)
                {
                    Response.Redirect("~/Login.aspx", false);
                    return;
                }

                //gvLoginDtails.DataSource = Membership.GetAllUsers();
                //gvLoginDtails.DataBind();

                //System.Data.DataView dv = (DataView)sdsLoginDtails.Select(DataSourceSelectArguments.Empty);
                //lblRecord.Text = "Total Rows Found : " + dv.Count.ToString();
            }
            catch (Exception ex)
            {
                //lblerror.Text += ex.Message;
            }
        }
    }
}