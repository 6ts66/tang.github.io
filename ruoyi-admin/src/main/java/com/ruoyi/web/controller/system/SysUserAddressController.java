package com.ruoyi.web.controller.system;

import com.ruoyi.common.core.controller.BaseController;
import com.ruoyi.common.core.domain.AjaxResult;
import com.ruoyi.common.utils.SecurityUtils;
import com.ruoyi.system.domain.SysUserAddress;
import com.ruoyi.system.service.ISysUserAddressService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/system/address")
public class SysUserAddressController extends BaseController {

    @Autowired
    private ISysUserAddressService addressService;

    /**
     * 获取用户地址列表
     */
    @GetMapping("/list")
    public AjaxResult list() {
        Long userId = SecurityUtils.getUserId();
        List<SysUserAddress> list = addressService.selectByUserId(userId);
        return success(list);
    }

    /**
     * 新增地址
     */
    @PostMapping
    public AjaxResult add(@RequestBody SysUserAddress address) {
        return toAjax(addressService.insert(address));
    }

    /**
     * 修改地址
     */
    @PutMapping
    public AjaxResult edit(@RequestBody SysUserAddress address) {
        return toAjax(addressService.update(address));
    }

    /**
     * 删除地址
     */
    @DeleteMapping("/{addressId}")
    public AjaxResult remove(@PathVariable Long addressId) {
        return toAjax(addressService.delete(addressId));
    }

    /**
     * 设置默认地址
     */
    @PutMapping("/default/{addressId}")
    public AjaxResult setDefault(@PathVariable Long addressId) {
        Long userId = SecurityUtils.getUserId();
        return toAjax(addressService.setDefault(addressId, userId));
    }

    /**
     * 取消其他默认地址
     */
    @PutMapping("/cancelDefault")
    public AjaxResult cancelOtherDefault() {
        Long userId = SecurityUtils.getUserId();
        return toAjax(addressService.cancelOtherDefault(userId));
    }
}