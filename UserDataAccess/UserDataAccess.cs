using System;
using System.Data.SqlClient;
using Employee_Book.Models;


namespace Employee_Book.DataAccessLayer
{
    public class UserDataAccess
    {
        private readonly string _connectionString = "YourConnectionStringHere"; // Update with your connection string

        public void SaveUser(User user)
        {
            using (var connection = new SqlConnection(_connectionString))
            {
                connection.Open();

                // Insert user data
                var insertUserCmd = new SqlCommand("INSERT INTO Users (FirstName, LastName, Age, DateOfBirth, Gender, Email, Phone, Username, Password) OUTPUT INSERTED.UserId VALUES (@FirstName, @LastName, @Age, @DateOfBirth, @Gender, @Email, @Phone, @Username, @Password)", connection);
                insertUserCmd.Parameters.AddWithValue("@FirstName", user.FirstName);
                insertUserCmd.Parameters.AddWithValue("@LastName", user.LastName);
                insertUserCmd.Parameters.AddWithValue("@Age", user.Age);
                insertUserCmd.Parameters.AddWithValue("@DateOfBirth", user.DateOfBirth);
                insertUserCmd.Parameters.AddWithValue("@Gender", user.Gender);
                insertUserCmd.Parameters.AddWithValue("@Email", user.Email);
                insertUserCmd.Parameters.AddWithValue("@Phone", user.Phone);
                insertUserCmd.Parameters.AddWithValue("@Username", user.Username);
                insertUserCmd.Parameters.AddWithValue("@Password", user.Password);

                int userId = (int)insertUserCmd.ExecuteScalar(); // Get the inserted UserId

                // Insert qualifications
                foreach (var qual in user.Qualifications)
                {
                    var insertQualCmd = new SqlCommand("INSERT INTO Qualifications (UserId, CourseName, University, Year, Percentage) VALUES (@UserId, @CourseName, @University, @Year, @Percentage)", connection);
                    insertQualCmd.Parameters.AddWithValue("@UserId", userId);
                    insertQualCmd.Parameters.AddWithValue("@CourseName", qual.CourseName);
                    insertQualCmd.Parameters.AddWithValue("@University", qual.University);
                    insertQualCmd.Parameters.AddWithValue("@Year", qual.Year);
                    insertQualCmd.Parameters.AddWithValue("@Percentage", qual.Percentage);
                    insertQualCmd.ExecuteNonQuery();
                }
            }
        }
    }
}
