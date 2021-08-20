package kr.smhrd.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

// JDBC(java+9+SQL) 1.유지보수가 어렵다  2.생산성이 떨어진다 (개발속도가 느리다 -> 개발자가 코딩을 모두 해야한다)
// 새로운 방법론으로 해결 --> MyBatis (DataBase Mapping Framework) : http://mybatis.org
// Java와 SQL을 분리시킴
// SQL Mapper file(XML)을 만들어야함
@Mapper // (생략가능)
public interface BoardMapper {
	// DB 접속?? --> Spring에서는 환경설정 파일에서 한다 (XML)
	public List<BoardVO> boardList(); // 추상메소드  --> DAO가 interface가 됨
}
