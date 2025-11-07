package com.ruoyi.pill.service.impl;

import java.util.List;

import com.ruoyi.common.core.page.TableDataInfo;
import com.ruoyi.common.utils.DateUtils;
import com.ruoyi.common.utils.SecurityUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.pill.mapper.PillOrderMapper;
import com.ruoyi.pill.domain.PillOrder;
import com.ruoyi.pill.service.IPillOrderService;

/**
 * 我的订单Service业务层处理
 * 
 * @author lsl
 * @date 2025-11-01
 */
@Service
public class PillOrderServiceImpl implements IPillOrderService 
{
    @Autowired
    private PillOrderMapper pillOrderMapper;

    /*@Override
    public TableDataInfo selectPillOrderPage(PillOrder order) {
        startPage();
        Long userId = SecurityUtils.getUserId();
        List<PillOrder> list = pillOrderMapper.selectPillOrderListByUserId(userId, order);
        return getDataTable(list);
    }*/

    /**
     * 查询我的订单
     * 
     * @param orderId 我的订单主键
     * @return 我的订单
     */
    @Override
    public PillOrder selectPillOrderByOrderId(Long orderId)
    {
        return pillOrderMapper.selectPillOrderByOrderId(orderId);
    }

    /**
     * 查询我的订单列表
     * 
     * @param order 我的订单
     * @return 我的订单
     */
    @Override
    public List<PillOrder> selectPillOrderList(PillOrder order)
    {
        // 获取当前登录用户ID
        Long userId = SecurityUtils.getUserId();
        return pillOrderMapper.selectPillOrderListByUserId(userId, order);
    }

    /**
     * 新增我的订单
     * 
     * @param pillOrder 我的订单
     * @return 结果
     */
    @Override
    public int insertPillOrder(PillOrder pillOrder)
    {
        pillOrder.setCreateTime(DateUtils.getNowDate());
        return pillOrderMapper.insertPillOrder(pillOrder);
    }

    /**
     * 修改我的订单
     * 
     * @param pillOrder 我的订单
     * @return 结果
     */
    @Override
    public int updatePillOrder(PillOrder pillOrder)
    {
        return pillOrderMapper.updatePillOrder(pillOrder);
    }

    /**
     * 批量删除我的订单
     * 
     * @param orderIds 需要删除的我的订单主键
     * @return 结果
     */
    @Override
    public int deletePillOrderByOrderIds(Long[] orderIds)
    {
        return pillOrderMapper.deletePillOrderByOrderIds(orderIds);
    }

    @Override
    public int deletePillOrderByOrderId(Long orderId) {
        return 0;
    }

    /**
     * 删除我的订单信息
     * 
     * @param orderId 我的订单主键
     * @return 结果
     */
    @Override
    public int updateOrderStatus(Long orderId, String status) {
        return pillOrderMapper.updateOrderStatus(orderId, status);
    }

    @Override
    public int updateOrderStatusBatch(List<Long> orderIds, String status) {
        return pillOrderMapper.updateOrderStatusBatch(orderIds, status);
    }
}
