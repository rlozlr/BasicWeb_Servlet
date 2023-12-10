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

}
