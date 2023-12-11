package repository;

import java.util.List;

import domain.BoardVO;
import domain.PagingVO;

public interface BoardDAO {

	List<BoardVO> selectList(PagingVO pgvo);

	int getTotal(PagingVO pgvo);

	int insert(BoardVO bvo);

	BoardVO getDetail(int bno);

	int delete(int bno);

	int update(BoardVO bvo);

	int readcountUp(int bno);

}
