package com.ruoyi.pill.mapper;

import java.util.List;

import com.ruoyi.pill.domain.PillDrug;
import com.ruoyi.pill.domain.PillDrugClient;

/**
 * 药品购买Mapper接口
 * 
 * @author lsl
 * @date 2025-11-01
 */
public interface PillDrugClientMapper 
{

    // 带锁查询，防止超卖
    PillDrugClient selectPillDrugClientForUpdate(Long drugId);
    /**
     * 查询药品购买
     * 
     * @param drugId 药品购买主键
     * @return 药品购买
     */
    public PillDrugClient selectPillDrugClientByDrugId(Long drugId);

    /**
     * 查询药品购买列表
     * 
     * @param pillDrugClient 药品购买
     * @return 药品购买集合
     */
    public List<PillDrugClient> selectPillDrugClientList(PillDrugClient pillDrugClient);

    /**
     * 新增药品购买
     * 
     * @param pillDrugClient 药品购买
     * @return 结果
     */
    public int insertPillDrugClient(PillDrugClient pillDrugClient);

    /**
     * 修改药品购买
     * 
     * @param pillDrugClient 药品购买
     * @return 结果
     */
    public int updatePillDrugClient(PillDrugClient pillDrugClient);

    /**
     * 删除药品购买
     * 
     * @param drugId 药品购买主键
     * @return 结果
     */
    public int deletePillDrugClientByDrugId(Long drugId);

    /**
     * 批量删除药品购买
     * 
     * @param drugIds 需要删除的数据主键集合
     * @return 结果
     */
    public int deletePillDrugClientByDrugIds(Long[] drugIds);
}
