package dao;

import org.apache.ibatis.session.SqlSession;

import vo.User;

public class UserDAOImpl implements UserDAO {
	private SqlSession session;

	public void setSession(SqlSession session) {
		this.session = session;
	}

	@Override
	public int insertUser(User user) {
		// TODO Auto-generated method stub
		int result = 0;
		try {
			result = session.insert("user.insertUser", user);
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return result;
	}
	
	@Override
	public User selectOne(User user) {
		// TODO Auto-generated method stub
		User login = null;
		try {
			login = session.selectOne("user.selectOne",user);
		}catch (NullPointerException e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return login;
	}
	
}
