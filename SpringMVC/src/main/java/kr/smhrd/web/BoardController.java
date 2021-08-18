package kr.smhrd.web;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.smhrd.dao.BoardVO;

@Controller // @(annotation) + Controller 를 해줘야 POJO가 된다
public class BoardController {
	
	@RequestMapping("/boardList.do") // Client의 요청을 받는 annotation 
	// --> HandlerMapping class가 요청과 메소드를 연결해준다
	public String boardList(Model model) { // 요청에 따라 실행할 메소드
		// Model -> 객체바인딩을 하기 위해 만든 임시 객체, 주소를 저장하는 용도 
		
		// 데이터 베이스 연동
		BoardVO vo1 = new BoardVO(1, "연습1", "연습1", 0, "김성훈", "2021-08-18");
		BoardVO vo2 = new BoardVO(2, "연습2", "연습2", 0, "김성훈", "2021-08-18");
		BoardVO vo3 = new BoardVO(3, "연습3", "연습3", 0, "김성훈", "2021-08-18");
		
		List<BoardVO> list = new ArrayList<BoardVO>();
		list.add(vo1);
		list.add(vo2);
		list.add(vo3);
		
		//RequestDispatcher --> forward()
		model.addAttribute("list", list); // 객체바인딩(특정메모리에 객체를 연결하는 기술)
		
		// 사용자가 request하면 request객체가 생성되고 메모리가 생김 (스프링에서는 request가 아니라 Model class를 사용)
		// 객체바인딩을 통해 메모리에 setAttribute 한다 
		// jsp로 forward하면 jsp가 getAttribute할 수 있다
		
		return "boardList"; // --> /WEB-INF/views/boardList.jsp
	}
}
