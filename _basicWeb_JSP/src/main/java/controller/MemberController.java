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

import domain.MemberVO;
import service.MemberService;
import service.MemberServiceImpl;

@WebServlet("/memb/*")
public class MemberController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	// 로그 사용하려고
	private static final Logger log = LoggerFactory.getLogger(MemberController.class);
    // jsp에서 받은 요청을 처리, 처리 결과를 다른 jsp로 보내는 역할
	private RequestDispatcher rdp;
    // 목적지 주소
    private String destPage;
    // DB 구문 체크
    private int isOk;
    
    // controller <-> service
    private MemberService msv;	// service 패키지에 인터페이스로 생성
	
    public MemberController() {
    	// 인터페이스 msv를 구현할 객체이므로 class로 생성
    	msv = new MemberServiceImpl();	// service 패키지에 class로 생성
    }

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 모든 서비스 처리 경로
		request.setCharacterEncoding("utf-8"); 	// 소/대문자 상관없음
		response.setCharacterEncoding("utf-8");	// 소/대문자 상관없음
		response.setContentType("text/html; charset=UTF-8");	// 여기 UTF-8은 규격이 대문자라서 대문자로
		
		String uri = request.getRequestURI();
		String path = uri.substring(uri.lastIndexOf("/")+1);
		log.info(">>> path >>> {}", path);
		
		switch(path) {
		case "join":
			// index의 /member/join 경로
			destPage = "/member/join.jsp";
			break;
			
		case "register":
			try {
				// join.jsp에서 보낸 파라미터 값 받기
				String id = request.getParameter("id");
				String pwd = request.getParameter("pwd");
				String email = request.getParameter("email");
				int team = Integer.parseInt(request.getParameter("team"));
				
				MemberVO mvo = new MemberVO(id, pwd, email, team);
				log.info(">>> join check 1 >>> {}", mvo);
				isOk = msv.register(mvo);
				log.info("join >>> {}", (isOk > 0)? "OK" : "FAIL");
				
				if(isOk > 0) {
				request.setAttribute("msg_join", "welcome");
				}
				
				destPage = "/index.jsp";
				
			} catch (Exception e) {
				e.printStackTrace();
				log.info(">>> join error");
			}
			break;
			
		case "login":
			try {
				// login.jsp에서 id, pwd를 전송
				String id = request.getParameter("id");
				String pwd = request.getParameter("pwd");
				// id, pwd를 객체화해서 DB로 전송
				MemberVO mvo = new MemberVO(id,pwd);
				log.info(">>> login check 1");
				
				// id와 pwd가 일치하는 데이터의 객체를 리턴
				MemberVO loginMvo = msv.login(mvo);
				log.info("login mov >>> {}", loginMvo);
				
				// 로그인 객체가 있다면...
				if(loginMvo != null) {
					// Session 객체 가져오기
					// 연결된 세션 객체가 있다면 기존 객체 가져오기, 없으면 생성
					HttpSession ses = request.getSession();
					ses.setAttribute("ses", loginMvo);
					// 로그인 유지시간(초단위로 설정) => 10*60 10분*60초 / 없으면 브라우저 끄면 날아감
					ses.setMaxInactiveInterval(10*60);	
					
				} else {
					request.setAttribute("msg_login","fail");
				}
				
				destPage = "/index.jsp";
				
			} catch (Exception e) {
				e.printStackTrace();
				log.info(">>> login error");
			}
			break;
			
		case "logout":
			try {
				// 로그인 정보
				HttpSession ses = request.getSession();
				// ses에서 mvo 객체로 가져오기
				// lastLogin update할 때 id 가져오려고 만듦
				MemberVO mvo = (MemberVO)ses.getAttribute("ses");
				log.info(">>> ses mvo >>> {}",mvo);
				
				// lastLogin update
				// isOk = msv.lastLogin(mvo.getId());
				// log.info(">>> lastLogin >>> {}", (isOk > 0) ? "OK" : "FAIL");
				// 세션 무효화 (세션 끊기)
				ses.invalidate();
				
				destPage = "/index.jsp";
				
			} catch (Exception e) {
				e.printStackTrace();
				log.info(">>> logout error");
			}
			break;
			
		case "mypage":
			 try {
				HttpSession ses = request.getSession();
				MemberVO mvo = (MemberVO)ses.getAttribute("ses");
				log.info(">>> ses mvo >>> {}",mvo);
				
				request.setAttribute("mvo", mvo);
				log.info(">>> mypage check 1");
				
				destPage = "/member/mypage.jsp";
				
			} catch (Exception e) {
				e.printStackTrace();
				log.info(">>> mypage error");
			}
			break;
			
		case "modify":
			try {
				// mypage.jsp의 form method = post
				// equalsIgnoreCase를 사용하면 POST / post 대소문자 다 사용 가능
				if(request.getMethod().equalsIgnoreCase("post")) {
					HttpSession ses = request.getSession();
					MemberVO mvo = (MemberVO) ses.getAttribute("ses");
					log.info(">>> ses mvo >>> {}", mvo);
					
					// 수정할 정보
					String pwd = request.getParameter("pwd");
					String email = request.getParameter("email");
					int team = Integer.parseInt(request.getParameter("team"));
					
					// 현재 로그인된 계정의 아이디를 가져와서 수정된 객체 생성
					String id = mvo.getId();
					MemberVO updateMvo = new MemberVO(mvo.getId(), pwd, email, team);
					
					// 수정 로직 수행
					int isOk = msv.modify(updateMvo);
					log.info(">>> modify >>> {}", (isOk > 0)? "OK":"FAIL");
					
					// 수정 후 로그인 중인 계정 정보 갱신
					mvo = msv.login(new MemberVO(mvo.getId(), pwd));
					// 로그인 한 계정의 정보 업데이트
					ses.setAttribute("ses", mvo);
					
					if(isOk > 0) {
						request.setAttribute("msg_modify", "success");
					}
					
					// 프로필 수정 후의 정보 업데이트
					ses.setAttribute("mvo", mvo);
					
					// modify 요청이 /memb/modify로 진행되므로 
					///memb/mypage로 이동하고 싶으면 /memb/를 생각하고 mypage만 써줘도 된다 (상대경로)
					// 절대경로를 사용하려면 /memb/mypage로 써주면 된다
					destPage = "mypage";
					
				}
				
			} catch (Exception e) {
				e.printStackTrace();
				log.info(">>> mypage modify error");
			}
			break;
			
		case "remove":
			/* String id = request.getParameter("id");
			 * 이렇게 하면 주소에 내 아이디가 노출 된다.
			 * 그래서 mypage.jsp에서 Query String으로 값을 달고 와야하는데
			 * <a href="/memb/remove?${ses.id}"><button type="button">회원탈퇴</button></a> 요론식으로 하면 됨
			 * */
			try {
				HttpSession ses = request.getSession();
				MemberVO mvo = (MemberVO) ses.getAttribute("ses");
				log.info(">>> ses mvo >>> {}", mvo);
				
				isOk = msv.remove(mvo.getId());
				log.info(">>> remove >>> {}", (isOk > 0)? "OK":"FAIL");
				
				ses.invalidate();
				
				if(isOk > 0) {
					request.setAttribute("msg_remove", "bye");
				}
				
				destPage = "/index.jsp";
				
			} catch (Exception e) {
				e.printStackTrace();
				log.info(">>> remove error");
			}
			break;
			
		case "attend":
			try {
				// 로그인 정보
				HttpSession ses = request.getSession();
				// ses에서 mvo 객체로 가져오기
				MemberVO mvo = (MemberVO)ses.getAttribute("ses");
				log.info(">>> ses mvo >>> {}",mvo);
				
				// lastLogin update
				isOk = msv.lastLogin(mvo.getId());
				log.info(">>> 출석을 위한 lastLogin update  >>> {}", (isOk > 0) ? "OK" : "FAIL");
				
				destPage = "/memb/attend_book";
				
			} catch (Exception e) {
				e.printStackTrace();
				log.info(">>> atten error");
			}
			break;
			
		case "attend_book":
			try {
				log.info("memList check 1");
				List<MemberVO> list = msv.getList();

				log.info("memList >>> {} " + list);
				request.setAttribute("list", list);
				destPage = "/member/attend.jsp";

			} catch (Exception e) {
				e.printStackTrace();
				log.info(">>> memList error");
			}
			break;
			
		}
		
		
		
		// 목적지 주소로 데이터를 전달(RequestDispatcher)
		rdp = request.getRequestDispatcher(destPage);
		rdp.forward(request, response);	// 요청에 필요한 객체를 가지고 경로로 전송 
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// get으로 오는 요청처리
		service(request, response);
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// post로 오는 요청처리
		service(request, response);
	}

}
