using System;
using System.Collections.Generic;
using System.Text;
using System.IO;
using System.Text.RegularExpressions;
using System.Threading;
using System.Collections;

namespace InstagramBotLib.Helper
{
    public static class SoftBucketFileUtillity
    {
        private static int _bufferSize = 16384;

        public static string DecodeFromUtf8(string utf8String)
        {
            // copy the string as UTF-8 bytes.
            byte[] utf8Bytes = new byte[utf8String.Length];
            for (int i = 0; i < utf8String.Length; ++i)
            {
                //Debug.Assert( 0 <= utf8String[i] && utf8String[i] <= 255, "the char must be in byte's range");
                utf8Bytes[i] = (byte)utf8String[i];
            }

            return Encoding.UTF8.GetString(utf8Bytes, 0, utf8Bytes.Length);
        }

        public static List<string> ReadFile(string filename)
        {
            List<string> listFileContent = new List<string>();

            StringBuilder stringBuilder = new StringBuilder();
            using (FileStream fileStream = new FileStream(filename, FileMode.Open, FileAccess.Read))
            {
                using (StreamReader streamReader = new StreamReader(fileStream))
                {
                    char[] fileContents = new char[_bufferSize];
                    int charsRead = streamReader.Read(fileContents, 0, _bufferSize);

                    // Can't do much with 0 bytes
                    //if (charsRead == 0)
                    //    throw new Exception("File is 0 bytes");

                    while (charsRead > 0)
                    {
                        stringBuilder.Append(fileContents);
                        charsRead = streamReader.Read(fileContents, 0, _bufferSize);
                    }

                    string[] contentArray = stringBuilder.ToString().Split(new char[] { '\r', '\n' });
                    foreach (string line in contentArray)
                    {
                        listFileContent.Add(line.Replace("#", "").Replace("\0", string.Empty));
                    }
                    listFileContent.RemoveAll(s => string.IsNullOrEmpty(s));
                }
            }
            return listFileContent;
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

        public static void WriteListtoTextfile(List<string> list, string filepath)
        {
            try
            {
                using (StreamWriter writer = new StreamWriter(filepath))
                {
                    foreach (string listitem in list)
                    {
                        writer.WriteLine(listitem);
                    }
                }
            }
            catch (Exception ex)
            {
                Console.WriteLine(ex.StackTrace);
            }
        }

        public static List<string> ReadChineseFile(string path)
        {
            
            try
            {
                List<string> lst = new List<string>();
                using (StreamReader sr = new
                StreamReader(path, System.Text.Encoding.GetEncoding("windows-1256")))
   
              // byte[] plain = Convert.FromBase64String(encodedData);
              // lblmsg.Text = Encoding.UTF8.GetString(plain);

                {

                    //This is an arbitrary size for this example.
                    string c = null;

                    while (sr.Peek() >= 0)
                    {
                        c = null;
                        c = sr.ReadLine();
                        lst.Add(c);

                    }
                }
                return lst;
            }
            catch (Exception e)
            {
                Console.WriteLine("The process failed: {0}", e.ToString());
                return null;
            }
        }
    }
}
