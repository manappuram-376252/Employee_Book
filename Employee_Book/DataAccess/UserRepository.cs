using System.Data.SqlClient;
using Employee_Book.Models;

namespace Employee_Book.DataAccess
{
    public class UserRepository
    {
        public bool SaveUser(User user)
        {


            //using (SqlConnection connection = new SqlConnection(connectionString))
            using (SqlConnection connection = new SqlConnection(@"Data Source =(localdb)\MSSQLLocalDB;Initial Catalog = master; Integrated Security = True; Connect Timeout = 30; Encrypt=False;TrustServerCertificate=True;ApplicationIntent=ReadWrite;MultiSubnetFailover=False"))
            {
                string query = "INSERT INTO user (FirstName, LastName, Age, Dob, Gender, Email, Phone, Username, Password) VALUES (@FirstName, @LastName, @Age, @Dob, @Gender, @Email, @Phone, @Username, @Password)";
                SqlCommand command = new SqlCommand(query, connection);
                command.Parameters.AddWithValue("@FirstName", user.FirstName);
                command.Parameters.AddWithValue("@LastName", user.LastName);
                command.Parameters.AddWithValue("@Age", user.Age);
                command.Parameters.AddWithValue("@Dob", user.Dob);
                command.Parameters.AddWithValue("@Gender", user.Gender);
                command.Parameters.AddWithValue("@Email", user.Email);
                command.Parameters.AddWithValue("@Phone", user.Phone);
                command.Parameters.AddWithValue("@Username", user.Username);
                command.Parameters.AddWithValue("@Password", user.Password); 

                connection.Open();
                int result = command.ExecuteNonQuery();
                return result > 0; 
            }
        }
    }
}
