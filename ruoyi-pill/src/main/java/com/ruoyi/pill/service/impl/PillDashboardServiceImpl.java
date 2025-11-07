package com.ruoyi.pill.service.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.ruoyi.pill.domain.RecentOrderDTO;
import com.ruoyi.pill.service.IPillDashboardService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.common.utils.SecurityUtils;
import com.ruoyi.pill.domain.DashboardVo;
import com.ruoyi.pill.mapper.PillDashboardMapper;

@Service
public class PillDashboardServiceImpl implements IPillDashboardService {

    @Autowired
    private PillDashboardMapper dashboardMapper;

    @Override
    public DashboardVo getDashboardStats() {
        Long userId = SecurityUtils.getUserId();
        return dashboardMapper.selectDashboardStats(userId);
    }

    @Override
    public List<?> getRecentOrders() {
        Long userId = SecurityUtils.getUserId();
        return dashboardMapper.selectRecentOrders(userId);
    }

    @Override
    public List<?> getAllOrders() {
        Long userId = SecurityUtils.getUserId();
        return dashboardMapper.selectAllOrders(userId);
    }

    @Override
    public List<?> getWarningDrugs() {
        Long userId = SecurityUtils.getUserId();
        return dashboardMapper.selectWarningDrugs(userId);
    }

}