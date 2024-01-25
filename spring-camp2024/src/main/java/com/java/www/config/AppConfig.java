package com.java.www.config;

import javax.sql.DataSource;

import org.apache.ibatis.session.SqlSessionFactory;
import org.mybatis.spring.SqlSessionFactoryBean;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.core.io.Resource;
import org.springframework.core.io.support.PathMatchingResourcePatternResolver;

@Configuration
public class AppConfig {

	// ▼myBatis 객체 생성
	@Bean // 객체를 만들어서 하나를 리턴한다.
	public SqlSessionFactory SqlSessionFactory(DataSource dataSource) throws Exception {

		// ▼1.DB연결부분 myBatis session연결 - application.properties에서 정보를 가져와 DB의 dataSource를 가져옴.
		SqlSessionFactoryBean sessionFactory = new SqlSessionFactoryBean();
		sessionFactory.setDataSource(dataSource); // dataSource가 DB접근 정보

		// ▼2.mapper 연결부분 : query문이 담긴 mapper파일을 모두 가져옴
		Resource[] res = new PathMatchingResourcePatternResolver().getResources("classpath:/mapper/**/*.xml"); //**모든폴더 확인
		sessionFactory.setMapperLocations(res);

		return sessionFactory.getObject(); // myBatis DB + mapper 정보가 들어가있는 모든 객체를 가져온다.

	}// SqlSessionFactory

	// ▼myBatis객체 1개를 리턴
	@Bean
	public SqlSessionTemplate sqlSession(SqlSessionFactory sqlSessionFactory) {
		return new SqlSessionTemplate(sqlSessionFactory); // myBatis에 사용할 1개 객체를 가져옴.
	}// sqlSession()

}// AppConfig
