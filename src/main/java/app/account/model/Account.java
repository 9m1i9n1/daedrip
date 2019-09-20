package app.account.model;

import java.sql.Date;

import lombok.Data;

@Data
public class Account {
  private int idx;
  private String userid;
  private String pw;
  private String platform;
  private String token;
  private String email;
  private String nickname;
  private String zipcode;
  private String address;
  private String extraaddress;
  private Date regdate;
  private Date modifydate;
}