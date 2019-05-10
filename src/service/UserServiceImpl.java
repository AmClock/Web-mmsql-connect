package service;

import dao.UserDAO;
import vo.User;

public class UserServiceImpl implements UserService {
	private UserDAO userDAO;

	public void setUserDAO(UserDAO userDAO) {
		this.userDAO = userDAO;
	}
	
	@Override
	public Boolean joinUser(User user) {
		// TODO Auto-generated method stub
		return userDAO.insertUser(user) == 1;
	}
	@Override
	public User loginUser(User user) {
		// TODO Auto-generated method stub
		return userDAO.selectOne(user);
	}
}
