using Employee_Book.DataAccessLayer;
using Employee_Book.Models;

namespace Employee_Book.BusinessLayer
{
    public class UserManager
    {
        private readonly UserDataAccess _userDataAccess;

        public UserManager()
        {
            _userDataAccess = new UserDataAccess();
        }

        public void SaveUser(User user)
        {
            // Perform any business logic here (e.g., validation)
            _userDataAccess.SaveUser(user);
        }
    }
}
