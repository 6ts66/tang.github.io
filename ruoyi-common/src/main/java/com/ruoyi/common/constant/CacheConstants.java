package com.ruoyi.common.constant;

/**
 * 缓存的key 常量
 * 
 * @author ruoyi
 */
public class CacheConstants
{
    /**
     * 登录用户 redis key
     */
    public static final String LOGIN_TOKEN_KEY = "login_tokens:";

    /**
     * 验证码 redis key
     */
    public static final String CAPTCHA_CODE_KEY = "captcha_codes:";

    /**
     * 参数管理 cache key
     */
    public static final String SYS_CONFIG_KEY = "sys_config:";

    /**
     * 字典管理 cache key
     */
    public static final String SYS_DICT_KEY = "sys_dict:";

    /**
     * 防重提交 redis key
     */
    public static final String REPEAT_SUBMIT_KEY = "repeat_submit:";

    /**
     * 限流 redis key
     */
    public static final String RATE_LIMIT_KEY = "rate_limit:";

    /**
     * 登录账户密码错误次数 redis key
     */
    public static final String PWD_ERR_CNT_KEY = "pwd_err_cnt:";

    /**
     * 用户权限缓存前缀
     * 格式：user_permission:用户ID
     * 存储内容：用户权限列表
     */
    public static final String USER_PERMISSION_KEY = "user_permission:";

    /**
     * 用户角色缓存前缀
     * 格式：user_role:用户ID
     * 存储内容：用户角色列表
     */
    public static final String USER_ROLE_KEY = "user_role:";

    /**
     * 用户部门缓存前缀
     * 格式：user_dept:用户ID
     * 存储内容：用户部门信息
     */
    public static final String USER_DEPT_KEY = "user_dept:";

    /**
     * 用户缓存通用前缀（用于模式匹配）
     * 格式：user:用户ID:*
     */
    public static final String USER_CACHE_PREFIX = "user:";

    /**
     * 登录用户缓存前缀
     * 格式：login_user:用户ID
     * 存储内容：用户登录信息
     */
    public static final String LOGIN_USER_KEY = "login_user:";

}
