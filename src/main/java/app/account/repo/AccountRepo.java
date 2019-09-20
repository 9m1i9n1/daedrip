package app.account.repo;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import app.account.model.Account;

@Mapper
public interface AccountRepo {
  Account read(@Param("idx") int idx);
}