package app.sign.controller;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.CookieValue;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import app.account.service.AccountService;
import app.account.vo.AccountVO;
import app.sign.service.SignService;
import app.sign.vo.SignVO;

@Controller
@RequestMapping("/sign")
public class SignController {

  @Autowired
  SignService signService;

  @Autowired
  AccountService accountService;

  @GetMapping("/in")
  public String in() {
    return "/sign/in";
  }

  @GetMapping("/up")
  public String up(@ModelAttribute AccountVO accountVO) {
    return "/sign/up";
  }

  @GetMapping("/out")
  public String out(HttpSession session, @CookieValue(value = "signVO", required = false) SignVO cv,
      HttpServletResponse response) throws Exception {
    System.out.println(cv.toString());
    session.invalidate();
    PrintWriter out = response.getWriter();
    out.println("<script>alert('로그아웃 되었습니다.');</script>");
    return "redirect:/";
  }

  @PostMapping("/in")
  public String inExcute(@RequestParam("userid") String userId, @RequestParam("pw") String pw,
      @RequestParam(value = "check", required = false) String check, HttpSession session,
      @CookieValue(value = "signVO", required = false) SignVO cv) {

    SignVO signVO = signService.in(userId, pw);
    if (signVO != null) {
      if (check != null && check.equals("on")) {
        cv = signVO;
      }
      session.setAttribute("signVO", signVO);
    }
    return "redirect:/";
  }

  @PostMapping("/up")
  public String upExcute(@Valid AccountVO accountVO, BindingResult bindingResult,
      @ModelAttribute @RequestParam("pwCheck") String pwCheck, Model model, HttpServletResponse response)
      throws Exception {

    if (!accountVO.getPw().equals(pwCheck)) {
      model.addAttribute("pwCheckError", "비밀번호 맞춰주세요");
      return "/sign/up";
    } else if (bindingResult.hasErrors()) {
      return "/sign/up";
    } else {
      PrintWriter out = response.getWriter();
      out.println("<script>alert('회원가입되었습니다');</script>");
      accountService.create(accountVO);
      return "redirect:/";
    }
  }
}