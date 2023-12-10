package repository;

import java.util.List;

import domain.BoardVO;
import domain.PagingVO;

public interface BoardDAO {

	List<BoardVO> selectList(PagingVO pgvo);

	int getTotal(PagingVO pgvo);

}
