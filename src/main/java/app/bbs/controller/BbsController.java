package app.bbs.controller;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import app.bbs.service.BbsService;
import app.bbs.vo.BbsVO;

@Controller
@RequestMapping("/bbs")
public class BbsController {

  @Autowired
  BbsService bbsService;

  @GetMapping({ "", "/", "{pageNum}" })
  public String list(@PathVariable int pageNum, Model model) {
    return "/bbs/list";
  }

  @GetMapping("/read/{index}")
  public String read(@PathVariable int index, Model model) {
    BbsVO bbsVo = bbsService.read(index);
    System.out.println(bbsVo.getContent());
    return "/bbs/read";
  }

  @GetMapping("/create")
  public String create() {
    return "/bbs/create";
  }

  @GetMapping("/update/{index}")
  public String update(@PathVariable int index, Model model) {
    return "/bbs/update";
  }

  // #region excute
  @PostMapping("/create")
  public String createExcute(BbsVO bbs) {
    return "redirect:/bbs/read/"; // + index;
  }

  @PostMapping("/update/{index}")
  public String updateExcute(@PathVariable int index, BbsVO bbs) {
    return "redirect:/bbs/read/" + index;
  }

  @PostMapping("/delete/{index}")
  public String deleteExcute(@PathVariable int index) {
    return "redirect:/bbs/";
  }
  // #endregion excute

}