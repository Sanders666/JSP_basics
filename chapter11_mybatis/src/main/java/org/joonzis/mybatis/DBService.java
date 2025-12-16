package org.joonzis.mybatis;

import java.io.InputStream;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

public class DBService {	// DBService는 Factory만 만들어주는 역할
	
	// 필드
	private static SqlSessionFactory factory = null;
	
	// 싱글톤
	static {
		try {
			String resource = "org/joonzis/mybatis/sqlmap.xml";
			InputStream is = Resources.getResourceAsStream(resource);
			factory = new SqlSessionFactoryBuilder().build(is);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	// 메소드
	public static SqlSessionFactory getFactory() {
		return factory;
	}
}
// SqlSessionFactoryBuilder에서   SqlSessionFactory 을 생성하고,
// Factory에서  SqlSession을 생성한다.
// mybaytis를 이용하려면 SqlSession이 필요하다!