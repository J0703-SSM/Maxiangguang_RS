package com.baidu.account.service;

import com.baidu.account.domain.Account;
import com.baidu.base.domain.PageBean;

/**
 * Created by dllo on 17/11/19.
 */
public interface AccountService {


    PageBean<Account> findAll(PageBean<Account> pageBean);

    Account findById(int accountId);

    void insertAccount(Account account);

    void deleteById(int accountId);
}
