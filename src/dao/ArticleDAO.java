package dao;

import java.util.List;

import vo.Article;
import vo.PageVO;

public interface ArticleDAO {
	public List<Article> selectList(PageVO pageVO);
	public int insertArticle(Article article);
	public Article selectOne(int no);
	public int deleteArticle(int no);
	public int updateArticle(Article article);
}
