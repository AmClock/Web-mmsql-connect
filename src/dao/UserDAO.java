package dao;

import vo.User;

public interface UserDAO {
	public int insertUser(User user);
	public User selectOne(User User);
}
