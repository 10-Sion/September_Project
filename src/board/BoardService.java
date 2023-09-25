package board;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class BoardService {
    private BoardDAO boardDAO;

    public BoardService() {
        boardDAO = new BoardDAO();
    }

    // 게시물 목록 조회
    public List<BoardBean> listArticles() {
        return boardDAO.getAllBoards();
    }

    // 게시물 상세 조회
    public BoardBean viewArticle(int articleNO) {
        return boardDAO.getBoardByNum(articleNO);
    }

    // 게시물 추가
    public void addArticle(BoardBean boardBean) {
        boardDAO.insertBoard(boardBean);
    }

    // 게시물 수정
    public void modArticle(BoardBean boardBean) {
        boardDAO.updateBoard(boardBean);
    }

    // 게시물 삭제
    public void removeArticle(int articleNO) {
        boardDAO.deleteBoard(articleNO);
    }

   
/*
    
    	// 아래는 페이징을 고려한 게시물 목록 조회 메서드입니다.
    	public Map<String, Object> listArticles(int pageNo) {
        Map<String, Object> articlesMap = new HashMap<>();
        int totalArticles = boardDAO.getArticleCount(); // 전체 게시물 수 조회

        // 페이지 정보 계산
        Paging paging = new Paging(totalArticles, pageNo);

        // 페이지 번호와 페이지 크기를 기반으로 게시물 목록 조회
        List<BoardBean> articlesList = boardDAO.getArticlesByPage(paging.getStartRow(), paging.getEndRow());

        articlesMap.put("articlesList", articlesList);
        articlesMap.put("paging", paging);

        return articlesMap;
    }
    */
}
