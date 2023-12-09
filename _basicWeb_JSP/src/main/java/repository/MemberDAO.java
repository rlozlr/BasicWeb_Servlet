package repository;

import domain.MemberVO;

public interface MemberDAO {

	int insert(MemberVO mvo);

	MemberVO login(MemberVO mvo);

	int lastLogin(String id);

	int update(MemberVO updateMvo);

	int delete(String id);

}
