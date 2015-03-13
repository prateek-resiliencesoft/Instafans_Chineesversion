using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using SocialPanel.Model;
using System.Web.Security;

namespace Social_Media_Service_Panel
{
    public partial class TestGrid : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            //MembershipUserCollection muc = Membership.GetAllUsers();

            //foreach (MembershipUser item in muc)
            //{
            //    if (item.UserName!="test2" || item.UserName!= "test3")
            //    {
            //        Membership.DeleteUser(item.UserName);
            //    }
            //}

            //decimal d = decimal.Parse("500") / 1000;
            //double AmountForTask = double.Parse(d.ToString());

            //PaymentRepository pr = new PaymentRepository();

            //pr.AddPayment("pankaj", 10);

            //pr.AddPaymentRecord("pankaj", 10, "Completed", "pankaj", "111", "payer", "recevier");

        }
    }
}