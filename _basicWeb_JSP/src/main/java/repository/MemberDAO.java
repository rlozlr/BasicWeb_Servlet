package repository;

import java.util.List;

import domain.BoardVO;
import domain.MemberVO;

public interface MemberDAO {

	int insert(MemberVO mvo);

	MemberVO login(MemberVO mvo);

	int lastLogin(String id);

	int update(MemberVO updateMvo);

	int delete(String id);

	List<MemberVO> selectList();

	List<BoardVO> selectList(String writer);

}
