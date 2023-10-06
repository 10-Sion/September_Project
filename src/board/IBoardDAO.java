package board;

import java.util.Vector;

/*
 	 
 인터페이스를 만들어 놓는 이유는
 게시판의 기능은 글쓰기,글조회,글삭제,글수정 기능등...다양한 기능이 있습니다.
 팀프로젝트를 진행한다고 할때   팀원들이 각 기능별로 메소드이름을 정해서 사용하기 위해 작성합니다.

*/
public interface IBoardDAO { //각기능별로 추상메소드들의 이름을 정해 놓고 작성 
	
	//DB에 저장된 모든글들을 조회 해서 Vector배열에 담아 반환하는 추상메소드
	public Vector getBoardList(String keyField, String keyWord); //검색기준값,  검색어를 매개변수로 받음
	
	//DB에 저장된 전체 글들중에서 하나의 글정보만 조회 해서  BoardBean객체에 담아 반환하는 추상메소드
	public BoardBean getBoard(int num); //조회할 하나의 글의 글번호를 매개변수로 받음 
	
	//DB에 작성한 새글정보를 추가(글쓰기) 하는 기능의 추상메소드
	public void insertBoard(BoardBean boardBean); //작성한 하나의 새글정보를  BoardBean객체에 담아 매개변수로 받음 
	
	//DB에 작성되어 있는 하나의 글정보를 수정하는 기능의 추상메소드
	public void updateBoard(BoardBean boardBean); //수정한 하나의 새글 정보를 BoardBean객체에 담아 매개변수로 받음
												  //참고. 수정할 글의 글번호는 BoardBean객체에 담아 매개변수로 받습니다. 
	//DB에 작성되어 있는 하나의 글정보를 삭제하는 기능의 추상메소드 
	public void deleteBoard(int num, String passwd, String id); //삭제할 글의 글번호, 삭제시 입력한 비밀번호, 글작성자 아이디 를 매개변수로 받음 
	
	//DB에 작성되어 있는 주글에 대한 새로운 답변글추가(답변글쓰기) 하는 기능의 추상메소드
	public void replyBoard(BoardBean boardBean); //작성한 하나의 답변새글정보를 BoardBean객체에 담아 매개변수로 받음 

	

	

	
}








