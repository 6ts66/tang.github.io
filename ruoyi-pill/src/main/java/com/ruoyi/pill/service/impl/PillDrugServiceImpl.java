package com.ruoyi.pill.service.impl;

import java.util.List;
import com.ruoyi.common.utils.DateUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.pill.mapper.PillDrugMapper;
import com.ruoyi.pill.domain.PillDrug;
import com.ruoyi.pill.service.IPillDrugService;

/**
 * 药品信息Service业务层处理
 * 
 * @author lsl
 * @date 2023-04-10
 */
@Service
public class PillDrugServiceImpl implements IPillDrugService 
{
    @Autowired
    private PillDrugMapper pillDrugMapper;

    /**
     * 查询药品信息
     * 
     * @param drugId 药品信息主键
     * @return 药品信息
     */
    @Override
    public PillDrug selectPillDrugByDrugId(Long drugId)
    {
        return pillDrugMapper.selectPillDrugByDrugId(drugId);
    }

    /**
     * 查询药品信息列表
     * 
     * @param pillDrug 药品信息
     * @return 药品信息
     */
    @Override
    public List<PillDrug> selectPillDrugList(PillDrug pillDrug)
    {
        // 1. 执行查询（这里已经包含了关联的厂家数据）
        List<PillDrug> drugList = pillDrugMapper.selectPillDrugList(pillDrug);

        // 2. 处理导出字段：为每个药品设置厂家名称和编码
        for (PillDrug drug : drugList) {
            if (drug.getPillFactory() != null) {
                // 设置导出字段的值
                drug.setFactoryName(drug.getPillFactory().getFactoryName());
                drug.setFactoryCode(drug.getPillFactory().getFactoryCode());
            } else {
                // 如果没有关联厂家，设置空字符串避免null
                drug.setFactoryName("");
                drug.setFactoryCode("");
            }
        }

        // 3. 返回处理后的列表
        return drugList;
//        return pillDrugMapper.selectPillDrugList(pillDrug);
    }

    /**
     * 新增药品信息
     * 
     * @param pillDrug 药品信息
     * @return 结果
     */
    @Override
    public int insertPillDrug(PillDrug pillDrug)
    {
        pillDrug.setCreateTime(DateUtils.getNowDate());
        return pillDrugMapper.insertPillDrug(pillDrug);
    }

    /**
     * 修改药品信息
     * 
     * @param pillDrug 药品信息
     * @return 结果
     */
    @Override
    public int updatePillDrug(PillDrug pillDrug)
    {
        pillDrug.setUpdateTime(DateUtils.getNowDate());
        return pillDrugMapper.updatePillDrug(pillDrug);
    }

    /**
     * 批量删除药品信息
     * 
     * @param drugIds 需要删除的药品信息主键
     * @return 结果
     */
    @Override
    public int deletePillDrugByDrugIds(Long[] drugIds)
    {
        return pillDrugMapper.deletePillDrugByDrugIds(drugIds);
    }

    /**
     * 删除药品信息信息
     * 
     * @param drugId 药品信息主键
     * @return 结果
     */
    @Override
    public int deletePillDrugByDrugId(Long drugId)
    {
        return pillDrugMapper.deletePillDrugByDrugId(drugId);
    }
}
