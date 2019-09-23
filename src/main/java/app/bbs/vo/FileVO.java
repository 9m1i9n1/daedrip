package app.bbs.vo;

import java.util.Date;

import lombok.Data;

@Data
public class FileVO {
  private int fidx;
  private int idx;
  private String fileName;
  private String fileOriName;
  private String fileUrl;
  private Date regDate;
}