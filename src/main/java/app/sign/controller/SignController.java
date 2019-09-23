package app.sign.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/sign")
public class SignController {

  @GetMapping("/in")
  public String in() {
    return "/sign/in";
  }

  @GetMapping("/up")
  public String up() {
    return "/sign/up";
  }

  @GetMapping("/out")
  public String out() {
    
    return "/index";
  }

  @PostMapping("/in/excute")
  public String inExcute() {
    return "";
  }

  @PostMapping("/up/excute")
  public String upExcute() {
    return "";
  }
}