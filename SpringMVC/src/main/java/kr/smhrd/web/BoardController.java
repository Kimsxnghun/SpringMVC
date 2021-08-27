package kr.smhrd.web;

import java.util.ArrayList;
import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import kr.smhrd.dao.BoardMapper;
import kr.smhrd.dao.BoardVO;

@Controller // @(annotation) + Controller 를 해줘야 POJO가 된다
public class BoardController {
	
	// @Autowired // Spring의 DI(Dependency Injection)기법
	@Inject // @Inject를 @Autowired 대신 사용 가능
	private BoardMapper mapper;
	
	@RequestMapping("/boardList.do") // Client의 요청을 받는 annotation 
	// --> HandlerMapping class가 요청과 메소드를 연결해준다
//	public String boardList(Model model) { // 요청에 따라 실행할 메소드
	
	public void boardList(Model model) { // 요청이름하고 jsp이름이 같으면 void를 사용해도 동작한다, 다르면 안 됨
		
		// Model -> 객체바인딩을 하기 위해 만든 임시 객체, 주소를 저장하는 용도 

		// 데이터 베이스 연동		
		// BoardMapper mapper = new BoardMapper(); 스프링은 객체를 직접 만들지 않는다
		List<BoardVO> list = mapper.boardList();
		model.addAttribute("list", list); // 객체 바인딩
		
//		return "boardList"; // --> /WEB-INF/views/boardList.jsp
		
// RequestDispatcher --> forward()
// model.addAttribute("list", list); // 객체바인딩(특정메모리에 객체를 연결하는 기술)
		
// 사용자가 request하면 request객체가 생성되고 메모리가 생김 (스프링에서는 request가 아니라 Model class를 사용)
// 객체바인딩을 통해 메모리에 setAttribute 한다 
// jsp로 forward하면 jsp가 getAttribute할 수 있다
	}
	
	@RequestMapping("/boardInsertForm.do")
	public String boardInsertForm() {
		return "boardInsertForm"; //WEB-INF/views/boardInsertForm.jsp ( 포워딩 )
	}
	
	@RequestMapping("/boardInsert.do")
	public String boardInsert(BoardVO vo){		
		// 파라미터 수집 -> VO에 담는다 : 단순 반복 작업
		// -> 스프링 프레임워크가 해준다! -> 어떻게? VO를 매개변수로 받아주면 됨
		// -> 프레임워크가 내부에서 VO객체 생성해준다 (리플렉션:이름만 적어줘도 객체를 생성해주는 기법) **디폴트 생성자 필요!
		// 자동으로 작업하는데 전제조건이 있다 -> 파라미터와 VO의 속성명이 같아야함
		mapper.boardInsert(vo);
		// 저장 성공 후에는 리다이렉트를 통해 boardList.do(Controller)로 보낸다
		// 포워딩과 차이점
		// 리다이렉트 -> url이 바뀐다 
		// 포워딩 -> url이 바뀌는게 아니라 서버 내부에서 요청하고 결과를 컨트롤러한테 넘겨서 컨트롤러가 응답해줌 
		return "redirect:/boardList.do"; // redirect 일때는 리턴타입 void로 바꾸면 안됨
	}
	
	@RequestMapping("/boardContent.do")
							// int라고 명시해놓으면 스프링이 알아서 파라미터를 인트형으로 바꿔줌, 같은 이름으로 받아주는게 좋다
	public String boardContent(/*@RequestParam("idx") 쓰면 이름 바꿔서 받을 수 있다*/ int idx, Model model){
		
		BoardVO vo = mapper.boardContent(idx);
		model.addAttribute("vo",vo); // 객체바인딩
		
		return "boardContent"; //WEB-INF/views/boardContent.jsp
	}
	
	// @RequestMapping("/boardUpdate.do")
	// @RequestMapping(value="/boardUpdate.do", method=RequestMethod.POST) -> method를 사용해 보내는 방식을 명시할 수 있다
	@PostMapping("/boardUpdate.do") // @PostMapping -> post 방식으로 RequestMapping 
	//** 여러가지 API를 사용할 수 있는 유연성이 있어야한다 !!
	public String boardUpdate(BoardVO vo) {
		
		mapper.boardUpdate(vo);		
		return "redirect:/boardList.do"; //jsp로 가는게 아니라 다시 컨트롤러로 보내기 때문에 포워딩이 아니라 리다이렉트를 쓴다
	}
	
	@GetMapping("/boardDelete.do") // @GetMapping -> get방식으로 RequestMappting
	// delete의 경우 클라이언트가 get방식으로 요청하기 때문에 post방식으로 받으면 Error가 발생한다
	public String boardDelete(int idx) {
		
		mapper.boardDelete(idx);
		return "redirect:/boardList.do";
	}
}


