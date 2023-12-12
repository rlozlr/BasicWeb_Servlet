package repository;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import domain.BoardVO;
import domain.MemberVO;
import orm.DatabaseBuilder;

public class MemberDAOImpl implements MemberDAO {
	private static final Logger log = LoggerFactory.getLogger(MemberDAOImpl.class);
	// Sql Session 객체
	private SqlSession sql;
	
	public MemberDAOImpl() {
		// db와의 연결 및 Session 관리에 필요한 객체
		new DatabaseBuilder();
		sql = DatabaseBuilder.getFactory().openSession();
	}
	
	@Override
	public int insert(MemberVO mvo) {
		log.info(">>> join check 3");
		// "MemberMapper.reg" => namespace.id
		int isOk = sql.insert("MemberMapper.reg", mvo);
		if(isOk > 0) sql.commit();
		return isOk;
	}

	@Override
	public MemberVO login(MemberVO mvo) {
		log.info(">>> login check 3");
		return sql.selectOne("MemberMapper.login", mvo);
	}

	@Override
	public int lastLogin(String id) {
        log.info(">>> lastLogin check 3");
        int isOk = sql.update("MemberMapper.last", id);
        if (isOk > 0) sql.commit();
        return isOk;
	}

	@Override
	public int update(MemberVO updateMvo) {
		log.info(">>> modify check 3");
	    int isOk = sql.update("MemberMapper.mypage", updateMvo);
	    if (isOk > 0) sql.commit();
	    return isOk;
	}

	@Override
	public int delete(String id) {
		log.info(">>> remove check 3");
	    int isOk = sql.update("MemberMapper.remove", id);
	    if (isOk > 0) sql.commit();
	    return isOk;
	}

	@Override
	public List<MemberVO> selectList() {
		log.info(">>> attend_book check 3");
		return sql.selectList("MemberMapper.list");
	}

	@Override
	public List<BoardVO> selectList(String writer) {
		log.info(">>> myList check 3");
		return sql.selectList("MemberMapper.myList", writer);
	}

}
