package service;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import domain.BoardVO;
import domain.PagingVO;
import repository.BoardDAO;
import repository.BoardDAOImpl;

public class BoardServiceImpl implements BoardService {
	private static final Logger log = LoggerFactory.getLogger(BoardServiceImpl.class);
	private BoardDAO bdao;
	
	public BoardServiceImpl() {
		bdao = new BoardDAOImpl();
	}

	@Override
	public List<BoardVO> getList(PagingVO pgvo) {
		log.info(">>> list check 2");
		return bdao.selectList(pgvo);
	}

	@Override
	public int getTotal(PagingVO pgvo) {
		log.info(">>> totalCount check 2");
		return bdao.getTotal(pgvo);
	}

	@Override
	public int insert(BoardVO bvo) {
		log.info(">>> insert check 2");
		return bdao.insert(bvo);
	}

	@Override
	public BoardVO getDetail(int bno) {
		log.info(">>> detail check 2");
		// 조회수 +1
		int isOk = bdao.readcountUp(bno);
		return bdao.getDetail(bno);
	}

	@Override
	public int remove(int bno) {
		log.info(">>> remove check 2");
		return bdao.delete(bno);
	}

	@Override
	public int modify(BoardVO bvo) {
		log.info(">>> edit check 2");
		return bdao.update(bvo);
	}

}
