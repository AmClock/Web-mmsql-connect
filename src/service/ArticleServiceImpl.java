package service;

import java.util.List;

import dao.ArticleDAO;
import vo.Article;
import vo.PageVO;

public class ArticleServiceImpl implements ArticleService {
	private ArticleDAO articleDAO;

	public void setArticleDAO(ArticleDAO articleDAO) {
		this.articleDAO = articleDAO;
	}

	@Override
	public List<Article> selectList(int page) {
		// TODO Auto-generated method stub
		int numPage = 10;
		PageVO pageVO = new PageVO(page, numPage);
		return articleDAO.selectList(pageVO);
	}

	@Override
	public Boolean writeArticle(Article article) {
		// TODO Auto-generated method stub
		return articleDAO.insertArticle(article) == 1;
	}
	@Override
	public Article viewDetail(int no) {
		// TODO Auto-generated method stub
		return articleDAO.selectOne(no);
	}
	@Override
	public Boolean removeArticle(int no) {
		// TODO Auto-generated method stub
		return articleDAO.deleteArticle(no) == 1;
	}
	@Override
	public Boolean rewindArticle(Article article) {
		// TODO Auto-generated method stub
		return articleDAO.updateArticle(article) == 1;
	}
}
