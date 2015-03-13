using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using SocialPanel.Model;
using Social_Media_Service_Panel_With_Pintrest.Helper;
using Instafens.Model;
using Social_Media_Service_Panel.Helper;
using System.Text.RegularExpressions;

namespace Instafens.User
{
    public partial class AddFollower : System.Web.UI.Page
    {
        OrderRepository orderRepo = new OrderRepository();
        MailFormats mailformats = new MailFormats();
        PaymentRepository pr = new PaymentRepository();
        OrderTypePriceRepository orderTypePriceRepo = new OrderTypePriceRepository();

        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                if (HttpContext.Current.User.Identity.IsAuthenticated)
                {
                    if (!IsPostBack)
                    {
                        tblOrderTypePrice orderTypePrice = orderTypePriceRepo.GetOrderTypePrice("Followers");

                        txtMinAmount.Text = orderTypePrice.MinAmount.ToString();
                        txtMaxAmount.Text = orderTypePrice.MaxAmount.ToString();
                        txtPrice.Text = orderTypePrice.Price.ToString();
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
                lblErrorMessage.Text = ex.Message;
            }
        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            try
            {
                List<string> lstUrls = Regex.Split(txtUrl.Text.Trim(), "\r\n").ToList();

                foreach (var itemUrl in lstUrls)
                {
                    decimal tempAmount = 0;

                    if (Session["PriceList"] == null)
                    {
                        IQueryable<tblOrderTypePrice> orderTypePrice = orderTypePriceRepo.GetOrderTypePrice();
                        Dictionary<string, decimal> dicOrderTypePrice = new Dictionary<string, decimal>();

                        foreach (tblOrderTypePrice item in orderTypePrice)
                        {
                            try
                            {
                                dicOrderTypePrice.Add(item.OrderType, decimal.Parse(item.Price.ToString()));
                            }
                            catch (Exception ex)
                            {

                            }
                        }

                        Session["PriceList"] = dicOrderTypePrice;
                        tempAmount = dicOrderTypePrice["Followers"];
                    }
                    else
                    {
                        Dictionary<string, decimal> dicOrderTypePrice = (Dictionary<string, decimal>)Session["PriceList"];
                        tempAmount = dicOrderTypePrice["Followers"];
                    }

                    string OrderNumber = Guid.NewGuid().ToString();

                    tblPayment tblpay = pr.GetAmountDetail(HttpContext.Current.User.Identity.Name);

                    double lastBal = double.Parse(tblpay.Amount.ToString());
                    decimal AmountForTask = decimal.Parse(txtAmount.Text.Trim()) / 1000;

                    AmountForTask = AmountForTask * tempAmount;
                    double NewBal = lastBal - double.Parse(AmountForTask.ToString());

                    if (NewBal >= 0)
                    {
                        pr.UpdatePayment(HttpContext.Current.User.Identity.Name, NewBal);

                        Session["Amount"] = NewBal;
                    }
                    else
                    {
                        lblErrorMessage.Text = "No Enough balance please add the money";
                        return;
                    }

                    int startPoint = 0;
                    int endPoint = 0;
                    InstagramDetails instaDetails = new InstagramDetails();


                    Social_Media_Service_Panel.Helper.InstagramUser instaUser = instaDetails.GetInstgramUserByUserName(itemUrl);
                    startPoint = instaUser.entry_data.UserProfile[0].user.counts.followed_by;

                    endPoint = startPoint + int.Parse(txtAmount.Text.Trim());

                    if (itemUrl.Contains("http"))
                    {
                        orderRepo.AddOrder("Followers", OrderNumber, itemUrl, int.Parse(txtAmount.Text.Trim()),
                        HttpContext.Current.User.Identity.Name, DateTime.Now, startPoint, endPoint, 0, "Pending", DateTime.Now, AmountForTask, "Normal");
                    }
                    else
                    {
                        string tempUrl = "https://instagram.com/" + itemUrl;
                        orderRepo.AddOrder("Followers", OrderNumber, tempUrl, int.Parse(txtAmount.Text.Trim()),
                        HttpContext.Current.User.Identity.Name, DateTime.Now, startPoint, endPoint, 0, "Pending", DateTime.Now, AmountForTask, "Normal");
                    }

                    
                    lblErrorMessage.Text = "Order added";
                }



                //string Body = mailformats.OrderMailBody(ddlOrderType.SelectedItem.Value, string.Join("<br/>", FbDetail.ToArray()), Number, "Facebook");
                //var Username = Membership.GetUser(HttpContext.Current.User.Identity.Name);
                //string Email = Username.Email;
                //mailformats.SendNewOrderMailWithFormat(Email, Body);

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