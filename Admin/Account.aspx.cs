using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Social_Media_Service_Panel_With_Pintrest.Model;
using System.Text.RegularExpressions;
using SocialPanel.Model;
using Instafens;
using Instafens.Model;
using System.IO;
using InstagramBotLib.Helper;

namespace Social_Media_Service_Panel.Admin
{
    public partial class Account : System.Web.UI.Page
    {
        SocialAccountRepository socialAccountRepo = new SocialAccountRepository();

        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                if (HttpContext.Current.User.Identity.IsAuthenticated)
                {
                    if (!IsPostBack)
                    {
                        Order_Types.GetAccountType();
                        ddlAccountType.DataSource = Order_Types.AcountType;
                        ddlAccountType.DataTextField = "Value";
                        ddlAccountType.DataValueField = "Value";
                        ddlAccountType.DataBind();

                        //if (Request.QueryString["ID"] != null)
                        //{
                        //    string queryUsername = Request.QueryString["ID"];

                            //tblSocialAccount socialAccounts = socialAccountRepo.GetAccount(queryUsername);
                            //txtAccounts.Text = socialAccounts.Username + ":" + socialAccounts.Password + ":" + socialAccounts.Proxy
                            //    + ":" + socialAccounts.Port + ":" + socialAccounts.ProxyUsername + ":" + socialAccounts.ProxyPassword;

                            //this.ddlAccountType.Items.FindByText(socialAccounts.AccountType).Selected = true;
                        //}
                        //    tblSocialAccount socialAccounts = socialAccountRepo.GetAccount(queryUsername);
                        //    txtAccounts.Text = socialAccounts.Username + ":" + socialAccounts.Password + ":" + socialAccounts.Proxy
                        //        + ":" + socialAccounts.Port + ":" + socialAccounts.ProxyUsername + ":" + socialAccounts.ProxyPassword;

                        //    this.ddlAccountType.Items.FindByText(socialAccounts.AccountType).Selected = true;
                        //}
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
                lblerror.Text = ex.Message;
            }
        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            try
            {
                if (FileUploadControl.HasFile)
                {
                    if (FileUploadControl.PostedFile.ContentType == "text/plain")
                    {
                        string filename = FileUploadControl.PostedFile.FileName;
                        FileUploadControl.SaveAs(Server.MapPath("~/AccountFiles/" + filename));
                        List<string> lstAcconts = SoftBucketFileUtillity.ReadFile(Server.MapPath("~/AccountFiles/" + filename));

                        //List<string> lstAcconts = Regex.Split(txtAccounts.Text.Trim(), "\r\n").ToList();

                        foreach (string item in lstAcconts)
                        {
                            try
                            {
                                string[] arAccounts = item.Split(':');

                                string Username = string.Empty;
                                string Password = string.Empty;
                                string Proxy = string.Empty;
                                string Port = "0";
                                string ProxyUsername = string.Empty;
                                string ProxyPassword = string.Empty;

                                if (arAccounts.Count() == 4)
                                {
                                    Username = arAccounts[0];
                                    Password = arAccounts[1];
                                    Proxy = arAccounts[2];
                                    Port = arAccounts[3];
                                }
                                else if (arAccounts.Count() == 6)
                                {
                                    Username = arAccounts[0];
                                    Password = arAccounts[1];
                                    Proxy = arAccounts[2];
                                    Port = arAccounts[3];
                                    ProxyUsername = arAccounts[4];
                                    ProxyPassword = arAccounts[5];
                                }
                                else
                                {
                                    Username = arAccounts[0];
                                    Password = arAccounts[1];
                                }

                                if (Request.QueryString["ID"] == null)
                                {
                                    socialAccountRepo.AddAccount(ddlAccountType.SelectedItem.Value, Username, Password, Proxy, int.Parse(Port), ProxyUsername, ProxyPassword, true);
                                }
                                else
                                {
                                    string queryUsername = Request.QueryString["ID"];
                                    socialAccountRepo.UpdateAccount(ddlAccountType.SelectedItem.Value, Username, Password, Proxy, int.Parse(Port), ProxyUsername, ProxyPassword, true);
                                }
                            }
                            catch (Exception ex)
                            {

                            }
                        }

                        lblerror.Text = "Accounts Added Successfully";
                    }
                    else
                    {
                        lblerror.Text = "Accept only Text file";
                    }
                }
                else
                {
                    lblerror.Text = "Please select a File.";
                }
            }
            catch (Exception ex)
            {
                lblerror.Text = ex.Message;
            }
        }

        protected void btnReset_Click(object sender, EventArgs e)
        {
            try
            {

            }
            catch (Exception ex)
            {

            }
        }

        protected void btndelete_Click(object sender, EventArgs e)
        {
            try
            {
                socialAccountRepo.DeleteFalseAccount();
                lblDelete.Text = "Accounts Deleted Successfully.";
            }
            catch (Exception ex)
            {
                lblDelete.Text = ex.Message;
            }
        }
    }
}