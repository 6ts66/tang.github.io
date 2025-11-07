<template>
  <div class="address-manager">
    <el-button type="primary" @click="showAddDialog" style="margin-bottom: 15px;">
      <i class="el-icon-plus"></i> 添加新地址
    </el-button>

    <el-table :data="addressList" border style="width: 100%">
      <el-table-column prop="receiverName" label="收货人" width="120"></el-table-column>
      <el-table-column prop="receiverPhone" label="联系电话" width="150"></el-table-column>
      <el-table-column prop="address" label="详细地址"></el-table-column>
<!--      <el-table-column label="默认地址" width="120">
        <template slot-scope="scope">
          <el-tag v-if="scope.row.isDefault" type="success">默认</el-tag>
          <el-button
            v-else
            type="text"
            size="mini"
            @click="setDefault(scope.row.addressId)"
          >设为默认</el-button>
        </template>
      </el-table-column>-->
      <el-table-column label="操作" width="180">
        <template slot-scope="scope">
          <el-button
            size="mini"
            @click="handleEdit(scope.row)"
          >编辑</el-button>
          <el-button
            size="mini"
            type="danger"
            @click="handleDelete(scope.row.addressId)"
          >删除</el-button>
        </template>
      </el-table-column>
    </el-table>

    <!-- 添加/编辑地址对话框 -->
    <el-dialog :title="dialogTitle" :visible.sync="dialogVisible" width="50%">
      <el-form :model="addressForm" :rules="rules" ref="addressForm" label-width="100px">
        <el-form-item label="收货人" prop="receiverName">
          <el-input v-model="addressForm.receiverName"></el-input>
        </el-form-item>
        <el-form-item label="联系电话" prop="receiverPhone">
          <el-input v-model="addressForm.receiverPhone"></el-input>
        </el-form-item>
        <el-form-item label="详细地址" prop="address">
          <el-input type="textarea" v-model="addressForm.address" :rows="3"></el-input>
        </el-form-item>
<!--        <el-form-item label="设为默认">
          <el-switch v-model="addressForm.isDefault"></el-switch>
        </el-form-item>-->
      </el-form>
      <div slot="footer" class="dialog-footer">
        <el-button @click="dialogVisible = false">取 消</el-button>
        <el-button type="primary" @click="submitForm">确 定</el-button>
      </div>
    </el-dialog>
  </div>
</template>

<script>
import { listAddress, addAddress, updateAddress, deleteAddress, setDefaultAddress } from "@/api/system/address";

export default {
  name: "AddressManager",
  data() {
    return {
      addressList: [],
      dialogVisible: false,
      dialogTitle: "添加地址",
      addressForm: {
        addressId: null,
        receiverName: "",
        receiverPhone: "",
        address: "",
        isDefault: false
      },
      rules: {
        receiverName: [
          { required: true, message: "请输入收货人姓名", trigger: "blur" }
        ],
        receiverPhone: [
          { required: true, message: "请输入联系电话", trigger: "blur" },
          { pattern: /^1[3-9]\d{9}$/, message: "请输入正确的手机号码", trigger: "blur" }
        ],
        address: [
          { required: true, message: "请输入详细地址", trigger: "blur" }
        ]
      }
    };
  },
  created() {
    this.loadAddressList();
  },
  methods: {
    loadAddressList() {
      listAddress().then(response => {
        this.addressList = response.data;
      });
    },
    showAddDialog() {
      this.dialogTitle = "添加地址";
      this.addressForm = {
        addressId: null,
        receiverName: "",
        receiverPhone: "",
        address: "",
        isDefault: false
      };
      this.dialogVisible = true;
      this.$nextTick(() => {
        this.$refs.addressForm.clearValidate();
      });
    },
    handleEdit(row) {
      this.dialogTitle = "编辑地址";
      this.addressForm = {
        addressId: row.addressId,
        receiverName: row.receiverName,
        receiverPhone: row.receiverPhone,
        address: row.address,
        isDefault: row.isDefault === 1
      };
      this.dialogVisible = true;
    },
    handleDelete(addressId) {
      this.$confirm("确认删除该地址?", "提示", {
        confirmButtonText: "确定",
        cancelButtonText: "取消",
        type: "warning"
      }).then(() => {
        deleteAddress(addressId).then(() => {
          this.$message.success("删除成功");
          this.loadAddressList();
        });
      });
    },
    /*setDefault(addressId) {
      setDefaultAddress(addressId).then(() => {
        // 前端更新地址列表，确保只有一个默认地址
        this.addressList = this.addressList.map(item => {
          return {
            ...item,
            isDefault: item.addressId === addressId ? 1 : 0
          };
        });
        this.$message.success("设置默认地址成功");
      }).catch(error => {
        this.$message.error("设置默认地址失败");
      });
    },*/
    submitForm() {
      this.$refs.addressForm.validate(valid => {
        if (valid) {
          const formData = {
            ...this.addressForm,
            isDefault: this.addressForm.isDefault ? 1 : 0
          };

          const promise = formData.addressId
            ? updateAddress(formData)
            : addAddress(formData);

          promise.then(() => {
            // 如果设置为默认地址，前端更新其他地址状态
            if (formData.isDefault) {
              this.addressList = this.addressList.map(item => {
                return {
                  ...item,
                  isDefault: item.addressId === formData.addressId ? 1 : 0
                };
              });
            }

            this.$message.success(this.dialogTitle + "成功");
            this.dialogVisible = false;
            this.loadAddressList(); // 仍然重新加载确保数据一致性
          });
        }
      });
    }
  }
};
</script>

<style scoped>
.address-manager {
  padding: 20px;
}
</style>
