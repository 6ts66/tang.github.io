package com.ruoyi.pill.mapper;

import java.util.List;
import com.ruoyi.pill.domain.PillOrder;
import org.apache.ibatis.annotations.Param;

/**
 * 我的订单Mapper接口
 * 
 * @author lsl
 * @date 2025-11-01
 */
public interface PillOrderMapper 
{
    List<PillOrder> selectPillOrderListByUserId(@Param("userId") Long userId, @Param("order") PillOrder order);
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
     * @param pillOrder 我的订单
     * @return 我的订单集合
     */
    public List<PillOrder> selectPillOrderList(PillOrder pillOrder);

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
     * 删除我的订单
     * 
     * @param orderId 我的订单主键
     * @return 结果
     */
    public int deletePillOrderByOrderId(Long orderId);

    /**
     * 批量删除我的订单
     * 
     * @param orderIds 需要删除的数据主键集合
     * @return 结果
     */
    public int deletePillOrderByOrderIds(Long[] orderIds);

    /**
     * 更新订单状态
     */
    int updateOrderStatus(@Param("orderId") Long orderId, @Param("status") String status);

    /**
     * 批量更新订单状态
     */
    int updateOrderStatusBatch(@Param("orderIds") List<Long> orderIds, @Param("status") String status);

}
