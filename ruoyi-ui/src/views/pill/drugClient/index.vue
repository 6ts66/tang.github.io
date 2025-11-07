<template>
  <div class="app-container">
    <el-form :model="queryParams" ref="queryForm" size="small" :inline="true" v-show="showSearch" label-width="68px">
      <el-form-item label="药品名称" prop="drugName">
        <el-input
          v-model="queryParams.drugName"
          placeholder="请输入药品名称"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="生产厂家" prop="factoryId">
        <el-input
          v-model="queryParams.factoryId"
          placeholder="请输入生产厂家"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item>
        <el-button type="primary" icon="el-icon-search" size="mini" @click="handleQuery">搜索</el-button>
        <el-button icon="el-icon-refresh" size="mini" @click="resetQuery">重置</el-button>
      </el-form-item>
    </el-form>

    <el-row :gutter="10" class="mb8">
      <el-col :span="1.5">
        <el-button
          type="warning"
          plain
          icon="el-icon-download"
          size="mini"
          @click="handleExport"
          v-hasPermi="['pill:drugClient:export']"
        >导出</el-button>
      </el-col>
      <right-toolbar :showSearch.sync="showSearch" @queryTable="getList"></right-toolbar>
    </el-row>

    <el-table v-loading="loading" :data="drugClientList" @selection-change="handleSelectionChange">
      <el-table-column label="药品ID" align="center" prop="drugId" />
      <el-table-column label="药品名称" align="center" prop="drugName" />
      <el-table-column label="药品编码" align="center" prop="drugCode" />
      <el-table-column label="价格" align="center" prop="price" />
      <el-table-column label="库存量" align="center" prop="num" />
      <el-table-column label="操作" align="center" class-name="small-padding fixed-width">
        <template slot-scope="scope">
          <el-button
            size="mini"
            type="text"
            icon="el-icon-shopping-cart"
            @click="handleSingleBuy(scope.row)"
            :disabled="scope.row.num <= 0"
          >{{ scope.row.num > 0 ? '购买' : '缺货' }}</el-button>
        </template>
      </el-table-column>
    </el-table>

    <!-- 购买药品对话框 -->
    <el-dialog
      :title="`购买 ${currentDrug.drugName}`"
      :visible.sync="buyDialogVisible"
      width="500px"
      append-to-body
      class="purchase-dialog"
    >
      <div class="purchase-content">
        <!-- 商品标题 -->
        <div class="drug-title">{{ currentDrug.drugName }}</div>

        <!-- 购买数量区域 -->
        <div class="section">
          <div class="section-label">购买数量:</div>
          <div class="quantity-control">
            <div class="quantity-input-group">
              <button
                class="quantity-btn minus"
                @click="decreaseQuantity"
                :disabled="buyForm.quantity <= 1"
              >-</button>
              <input
                type="number"
                class="quantity-input"
                v-model.number="buyForm.quantity"
                :min="1"
                :max="currentDrug.num"
                @change="validateQuantity"
              >
              <button
                class="quantity-btn plus"
                @click="increaseQuantity"
                :disabled="buyForm.quantity >= currentDrug.num"
              >+</button>
            </div>
            <span class="stock-info">库存:{{ currentDrug.num }}件</span>
          </div>
        </div>

        <!-- 收货地址区域 -->
        <div class="section">
          <div class="section-label">收货地址:</div>
          <div class="address-control">
            <el-select
              v-model="buyForm.addressId"
              placeholder="请选择收货地址"
              class="address-select"
              @change="onAddressChange"
            >
              <el-option
                v-for="address in addressList"
                :key="address.addressId"
                :label="getAddressFullText(address)"
                :value="address.addressId"
              >
                <div class="address-option">
                  {{ getAddressFullText(address) }}
                </div>
              </el-option>
            </el-select>
            <!-- 选中的地址完整显示 -->
            <!--            <div v-if="selectedAddress" class="selected-address">
                          {{ getAddressFullText(selectedAddress) }}
                        </div>-->
          </div>
        </div>

        <!-- 金额汇总区域 -->
        <div class="section">
          <div class="section-label">金额汇总:</div>
          <div class="amount-summary">
            <div class="amount-item">
              <span>单价:</span>
              <span class="price">¥{{ currentDrug.price }}</span>
            </div>
            <div class="amount-item total">
              <span>总计:</span>
              <span class="total-amount">¥{{ totalAmount }}</span>
            </div>
          </div>
        </div>
      </div>

      <div slot="footer" class="dialog-footer">
        <el-button @click="buyDialogVisible = false" class="cancel-btn">取消</el-button>
        <el-button
          type="primary"
          @click="confirmPurchase"
          :loading="buyLoading"
          class="confirm-btn"
        >确定购买</el-button>
      </div>
    </el-dialog>
  </div>
</template>

<script>
import { listDrugClient,buyDrugs } from "@/api/pill/drugClient";
import { listAddress } from "@/api/system/address"; // 新增地址API
export default {
  name: "DrugClient",
  dicts: ['pull_drug_pt', 'pill_drug_dt', 'sys_normal_disable'],
  data() {
    return {
      // 遮罩层
      loading: true,
      // 显示搜索条件
      showSearch: true,
      // 总条数
      total: 0,
      // 药品购买表格数据
      drugClientList: [],
      drugOptions: [],
      batchBuyOpen: false,
      selectedDrugs: [],
      totalAmount: 0,
      // 弹出层标题
      title: "",
      // 是否显示弹出层
      open: false,
      // 查询参数
      queryParams: {
        pageNum: 1,
        pageSize: 10,
        drugName: null,
        factoryId: null,
      },
      // 表单参数
      form: {},
      // 表单校验
      rules: {
      },
      // 购买对话框相关数据
      buyDialogVisible: false,
      buyLoading: false,
      currentDrug: {
        drugId: null,
        drugName: '',
        num: 0,
        price: 0
      },
      buyForm: {
        quantity: 1,
        addressId: null
      },
      addressList: [],
      selectedAddress: null,
    };
  },
  created() {
    this.getList();
    this.loadUserAddresses(); // 新增：加载用户地址
  },
  watch: {
    'buyForm.quantity': {
      handler(newVal) {
        this.updateTotalAmount();
      },
      immediate: true
    },
    'buyForm.addressId': {
      handler(newVal) {
        this.selectedAddress = this.addressList.find(addr => addr.addressId === newVal);
      },
      immediate: true
    }
  },
  methods: {
    /** 加载用户地址 */
    loadUserAddresses() {
      listAddress().then(response => {
        this.addressList = response.data || [];
        if (this.addressList.length > 0) {
          const defaultAddr = this.addressList.find(addr => addr.isDefault === 1) || this.addressList[0];
          this.buyForm.addressId = defaultAddr.addressId;
          this.selectedAddress = defaultAddr;
        }
      }).catch(error => {
        console.error('加载地址失败:', error);
        this.addressList = [];
      });
    },

    /** 获取完整地址文本 */
    getAddressFullText(address) {
      if (!address) return '';
      return `${address.receiverName} ${address.receiverPhone} ${address.address}`;
    },

    /** 减少数量 */
    decreaseQuantity() {
      if (this.buyForm.quantity > 1) {
        this.buyForm.quantity--;
      }
    },

    /** 增加数量 */
    increaseQuantity() {
      if (this.buyForm.quantity < this.currentDrug.num) {
        this.buyForm.quantity++;
      }
    },

    /** 验证数量 */
    validateQuantity() {
      if (this.buyForm.quantity < 1) {
        this.buyForm.quantity = 1;
      } else if (this.buyForm.quantity > this.currentDrug.num) {
        this.buyForm.quantity = this.currentDrug.num;
        this.$message.warning(`最大可购买${this.currentDrug.num}件`);
      }
    },

    /** 更新总金额 */
    updateTotalAmount() {
      this.totalAmount = this.currentDrug.price * this.buyForm.quantity;
    },

    /** 地址变更处理 */
    onAddressChange(addressId) {
      this.selectedAddress = this.addressList.find(addr => addr.addressId === addressId);
    },

    /** 单个药品购买 */
    handleSingleBuy(row) {
      this.currentDrug = { ...row };
      this.buyForm = {
        quantity: Math.min(1, row.num),
        addressId: this.addressList[0]?.addressId || null
      };
      this.updateTotalAmount();
      this.buyDialogVisible = true;
    },

    /** 确认购买 */
    confirmPurchase() {
      if (!this.buyForm.addressId) {
        this.$message.error('请选择收货地址');
        return;
      }

      if (this.buyForm.quantity <= 0) {
        this.$message.error('购买数量必须大于0');
        return;
      }

      if (this.buyForm.quantity > this.currentDrug.num) {
        this.$message.error(`库存不足，最多可购买${this.currentDrug.num}件`);
        return;
      }

      this.buyLoading = true;
      const purchaseData = {
        drugId: this.currentDrug.drugId,
        drugName: this.currentDrug.drugName,
        quantity: this.buyForm.quantity,
        price: this.currentDrug.price,
        address: this.selectedAddress.address,
        receiverName: this.selectedAddress.receiverName,
        receiverPhone: this.selectedAddress.receiverPhone
      };

      this.submitBuy([purchaseData]);
    },

    /** 提交购买 */
    submitBuy(buyItems) {
      buyDrugs(buyItems).then(response => {
        this.$message.success('购买成功！');
        this.buyDialogVisible = false;
        this.getList(); // 刷新列表
      }).finally(() => {
        this.buyLoading = false;
      });
    },
    /** 查询药品购买列表 */
    getList() {
      this.loading = true;
      listDrugClient(this.queryParams).then(response => {
        this.drugClientList = response.rows;
        this.total = response.total;
        this.loading = false;
      });
    },
    // 取消按钮
    cancel() {
      this.open = false;
      this.reset();
    },
    // 表单重置
    reset() {
      this.form = {
        drugId: null,
        drugName: null,
        drugCode: null,
        factoryId: null,
        drugType: null,
        prescriptionType: null,
        unit: null,
        price: null,
        num: null,
        warnValue: null,
        conversion: null,
        status: null,
        createBy: null,
        createTime: null,
        updateBy: null,
        updateTime: null,
        remark: null
      };
      this.resetForm("form");
    },
    /** 搜索按钮操作 */
    handleQuery() {
      this.queryParams.pageNum = 1;
      this.getList();
    },
    /** 重置按钮操作 */
    resetQuery() {
      this.resetForm("queryForm");
      this.handleQuery();
    },
    /** 导出按钮操作 */
    handleExport() {
      this.download('pill/drugClient/export', {
        ...this.queryParams
      }, `drugClient_${new Date().getTime()}.xlsx`)
    }
  }
};
</script>
<style scoped>
.purchase-dialog .el-dialog {
  border-radius: 8px;
}

.purchase-dialog .el-dialog__header {
  border-bottom: 1px solid #f0f0f0;
  padding: 15px 20px;
}

.purchase-dialog .el-dialog__body {
  padding: 20px;
}

.purchase-content {
  padding: 0 10px;
}

.drug-title {
  font-size: 16px;
  font-weight: 600;
  color: #333;
  margin-bottom: 20px;
  text-align: center;
}

.section {
  margin-bottom: 20px;
}

.section-label {
  font-size: 14px;
  color: #666;
  margin-bottom: 8px;
  font-weight: 500;
}

/* 数量控制样式 */
.quantity-control {
  display: flex;
  align-items: center;
  justify-content: space-between;
}

.quantity-input-group {
  display: flex;
  align-items: center;
  border: 1px solid #dcdfe6;
  border-radius: 4px;
  overflow: hidden;
}

.quantity-btn {
  width: 36px;
  height: 36px;
  border: none;
  background: #f5f7fa;
  font-size: 16px;
  font-weight: bold;
  cursor: pointer;
  display: flex;
  align-items: center;
  justify-content: center;
  transition: all 0.3s;
}

.quantity-btn:hover:not(:disabled) {
  background: #e4e7ed;
}

.quantity-btn:disabled {
  background: #f5f7fa;
  color: #c0c4cc;
  cursor: not-allowed;
}

.quantity-btn.minus {
  border-right: 1px solid #dcdfe6;
}

.quantity-btn.plus {
  border-left: 1px solid #dcdfe6;
}

.quantity-input {
  width: 60px;
  height: 34px;
  border: none;
  text-align: center;
  font-size: 14px;
  outline: none;
  -moz-appearance: textfield;
}

.quantity-input::-webkit-outer-spin-button,
.quantity-input::-webkit-inner-spin-button {
  -webkit-appearance: none;
  margin: 0;
}

.stock-info {
  color: #909399;
  font-size: 13px;
  margin-left: 15px;
}

/* 地址选择样式 */
.address-control {
  display: flex;
  flex-direction: column;
  gap: 8px;
}

.address-select {
  width: 100%;
}

.address-select .el-input__inner {
  height: 36px;
}

.selected-address {
  padding: 8px 12px;
  background: #f8f9fa;
  border: 1px solid #e9ecef;
  border-radius: 4px;
  font-size: 14px;
  color: #495057;
  line-height: 1.4;
}

.address-option {
  padding: 8px 0;
  font-size: 14px;
}

/* 金额汇总样式 */
.amount-summary {
  background: #f8f9fa;
  border-radius: 4px;
  padding: 12px;
}

.amount-item {
  display: flex;
  justify-content: space-between;
  align-items: center;
  margin-bottom: 6px;
}

.amount-item.total {
  border-top: 1px solid #dee2e6;
  padding-top: 6px;
  margin-top: 6px;
  margin-bottom: 0;
}

.amount-item span:first-child {
  color: #666;
}

.price {
  color: #333;
  font-weight: 500;
}

.total-amount {
  color: #f56c6c;
  font-size: 16px;
  font-weight: 600;
}

/* 底部按钮样式 */
.dialog-footer {
  text-align: right;
  padding: 10px 20px 20px;
}

.cancel-btn {
  width: 80px;
}

.confirm-btn {
  width: 100px;
  background: #1890ff;
  border-color: #1890ff;
}

.confirm-btn:hover {
  background: #1890ff;
  border-color: #1890ff;
}
</style>
