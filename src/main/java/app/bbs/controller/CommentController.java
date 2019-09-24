package app.bbs.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import app.bbs.vo.CommentVO;
import app.bbs.service.CommentService;

@Controller
@RequestMapping("/comment")
public class CommentController {

  @Autowired
  CommentService mCommentService;

  @RequestMapping("/list") // 댓글 리스트
  @ResponseBody
  private List<CommentVO> mCommentServiceList(Model model, int bbs_idx) throws Exception {
    
    return mCommentService.commentListService(bbs_idx);
  }

  @RequestMapping("/insert") // 댓글 작성
  @ResponseBody
  private int mCommentServiceInsert(@RequestParam int bbs_idx, @RequestParam String content) throws Exception {

    CommentVO comment = new CommentVO();
    comment.setBbs_idx(bbs_idx);
    comment.setContent(content);
    // 로그인 기능을 구현했거나 따로 댓글 작성자를 입력받는 폼이 있다면 입력 받아온 값으로 사용하면 됩니다. 저는 따로 폼을 구현하지
    // 않았기때문에 임시로 "test"라는 값을 입력해놨습니다.
    comment.setAccount_idx(123);

    return mCommentService.commentInsertService(comment);
  }

  @RequestMapping("/update") // 댓글 수정
  @ResponseBody
  private int mCommentServiceUpdateProc(@RequestParam int idx, @RequestParam String content) throws Exception {

    CommentVO comment = new CommentVO();
    comment.setIdx(idx);
    comment.setContent(content);

    return mCommentService.commentUpdateService(comment);
  }

  @RequestMapping("/delete/{idx}") // 댓글 삭제
  @ResponseBody
  private int mCommentServiceDelete(@PathVariable int idx) throws Exception {

    return mCommentService.commentDeleteService(idx);
  }

}
