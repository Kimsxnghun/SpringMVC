package kr.smhrd.dao;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

// JDBC(java+9+SQL) 1.유지보수가 어렵다  2.생산성이 떨어진다 (개발속도가 느리다 -> 개발자가 코딩을 모두 해야한다)
// 새로운 방법론으로 해결 --> MyBatis (DataBase Mapping Framework) : http://mybatis.org
// Java와 SQL을 분리시킴
// SQL Mapper file(XML)을 만들어야함
@Mapper // (생략가능) scan을 통해 @Mapper를 찾아냄
// -> 메모리에 interface가 올라가면서 네임스페이스를 보고 xml과 연결됨 -> sql실행
public interface BoardMapper {
	// DB 접속?? --> Spring에서는 환경설정 파일에서 한다 (XML)
	// root-context.xml의 org.mybatis.spring.SqlSessionFactoryBean가 인터페이스를 사용해서 DB연동 
	
	// Interface와 Annotation을 이용하는 방법 (xml 파일 없이) -> @Select
	// @Select("select * from tboard order by idx desc")
	public List<BoardVO> boardList(); // 추상메소드  --> DAO가 interface가 됨
	public void boardInsert(BoardVO vo); // 바디는 적지 않는다 -> 바디역할을 MyBatis 프레임워크가 대신 해준다
	// 매개변수는 xml로 넘겨주는 값이다 -> BoardInsert 메소드가 Mapper.xml로 BoardVO vo를 넘겨줌
	public BoardVO boardContent(int idx); 
	public void boardUpdate(BoardVO vo);
	
	@Delete("delete from tboard where idx=#{idx}")
	public void boardDelete(int idx);
	
	// ajax로 업데이트
	@Update("update tboard set title=#{title}, writer=#{writer} where idx=#{idx}")
	public void ajaxUpdate(BoardVO vo);
	
	@Update("update tboard set contents=#{contents} where idx=#{idx}")
	public void ajaxConUpdate(BoardVO vo);
}
