package service;

import java.util.List;

import vo.Article;

public interface ArticleService {
	public List<Article> selectList(int page);
	public Boolean writeArticle(Article article);
	public Article viewDetail(int no);
	public Boolean removeArticle(int no);
	public Boolean rewindArticle(Article article);
}
