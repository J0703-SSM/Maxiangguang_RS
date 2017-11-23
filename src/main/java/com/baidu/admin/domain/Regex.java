package com.baidu.admin.domain;

/**
 * Created by dllo on 17/11/22.
 */
public class Regex {
    public static final String REGEX_MOBILE = "(^((13[0-9])|(15[^4,\\D])|(17[0-9])|(18[0-9]))\\d{8}$)||(\\d{3}-\\d{8})||(\\d{4}-\\d{7})";
    public static final String REGEX_EMAIL = "^\\w+([-+.]\\w+)*@\\w+([-.]\\w+)*\\.\\w+([-.]\\w+)*$";
}
