package app.bbs.controller;

import java.io.File;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.io.FilenameUtils;
import org.apache.commons.lang3.RandomStringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestPart;
import org.springframework.web.multipart.MultipartFile;

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
  private String writeProc(HttpServletRequest request, @RequestPart MultipartFile files) throws Exception {

    BbsVO bbs = new BbsVO();

    bbs.setTitle(request.getParameter("title"));
    bbs.setAccount_idx(Integer.parseInt(request.getParameter("account_idx")));
    bbs.setContent(request.getParameter("content"));

    String sourceFileName = files.getOriginalFilename();
    String sourceFileNameExtension = FilenameUtils.getExtension(sourceFileName).toLowerCase();

    File destinationFile;
    String destinationFileName;
    String fileUrl = "../../../../webapp/WEB-INF/upload/";

    do {
      destinationFileName = RandomStringUtils.randomAlphabetic(32) + "." + sourceFileNameExtension;
      destinationFile = new File(fileUrl + destinationFileName);
    } while (destinationFile.exists());

    destinationFile.getParentFile().mkdirs();
    files.transferTo(destinationFile);

    bbsService.writeService(bbs);

    return "redirect:/bbs/index";
  }

  @GetMapping("/{category}/update/{idx}")
  private String update(@PathVariable int idx, Model model) throws Exception {
    model.addAttribute("read", bbsService.readService(idx));
    return "/bbs/update";
  }

  @PostMapping("/updateProc")
  private String updateProc(HttpServletRequest request) throws Exception {

    BbsVO bbs = new BbsVO();
    bbs.setTitle(request.getParameter("title"));
    bbs.setContent(request.getParameter("content"));
    bbs.setIdx(Integer.parseInt(request.getParameter("idx")));

    bbsService.updateService(bbs);

    return "redirect:/bbs/read/" + request.getParameter("idx");
  }

  @DeleteMapping("/delete/{idx}")
  private String delete(@PathVariable int idx) throws Exception {

    bbsService.deleteService(idx);

    return "bbs/";
  }

}