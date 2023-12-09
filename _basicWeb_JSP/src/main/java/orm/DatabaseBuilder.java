package orm;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

public class DatabaseBuilder {

	// Mybatis의 SqlSessionFactory 인스턴스
	private static SqlSessionFactory factory;
	// Mybatis 파일 경로
	private static final String CONFIG = "orm/MybatisConfig.xml";
	
	// 초기화 블럭을 사용하여 객체 생성 => 클래스가 로딩될 때 한 번만 생성
	static {
		try {
			// MybatisConfig.xml 파일을 읽어와 SqlSessionFactory 생성
			factory = new SqlSessionFactoryBuilder().build(Resources.getResourceAsReader(CONFIG));
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	// 생성된 SqlSessionFactory를 return
	// 이 method를 통해서 다른 클래스에서 db session을 얻을 수 있음
	public static SqlSessionFactory getFactory() {
		return factory;
	}
}
