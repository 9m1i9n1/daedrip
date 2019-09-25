package app.account.vo;

import java.sql.Date;

import javax.validation.constraints.Email;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Pattern;

import lombok.Data;

@Data
public class AccountVO {
  private int idx;
  @Pattern(regexp = "\\S{4,8}", message = "아이디를 4~8자로 입력해주세요.")
  private String userid;
  @Pattern(regexp = "\\S{4,8}", message = "비밀번호를 4~8자로 입력해주세요.")
  private String pw;
  private String platform;
  private String token;

  @Email
  private String email;
  @Pattern(regexp = "\\S{4,8}", message = "닉네임을 4~8자로 입력해주세요.")
  private String nickname;

  @NotNull
  private String zipcode;
  @NotNull
  private String address;
  @NotNull
  private String extraaddress;

  private Date regdate;
  private Date modifydate;
}