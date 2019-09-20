package app.account.service;

import java.util.List;

import org.springframework.stereotype.Service;

import app.account.model.Account;
import app.account.repo.AccountRepo;

@Service
public class AccountServiceImpl implements AccountService {

  AccountRepo accountRepo;

  @Override
  public List<Account> list(int pageNum) {
    return null;
  }

  @Override
  public int create(Account account) {
    return 0;
  }

  @Override
  public Account read(int idx) {
    Account account = accountRepo.read(idx);
    return account;
  }

  @Override
  public boolean update(int idx, Account account) {
    return false;
  }

  @Override
  public boolean delete(int idx) {
    return false;
  }

}