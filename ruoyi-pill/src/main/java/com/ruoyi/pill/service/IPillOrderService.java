package com.ruoyi.pill.service;

import java.util.List;

import com.ruoyi.common.core.page.TableDataInfo;
import com.ruoyi.common.utils.SecurityUtils;
import com.ruoyi.pill.domain.PillOrder;
import com.ruoyi.pill.mapper.PillOrderMapper;

/**
 * 我的订单Service接口
 * 
 * @author lsl
 * @date 2025-11-01
 */
public interface IPillOrderService 
{

    List<PillOrder> selectPillOrderList(PillOrder order);

//    TableDataInfo selectPillOrderPage(PillOrder order);
    /**
     * 查询我的订单
     * 
     * @param orderId 我的订单主键
     * @return 我的订单
     */
    public PillOrder selectPillOrderByOrderId(Long orderId);

    /**
     * 查询我的订单列表
     * 
     * @param
     * @return 我的订单集合
     */
    /*public List<PillOrder> selectPillOrderList(
            PillOrder pillOrder
    );*/

    /**
     * 新增我的订单
     * 
     * @param pillOrder 我的订单
     * @return 结果
     */
    public int insertPillOrder(PillOrder pillOrder);

    /**
     * 修改我的订单
     * 
     * @param pillOrder 我的订单
     * @return 结果
     */
    public int updatePillOrder(PillOrder pillOrder);

    /**
     * 批量删除我的订单
     * 
     * @param orderIds 需要删除的我的订单主键集合
     * @return 结果
     */
    public int deletePillOrderByOrderIds(Long[] orderIds);

    /**
     * 删除我的订单信息
     * 
     * @param orderId 我的订单主键
     * @return 结果
     */
    public int deletePillOrderByOrderId(Long orderId);

    /**
     * 更新订单状态
     */
    int updateOrderStatus(Long orderId, String status);

    /**
     * 批量更新订单状态
     */
    int updateOrderStatusBatch(List<Long> orderIds, String status);
}
