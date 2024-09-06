using System;
using System.Web.UI;
using System.Data.SqlClient;
using System.Web.Configuration;


namespace Employee_Book
{
    public partial class Registration : Page
    {
        private readonly object firstName;

        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void RegisterButton_Click(object sender, EventArgs e)
        {
            string connString = WebConfigurationManager.ConnectionStrings["SchoolDB"].ConnectionString;

            using (SqlConnection conn = new SqlConnection(connString))
            {
                conn.Open();
                string studentId = GenerateStudentId();
                string query = "INSERT INTO Students (StudentId, FirstName, LastName, Age, DOB, Gender, Email, Phone, Username, Password) VALUES (@StudentId, @FirstName, @LastName, @Age, @DOB, @Gender, @Email, @Phone, @Username, @Password)";
                using (SqlCommand cmd = new SqlCommand(query, conn))
                {
                    //cmd.Parameters.AddWithValue("@StudentId", studentId);
                    //cmd.Parameters.AddWithValue("@FirstName", firstName.Text);
                    //cmd.Parameters.AddWithValue("@LastName", lastName.Text);
                    //cmd.Parameters.AddWithValue("@Age", int.Parse(age.Text));
                    //cmd.Parameters.AddWithValue("@DOB", DateTime.Parse(dob.Text));
                    //cmd.Parameters.AddWithValue("@Gender", gender.SelectedValue);
                    //cmd.Parameters.AddWithValue("@Email", email.Text);
                    //cmd.Parameters.AddWithValue("@Phone", phone.Text);
                    //cmd.Parameters.AddWithValue("@Username", username.Text);
                    //cmd.Parameters.AddWithValue("@Password", System.Web.Security.FormsAuthentication.HashPasswordForStoringInConfigFile(password.Text, "SHA1"));

                    cmd.ExecuteNonQuery();
                }
                for (int i = 0; i < Request.Form.GetValues("courseName[]").Length; i++)
                {
                    string courseName = Request.Form.GetValues("courseName[]")[i];
                    string percentage = Request.Form.GetValues("percentage[]")[i];
                    string yearOfPassing = Request.Form.GetValues("yearOfPassing[]")[i];

                    string queryQual = "INSERT INTO Qualifications (StudentId, CourseName, Percentage, YearOfPassing) VALUES (@StudentId, @CourseName, @Percentage, @YearOfPassing)";
                    using (SqlCommand cmdQual = new SqlCommand(queryQual, conn))
                    {
                        cmdQual.Parameters.AddWithValue("@StudentId", studentId);
                        cmdQual.Parameters.AddWithValue("@CourseName", courseName);
                        cmdQual.Parameters.AddWithValue("@Percentage", percentage);
                        cmdQual.Parameters.AddWithValue("@YearOfPassing", yearOfPassing);

                        cmdQual.ExecuteNonQuery();
                    }
                }

                Response.Redirect("Registrationform.aspx");
            }
        }

        private string GenerateStudentId()
        {
          
            return Guid.NewGuid().ToString();
        }
    }
}


