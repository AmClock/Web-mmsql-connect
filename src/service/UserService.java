package service;

import vo.User;

public interface UserService {
	public Boolean joinUser(User user);
	public User loginUser(User user);
}
