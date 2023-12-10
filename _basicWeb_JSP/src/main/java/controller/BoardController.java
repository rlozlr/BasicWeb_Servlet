package controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import domain.BoardVO;
import domain.MemberVO;
import domain.PagingVO;
import handler.PagingHandler;
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
				// ses.id 값 받아와야 하니까
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
				
			} catch (Exception e) {
				log.info(">>> insert error");
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
