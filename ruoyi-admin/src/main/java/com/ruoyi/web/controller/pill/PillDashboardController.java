package com.ruoyi.web.controller.pill;

import java.util.List;

import com.ruoyi.pill.domain.DashboardVo;
import com.ruoyi.pill.domain.PillAllOrder;
import com.ruoyi.pill.domain.RecentOrderDTO;
import com.ruoyi.pill.service.IPillAllOrderService;
import com.ruoyi.pill.service.IPillDashboardService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import com.ruoyi.common.core.controller.BaseController;
import com.ruoyi.common.core.domain.AjaxResult;

/**
 * 首页仪表盘控制器
 */
@RestController
@RequestMapping("/pill/dashboard")
public class PillDashboardController extends BaseController {

    @Autowired
    private IPillDashboardService dashboardService;

    @Autowired
    private IPillAllOrderService pillAllOrderService;

    /**
     * 获取首页全部订单数据
     */
    @GetMapping("/allOrders")
    public AjaxResult getAllOrders() {
        List<?> orders = dashboardService.getAllOrders();
        return success(orders);
    }
    /**
     * 获取首页统计信息
     */
    @GetMapping("/stats")
    public AjaxResult getDashboardStats() {
        DashboardVo stats = dashboardService.getDashboardStats();
        // 使用日志输出（推荐方式）
        logger.info("可购药品：{}", stats.getTotalDrugs());
        logger.info("我的订单：{}", stats.getMyTotalOrders());

        // 如果需要更详细的调试信息
        logger.debug("仪表盘统计数据：{}", stats);
        return success(stats);
    }

    /**
     * 获取最近订单
     */
    @GetMapping("/recentOrders")
    public AjaxResult getRecentOrders() {
        List<?> orders = dashboardService.getRecentOrders();
        return success(orders);
    }

    /**
     * 获取库存预警药品
     */
    @GetMapping("/warningDrugs")
    public AjaxResult getWarningDrugs() {
        List<?> drugs = dashboardService.getWarningDrugs();
        return success(drugs);
    }
}
