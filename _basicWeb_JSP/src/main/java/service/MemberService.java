package service;

import java.util.List;

import domain.BoardVO;
import domain.MemberVO;

public interface MemberService {

	int register(MemberVO mvo);

	MemberVO login(MemberVO mvo);

	int lastLogin(String id);

	int modify(MemberVO updateMvo);

	int remove(String id);

	List<MemberVO> getList();

	List<BoardVO> myList(String writer);

}
