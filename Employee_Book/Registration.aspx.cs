using System;
using System.IO;
using System.Net;
using System.Web.UI;
using Employee_Book.BusinessLogic;
using System.Collections.Generic;
using System.Linq;
using System.Web.Services;
using System.Web.Script.Services;

namespace Employee_Book
{
    public partial class Registration : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
        }
        //   [WebMethod]
        //   public static string GetData(string typ, string val)
        //   {
        //       return "str";
        //   }
        //   [WebMethod]
        //   public static string RegisterButton_Click(string firstName, string lastName, string age, string dob, string gender, string email, string phone, string username, string password)
        //   {

        //       //if (IsValid)
        //       //{
        //           var url = "https://localhost:7253/api/User";


        //           // Convert the user object to JSON
        //           var json = "{\"firstName\":\"" + firstName + "\",\"lastName\":\"" + lastName + "\",\"age\":" + age + ",\"dob\":\"" + dob + "\",\"gender\":\"" + gender + "\",\"email\":\"" + email + "\",\"phone_no\":\"" + phone + "\",\"username\":\"" + username + "\",\"password\":\"" + password + "\"}";

        //           // Create the HttpWebRequest
        //           var request = (HttpWebRequest)WebRequest.Create(url);
        //           request.Method = "POST";
        //           request.ContentType = "application/json";

        //           // Write the JSON data to the request stream
        //           using (var streamWriter = new StreamWriter(request.GetRequestStream()))
        //           {
        //               streamWriter.Write(json);
        //               streamWriter.Flush();
        //               streamWriter.Close();
        //           }

        //           // Get the response
        //           try
        //           {
        //               using (var response = (HttpWebResponse)request.GetResponse())
        //               using (var streamReader = new StreamReader(response.GetResponseStream()))
        //               {
        //                   // Read and output the response
        //                   var result = streamReader.ReadToEnd();
        //                   Console.WriteLine($"Response: {result}");
        //               }
        //           }
        //           catch (WebException ex)
        //           {
        //               // Handle exceptions
        //               using (var errorResponse = (HttpWebResponse)ex.Response)
        //               using (var reader = new StreamReader(errorResponse.GetResponseStream()))
        //               {
        //                   var errorText = reader.ReadToEnd();
        //                   Console.WriteLine($"Error: {errorText}");

        //               }
        //           }
        //       return "success";
        //       }

        //}
    }
}


