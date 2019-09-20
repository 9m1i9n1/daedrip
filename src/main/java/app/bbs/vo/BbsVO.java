package app.bbs.vo;

import java.sql.Date;

import lombok.Data;

@Data
public class BbsVO {
  private int idx;
  private int account_idx;
  private String category;
  private String title;
  private String content;
  private int readcount;
  private Date regdate;
  private Date modifydate;
}