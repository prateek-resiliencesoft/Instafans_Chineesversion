using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Newtonsoft.Json.Linq;
using Newtonsoft.Json;
using Social_Media_Service_Panel.Helper;
using Social_Media_Service_Panel.ForImage.Helper;

namespace SocialPanel.Helper
{
    public class JsonParser
    {
        public static InstagramUser GetInstagramUser(string Data)
        {
            InstagramUser instagramUser = new InstagramUser();

            try
            {
                instagramUser = JsonConvert.DeserializeObject<InstagramUser>(Data);
            }
            catch (Exception ex)
            {

            }

            return instagramUser;

        }

        public static InstagramImageResult GetImageResult(string data)
        {
            InstagramImageResult instaImage = new InstagramImageResult();

            try
            {
                instaImage = JsonConvert.DeserializeObject<InstagramImageResult>(data);
            }
            catch (Exception ex)
            {

            }

            return instaImage;
        }

        public static MediaDetails GetMediaValue(string PageSource)
        {
            MediaDetails md = new MediaDetails();

            try
            {
                JObject OBJData = JObject.Parse(PageSource);
                if (OBJData != null)
                {
                    JObject JDATA = (JObject)OBJData["data"];
                    if (JDATA != null)
                    {
                        md.link = (string)JDATA["link"];
                        JObject JLIKE = (JObject)JDATA["likes"];
                        if (JLIKE != null)
                        {
                            md.likecount = (int)JLIKE["count"];
                        }

                        JObject JUser = (JObject)JDATA["user"];
                        if (JUser != null)
                        {
                            md.username = (string)JUser["username"];
                        }
                    }
                }
            }
            catch (Exception ex)
            {

            }

            return md;
        }

        public static List<MediaPostedDetails> GetMediaId(string PageSource)
        {
            List<MediaPostedDetails> lstMediaDetails = new List<MediaPostedDetails>();

            try
            {
                lstMediaDetails = JsonConvert.DeserializeObject<List<MediaPostedDetails>>(PageSource);
            }
            catch (Exception ex)
            {

            }

            return lstMediaDetails;
        }
    }

    public class Data
    {
        public string media_id { get; set; }
    }

    public class MediaPostedDetails
    {
        public string changed_aspect { get; set; }
        public string @object { get; set; }
        public string object_id { get; set; }
        public int time { get; set; }
        public int subscription_id { get; set; }
        public Data data { get; set; }
    }

    public class MediaDetails
    {
        public string link { get; set; }
        public int likecount { get; set; }
        public string username { get; set; }
    }
}