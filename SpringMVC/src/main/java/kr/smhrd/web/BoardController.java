package kr.smhrd.web;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import kr.smhrd.dao.BoardMapper;
import kr.smhrd.dao.BoardVO;

@Controller // @(annotation) + Controller 를 해줘야 POJO가 된다
public class BoardController {
	
	@Autowired // Spring의 DI(Dependency Injection)기법
	private BoardMapper mapper;
	
	@RequestMapping("/boardList.do") // Client의 요청을 받는 annotation 
	// --> HandlerMapping class가 요청과 메소드를 연결해준다
	public String boardList(Model model) { // 요청에 따라 실행할 메소드
		// Model -> 객체바인딩을 하기 위해 만든 임시 객체, 주소를 저장하는 용도 

		// 데이터 베이스 연동		
		// BoardMapper mapper = new BoardMapper(); 스프링은 객체를 직접 만들지 않는다
		List<BoardVO> list = mapper.boardList();
		model.addAttribute("list", list); // 객체 바인딩
		
		return "boardList"; // --> /WEB-INF/views/boardList.jsp
// RequestDispatcher --> forward()
// model.addAttribute("list", list); // 객체바인딩(특정메모리에 객체를 연결하는 기술)
		
// 사용자가 request하면 request객체가 생성되고 메모리가 생김 (스프링에서는 request가 아니라 Model class를 사용)
// 객체바인딩을 통해 메모리에 setAttribute 한다 
// jsp로 forward하면 jsp가 getAttribute할 수 있다
	}
	
	@RequestMapping("/boardInsertForm.do")
	public String boardInsertForm() {
		return "boardInsertForm"; //WEB-INF/views/boardInsertForm.jsp
	}
	
	@RequestMapping("/boardInsert.do")
	public String boardInsert(BoardVO vo){
		// 파라미터 수집 -> VO에 담는다 : 단순 반복 작업
		// -> 스프링 프레임워크가 해준다! -> 어떻게? VO를 매개변수로 받아주면 됨
		// -> 프레임워크가 내부에서 VO객체 생성해준다 (리플렉션:이름만 적어줘도 객체를 생성해주는 기법) **디폴트 생성자 필요!
		// 자동으로 작업하는데 전제조건이 있다 -> 파라미터와 VO의 속성명이 같아야함
		mapper.boardInsert(vo);
		// 저장 성공 후에는 리다이렉트를 통해 boardList.do(Controller)로 보낸다
		return "redirect:/boardList.do";
	}
	
	@RequestMapping("/boardContent.do")
							// int라고 명시해놓으면 스프링이 알아서 파라미터를 인트형으로 바꿔줌, 같은 이름으로 받아주는게 좋다
	public String boardContent(/*@RequestParam("idx") 쓰면 이름 바꿔서 받을 수 있다*/ int idx, Model model){
		
		BoardVO vo = mapper.boardContent(idx);
		model.addAttribute("vo",vo); // 객체바인딩
		
		return "boardContent"; //WEB-INF/views/boardContent.jsp
	}
	
}


