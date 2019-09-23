package app.bbs.vo;

import java.util.Date;

import lombok.Data;

@Data
public class commentVO {
  private int idx;
  private int bbs_idx;
  private int account_idx;
  private String content;
  private Date regDate;
  private Date modifyDate;
}