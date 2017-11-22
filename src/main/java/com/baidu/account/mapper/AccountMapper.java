package com.baidu.account.mapper;

import com.baidu.account.domain.Account;
import com.baidu.base.domain.PageBean;

import java.util.List;

/**
 * Created by dllo on 17/11/19.
 */
public interface AccountMapper {

    List<Account> findAll1(PageBean<Account> pageBean);

    List<Account> findAll();

    Account findById(int accountId);

    Account findByIdCard(String recommenderIdCard);

    void insertAccount(Account account);

    void deleteById(int accountId);
}
