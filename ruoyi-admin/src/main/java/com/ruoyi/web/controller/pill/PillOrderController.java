package com.ruoyi.web.controller.pill;

import java.util.List;
import java.util.Map;
import javax.servlet.http.HttpServletResponse;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import com.ruoyi.common.annotation.Log;
import com.ruoyi.common.core.controller.BaseController;
import com.ruoyi.common.core.domain.AjaxResult;
import com.ruoyi.common.enums.BusinessType;
import com.ruoyi.pill.domain.PillOrder;
import com.ruoyi.pill.service.IPillOrderService;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.common.core.page.TableDataInfo;

/**
 * 我的订单Controller
 * 
 * @author lsl
 * @date 2025-11-01
 */
@RestController
@RequestMapping("/pill/order")
public class PillOrderController extends BaseController
{
    @Autowired
    private IPillOrderService pillOrderService;

    /**
     * 查询我的订单列表
     */
    @PreAuthorize("@ss.hasPermi('pill:order:list')")
    @GetMapping("/list")
    public TableDataInfo list(PillOrder pillOrder)
    {
        startPage();
        List<PillOrder> list = pillOrderService.selectPillOrderList(pillOrder);
        return getDataTable(list);
    }

    /**
     * 导出我的订单列表
     */
    @PreAuthorize("@ss.hasPermi('pill:order:export')")
    @Log(title = "我的订单", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, PillOrder pillOrder)
    {
        List<PillOrder> list = pillOrderService.selectPillOrderList(pillOrder);
        ExcelUtil<PillOrder> util = new ExcelUtil<PillOrder>(PillOrder.class);
        util.exportExcel(response, list, "我的订单数据");
    }

    /**
     * 获取我的订单详细信息
     */
    @PreAuthorize("@ss.hasPermi('pill:order:query')")
    @GetMapping(value = "/{orderId}")
    public AjaxResult getInfo(@PathVariable("orderId") Long orderId)
    {
        return success(pillOrderService.selectPillOrderByOrderId(orderId));
    }

    /**
     * 新增我的订单
     */
    @PreAuthorize("@ss.hasPermi('pill:order:add')")
    @Log(title = "我的订单", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody PillOrder pillOrder)
    {
        return toAjax(pillOrderService.insertPillOrder(pillOrder));
    }

    /**
     * 修改我的订单
     */
    @PreAuthorize("@ss.hasPermi('pill:order:edit')")
    @Log(title = "我的订单", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody PillOrder pillOrder)
    {
        return toAjax(pillOrderService.updatePillOrder(pillOrder));
    }

    /**
     * 删除我的订单
     */
    @PreAuthorize("@ss.hasPermi('pill:order:remove')")
    @Log(title = "我的订单", businessType = BusinessType.DELETE)
	@DeleteMapping("/{orderIds}")
    public AjaxResult remove(@PathVariable Long[] orderIds)
    {
        return toAjax(pillOrderService.deletePillOrderByOrderIds(orderIds));
    }

    /**
     * 修改订单状态
     */
    @PreAuthorize("@ss.hasPermi('system:order:edit')")
    @Log(title = "订单管理", businessType = BusinessType.UPDATE)
    @PutMapping("/status")
    public AjaxResult updateStatus(@RequestBody Map<String, Object> params) {
        Long orderId = Long.valueOf(params.get("orderId").toString());
        String status = params.get("status").toString();
        return toAjax(pillOrderService.updateOrderStatus(orderId, status));
    }
}
