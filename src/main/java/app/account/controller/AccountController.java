package app.account.controller;

import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import app.account.service.AccountService;
import app.account.vo.AccountVO;

@Controller
@RequestMapping("/account")
public class AccountController {

  @Autowired
  AccountService accountService;

  @GetMapping({ "", "/", "{pageNum}" })
  public String list(@PathVariable Optional<Integer> pageNum, Model model) {
    return "/account/list";
  }

  @GetMapping("/read/{index}")
  public String read(@PathVariable Optional<Integer> index, Model model) {
    return "/account/read";
  }

  @GetMapping("/create")
  public String create() {
    return "/account/create";
  }

  @GetMapping("/update/{index}")
  public String update(@PathVariable Optional<Integer> index, Model model) {
    return "/account/update";
  }

  // #region excute
  @PostMapping("/create")
  public String createExcute(AccountVO account) {
    return "redirect:/account/read/";
  }

  @PostMapping("/update/{index}")
  public String updateExcute(@PathVariable Optional<Integer> index, AccountVO account) {
    return "redirect:/account/read/" + index.orElse(0);
  }

  @PostMapping("/delete/{index}")
  public String deleteExcute(@PathVariable Optional<Integer> index) {
    return "redirect:/account/";
  }
}