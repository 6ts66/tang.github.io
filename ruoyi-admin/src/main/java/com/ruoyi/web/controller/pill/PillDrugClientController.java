package com.ruoyi.web.controller.pill;

import java.util.List;
import javax.servlet.http.HttpServletResponse;

import com.ruoyi.pill.domain.BuyRequest;
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
import com.ruoyi.pill.domain.PillDrugClient;
import com.ruoyi.pill.service.IPillDrugClientService;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.common.core.page.TableDataInfo;

/**
 * 药品购买Controller
 * 
 * @author lsl
 * @date 2025-11-01
 */
@RestController
@RequestMapping("/pill/drugClient")
public class PillDrugClientController extends BaseController
{
    @Autowired
    private IPillDrugClientService pillDrugClientService;

    @PostMapping("/buy")
    public AjaxResult buyDrugs(@RequestBody List<BuyRequest> buyRequests) {
        try {
            // 处理购买逻辑
            pillDrugClientService.processPurchase(buyRequests);
            return AjaxResult.success("购买成功");
        } catch (Exception e) {
            return AjaxResult.error("购买失败：" + e.getMessage());
        }
    }
    /**
     * 查询药品购买列表
     */
    @PreAuthorize("@ss.hasPermi('pill:drugClient:list')")
    @GetMapping("/list")
    public TableDataInfo list(PillDrugClient pillDrugClient)
    {
        startPage();
        List<PillDrugClient> list = pillDrugClientService.selectPillDrugClientList(pillDrugClient);
        return getDataTable(list);
    }

    /**
     * 导出药品购买列表
     */
    @PreAuthorize("@ss.hasPermi('pill:drugClient:export')")
    @Log(title = "药品购买", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, PillDrugClient pillDrugClient)
    {
        List<PillDrugClient> list = pillDrugClientService.selectPillDrugClientList(pillDrugClient);
        ExcelUtil<PillDrugClient> util = new ExcelUtil<PillDrugClient>(PillDrugClient.class);
        util.exportExcel(response, list, "药品购买数据");
    }

    /**
     * 获取药品购买详细信息
     */
    @PreAuthorize("@ss.hasPermi('pill:drugClient:query')")
    @GetMapping(value = "/{drugId}")
    public AjaxResult getInfo(@PathVariable("drugId") Long drugId)
    {
        return success(pillDrugClientService.selectPillDrugClientByDrugId(drugId));
    }

    /**
     * 新增药品购买
     */
    @PreAuthorize("@ss.hasPermi('pill:drugClient:add')")
    @Log(title = "药品购买", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody PillDrugClient pillDrugClient)
    {
        return toAjax(pillDrugClientService.insertPillDrugClient(pillDrugClient));
    }

    /**
     * 修改药品购买
     */
    @PreAuthorize("@ss.hasPermi('pill:drugClient:edit')")
    @Log(title = "药品购买", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody PillDrugClient pillDrugClient)
    {
        return toAjax(pillDrugClientService.updatePillDrugClient(pillDrugClient));
    }

    /**
     * 删除药品购买
     */
    @PreAuthorize("@ss.hasPermi('pill:drugClient:remove')")
    @Log(title = "药品购买", businessType = BusinessType.DELETE)
	@DeleteMapping("/{drugIds}")
    public AjaxResult remove(@PathVariable Long[] drugIds)
    {
        return toAjax(pillDrugClientService.deletePillDrugClientByDrugIds(drugIds));
    }
}
