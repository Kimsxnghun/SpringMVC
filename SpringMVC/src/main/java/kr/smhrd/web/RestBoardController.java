package kr.smhrd.web;

import java.util.List;

import javax.inject.Inject;

import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import kr.smhrd.dao.BoardMapper;
import kr.smhrd.dao.BoardVO;

// @Controller -> @RestController로 변경
@RestController // RestController : JSON dataformat으로 응답할 때 사용 -> OPEN API(URL로 요청 -> 서버가 데이터 제공 : XML,JSON)
// XML이 태그를 기반으로 하다보니 데이터량이 비대해짐 -> JSON을 통해 해결
public class RestBoardController {

	@Inject
	private BoardMapper mapper;
	
	@RequestMapping("list.do")
	public List<BoardVO> boardList(Model model){
		List<BoardVO> list = mapper.boardList();
		return list; // jsp주소가 아닌 객체를 보내버림 -> JSON으로 변환됨 (스프링프레임워크가 내부적으로 변환)
		// Object -> JSON변환 -> JSON타입으로 응답
		// [
		// {"idx":1, "title":"스프링1", "contents":"스프링1","count":0, "writer":"관리자", "indate":"2021-08-27"},
		// {"idx":2, "title":"스프링2", "contents":"스프링2","count":0, "writer":"관리자", "indate":"2021-08-27"},
		// {"idx":3, "title":"스프링3", "contents":"스프링3","count":0, "writer":"관리자", "indate":"2021-08-27"},
		// {"idx":4, "title":"스프링4", "contents":"스프링4","count":0, "writer":"관리자", "indate":"2021-08-27"} 
		// ]
		// 타입은 String인데 형식이 JSON포멧형식
		// String타입이기 때문에 JSON을 받는 클라이언트는 JSON을 핸들링하는  API를 통해 해석할 수 있다
		// 결과 보기 힘들면 JSON VIEWER 사용하면 된다~
	}
	
	@RequestMapping("/delete.do")
	public void delete(int idx){
		mapper.boardDelete(idx);
	}
	
	@RequestMapping("/insert.do")
	public void insert(BoardVO vo) {
		mapper.boardInsert(vo);
	}
	
	@RequestMapping("/update.do")
	public void update(BoardVO vo) { // ajax를 통해 title과 writer가 넘어옴
		mapper.ajaxUpdate(vo);
	}
	
	@RequestMapping("/conUpdate.do")
	public void conUpdate(BoardVO vo) {
		mapper.ajaxConUpdate(vo);
	}
}
