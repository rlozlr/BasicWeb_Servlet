package domain;

public class PagingVO {
	private int pageNo;	// 화면에 출력되는 페이지네이션 번호
	// qty = quantity(수량)의 약자
	private int qty;	// 한 페이지에 보여줄 게시글 수 (10개)
	private String type;	// 검색 유형
	private String keyword;	// 검색어
	
	public PagingVO() {
		// 처음 게시판 리스트 들어갔을 때
		// 페이지네이션 클릭 하기 전의 기본값 설정
		this.pageNo = 1;
		this.qty = 10;
	}
	
	// 페이지네이션을 클릭하면...
	public PagingVO(int pageNo, int qty, String type, String keyword) {
		this.pageNo = pageNo;
		this.qty = qty;
		this.type = type;
		this.keyword = keyword;
	}
	
	// DB에서 사용되는 시작번호 (0번지부터 시작함)
	public int getPageStart() {
		// 1page => 0번째 게시물 ~ 9번째 게시물,  2page => 10번째 게시물~, 3page => 20번째 게시물~
		return (pageNo - 1) * qty;
	}
	
	public String[] getTypeToArray() {
		// type 변수가 null 이라면 빈 문자열 배열을 반환
		// 아니라면 type 변수의 각 문자를 포함한 문자열 배열을 반환
		return this.type == null?
				new String[] {} : this.type.split("");
	}

	public int getPageNo() {
		return pageNo;
	}

	public void setPageNo(int pageNo) {
		this.pageNo = pageNo;
	}

	public int getQty() {
		return qty;
	}

	public void setQty(int qty) {
		this.qty = qty;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public String getKeyword() {
		return keyword;
	}

	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}

	@Override
	public String toString() {
		return "PagingVO [pageNo=" + pageNo + ", qty=" + qty + ", type=" + type + ", keyword=" + keyword + "]";
	}
	
}
