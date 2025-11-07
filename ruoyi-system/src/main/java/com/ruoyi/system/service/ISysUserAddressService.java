package com.ruoyi.system.service;

import com.ruoyi.common.utils.SecurityUtils;
import com.ruoyi.system.domain.SysUserAddress;
import com.ruoyi.system.mapper.SysUserAddressMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Date;
import java.util.List;

// SysUserAddressService.java
@Service
public interface ISysUserAddressService {

    /**
     * 查询用户地址列表
     * @param userId 用户ID
     * @return 地址列表
     */
    List<SysUserAddress> selectByUserId(Long userId);

    /**
     * 新增地址
     * @param address 地址信息
     * @return 结果
     */
    int insert(SysUserAddress address);

    /**
     * 修改地址
     * @param address 地址信息
     * @return 结果
     */
    int update(SysUserAddress address);

    /**
     * 删除地址
     * @param addressId 地址ID
     * @return 结果
     */
    int delete(Long addressId);

    /**
     * 设置默认地址
     * @param addressId 地址ID
     * @param userId 用户ID
     * @return 结果
     */
    int setDefault(Long addressId, Long userId);

    /**
     * 取消其他默认地址
     * @param userId 用户ID
     * @return 结果
     */
    int cancelOtherDefault(Long userId);
}