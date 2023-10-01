package QnA;

import java.io.File;
import java.util.Vector;

// 파일 업로드에 필요한 클래스
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.ultipart.DefaultFileRenamePolicy;

import 준현팀플.DBConnectionMgr;


public class BoardMgr {
	private DBConnectionMgr pool;
	private static final String SAVEFOLDER = "업로드 기능에 파일이 저장될 폴더 위치";
	private static final String ENCYPE = "EUC-KR";
	private static int MAXSIZE = 5*1024*1024;

	
	public BoardMgr() {
		try {
			pool = DBConnectionMgr.getInstance();
		}catch (Exception e) {
				e.printStackTrace();
			}
	}
	
	// 게시판 리스트
	public Vector<BoardBean> getBoardList(String keyfield, String keyword,
			int start, int end) {
			Connection con = null;
			preparedStatement pstmt = null;
			ResultSet rs = null;
			String sql = null;
			Vector<BoardBean> vlist = new Vector BoardBean();

	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
