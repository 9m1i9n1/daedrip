package app.account.service;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import app.account.model.Account;

public interface AccountService {
  public List<Account> list(@Param("pageNum") int pageNum);

  public Account read(@Param("idx") int idx);

  public int create(Account account);

  public boolean update(int idx, Account account);

  public boolean delete(int idx);
}