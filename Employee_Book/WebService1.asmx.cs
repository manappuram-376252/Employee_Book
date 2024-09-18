using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Script.Services;
using System.Web.Services;

namespace Employee_Book
{
    /// <summary>
    /// Summary description for WebService1
    /// </summary>
    [WebService(Namespace = "http://tempuri.org/")]
    [WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
    [System.ComponentModel.ToolboxItem(false)]
    [ScriptService]
    // To allow this Web Service to be called from script, using ASP.NET AJAX, uncomment the following line. 
    // [System.Web.Script.Services.ScriptService]
    public class WebService1 : System.Web.Services.WebService
    {

        [WebMethod]
        public string GetData(string firstName, string lastName, string age, string dob, string gender, string email, string phone, string username, string password)
        {
            var url = "https://localhost:7253/api/User";


            // Convert the user object to JSON
            var json = "{\"firstName\":\"" + firstName + "\",\"lastName\":\"" + lastName + "\",\"age\":" + age + ",\"dob\":\"" + dob + "\",\"gender\":\"" + gender + "\",\"email\":\"" + email + "\",\"phone_no\":\"" + phone + "\",\"username\":\"" + username + "\",\"password\":\"" + password + "\"}";

            var request = (HttpWebRequest)WebRequest.Create(url);
            request.Method = "POST";
            request.ContentType = "application/json";

            using (var streamWriter = new StreamWriter(request.GetRequestStream()))
            {
                streamWriter.Write(json);
                streamWriter.Flush();
                streamWriter.Close();
            }
            try
            {
                using (var response = (HttpWebResponse)request.GetResponse())
                using (var streamReader = new StreamReader(response.GetResponseStream()))
                {
                    // Read and output the response
                    var result = streamReader.ReadToEnd();
                    Console.WriteLine($"Response: {result}");
                }
            }
            catch (WebException ex)
            {
                using (var errorResponse = (HttpWebResponse)ex.Response)
                using (var reader = new StreamReader(errorResponse.GetResponseStream()))
                {
                    var errorText = reader.ReadToEnd();
                    Console.WriteLine($"Error: {errorText}");

                }
            }
            return "success";
        }
    }
}
