using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Social_Media_Service_Panel_With_Pintrest.Model;
using SocialPanel.Model;
using System.Text.RegularExpressions;
using Social_Media_Service_Panel.Helper;
using Social_Media_Service_Panel.ForImage.Helper;
using Instafens;
using Instafens.Model;

namespace SocialPanel.Admin
{
    public partial class Order : System.Web.UI.Page
    {
        OrderRepository orderRepo = new OrderRepository();
        
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                if (HttpContext.Current.User.Identity.IsAuthenticated)
                {
                    if (!IsPostBack)
                    {
                        Order_Types.GetOrderTypes();
                        ddlOrderType.DataSource = Order_Types.OrderTypes;
                        ddlOrderType.DataTextField = "Value";
                        ddlOrderType.DataValueField = "Value";
                        ddlOrderType.DataBind();

                        Order_Types.GetStatusForAdmin();
                        ddlOrderStatus.DataSource = Order_Types.StatusForAdmin;
                        ddlOrderStatus.DataTextField = "Value";
                        ddlOrderStatus.DataValueField = "Value";
                        ddlOrderStatus.DataBind();

                        if (Request.QueryString["ID"] != null)
                        {
                            int OrderId = int.Parse(Request.QueryString["ID"]);

                            tblOrder order = orderRepo.GetDetail(OrderId);
                            txtUrl.Text = order.Url;
                            txtAmount.Text = order.Amount.ToString();

                            hfUser.Value = order.ClientUserName;

                            ddlOrderType.ClearSelection();
                            ddlOrderStatus.ClearSelection();
                            this.ddlOrderType.Items.FindByText(order.OrderType).Selected = true;
                            this.ddlOrderStatus.Items.FindByText(order.OrderStatus).Selected = true;
                        }
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
                if (Request.QueryString["ID"] == null)
                {
                    string OrderNumber = Guid.NewGuid().ToString();

                    decimal AmountForTask = decimal.Parse(txtAmount.Text.Trim()) / 1000;
                    AmountForTask = AmountForTask * 2;

                    List<string> lstAcconts = Regex.Split(txtUrl.Text.Trim(), "\r\n").ToList();

                    foreach (string item in lstAcconts)
                    {
                        try
                        {
                            int startPoint = 0;
                            int endPoint = 0;
                            InstagramDetails instaDetails = new InstagramDetails();

                            if (ddlOrderType.SelectedItem.Value.Contains("Like"))
                            {
                                InstagramImageResult instaImage = instaDetails.GetInstagramImageIdByUrl(item);
                                startPoint = instaImage.entry_data.DesktopPPage[0].media.likes.count;
                            }
                            if (ddlOrderType.SelectedItem.Value.Contains("Follow"))
                            {
                                Social_Media_Service_Panel.Helper.InstagramUser instaUser = instaDetails.GetInstgramUserByUserName(item);
                                startPoint = instaUser.entry_data.UserProfile[0].user.counts.followed_by;
                            }
                            endPoint = startPoint + int.Parse(txtAmount.Text.Trim());

                            orderRepo.AddOrder(ddlOrderType.SelectedItem.Value, OrderNumber, item, int.Parse(txtAmount.Text.Trim()),
                                                HttpContext.Current.User.Identity.Name, DateTime.Now,startPoint,endPoint, 0, ddlOrderStatus.SelectedItem.Value, DateTime.Now, AmountForTask,"Normal");
                            lblErrorMessage.Text = "Order Added";
                        }
                        catch (Exception ex)
                        {

                        }
                    }
                    
                }
                else
                {
                    int OrderId = int.Parse(Request.QueryString["ID"]);

                    decimal AmountForTask = decimal.Parse(txtAmount.Text.Trim()) / 1000;
                    AmountForTask = AmountForTask * 2;

                    //orderRepo.UpdateOrderForAdmin(OrderId,ddlOrderType.SelectedItem.Value, txtUrl.Text.Trim(), int.Parse(txtAmount.Text.Trim()),
                    //    HttpContext.Current.User.Identity.Name, DateTime.Now, ddlOrderStatus.SelectedItem.Value, DateTime.Now,AmountForTask);

                    orderRepo.UpdateOrderForAdmin(OrderId, ddlOrderType.SelectedItem.Value, txtUrl.Text.Trim(), int.Parse(txtAmount.Text.Trim()),
                        hfUser.Value.Trim(), DateTime.Now, ddlOrderStatus.SelectedItem.Value, DateTime.Now, AmountForTask);

                    lblErrorMessage.Text = "Record successfully updated";
                }
            }
            catch (Exception ex)
            {
                lblErrorMessage.Text = ex.Message;
            }
        }

        protected void btnReset_Click(object sender, EventArgs e)
        {
            try
            {
                txtAmount.Text = string.Empty;
                txtUrl.Text = string.Empty;
            }
            catch (Exception ex)
            {
                lblErrorMessage.Text = ex.Message;
            }
        }
    }
}