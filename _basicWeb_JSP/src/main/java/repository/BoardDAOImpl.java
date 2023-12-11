package repository;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import domain.BoardVO;
import domain.PagingVO;
import orm.DatabaseBuilder;

public class BoardDAOImpl implements BoardDAO {
	private static final Logger log = LoggerFactory.getLogger(BoardDAOImpl.class);
	private SqlSession sql;
	
	public BoardDAOImpl() {
		new DatabaseBuilder();
		this.sql = DatabaseBuilder.getFactory().openSession();
	}

	@Override
	public List<BoardVO> selectList(PagingVO pgvo) {
		log.info(">>> list check 3");
		return sql.selectList("BoardMapper.list", pgvo);
	}

	@Override
	public int getTotal(PagingVO pgvo) {
		log.info(">>> totalCount check 3");
		return sql.selectOne("BoardMapper.total", pgvo);
	}

	@Override
	public int insert(BoardVO bvo) {
		log.info(">>> insert check 3");
		int isOk = sql.insert("BoardMapper.reg", bvo);
		if (isOk > 0) sql.commit();
		return isOk;
	}

	@Override
	public BoardVO getDetail(int bno) {
		log.info(">>> detail check3");
		return sql.selectOne("BoardMapper.detail", bno);

	}

	@Override
	public int delete(int bno) {
		log.info(">>> remove check3");
		int isOk = sql.delete("BoardMapper.del", bno);
		if(isOk > 0) sql.commit();
		return isOk;
	}

	@Override
	public int update(BoardVO bvo) {
		log.info(">>> edit check3");
		int isOk = sql.update("BoardMapper.edit", bvo);
		if(isOk > 0) sql.commit();
		return isOk;
	}

	@Override
	public int readcountUp(int bno) {
		log.info(">>> readcountUp check3");
		int isOk = sql.update("BoardMapper.readcount", bno);
		if(isOk > 0) sql.commit();
		return isOk;
	}

}
