package service;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import controller.CommentController;
import domain.CommentVO;
import repository.CommentDAO;
import repository.CommentDAOImpl;

public class CommentSerivceImpl implements CommentService {
	private static final Logger log = LoggerFactory.getLogger(CommentController.class);
	private CommentDAO cdao;
	
	public CommentSerivceImpl() {
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

}
