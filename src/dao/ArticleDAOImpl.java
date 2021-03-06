package dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import vo.Article;
import vo.PageVO;

public class ArticleDAOImpl implements ArticleDAO {
	private SqlSession session;

	public void setSession(SqlSession session) {
		this.session = session;
	}

	@Override
	public List<Article> selectList(PageVO pageVO) {
		// TODO Auto-generated method stub
		return session.selectList("article.selectList",pageVO);
	}
	
	@Override
	public int insertArticle(Article article) {
		// TODO Auto-generated method stub
		return session.insert("article.insertArticle",article);
	}
	
	@Override
	public Article selectOne(int no) {
		// TODO Auto-generated method stub
		return session.selectOne("article.selectOne",no);
	}
	
	@Override
	public int deleteArticle(int no) {
		// TODO Auto-generated method stub
		return session.delete("article.deleteArticle",no);
	}
	
	@Override
	public int updateArticle(Article article) {
		// TODO Auto-generated method stub
		return session.update("article.updateArticle", article);
	}
}
