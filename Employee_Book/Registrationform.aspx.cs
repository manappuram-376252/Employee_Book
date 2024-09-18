using System;
using System.Web.UI;

namespace Employee_Book
{
    public partial class Registrationform : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
           
        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            string email = txtEmail.Text.Trim();
            string password = txtPassword.Text.Trim();
           

            if (string.IsNullOrEmpty(email) || string.IsNullOrEmpty(password))
            {

                ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('Please fill all Field..!');", true);
                return;
            }
            if (password != "Passwrd@123") 
            {

                ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('Please Check Password..!');", true);
                return;
            }
            else
            {

                Response.Redirect("~/Registration.aspx");
            }
        }
    }
}
