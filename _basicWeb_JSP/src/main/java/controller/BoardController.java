package controller;

import java.io.File;
import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import domain.BoardVO;
import domain.MemberVO;
import domain.PagingVO;
import handler.FileRemoveHandler;
import handler.PagingHandler;
import net.coobird.thumbnailator.Thumbnails;
import service.BoardService;
import service.BoardServiceImpl;

@WebServlet("/brd/*")
public class BoardController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static final Logger log = LoggerFactory.getLogger(BoardController.class);
	private RequestDispatcher rdp;
	private String destPage;
	private int isOk;
    private BoardService bsv;
    private String savePath;
	
    public BoardController() {
    	bsv = new BoardServiceImpl();
    }

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=UTF-8");
		
		String uri = request.getRequestURI();
		String path = uri.substring(uri.lastIndexOf("/")+1);
		log.info(">>> path >>> {}", path);
		
		switch(path) {
		case "list":
			try {
				log.info("list check 1");
				PagingVO pgvo = new PagingVO();
				
				if(request.getParameter("pageNo") != null) {
					int pageNo = Integer.parseInt(request.getParameter("pageNo"));
					int qty = Integer.parseInt(request.getParameter("qty"));
					String type = request.getParameter("type");
					String keyword = request.getParameter("keyword");
					pgvo = new PagingVO(pageNo, qty, type, keyword);
					log.info(">>> pgvo >>> " + pageNo + " / " + qty + " / " + type + " / " + keyword);
				}
				
				// 페이지네이션을 적용하기 위해서 bsv.getList() method에 pgvo 객체를 전달
				List<BoardVO> list = bsv.getList(pgvo);
				log.info(">>> list >>> {} ", list);
				
				// DB에서 전체 게시글 수 가져오기 || search 값의 게시글 카운트
				int totalCount = bsv.getTotal(pgvo);	
				log.info("totalCount >>> {}", totalCount);
				
				PagingHandler ph = new PagingHandler(pgvo, totalCount);
				
				// 가져온 list를 "list"라는 이름으로 list.jsp에 뿌림
				request.setAttribute("list", list);
				// 검색어를 반영한 리스트
				request.setAttribute("ph", ph);
				
				destPage = "/board/list.jsp";
				
			} catch (Exception e) {
				log.info(">>> list error");
				e.printStackTrace();
			}
			break;
			
		case "register":
			destPage = "/board/register.jsp";
			break;
			
		case "insert":
			try {
				//파일을 업로드할 물리적인 경로 설정
				savePath = getServletContext().getRealPath("/_fileUpload");
				File fileDir = new File(savePath);
				log.info(">>> 파일 저장위치 >>> {}", savePath);
				
				DiskFileItemFactory fileItemFactory = new DiskFileItemFactory();
				fileItemFactory.setRepository(fileDir);	// 저장할 위치를 file 객체로 지정
				fileItemFactory.setSizeThreshold(1024*1024*3);	// 파일 저장을 위한 임시 메모리 설정 : byte 단위
				
				// 미리 객체 설정
				BoardVO bvo = new BoardVO();
				
				// multipart/form-date 형식으로 넘어온 request 객체를 다루기 쉽게 변환해주는 역할
				ServletFileUpload fileUpload = new ServletFileUpload(fileItemFactory);
				
				List<FileItem>itemList = fileUpload.parseRequest(request);
				for(FileItem item : itemList) {
					switch(item.getFieldName()) {
					case "title":
						bvo.setTitle(item.getString("utf-8"));
						break;
					case "writer":
						bvo.setWriter(item.getString("utf-8"));
						break;
					case "content":
						bvo.setContent(item.getString("utf-8"));
						break;
					case "board_file":
						// 이미지 있는지 체크
						if(item.getSize() > 0) {	// 데이터의 크기를 바이트 단위로 리턴 / 크기가 0보다 큰지 체크
							String fileName = item.getName()
									.substring(item.getName().lastIndexOf(File.separator)+1);	// 이름만 분리
							// File.separator : 파일 경로 기호를 저장
							// 시스템의 기간을 이용하여 파일을 구분 / 시간_dog.jpg
							fileName = System.currentTimeMillis()+"_"+fileName;
							File uploadFilePath = new File(fileDir + File.separator+fileName);
							log.info(" >>> uploadFilePath >>> {}", uploadFilePath.toString());
							
							// 저장
							try {
								item.write(uploadFilePath);	// 자바 객체를 디스크에 쓰기
								bvo.setBoardFile(fileName);	// bvo에 저장할 값 설정
								
								// 썸네일 작업 : 리스트 페이지에서 트래픽 과다사용 방지
								Thumbnails.of(uploadFilePath).size(75, 75)
								.toFile(new File(fileDir + File.separator + "th_" + fileName));
								
							} catch (Exception e) {
								log.info(">>> file writer on dist error");
								e.printStackTrace();
							}
						}
						break;
					}
				}
				
				isOk = bsv.insert(bvo);
				log.info(">>> insert " + (isOk > 0 ? "OK" : "FAIL"));
				
				if(isOk > 0) {
					request.setAttribute("msg_new", "new");
				}
				
				destPage = "/brd/list";
				
				
				// file Update 없는 경우
				// ses.id 값 받아와야 하니까
				/*
				HttpSession ses = request.getSession();
				MemberVO mvo = (MemberVO) ses.getAttribute("ses");
				String writer = mvo.getId();
				
				//register.jsp에서 받아오는 것은 title / content
				String title = request.getParameter("title");
				String content = request.getParameter("content");
				
				BoardVO bvo = new BoardVO(title, writer, content);
				log.info(">>> 글쓰기 >>> {}", bvo);
				
				
				isOk = bsv.insert(bvo);
				log.info(">>> insert " + (isOk > 0 ? "OK" : "FAIL"));
				
				if(isOk > 0) {
					request.setAttribute("msg_new", "new");
				}
				
				destPage = "/brd/list";
				*/
				
			} catch (Exception e) {
				log.info(">>> insert error");
				e.printStackTrace();
			}
			break;
			
		case "detail":
			try {
				// list.jsp에서 bno 값 가져오기
				int bno = Integer.parseInt(request.getParameter("bno"));
				log.info(">>> detail check1");
				
				BoardVO bvo = bsv.getDetail(bno);
				log.info(">>> bvo >>> {}", bvo);
				// detail.jsp에 해당 bno 정보 뿌리기
				request.setAttribute("bvo", bvo);
				
				destPage = "/board/detail.jsp";
				
			} catch (Exception e) {
				log.info(">>> detail error");
				e.printStackTrace();
			}
			break;
		
		case "remove":
			try {
				// detail.jsp에서 bno 값 받아오기
				int bno = Integer.parseInt(request.getParameter("bno"));
				
				// 댓글, 파일도 같이 삭제
				savePath = getServletContext().getRealPath("/_fileUpload");
				String boardFileName = bsv.getFileName(bno);
				int isDel = 0;
				
				if(boardFileName != null) {
					FileRemoveHandler fh = new FileRemoveHandler();
					// 해당 파일과 썸네일이 같이 삭제
					isDel = fh.deleteFile(boardFileName, savePath);
				}
				
				isOk = bsv.remove(bno);
				log.info(">>> remove check1");
				log.info(">>> remove >>> " + (isOk > 0 ? "OK" : "FAIL"));
				
				destPage = "list";
				
			} catch (Exception e) {
				log.info(">>> remove error");
				e.printStackTrace();
			}
			break;
			
		case "modify":
			try {
				int bno = Integer.parseInt(request.getParameter("bno"));
				// detail에서 생성해둔 getDetail(bno) method를 사용해서 BoardVO 객체에 데이터를 넣어줌
				BoardVO bvo = bsv.getDetail(bno);
				// 데이터를 받아 온 객체 bvo를 화면에 뿌림
				request.setAttribute("bvo", bvo);
				destPage = "/board/modify.jsp";
				
			} catch (Exception e) {
				log.info(">>> modify error");
				e.printStackTrace();
			}
			break;
			
		case "edit":
			try {
				savePath = getServletContext().getRealPath("/_fileUpload");
				File fileDir= new File(savePath);
				
				DiskFileItemFactory fileItemFactory= new DiskFileItemFactory();
				fileItemFactory.setRepository(fileDir);
				fileItemFactory.setSizeThreshold(3*1024*1024);
				
				BoardVO bvo = new BoardVO();
				
				ServletFileUpload fileUpload = new ServletFileUpload(fileItemFactory);
				
				List<FileItem>itemList= fileUpload.parseRequest(request);
				// (구)첨부파일과 (신)첨부파일 구분을 위해
				String old_file = null;
				
				for(FileItem item : itemList) {
					switch(item.getFieldName()) {
					case "bno" :
						bvo.setBno(Integer.parseInt(item.getString("utf-8")));
						break;
					case "title" :
						bvo.setTitle(item.getString("utf-8"));
						break;
					case "writer":
						bvo.setWriter(item.getString("utf-8"));
						break;
					case "content":
						bvo.setContent(item.getString("utf-8"));
						break;
					case "board_file":
						// 이전 그림 파일의 보관용
						old_file = item.getString("utf-8");
						break;
					case "new_file":
						// 새로운 파일은 등록이 될 수도 있고, 안될 수도 있음.
						// 새로운 등록파일 있다면...
						if(item.getSize() > 0) {
							// old_file 삭제 작업
							if(old_file != null) {
								// 파일 삭제 핸들러를 통해서 파일 삭제 작업 진행
								FileRemoveHandler fileHandler = new FileRemoveHandler();
								isOk = fileHandler.deleteFile(old_file, savePath);
							}
							// 새로운 파일에 대한 객체 작업
							String fileName = item.getName()
									.substring(item.getName().lastIndexOf(File.separator)+1);
							log.info("new File Name >>> {}",fileName);
							
							fileName = System.currentTimeMillis()+"_"+fileName;
							File uploadFilePath = new File(fileDir+File.separator+fileName);
							
							try {
								item.write(uploadFilePath);
								bvo.setBoardFile(fileName);
								// 썸네일 작업
								Thumbnails.of(uploadFilePath).size(75, 75)
								.toFile(new File(fileDir+File.separator+"th_"+fileName));
								
								
							} catch (Exception e) {
								log.info("File Write Update Error");
								e.printStackTrace();
							}
							
						} else {
							// 기존 파일은 있지만, 새로운 이미지 파일이 없다면...
							bvo.setBoardFile(old_file);	// 기존 객체를 bvo에 담기
						}
						break;
					}
				}
				log.info(">>>> check bvo>>>>{}",bvo);
				isOk = bsv.modify(bvo);
				log.info(">>> eidt >>> " + (isOk > 0 ? "OK" : "FAIL"));
				destPage = "list";	// 내부 list case로 이동
				
				// modify.jsp에서 bno 값을 가져온다.
				/*
				int bno = Integer.parseInt(request.getParameter("bno"));
				String title = request.getParameter("title");
				String content = request.getParameter("content");
				BoardVO	bvo = new BoardVO(bno, title, content);
				log.info(">>> bvo >>> {}", bvo);
				log.info(">>> edit chck 1");
				
				isOk = bsv.modify(bvo);
				log.info(">>> eidt >>> "+(isOk > 0 ? "OK" : "FAIL"));
				
				destPage = "list";
				*/
				
			} catch (Exception e) {
				log.info(">>> edit error");
				e.printStackTrace();
			}
			break;
		}
		
		
		rdp = request.getRequestDispatcher(destPage);
		rdp.forward(request, response);
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		service(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		service(request, response);
	}

}
