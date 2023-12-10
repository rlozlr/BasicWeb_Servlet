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

}
