package controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import service.ArticleService;
import vo.Article;
import vo.User;

@Controller
public class ArticleController {
	private ArticleService articleService;

	public void setArticleService(ArticleService articleService) {
		this.articleService = articleService;
	}

	@RequestMapping(value = { "/", "main" }, method = RequestMethod.GET)
	public String main() {
		return "main";
	}
	
	@RequestMapping(value="/ajax/selectList/{page}",method=RequestMethod.GET)
	@ResponseBody
	public List<Article> selectList(@PathVariable int page) {
		return articleService.selectList(page);
	}

	@RequestMapping(value = "/write", method = RequestMethod.GET)
	public String goForm() {
		return "form";
	}

	@RequestMapping(value = "/write/article", method = RequestMethod.POST)
	public String writeArticle(Article article, HttpSession session) {
		String url = "redirect:/write";

		try {
			User user = (User) session.getAttribute("loginUser");
			article.setUserNo(user.getNo());
			articleService.writeArticle(article);
			url = "redirect:/main";

		} catch (NullPointerException e) {
			// TODO: handle exception
			e.printStackTrace();
		}

		return url;
	}
	@RequestMapping(value = "/write/article", method = RequestMethod.PUT)
	public String updateArticle(Article article) {
		return articleService.rewindArticle(article) == true ? "redirect:/detail/article/"+article.getNo() : "redirect:/update/article/"+article.getNo() ;
	}
	@RequestMapping(value = "/delet/article/{no}", method = RequestMethod.DELETE)
	public String deletArticle(@PathVariable int no) {
		return articleService.removeArticle(no) == true ? "redirect:/main" : "redirect:/detail/article/"+no ;
	}

	@RequestMapping(value = "/update/article/{no}", method = RequestMethod.GET)
	public String updateArticle(Model model , @PathVariable int no) {
		model.addAttribute("view", articleService.viewDetail(no));
		return "form";
	}
	
	@RequestMapping(value="/detail/article/{no}")
	public String viewDetail(@PathVariable int no , Model model) {
		model.addAttribute("view", articleService.viewDetail(no));
		return "detail";
	}
}
