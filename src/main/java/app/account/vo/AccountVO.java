package app.account.vo;

import java.sql.Date;

import javax.validation.constraints.Email;
import javax.validation.constraints.NotEmpty;
import javax.validation.constraints.NotNull;

import org.hibernate.validator.constraints.Length;

import lombok.Data;

@Data
public class AccountVO {
  private int idx;

  @NotEmpty
  private String userid;

  @NotEmpty
  @Length(min = 4, max = 16)

  private String pw;
  private String platform;
  private String token;

  @NotEmpty
  @Email
  private String email;

  @NotNull
  private String nickname;

  @NotNull
  private String zipcode;
  @NotNull
  private String address;
  private String extraaddress;
  private Date regdate;
  private Date modifydate;
}