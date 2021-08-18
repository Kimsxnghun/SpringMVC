package kr.smhrd.dao;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.NonNull;
import lombok.RequiredArgsConstructor;

// 게시판(Object) -> 번호, 제목, 내용, 조회수, 작성자, 작성일 ... (속성)
@Data // lombok API로 getter, setter 만듬
@AllArgsConstructor // lombok API로 생성자 만듬
@NoArgsConstructor // 기본 생성자도 만들어준다
// @RequiredArgsConstructor // @nonNull 처리한 속성을 필요로 하는 생성자가 생긴다
public class BoardVO {
	// 맴버변수, 속성, 프로퍼티(property)
	private int idx;
	// @NonNull
	private String title;
	// @NonNull
	private String contents;
	private int count;
	// @NonNull
	private String writer;
	private String indate;
	// 스프링은 getter, setter를 자동으로 만들 수 있다 -> lombok API를 사용
	
	
	
	
}
