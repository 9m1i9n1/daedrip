package app.bbs.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import com.google.gson.Gson;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttribute;

import app.bbs.vo.CommentVO;
import app.sign.vo.SignVO;
import app.bbs.service.CommentService;

@Controller
@RequestMapping("/comment")
public class CommentController {

  @Autowired
  CommentService mCommentService;

  @RequestMapping("/list") // 댓글 리스트
  @ResponseBody
  private Map<String, Object> mCommentServiceList(Model model, @RequestParam("bbs_idx") int bbs_idx,
      @SessionAttribute(value = "signVO", required = false) SignVO signVO) throws Exception {
    Map<String, Object> a = new HashMap<String, Object>();
    a.put("comment", mCommentService.commentListService(bbs_idx));
    a.put("signVO", signVO);
    return a;
  }

  @RequestMapping("/insert") // 댓글 작성
  @ResponseBody
  private int mCommentServiceInsert(@RequestParam int bbs_idx, @RequestParam String content,
      @SessionAttribute(value = "signVO") SignVO signVO) throws Exception {

    CommentVO comment = new CommentVO();
    comment.setBbs_idx(bbs_idx);
    comment.setContent(content);
    // 로그인 기능을 구현했거나 따로 댓글 작성자를 입력받는 폼이 있다면 입력 받아온 값으로 사용하면 됩니다. 저는 따로 폼을 구현하지
    // 않았기때문에 임시로 "test"라는 값을 입력해놨습니다.
    comment.setAccount_idx(Integer.parseInt(signVO.getIdx()));

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
