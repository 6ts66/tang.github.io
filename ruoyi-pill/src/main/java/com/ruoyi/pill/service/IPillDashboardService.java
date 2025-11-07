package com.ruoyi.pill.service;

import com.ruoyi.pill.domain.DashboardVo;
import com.ruoyi.pill.domain.RecentOrderDTO;

import java.util.List;
import java.util.Map;

public interface IPillDashboardService {
    /**
     * 获取仪表盘统计信息
     */
    DashboardVo getDashboardStats();

    /**
     * 获取最近订单
     */
    List<?> getRecentOrders();
    List<?> getAllOrders();

    /**
     * 获取库存预警药品
     */
    List<?> getWarningDrugs();
}
