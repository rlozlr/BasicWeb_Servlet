package service;

import java.util.List;

import domain.BoardVO;
import domain.PagingVO;

public interface BoardService {

	List<BoardVO> getList(PagingVO pgvo);

	int getTotal(PagingVO pgvo);

	int insert(BoardVO bvo);

	BoardVO getDetail(int bno);

	int remove(int bno);

	int modify(BoardVO bvo);

}
