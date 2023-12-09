package repository;

import java.util.List;

import domain.BoardVO;

public interface BoardDAO {

	List<BoardVO> selectList();

}
