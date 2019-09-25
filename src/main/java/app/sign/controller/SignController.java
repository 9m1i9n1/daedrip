package app.sign.controller;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
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
  public String up(Model model) {
    model.addAttribute("accountVO", new AccountVO());
    return "/sign/up";
  }

  @GetMapping("/out")
  public String out(HttpSession session) {
    session.invalidate();
    return "redirect:/";
  }

  @PostMapping("/in")
  public String inExcute(@RequestParam("userid") String userId, @RequestParam("pw") String pw,
      @RequestParam(value = "check", required = false) String check, HttpSession session, Model model) {
    SignVO signVO = signService.in(userId, pw);
    if (signVO != null) {
      session.setAttribute("signVO", signVO);
    }
    return "redirect:/";
  }

  @PostMapping("/up")
  public String upExcute(@Valid AccountVO accountVO, BindingResult bindingResult) throws Exception {
    System.out.println(bindingResult.toString());
    if (bindingResult.hasErrors()) {
      System.out.println("에러발생");
      return "/sign/up";
    } else {
      System.out.println("회원가입성공!!");
      return "redirect:/";
    }
  }
}