using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using SocialPanel.Model;
using Instafens.Model;
using System.Web.Security;

namespace Instafens.Admin
{
    public partial class AddFund : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                if (!IsPostBack)
                {
                    MembershipUserCollection muc = Membership.GetAllUsers();

                    string[] lst = Roles.GetUsersInRole("User");

                    //List<string> lst = new List<string>();

                    //foreach (str item in muc)
                    //{
                    //    try
                    //    {
                    //        lst.Add(item.UserName);
                    //    }
                    //    catch (Exception ex)
                    //    {
                            
                    //    }
                    //}

                    ddluser.DataSource = lst;
                    ddluser.DataBind();
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
                PaymentRepository paymentRepo = new PaymentRepository();
                tblPayment paymentData = paymentRepo.GetAmountDetail(ddluser.SelectedValue);
                double NewAmount = double.Parse(paymentData.Amount.ToString())+double.Parse(txtamount.Text.Trim());
                paymentRepo.UpdatePayment(ddluser.SelectedValue, NewAmount);
            }
            catch (Exception ex)
            {
                
            }
        }

        protected void btnReset_Click(object sender, EventArgs e)
        {

        }
    }
}