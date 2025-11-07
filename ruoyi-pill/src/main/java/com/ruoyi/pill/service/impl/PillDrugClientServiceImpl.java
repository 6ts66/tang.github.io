package com.ruoyi.pill.service.impl;

import java.math.BigDecimal;
import java.util.Date;
import java.util.List;

import com.ruoyi.common.core.domain.entity.SysUser;
import com.ruoyi.common.utils.DateUtils;
import com.ruoyi.common.utils.SecurityUtils;
import com.ruoyi.pill.domain.BuyRequest;
import com.ruoyi.pill.domain.PillDrug;
import com.ruoyi.pill.domain.PillOrder;
import com.ruoyi.pill.mapper.PillDrugMapper;
import com.ruoyi.pill.mapper.PillOrderMapper;
import com.ruoyi.system.mapper.SysUserMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.pill.mapper.PillDrugClientMapper;
import com.ruoyi.pill.domain.PillDrugClient;
import com.ruoyi.pill.service.IPillDrugClientService;
import org.springframework.transaction.annotation.Transactional;

/**
 * 药品购买Service业务层处理
 *
 * @author lsl
 * @date 2025-11-01
 */
@Service
public class PillDrugClientServiceImpl implements IPillDrugClientService
{
    @Autowired
    private PillDrugClientMapper pillDrugClientMapper;

    @Autowired
    private PillOrderMapper pillOrderMapper;

    @Autowired

    private SysUserMapper sysUserMapper;

    /**
     * 处理购买请求（包含余额检查）
     */
    @Transactional(rollbackFor = Exception.class)
    public void processPurchase(List<BuyRequest> buyRequests) {
        Long userId = SecurityUtils.getUserId();

        // 1. 查询用户余额（加锁）
        SysUser user = sysUserMapper.selectUserForUpdate(userId);
        if (user == null) {
            throw new RuntimeException("用户不存在");
        }

        // 2. 计算总金额
        BigDecimal totalAmount = calculateTotalAmount(buyRequests);

        // 3. 检查余额是否足够
        if (user.getBalance().compareTo(totalAmount) < 0) {
            throw new RuntimeException("余额不足，当前余额：¥" +
                    user.getBalance() + "，需要：¥" + totalAmount);
        }

        // 4. 处理每个购买请求
        for (BuyRequest request : buyRequests) {
            processSinglePurchase(request, userId);
        }

        // 5. 扣除用户余额
        user.setBalance(user.getBalance().subtract(totalAmount));
        sysUserMapper.updateUser(user);
    }

    /**
     * 计算购买总金额
     */
    private BigDecimal calculateTotalAmount(List<BuyRequest> buyRequests) {
        BigDecimal total = BigDecimal.ZERO;
        for (BuyRequest request : buyRequests) {
            // 验证价格有效性
            if (request.getPrice() == null || request.getPrice().compareTo(BigDecimal.ZERO) <= 0) {
                throw new RuntimeException("药品价格无效：" + request.getDrugName());
            }
            if (request.getQuantity() <= 0) {
                throw new RuntimeException("购买数量必须大于0");
            }

            BigDecimal itemTotal = request.getPrice().multiply(
                    new BigDecimal(request.getQuantity()));
            total = total.add(itemTotal);
        }
        return total;
    }

    /**
     * 处理单个药品购买
     */
    private void processSinglePurchase(BuyRequest request, Long userId) {
        // 1. 检查库存（加锁）
        PillDrugClient drug = pillDrugClientMapper.selectPillDrugClientForUpdate(request.getDrugId());
        if (drug == null) {
            throw new RuntimeException("药品不存在：" + request.getDrugName());
        }
        if (drug.getNum() < request.getQuantity()) {
            throw new RuntimeException("库存不足：" + request.getDrugName() +
                    "，当前库存：" + drug.getNum());
        }

        // 2. 减少库存
        drug.setNum(drug.getNum() - request.getQuantity());
        pillDrugClientMapper.updatePillDrugClient(drug);

        // 3. 创建订单记录
        PillOrder order = new PillOrder();
        order.setDrugId(request.getDrugId());
        order.setUserId(userId);
        order.setQuantity(request.getQuantity());
        order.setTotalPrice(request.getPrice().multiply(new BigDecimal(request.getQuantity())));
        order.setCreateTime(new Date());
        pillOrderMapper.insertPillOrder(order);
    }

    /**
     * 预检查余额（前端调用）
     */
    public boolean checkBalanceSufficient(BigDecimal requiredAmount) {
        Long userId = SecurityUtils.getUserId();
        SysUser user = sysUserMapper.selectUserById(userId);
        if (user == null || user.getBalance() == null) {
            return false;
        }
        return user.getBalance().compareTo(requiredAmount) >= 0;
    }

    /**
     * 获取用户余额
     */
    public BigDecimal getUserBalance() {
        Long userId = SecurityUtils.getUserId();
        SysUser user = sysUserMapper.selectUserById(userId);
        return user != null ? user.getBalance() : BigDecimal.ZERO;
    }
/**
     * 查询药品购买
     *
     * @param drugId 药品购买主键
     * @return 药品购买
     */
    @Override
    public PillDrugClient selectPillDrugClientByDrugId(Long drugId)
    {
        return pillDrugClientMapper.selectPillDrugClientByDrugId(drugId);
    }

    /**
     * 查询药品购买列表
     *
     * @param pillDrugClient 药品购买
     * @return 药品购买
     */
    @Override
    public List<PillDrugClient> selectPillDrugClientList(PillDrugClient pillDrugClient)
    {
        return pillDrugClientMapper.selectPillDrugClientList(pillDrugClient);
    }

    /**
     * 新增药品购买
     *
     * @param pillDrugClient 药品购买
     * @return 结果
     */
    @Override
    public int insertPillDrugClient(PillDrugClient pillDrugClient)
    {
        pillDrugClient.setCreateTime(DateUtils.getNowDate());
        return pillDrugClientMapper.insertPillDrugClient(pillDrugClient);
    }

    /**
     * 修改药品购买
     *
     * @param pillDrugClient 药品购买
     * @return 结果
     */
    @Override
    public int updatePillDrugClient(PillDrugClient pillDrugClient)
    {
        pillDrugClient.setUpdateTime(DateUtils.getNowDate());
        return pillDrugClientMapper.updatePillDrugClient(pillDrugClient);
    }

    /**
     * 批量删除药品购买
     *
     * @param drugIds 需要删除的药品购买主键
     * @return 结果
     */
    @Override
    public int deletePillDrugClientByDrugIds(Long[] drugIds)
    {
        return pillDrugClientMapper.deletePillDrugClientByDrugIds(drugIds);
    }

    /**
     * 删除药品购买信息
     *
     * @param drugId 药品购买主键
     * @return 结果
     */
    @Override
    public int deletePillDrugClientByDrugId(Long drugId)
    {
        return pillDrugClientMapper.deletePillDrugClientByDrugId(drugId);
    }
}
