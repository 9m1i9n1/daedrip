package app.bbs.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
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
  private String list(Model model) throws Exception {

    model.addAttribute("list", bbsService.listService());
    return "/bbs/index";
  }

  @GetMapping("/read/{idx}")
  private String read(@PathVariable int idx, Model model) throws Exception {

    model.addAttribute("read", bbsService.readService(idx));
    return "/bbs/read";
  }

  @GetMapping("/write")
  private String write() {

    return "/bbs/write";
  }

  @PostMapping("/writeProc")
  private String writeProc(HttpServletRequest request) throws Exception {

    BbsVO bbs = new BbsVO();

    bbs.setTitle(request.getParameter("title"));
    bbs.setAccount_idx(Integer.parseInt(request.getParameter("account_idx")));
    bbs.setContent(request.getParameter("content"));
    bbsService.writeService(bbs);

    return "redirect:/bbs/index";
  }

  @PostMapping("/update/{idx}")
  private String update(@PathVariable int idx, Model model) throws Exception {

    model.addAttribute("read", bbsService.readService(idx));

    return "/bbs/update";
  }

  @PostMapping("/updateProc")
  private int updateProc(HttpServletRequest request) throws Exception {

    BbsVO bbs = (BbsVO) request.getParameterMap();

    return bbsService.updateService(bbs);
  }

  @DeleteMapping("/delete/{idx}")
  private String delete(@PathVariable int idx) throws Exception {

    bbsService.deleteService(idx);

    return "bbs/";
  }
}