using Employee_Book.DataAccess;
using Employee_Book.Models;

namespace Employee_Book.BusinessLogic
{
    public class UserService
    {
        private UserRepository _userRepository;

        public UserService()
        {
            _userRepository = new UserRepository();
        }

        public bool RegisterUser(User user)
        {
            return _userRepository.SaveUser(user);
        }
    }
}
