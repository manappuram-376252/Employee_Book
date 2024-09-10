using System;
using System.Web.UI;
using Employee_Book.BusinessLogic;
using Employee_Book.Models;

namespace Employee_Book
{
    public partial class Registration : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
        }

        protected void RegisterButton_Click(object sender, EventArgs e)
        {
          
                if (IsValid)
            {

                User User = new User
                {
                    FirstName = firstName.Text,
                    LastName = lastName.Text,
                    Age = int.Parse(age.Text),
                    Dob = DateTime.Parse(dob.Text),
                    Gender = gender.SelectedValue,
                    Email = email.Text,
                    Phone = phone.Text,
                    Username = username.Text,
                    Password = password.Text
                };

                
                UserService userService = new UserService();
                bool isRegistered = userService.RegisterUser(User);

                if (isRegistered)
                {
                    
                    Response.Redirect("Success.aspx");
                }
                else
                {
                    lblError.Text = "Registration failed. Please try again.";
                    lblError.Visible = true;
                }
            }
        }
    }
}
