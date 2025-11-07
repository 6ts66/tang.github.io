package com.ruoyi.pill.mapper;

import java.util.List;
import java.util.Map;

import com.ruoyi.pill.domain.DashboardVo;
import com.ruoyi.pill.domain.RecentOrderDTO;
import com.ruoyi.pill.domain.WarningDrugDTO;
import org.apache.ibatis.annotations.MapKey;
import org.apache.ibatis.annotations.Param;

public interface PillDashboardMapper {

    /**
     * 查询仪表盘统计信息
     */
    DashboardVo selectDashboardStats(@Param("userId") Long userId);

    /**
     * 查询最近订单
     */
    List<RecentOrderDTO> selectRecentOrders(@Param("userId") Long userId);
    List<RecentOrderDTO> selectAllOrders(@Param("userId") Long userId);

    /**
     * 查询库存预警药品
     */
    List<WarningDrugDTO> selectWarningDrugs(@Param("userId") Long userId);

}