package app.bbs.vo;

import java.sql.Date;

import lombok.Data;

@Data
public class commentVO {
  private int cidx;
  private int idx;
  private String content;
  private String writer;
  private Date reg_date;
}