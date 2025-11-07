package com.ruoyi.pill.service.impl;

import java.util.List;
import com.ruoyi.common.utils.DateUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.pill.mapper.PillAllOrderMapper;
import com.ruoyi.pill.domain.PillAllOrder;
import com.ruoyi.pill.service.IPillAllOrderService;

/**
 * 全部订单Service业务层处理
 *
 * @author lsl
 * @date 2025-11-02
 */
@Service
public class PillAllOrderServiceImpl implements IPillAllOrderService 
{
    @Autowired
    private PillAllOrderMapper pillAllOrderMapper;


    /**
     * 查询全部订单
     * 
     * @param orderId 全部订单主键
     * @return 全部订单
     */
    @Override
    public PillAllOrder selectPillAllOrderByOrderId(Long orderId)
    {
        return pillAllOrderMapper.selectPillAllOrderByOrderId(orderId);
    }

    /**
     * 查询全部订单列表
     * 
     * @param pillAllOrder 全部订单
     * @return 全部订单
     */
    @Override
    public List<PillAllOrder> selectPillAllOrderList(PillAllOrder pillAllOrder)
    {
        return pillAllOrderMapper.selectPillAllOrderList(pillAllOrder);
    }

    /**
     * 新增全部订单
     * 
     * @param pillAllOrder 全部订单
     * @return 结果
     */
    @Override
    public int insertPillAllOrder(PillAllOrder pillAllOrder)
    {
        pillAllOrder.setCreateTime(DateUtils.getNowDate());
        return pillAllOrderMapper.insertPillAllOrder(pillAllOrder);
    }

    /**
     * 修改全部订单
     * 
     * @param pillAllOrder 全部订单
     * @return 结果
     */
    @Override
    public int updatePillAllOrder(PillAllOrder pillAllOrder)
    {
        return pillAllOrderMapper.updatePillAllOrder(pillAllOrder);
    }

    /**
     * 批量删除全部订单
     * 
     * @param orderIds 需要删除的全部订单主键
     * @return 结果
     */
    @Override
    public int deletePillAllOrderByOrderIds(Long[] orderIds)
    {
        return pillAllOrderMapper.deletePillAllOrderByOrderIds(orderIds);
    }

    /**
     * 删除全部订单信息
     * 
     * @param orderId 全部订单主键
     * @return 结果
     */
    @Override
    public int deletePillAllOrderByOrderId(Long orderId)
    {
        return pillAllOrderMapper.deletePillAllOrderByOrderId(orderId);
    }

    @Override
    public int updateOrderStatus(Long orderId, String status) {
        return pillAllOrderMapper.updateOrderStatus(orderId, status);
    }

    @Override
    public int updateOrderStatusBatch(List<Long> orderIds, String status) {
        return pillAllOrderMapper.updateOrderStatusBatch(orderIds, status);
    }
}
