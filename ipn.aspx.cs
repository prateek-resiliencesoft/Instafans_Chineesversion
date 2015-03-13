using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Social_Media_Service_Panel.Helper;
using System.IO;
using System.Net;
using System.Text;
using SocialPanel.Model;
using Instafens.Model;

namespace SocialPanel
{
    public partial class ipn : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                //Post back to either sandbox or live
                string strSandbox = "https://www.sandbox.paypal.com/cgi-bin/webscr";
                // string strLive = "https://www.paypal.com/cgi-bin/webscr";
                HttpWebRequest req = (HttpWebRequest)WebRequest.Create(strSandbox);

                //Set values for the request back
                req.Method = "POST";
                req.ContentType = "application/x-www-form-urlencoded";
                byte[] param = Request.BinaryRead(HttpContext.Current.Request.ContentLength);
                string strRequest = Encoding.ASCII.GetString(param);
                strRequest += "&cmd=_notify-validate";
                req.ContentLength = strRequest.Length;

                //for proxy
                //WebProxy proxy = new WebProxy(new Uri("http://url:port#"));
                //req.Proxy = proxy;

                //Send the request to PayPal and get the response
                StreamWriter streamOut = new StreamWriter(req.GetRequestStream(), System.Text.Encoding.ASCII);
                streamOut.Write(strRequest);
                streamOut.Close();
                StreamReader streamIn = new StreamReader(req.GetResponse().GetResponseStream());
                string strResponse = streamIn.ReadToEnd();
                streamIn.Close();

                if (strResponse == "VERIFIED")
                {
                    //UPDATE YOUR DATABASE
                    // paypal has verified the data, it is safe for us to perform processing now
                    // extract the form fields expected: buyer and seller email, payment status, amount, custom, txn_id

                    string payerEmail = Request.Form["payer_email"];
                    string paymentStatus = Request.Form["payment_status"];
                    string receiverEmail = Request.Form["receiver_email"];
                    string amount = Request.Form["mc_gross"];
                    string custom = Request.Form["custom"];
                    string txn_id = Request.Form["txn_id"];

                    //string TestData = "payerEmail : " + payerEmail + " paymentStatus : " + paymentStatus + " receiverEmail : "
                    //        + receiverEmail + " amount : " + amount + " custom : " + custom + " txn_id : " + txn_id;
                   

                    if (paymentStatus.Equals("Completed"))
                    {
                        //FileHelper.AppendStringToTextfileNewLine(TestData, Server.MapPath("text.txt"));
                        if (!string.IsNullOrEmpty(custom))
                        {
                            DateTime dt = DateTime.Now;

                            PaymentRepository pr = new PaymentRepository();
                            pr.AddPaymentRecord(custom, double.Parse(amount), paymentStatus,dt,dt, "Auto", txn_id, payerEmail, receiverEmail);



                            try
                            {
                                bool IsExist = pr.GetPaymentDetail(custom);

                                if (IsExist)
                                {
                                    tblPayment tblpay = pr.GetAmountDetail(custom);
                                    double lastBal = double.Parse(tblpay.Amount.ToString());
                                    double NewBal = lastBal + double.Parse(amount);
                                    pr.UpdatePayment(custom, NewBal);

                                    Session["Amount"] = NewBal;
                                }
                                else
                                {
                                    pr.AddPayment(custom, double.Parse(amount),dt);

                                    Session["Amount"] = double.Parse(amount);
                                }
                            }
                            catch (Exception ex)
                            {
                                FileHelper.AppendStringToTextfileNewLine(ex.Message, Server.MapPath("text.txt"));
                            }
                        }
                    }

                    //check the payment_status is Completed
                    //check that txn_id has not been previously processed
                    //check that receiver_email is your Primary PayPal email
                    //check that payment_amount/payment_currency are correct
                    //process payment
                }
                else if (strResponse == "INVALID")
                {

                    string payerEmail = Request.Form["payer_email"];
                    string paymentStatus = Request.Form["payment_status"];
                    string receiverEmail = Request.Form["receiver_email"];
                    string amount = Request.Form["mc_gross"];
                    string custom = Request.Form["custom"];
                    string txn_id = Request.Form["txn_id"];

                    DateTime dt = DateTime.Now;

                    PaymentRepository pr = new PaymentRepository();
                    pr.AddPaymentRecord(custom, double.Parse(amount), paymentStatus, dt, dt, "Auto", txn_id, payerEmail, receiverEmail);

                    //UPDATE YOUR DATABASE

                    //TextWriter txWriter = new StreamWriter(Server.MapPath("../uploads/") + Session["orderID"].ToString() + ".txt");
                    //txWriter.WriteLine(strResponse);
                    ////log for manual investigation
                    //txWriter.Close();

                   // FileHelper.AppendStringToTextfileNewLine(strResponse, Server.MapPath("text.txt"));
                }
                else
                {

                    string payerEmail = Request.Form["payer_email"];
                    string paymentStatus = Request.Form["payment_status"];
                    string receiverEmail = Request.Form["receiver_email"];
                    string amount = Request.Form["mc_gross"];
                    string custom = Request.Form["custom"];
                    string txn_id = Request.Form["txn_id"];

                    DateTime dt = DateTime.Now;

                    PaymentRepository pr = new PaymentRepository();
                    pr.AddPaymentRecord(custom, double.Parse(amount), paymentStatus, dt, dt, "Auto", txn_id, payerEmail, receiverEmail);

                    //UPDATE YOUR DATABASE

                    //TextWriter txWriter = new StreamWriter(Server.MapPath("../uploads/") + Session["orderID"].ToString() + ".txt");
                    //txWriter.WriteLine("Invalid");
                    ////log response/ipn data for manual investigation
                    //txWriter.Close();

                   // FileHelper.AppendStringToTextfileNewLine(strResponse, Server.MapPath("text.txt"));
                }
            }
            catch (Exception ex)
            {
                //FileHelper.AppendStringToTextfileNewLine(ex.Message, Server.MapPath("text.txt"));
            }

            //try
            //{
            //    Response.Write(Request.Url.ToString());

            //    FileHelper.AppendStringToTextfileNewLine(Request.Url.ToString(), Server.MapPath("text.txt"));
            //}
            //catch (Exception ex)
            //{
            //    FileHelper.AppendStringToTextfileNewLine(ex.Message, Server.MapPath("text.txt"));
            //}
        }
    }
}