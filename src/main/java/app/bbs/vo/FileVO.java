package app.bbs.vo;

import lombok.Data;

@Data
public class FileVO {
  private int fidx;
  private int idx;
  // 저장할 파일
  private String fileName;
  // 실제 파일
  private String fileOriName;
  private String fileUrl;
}