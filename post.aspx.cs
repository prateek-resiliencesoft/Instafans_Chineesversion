using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;
using Social_Media_Service_Panel.Helper;
using System.Collections.Specialized;
using SocialPanel.Model;
using SocialPanel.Helper;
using Instafens;
using Instafens.Model;

namespace SocialPanel
{
    public partial class post : System.Web.UI.Page
    {
        AutoLikeRepository autoLikeRepo = new AutoLikeRepository();
        OrderRepository orderRepo = new OrderRepository();

        protected void Page_Load(object sender, EventArgs e)
        {
            //SoftBucketHttpUtillity httpHelper = new SoftBucketHttpUtillity();

            //string PostData = "client_id=201df4f77c644f7f9bcf8d9d246e2b4b" +
            //                  "&client_secret=70bf33ede8704d369420cd1ef505220e" +
            //                  "&object=user" +
            //                  "&aspect=media" +
            //                  "&verify_token=myVerifyToken" +
            //                  "&callback_url=http://198.20.168.151/post.aspx";

            //string aa = httpHelper.PostFormData(new Uri("https://api.instagram.com/v1/subscriptions/"), PostData, "", new System.Collections.Specialized.NameValueCollection());


            if (Request.QueryString["hub.challenge"] != null)
            {
                Response.Write(Request.QueryString["hub.challenge"].ToString());
            }
            else
            {
                try
                {
                    System.IO.StreamReader sr = new System.IO.StreamReader(Request.InputStream);
                    string NewImagePostedSource = sr.ReadToEnd();

                    //NewImagePostedSource = "[{\"changed_aspect\": \"media\", \"object\": \"user\", \"object_id\": \"966258514\", \"time\": 1411378957, \"subscription_id\": 12866014, \"data\": {\"media_id\": \"815028228719046648_966258514\"}}]";

                    List<MediaPostedDetails> lstMediaPostedDetails = JsonParser.GetMediaId(NewImagePostedSource);

                    foreach (MediaPostedDetails item in lstMediaPostedDetails)
                    {
                        try
                        {
                            string media_id = item.data.media_id;

                            SoftBucketHttpUtility httpHelper = new SoftBucketHttpUtility();

                            string mediaUrl = "https://api.instagram.com/v1/media/" + media_id + "?client_id=201df4f77c644f7f9bcf8d9d246e2b4b";
                            string MediaPageSource = httpHelper.GetPageSource(new Uri(mediaUrl), string.Empty, string.Empty);

                            MediaDetails md = JsonParser.GetMediaValue(MediaPageSource);


                            tblAutoLikeUser tblLikeUser = autoLikeRepo.GetUser(md.username);

                            if (tblLikeUser != null)
                            {
                                bool IsUrlExist = orderRepo.IsUrlExist(md.link);

                                if (!IsUrlExist)
                                {
                                    Random rnd = new Random();
                                    int Num = rnd.Next(int.Parse(tblLikeUser.MinCount.ToString()), int.Parse(tblLikeUser.MaxCount.ToString()));

                                    string OrderNumber = Guid.NewGuid().ToString();
                                    int EndPoint = md.likecount + Num;
                                    orderRepo.AddOrder("Extreme Instagram Likes", OrderNumber, md.link, Num, tblLikeUser.Login_Username, DateTime.Now, md.likecount, EndPoint, 0, "Pending", DateTime.Now, 0, "AutoLike");
                                }
                            }

                        }
                        catch (Exception ex)
                        {

                        }
                    }

                }
                catch (Exception ex)
                {

                }
            }

        }

        public static void AppendStringToTextfileNewLine(String content, string filepath)
        {

            using (StreamWriter writer = new StreamWriter(filepath, true))
            {
                using (StringReader reader = new StringReader(content))
                {

                    string temptext = "";

                    while ((temptext = reader.ReadLine()) != null)
                    {
                        writer.WriteLine(temptext);
                    }

                    writer.Close();
                }
            }
        }
    }
}