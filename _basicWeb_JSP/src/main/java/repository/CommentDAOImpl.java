package repository;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import controller.CommentController;
import domain.CommentVO;
import orm.DatabaseBuilder;

public class CommentDAOImpl implements CommentDAO {
	private static final Logger log = LoggerFactory.getLogger(CommentController.class);
	private SqlSession sql;
	private int isOk;
	
	public CommentDAOImpl() {
		new DatabaseBuilder();
		this.sql = DatabaseBuilder.getFactory().openSession();
	}

	@Override
	public int insert(CommentVO cvo) {
		log.info("comment post check 3");
		isOk = sql.insert("CommentMapper.post", cvo);
		if(isOk > 0) sql.commit();
		return isOk;
	}

	@Override
	public List<CommentVO> getList(int bno) {
		log.info("comment list check 3");
		return sql.selectList("CommentMapper.list", bno);
	}

	@Override
	public int update(CommentVO cvo) {
		log.info("comment update check 3");
		isOk = sql.update("CommentMapper.edit", cvo);
		if(isOk > 0) sql.commit();
		return isOk;
	}

	@Override
	public int delete(int cno) {
		log.info("comment remove check 3");
		isOk = sql.delete("CommentMapper.del", cno);
		if(isOk > 0) sql.commit();
		return isOk;
	}

	@Override
	public int removeAll(int bno) {
		log.info("comment removeAll check 3");
		isOk = sql.delete("CommentMapper.delAll", bno);
		sql.commit();
		return isOk;
	}

}
