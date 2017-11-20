package com.baidu.account.service.impl;

import com.baidu.account.domain.Account;
import com.baidu.account.mapper.AccountMapper;
import com.baidu.account.service.AccountService;
import com.baidu.base.domain.PageBean;
import com.baidu.base.test.MainTest;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.annotation.Resource;
import java.util.List;

/**
 * Created by dllo on 17/11/19.
 */
@Service("accountService")
public class AccountServiceImpl implements AccountService {

    @Resource
    private AccountMapper accountMapper;

    @Override
    public PageBean<Account> findAll(PageBean<Account> pageBean) {
        int pc = pageBean.getPc();
        int ps = pageBean.getPs();
        pageBean.setStart((pc -1)*ps);

        List<Account> accounts = accountMapper.findAll1(pageBean);

        pageBean.setTr(accountMapper.findAll().size());

        pageBean.setBeanList(accounts);

        return pageBean;
    }

    @Override
    public Account findById(int accountId) {
        return accountMapper.findById(accountId);
    }


}
