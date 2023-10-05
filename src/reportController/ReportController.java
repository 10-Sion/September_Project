package reportController;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;
 
import reportDAO.ReportDAO;
import reportVO.ReportVO;
import reportService.ReportService;


@WebServlet("/Report/*")
public class ReportController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	// 과제 글에 첨부할 파일 저장위치를 상수로 선언
	private static String ARTICLE_IMAGE_REPO = "C:\\Report\\ReportUplosd";
	
	
	ReportVO rVo;
	ReportService rService;
	
    public ReportController() {
    	rVo = new ReportVO();
    	rService = new ReportService();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		doHandle(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doHandle(request, response);
	}
	
	private void doHandle(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		
		// 한글처리
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		String action = request.getPathInfo();
		ServletContext application = request.getServletContext();
		System.out.println("요청한 주소 : " + action);
			
		String nextPage = null;
		
		if( action == null || action.equals("")) {
			nextPage = "/ReportBoard/ReportList.jsp";
		
		} else if ( action.equals("/ReportUpload.do") ) {
			System.out.println(request.getParameter("stu_no"));
			
			//upload()메소드를 호출해 글쓰기 화면에서 전송된 글관련 정보를 HashMap에 key/value 한쌍으로 저장시킵니다.
			//그런후.. 글 입력시 추가적으로 업로드한 파일을 선택하여 글쓰기 요청을 했다면
			//업로드할 파일명, 입력한 글제목, 입력한 글내용을 key/value 형태의 값들로 저장되어 있는 HashMap을 리턴 받는다.
			//그렇지 않을 경우에는???????
			//업로드할 파일명을 제외한 ~~ 입력한 글제목, 입력한 글내용을 key/value형태의 값들로 저장되어 있는 HashMap을 리턴 받는다.
			Map<String, String> RepostMap = upload(request,response);
			
			
			// HashMap에 저장된 글 정보 (업로드한 파일명, 입력한 글제목, 입력한 글내용)을 HashMap에서 다시 가져온다.
			String title = RepostMap.get("title");
			String stu_no = RepostMap.get("stu_no");
			String secret = RepostMap.get("secret");
			String content = RepostMap.get("content");
			String fileName = RepostMap.get("reportfile");
			
			// DB에 추가하기 위해 사용자가 입력한 글 정보 + 업로드한 파일명을 ReportVO 객체의 각 변수에 저장
			rVo.setTitle(title);
			rVo.setStu_no(Integer.parseInt(stu_no));
			rVo.setSecret(secret);
			rVo.setContent(content);
			rVo.setFileName(fileName);
			
			// ReportService 객체의 addReport() 메소드 호출 시 매개변수로 DB 에 추가할 새글 정보를 가지고 있는 ReportVO 객체를 전달
			int result = rService.addReport(rVo);
			
			System.out.println(result);
			
			nextPage = "/ReportBoard/ReportList.jsp";
		}
		
		System.out.println("반환되는 주소 : " + nextPage);
		request.getRequestDispatcher(nextPage).forward(request, response);
		
	}//doHandle메소드 닫는 기호
	
	//파일업로드 처리를 위한 메소드 
	private Map<String, String>  upload(HttpServletRequest request, HttpServletResponse  response) 
									throws ServletException, IOException {
		
		
		String encoding = "utf-8";
		
		Map<String, String> ReportMap = new HashMap<String, String>();
		
		//글쓰기 할때 첨부한 이미지파일을 저장할 폴더 경로에 접근할 File객체 생성
		File currentDirPath = new File(ARTICLE_IMAGE_REPO);//"C:\\Report\\ReportUplosd"
		
		//업로드할 파일 데이터를 임시로 저장할 객체 메모리 생성
		DiskFileItemFactory factory = new DiskFileItemFactory();
		
		//파일 업로드시 사용할 임시메모리 최대 크기를 1메가 바이트로 설정
		factory.setSizeThreshold(1024 * 1024 * 1);
		//임시 메모리에 파일업로드시 ~~ 지정한 1메가 바이트 크기를 넘을 경우 업로드될 폴더경로를 설정
		factory.setRepository(currentDirPath);
		
		//참고.
		//DiskFileItemFactory클래스는 업로드할 파일의 크기가 지정한 임시메모리의 크기를 넘기전까지는
		//업로드한 파일 데이터를 임시메모리에 저장하고  지정한 크기를 넘길 경우  업로드할 file_repo폴더로 업로드해서 저장시키는 역할을 함.
		
		//파일을 업로드할 임시 메모리 객체의 주소를 생성자쪽으로 전달해 저장한  파일업로드를 실제 처리할 객체 생성
		ServletFileUpload upload = new ServletFileUpload(factory);
		
		try {
			/*
				ReportForm.jsp 파일업로드 요청하는 디자인 페이지에서  첨부한 파일1개와   입력한 파라미터들의 정보들
				request객체에서 꺼내와서  각각의 DiskFileItem객체들에 저장한 후 
				각각의 DiskFileItem객체들을  ArrayList배열에 추가 하게 됩니다. 그후 ~ ArrayList배열 자체를 반환 해 줍니다.
			*/
			List items = upload.parseRequest(request);
			
			//ArrayList배열에 저장된 DiskFileItem객체(요청한 아이템하나)의 갯수만큼 반복
			for(int i=0;   i<items.size();   i++) {
				
				//ArrayList배열에서 DiskFileItem객체를 얻는다
				FileItem  fileItem = (FileItem)items.get(i);
				
				//얻은 DiskFileItem객체의 정보가 첨부한 파일 요청이 아닐 경우
				if( fileItem.isFormField()) {
					
					System.out.println( fileItem.getFieldName() + "=" + fileItem.getString(encoding) );
				
					//RreportForm.jsp페이지에서 입력한 글제목, 글내용만 따로  HashMap에  (key=value)형식으로 저장합니다.
					//HashMap에 저장된 모습 ->  {"title"="입력한글제목", "content"="입력한글내용" }
					ReportMap.put(fileItem.getFieldName(), fileItem.getString(encoding));
					
								
				}else {//얻은 DiskFileItem객체의 정보가  첨부한 파일일 경우
					
					System.out.println("요청한 <input>의 name속성값 : " + fileItem.getFieldName());
					System.out.println("업로드 요청한 첨부 이미지 파일명 : " + fileItem.getName());
					System.out.println("업로드 요청한 첨부 이미지 파일 크기 : " + fileItem.getSize() + "bytes");

					
					//ReportForm.jsp페이지에서 입력한 글제목, 글내용, 요청한 업로드 파일 정보 등.. 모든 요청정보들을 HashMap에 key=value한쌍 씩 저장
					//HashMap에 저장된 모습 ->  {"imageFileName"="3.png",   "title"="입력한글제목",  "content"="입력한글내용"}
					ReportMap.put(fileItem.getFieldName(), fileItem.getName());
					
					
					//업로드시 첨부한 파일의 크기가 0보다 크다면?
					if(fileItem.getSize() > 0 ) {
						
						//업로드할 파일명을 얻어  파일명의 뒤에서부터 \\문자열이 들어 있는지 index위치를 알려주는데..
						//없으면  -1을 반환함.
						int idx = fileItem.getName().lastIndexOf("\\");//파일명의 뒤에서 부터 \\문자열이 들어 있는지 검색해서
																	   //만약 있으면 \의 index위치를 int로 반환,없으면 -1을 반환
						
						System.out.println(idx);
						
						if(idx == -1) {
							idx = fileItem.getName().lastIndexOf("/"); //-1얻기
							System.out.println("첨부할 파일명에  /없다 : " + idx);
						}
						
						//업로드할 파일명 얻기
						String fileName = fileItem.getName().substring(idx + 1);
						//업로드할 파일경로  + 파일명 을 주소로 만들어서 접근할 File객체 생성
						File uploadFile = new File(currentDirPath + "\\"  + fileName);
						//실제 파일업로드
						fileItem.write(uploadFile);
			
					} // 가장 안쪽 if
				
				}//안쪽 if else중에서 else
		
			}//for
		
		}catch (Exception e) {
			e.printStackTrace();
		}
		
		return ReportMap;
		
	}//upload메소드 닫는 부분 
	
	
	
}
