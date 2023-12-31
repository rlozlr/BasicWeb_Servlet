package service;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import controller.CommentController;
import domain.CommentVO;
import repository.CommentDAO;
import repository.CommentDAOImpl;

public class CommentServiceImpl implements CommentService {
	private static final Logger log = LoggerFactory.getLogger(CommentController.class);
	private CommentDAO cdao;
	
	public CommentServiceImpl() {
		cdao = new CommentDAOImpl();
	}

	@Override
	public int post(CommentVO cvo) {
		log.info("comment post check 2");
		return cdao.insert(cvo);
	}

	@Override
	public List<CommentVO> getList(int bno) {
		log.info("comment list check 2");
		return cdao.getList(bno);
	}

	@Override
	public int modify(CommentVO cvo) {
		log.info("comment modify check 2");
		return cdao.update(cvo);
	}

	@Override
	public int remove(int cno) {
		log.info("comment remove check 2");
		return cdao.delete(cno);
	}

	public int removeAll(int bno) {
		log.info("comment removeAll check 2");
		return cdao.removeAll(bno);
	}
}
