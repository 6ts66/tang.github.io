package com.ruoyi.pill.mapper;

import java.util.List;
import com.ruoyi.pill.domain.PillAllOrder;
import org.apache.ibatis.annotations.Param;

/**
 * 全部订单Mapper接口
 * 
 * @author lsl
 * @date 2025-11-02
 */
public interface PillAllOrderMapper 
{
    /**
     * 查询全部订单
     * 
     * @param orderId 全部订单主键
     * @return 全部订单
     */
    public PillAllOrder selectPillAllOrderByOrderId(Long orderId);

    /**
     * 查询全部订单列表
     * 
     * @param pillAllOrder 全部订单
     * @return 全部订单集合
     */
    public List<PillAllOrder> selectPillAllOrderList(PillAllOrder pillAllOrder);

    /**
     * 新增全部订单
     * 
     * @param pillAllOrder 全部订单
     * @return 结果
     */
    public int insertPillAllOrder(PillAllOrder pillAllOrder);

    /**
     * 修改全部订单
     * 
     * @param pillAllOrder 全部订单
     * @return 结果
     */
    public int updatePillAllOrder(PillAllOrder pillAllOrder);

    /**
     * 删除全部订单
     * 
     * @param orderId 全部订单主键
     * @return 结果
     */
    public int deletePillAllOrderByOrderId(Long orderId);

    /**
     * 批量删除全部订单
     * 
     * @param orderIds 需要删除的数据主键集合
     * @return 结果
     */
    public int deletePillAllOrderByOrderIds(Long[] orderIds);

    /**
     * 更新订单状态
     */
    int updateOrderStatus(@Param("orderId") Long orderId, @Param("status") String status);

    /**
     * 批量更新订单状态
     */
    int updateOrderStatusBatch(@Param("orderIds") List<Long> orderIds, @Param("status") String status);
}
