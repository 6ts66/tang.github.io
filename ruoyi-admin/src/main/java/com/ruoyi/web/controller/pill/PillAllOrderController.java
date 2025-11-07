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
import com.ruoyi.pill.domain.PillAllOrder;
import com.ruoyi.pill.service.IPillAllOrderService;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.common.core.page.TableDataInfo;

/**
 * 全部订单Controller
 * 
 * @author lsl
 * @date 2025-11-02
 */
@RestController
@RequestMapping("/pill/allOrder")
public class PillAllOrderController extends BaseController
{
    @Autowired
    private IPillAllOrderService pillAllOrderService;

    /**
     * 查询全部订单列表
     */
    @PreAuthorize("@ss.hasPermi('pill:allOrder:list')")
    @GetMapping("/list")
    public TableDataInfo list(PillAllOrder pillAllOrder)
    {
        startPage();
        List<PillAllOrder> list = pillAllOrderService.selectPillAllOrderList(pillAllOrder);
        return getDataTable(list);
    }

    /**
     * 导出全部订单列表
     */
    @PreAuthorize("@ss.hasPermi('pill:allOrder:export')")
    @Log(title = "全部订单", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, PillAllOrder pillAllOrder)
    {
        List<PillAllOrder> list = pillAllOrderService.selectPillAllOrderList(pillAllOrder);
        ExcelUtil<PillAllOrder> util = new ExcelUtil<PillAllOrder>(PillAllOrder.class);
        util.exportExcel(response, list, "全部订单数据");
    }

    /**
     * 获取全部订单详细信息
     */
    @PreAuthorize("@ss.hasPermi('pill:allOrder:query')")
    @GetMapping(value = "/{orderId}")
    public AjaxResult getInfo(@PathVariable("orderId") Long orderId)
    {
        return success(pillAllOrderService.selectPillAllOrderByOrderId(orderId));
    }

    /**
     * 新增全部订单
     */
    @PreAuthorize("@ss.hasPermi('pill:allOrder:add')")
    @Log(title = "全部订单", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody PillAllOrder pillAllOrder)
    {
        return toAjax(pillAllOrderService.insertPillAllOrder(pillAllOrder));
    }

    /**
     * 修改全部订单
     */
    @PreAuthorize("@ss.hasPermi('pill:allOrder:edit')")
    @Log(title = "全部订单", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody PillAllOrder pillAllOrder)
    {
        return toAjax(pillAllOrderService.updatePillAllOrder(pillAllOrder));
    }

    /**
     * 删除全部订单
     */
    @PreAuthorize("@ss.hasPermi('pill:allOrder:remove')")
    @Log(title = "全部订单", businessType = BusinessType.DELETE)
	@DeleteMapping("/{orderIds}")
    public AjaxResult remove(@PathVariable Long[] orderIds)
    {
        return toAjax(pillAllOrderService.deletePillAllOrderByOrderIds(orderIds));
    }

    /**
     * 修改订单状态
     */
    @PreAuthorize("@ss.hasPermi('system:allOrder:edit')")
    @Log(title = "订单管理", businessType = BusinessType.UPDATE)
    @PutMapping("/status")
    public AjaxResult updateStatus(@RequestBody Map<String, Object> params) {
        Long orderId = Long.valueOf(params.get("orderId").toString());
        String status = params.get("status").toString();
        return toAjax(pillAllOrderService.updateOrderStatus(orderId, status));
    }

}
