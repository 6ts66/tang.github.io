package com.ruoyi.system.service.impl;

import com.ruoyi.common.core.domain.entity.SysUser;
import com.ruoyi.common.utils.SecurityUtils;
import com.ruoyi.system.domain.SysUserAddress;
import com.ruoyi.system.mapper.SysUserAddressMapper;
import com.ruoyi.system.service.ISysUserAddressService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

    @Service
    public class SysUserAddressServiceImpl implements ISysUserAddressService {

        @Autowired
        private SysUserAddressMapper addressMapper;

        @Override
        public List<SysUserAddress> selectByUserId(Long userId) {
            return addressMapper.selectByUserId(userId);
        }

        @Override
        @Transactional
        public int insert(SysUserAddress address) {
            SysUser currentUser = SecurityUtils.getLoginUser().getUser();
            address.setUserId(currentUser.getUserId());

            // 如果是第一个地址，设为默认
            List<SysUserAddress> existing = selectByUserId(currentUser.getUserId());
            if (existing.isEmpty()) {
                address.setIsDefault(1);
            }
            return addressMapper.insert(address);
        }

        @Override
        @Transactional
        public int update(SysUserAddress address) {
            return addressMapper.update(address);
        }

        @Override
        @Transactional
        public int delete(Long addressId) {
            return addressMapper.delete(addressId);
        }

        @Override
        @Transactional
        public int setDefault(Long addressId, Long userId) {
            // 1. 取消其他默认地址
            addressMapper.cancelOtherDefault(userId);
            // 2. 设置当前为默认
            return addressMapper.setDefault(addressId, userId);
        }

        @Override
        @Transactional
        public int cancelOtherDefault(Long userId) {
            return addressMapper.cancelOtherDefault(userId);
        }
    }
