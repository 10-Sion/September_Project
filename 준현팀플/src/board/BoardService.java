package board;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class BoardService {
	BoardDAO boardDAO;

	public BoardService() {
		boardDAO = new BoardDAO();
	}

	public Map listArticles(Map<String, Integer> pagingMap) {
		Map articlesMap = new HashMap();
		List<ArticleVO> articlesList = boardDAO.selectAllArticles(pagingMap);
//		List<ArticleVO> articlesList = null;
		int totArticles = boardDAO.selectTotArticles();   
		int sectionArticlesSize = boardDAO.selectSectionArticlesSize(pagingMap);   //section�� �� ������ ������ �ɴϴ�.
//		int sectionArticlesSize = 100;
		
		articlesMap.put("articlesList", articlesList);
		articlesMap.put("sectionArticlesSize", sectionArticlesSize);
		System.out.println("sectionArticlesSize : " + sectionArticlesSize);
		articlesMap.put("totArticles", totArticles);
		return articlesMap;
	}

	public List<ArticleVO> listArticles() {
		List<ArticleVO> articlesList = boardDAO.selectAllArticles();
		return articlesList;
	}

	// BoardController.java 에서  /BoardWritePro.board 2단계요청주소->  입력한 새글 내용들을 DB의 테이블에 INSERT요청 주소 를 받았으때	
	public int addArticle(ArticleVO article) {
		
		return boardDAO.insertNewArticle(article);
	}

	public ArticleVO viewArticle(int articleNO) {
		ArticleVO article = null;
		article = boardDAO.selectArticle(articleNO);
		return article;
	}

	public void modArticle(ArticleVO article) {
		boardDAO.updateArticle(article);
	}

	public List<Integer> removeArticle(int articleNO) {
		List<Integer> articleNOList = boardDAO.selectRemovedArticles(articleNO);
		boardDAO.deleteArticle(articleNO);
		return articleNOList;
	}

	public int addReply(ArticleVO article) {
		return boardDAO.insertNewArticle(article);
	}

}

