package com.ruoyi.system.mapper;

import com.ruoyi.system.domain.SysUserAddress;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

@Mapper
public interface SysUserAddressMapper {
    List<SysUserAddress> selectByUserId(Long userId);
    int insert(SysUserAddress address);
    int update(SysUserAddress address);
    int delete(Long addressId);
    int setDefault(@Param("addressId") Long addressId, @Param("userId") Long userId);
    int cancelOtherDefault(@Param("userId") Long userId);
}
