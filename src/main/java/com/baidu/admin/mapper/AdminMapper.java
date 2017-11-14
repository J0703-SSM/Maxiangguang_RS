package com.baidu.admin.mapper;

import com.baidu.admin.domain.Admin;

/**
 * Created by dllo on 17/11/13.
 */
public interface AdminMapper {

    Admin findByNameAndPwd(Admin admin);


}
