package app.account.controller;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import app.account.model.Account;
import app.account.service.AccountService;

@Controller
@RequestMapping("/account")
public class AccountController {

  @Autowired
  AccountService accountService;

  @GetMapping({ "", "/", "{pageNum}" })
  public String list(@PathVariable Optional<Integer> pageNum, Model model) {
    List<Account> lists = accountService.list(pageNum.orElse(0));
    model.addAttribute("list", lists);
    return "/account/list";
  }

  @GetMapping("/read/{index}")
  public String read(@PathVariable Optional<Integer> index, Model model) {
    Account account = accountService.read(index.get());
    model.addAttribute("account", account);
    return "/account/read";
  }

  @GetMapping("/create")
  public String create() {
    return "/account/create";
  }

  @GetMapping("/update/{index}")
  public String update(@PathVariable Optional<Integer> index, Model model) {
    Account account = accountService.read(index.get());
    model.addAttribute("account", account);
    return "/account/update";
  }

  // #region excute
  @PostMapping("/create")
  public String createExcute(Account account) {
    int index = accountService.create(account);
    return "redirect:/account/read/" + index;
  }

  @PostMapping("/update/{index}")
  public String updateExcute(@PathVariable Optional<Integer> index, Account account) {
    accountService.update(index.get(), account);
    return "redirect:/account/read/" + index.orElse(0);
  }

  @PostMapping("/delete/{index}")
  public String deleteExcute(@PathVariable Optional<Integer> index) {
    accountService.delete(index.get());
    return "redirect:/account/";
  }
  // #endregion excute
}