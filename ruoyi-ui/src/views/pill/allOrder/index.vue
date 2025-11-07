<template>
  <div class="app-container">
    <el-form :model="queryParams" ref="queryForm" size="small" :inline="true" v-show="showSearch" label-width="68px">
      <el-form-item label="订单状态:" prop="status">
        <el-select v-model="queryParams.status" placeholder="请选择订单状态:" clearable>
          <el-option
            v-for="dict in dict.type.pill_order_status"
            :key="dict.value"
            :label="dict.label"
            :value="dict.value"
          />
        </el-select>
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
          v-hasPermi="['pill:order:export']"
        >导出</el-button>
      </el-col>
      <right-toolbar :showSearch.sync="showSearch" @queryTable="getList"></right-toolbar>
    </el-row>

    <el-table v-loading="loading" :data="orderList" @selection-change="handleSelectionChange">
      <el-table-column label="订单ID" align="center" prop="orderId" />
      <el-table-column label="药品名称" align="center" prop="drugName" width="150">
        <template slot-scope="scope">
          {{ scope.row.drugName || '未知药品' }}
        </template>
      </el-table-column>
      <el-table-column label="药品编码" align="center" prop="drugCode" />
      <el-table-column label="购买数量" align="center" prop="quantity" />
      <el-table-column label="总金额" align="center" prop="totalPrice" />
      <el-table-column label="下单时间" align="center" prop="createTime" width="180">
        <template slot-scope="scope">
          <span>{{ parseTime(scope.row.createTime, '{y}-{m}-{d}') }}</span>
        </template>
      </el-table-column>
      <el-table-column label="订单状态:" align="center" prop="status">
        <template slot-scope="scope">
          <dict-tag :options="dict.type.pill_order_status" :value="scope.row.status"/>
        </template>
      </el-table-column>
      <el-table-column label="操作" align="center" class-name="small-padding fixed-width" width="200">
        <template slot-scope="scope">
          <!-- 完成订单按钮 - 只在已支付状态显示 -->
          <el-button
            v-if="scope.row.status === 'PAID'"
            size="mini"
            type="text"
            icon="el-icon-check"
            @click="handleComplete(scope.row)"
            v-hasPermi="['pill:order:edit']"
          >完成订单</el-button>
          <!-- 取消订单按钮 - 只在已支付状态显示 -->
          <el-button
            v-if="scope.row.status === 'PAID'"
            size="mini"
            type="text"
            icon="el-icon-close"
            @click="handleCancel(scope.row)"
            v-hasPermi="['pill:order:edit']"
          >取消订单</el-button>

          <!-- 已完成或已取消的订单显示提示 -->
          <span v-if="scope.row.status === 'COMPLETED'" style="color: #67C23A;">
            <i class="el-icon-success"></i> 已完成
          </span>
          <span v-if="scope.row.status === 'CANCELLED'" style="color: #F56C6C;">
            <i class="el-icon-error"></i> 已取消
          </span>
        </template>
      </el-table-column>
    </el-table>

    <pagination
      v-show="total>0"
      :total="total"
      :page.sync="queryParams.pageNum"
      :limit.sync="queryParams.pageSize"
      @pagination="getList"
    />
  </div>
</template>

<script>
import { listAllOrder, updateOrderStatus } from "@/api/pill/allOrder";

export default {
  name: "Order",
  dicts: ['pill_order_status'],
  data() {
    return {
      // 遮罩层
      loading: true,
      // 显示搜索条件
      showSearch: true,
      // 总条数
      total: 0,
      // 我的订单表格数据
      orderList: [],
      // 查询参数
      queryParams: {
        pageNum: 1,
        pageSize: 10,
        status: null,
      }
    };
  },
  created() {
    this.getList();
  },
  methods: {
    /** 查询我的订单列表 */
    getList() {
      this.loading = true;
      listAllOrder(this.queryParams).then(response => {
        this.orderList = response.rows;
        this.total = response.total;
        this.loading = false;
      });
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

    // 多选框选中数据（保留但可能不需要了）
    handleSelectionChange(selection) {
      // 可以移除或保留，根据需求
    },

    /** 完成订单操作 */
    handleComplete(row) {
      this.$modal.confirm('确认将订单 "' + row.orderId + '" 标记为已完成？').then(() => {
        return updateOrderStatus(row.orderId, 'COMPLETED');
      }).then(() => {
        this.$modal.msgSuccess("操作成功");
        this.getList(); // 刷新列表
      }).catch(() => {});
    },

    /** 取消订单操作 */
    handleCancel(row) {
      this.$modal.confirm('确认取消订单 "' + row.orderId + '"？').then(() => {
        return updateOrderStatus(row.orderId, 'CANCELLED');
      }).then(() => {
        this.$modal.msgSuccess("操作成功");
        this.getList(); // 刷新列表
      }).catch(() => {});
    },

    /** 导出按钮操作 */
    handleExport() {
      this.download('pill/allorder/export', {
        ...this.queryParams
      }, `order_${new Date().getTime()}.xlsx`)
    }
  }
};
</script>
