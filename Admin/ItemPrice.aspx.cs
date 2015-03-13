using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Social_Media_Service_Panel_With_Pintrest.Model;
using SocialPanel.Model;
using Instafens;
using Instafens.Model;

namespace SocialPanel.Admin
{
    public partial class ItemPrice : System.Web.UI.Page
    {
        OrderTypePriceRepository orderTypePriceRepo = new OrderTypePriceRepository();

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

                        if (Request.QueryString["ID"] != null)
                        {
                            int OrderId = int.Parse(Request.QueryString["ID"]);

                            tblOrderTypePrice orderTypePrice = orderTypePriceRepo.GetOrderTypePrice(OrderId);
                            txtAmount.Text = orderTypePrice.Price.ToString();

                            ddlOrderType.ClearSelection();
                            this.ddlOrderType.Items.FindByText(orderTypePrice.OrderType).Selected = true;
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
                    decimal AmountForTask = decimal.Parse(txtAmount.Text.Trim());

                    orderTypePriceRepo.AddOrderTypePrice(ddlOrderType.SelectedItem.Value.Trim(), AmountForTask,int.Parse(txtMinAccount.Text.Trim()),int.Parse(txtMaxAccount.Text.Trim()));
                    lblErrorMessage.Text = "Record successfully added";
                }
                else
                {
                    int OrderId = int.Parse(Request.QueryString["ID"]);

                    decimal AmountForTask = decimal.Parse(txtAmount.Text.Trim());

                    orderTypePriceRepo.UpdateOrderTypePrice(OrderId, ddlOrderType.SelectedItem.Value.Trim(), AmountForTask, int.Parse(txtMinAccount.Text.Trim()), int.Parse(txtMaxAccount.Text.Trim()));
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
            }
            catch (Exception ex)
            {

            }
        }
    }
}