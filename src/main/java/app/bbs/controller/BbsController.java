package app.bbs.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.io.FilenameUtils;
import org.apache.commons.lang3.RandomStringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestPart;
import org.springframework.web.multipart.MultipartFile;

import app.bbs.service.BbsService;
import app.bbs.vo.BbsVO;
import app.bbs.vo.FileVO;

@Controller
@RequestMapping("/bbs")
public class BbsController {

  @Autowired
  BbsService bbsService;

  @Value("${file.upload.directory}")
  String uploadFileDir;

  @GetMapping({ "", "/", "{pageNum}" })
  private String list(Model model) throws Exception {

    model.addAttribute("list", bbsService.listService());
    return "/bbs/index";
  }

  @GetMapping("/read/{idx}")
  private String read(@PathVariable int idx, Model model) throws Exception {

    bbsService.updateCountService(idx);
    model.addAttribute("read", bbsService.readService(idx));
    model.addAttribute("file", bbsService.downloadService(idx));

    return "/bbs/read";
  }

  @GetMapping("/write")
  private String write() {
    return "/bbs/write";
  }

  @PostMapping("/writeProc")
  private String writeProc(HttpServletRequest request, @RequestPart MultipartFile files) throws Exception {

    BbsVO bbs = new BbsVO();
    FileVO file = new FileVO();

    bbs.setTitle(request.getParameter("title"));
    bbs.setAccount_idx(Integer.parseInt(request.getParameter("account_idx")));
    bbs.setContent(request.getParameter("content"));

    if (files.isEmpty()) {
      bbsService.writeService(bbs);
    } else {
      String fileName = files.getOriginalFilename();
      String fileNameExtension = FilenameUtils.getExtension(fileName).toLowerCase();

      File destinationFile;
      String destinationFileName;
      do {
        destinationFileName = RandomStringUtils.randomAlphabetic(32) + "." + fileNameExtension;
        destinationFile = new File(uploadFileDir + destinationFileName);
      } while (destinationFile.exists());

      destinationFile.getParentFile().mkdirs();
      files.transferTo(destinationFile);

      // bbs insert
      bbsService.writeService(bbs);

      file.setBbs_idx(bbs.getIdx());
      file.setFileName(destinationFileName);
      file.setFileOriName(fileName);
      file.setFileUrl(uploadFileDir);

      // file insert
      bbsService.uploadService(file);
    }

    return "redirect:/bbs/index";
  }

  @GetMapping("/update/{idx}")
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

  // TODO:: 이 부분 GET 말고 다른 방향 있는지 확인.
  @GetMapping("/delete/{idx}")
  private String delete(@PathVariable int idx) throws Exception {

    bbsService.deleteService(idx);

    return "redirect:/bbs/index";
  }

  @GetMapping("/fileDown/{bbs_idx}")
  private void fileDown(@PathVariable int bbs_idx, HttpServletRequest request, HttpServletResponse response)
      throws Exception {
    request.setCharacterEncoding("UTF-8");
    FileVO fileVO = bbsService.downloadService(bbs_idx);

    // 파일 업로드 경로
    try {
      String fileUrl = fileVO.getFileUrl();
      fileUrl += "/";
      String savePath = fileUrl;
      String fileName = fileVO.getFileName();

      String oriFileName = fileVO.getFileOriName();
      InputStream in = null;
      OutputStream os = null;
      File file = null;
      boolean skip = false;
      String client = "";

      try {
        file = new File(savePath, fileName);
        in = new FileInputStream(file);
      } catch (FileNotFoundException fe) {
        skip = true;
      }

      client = request.getHeader("User-Agent");

      response.reset();
      response.setContentType("application/octet-stream");
      response.setHeader("Content-Description", "JSP Generated Data");

      if (!skip) {
        // IE
        if (client.indexOf("MSIE") != -1) {
          response.setHeader("Content-Disposition", "attachment; filename=\""
              + java.net.URLEncoder.encode(oriFileName, "UTF-8").replaceAll("\\+", "\\ ") + "\"");
        }
        // IE 11 이상
        else if (client.indexOf("Trident") != -1) {
          response.setHeader("Content-Disposition", "attachment; filename=\""
              + java.net.URLEncoder.encode(oriFileName, "UTF-8").replaceAll("\\+", "\\ ") + "\"");
        }
        // 한글 파일명 처리
        else {
          response.setHeader("Content-Disposition",
              "attachment; filename=\"" + new String(oriFileName.getBytes("UTF-8"), "ISO8859_1") + "\"");
          response.setHeader("Content-Type", "application/octet-stream; charset=utf-8");
        }

        response.setHeader("Content-Length", "" + file.length());
        os = response.getOutputStream();
        byte b[] = new byte[(int) file.length()];
        int leng = 0;
        while ((leng = in.read(b)) > 0) {
          os.write(b, 0, leng);
        }
      } else {
        response.setContentType("text/html; charset=UTF-8");
        PrintWriter out = response.getWriter();
        out.println("<script language='javascript'>alert('파일을 찾을 수 없습니다!'); history.back(); </script>");
        out.flush();
      }

      in.close();
      os.close();

    } catch (Exception e) {
      System.out.println("ERROR : " + e.getMessage());
    }
  }

}