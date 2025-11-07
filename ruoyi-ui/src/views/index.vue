<template>
  <div class="app-container home">
    <!-- 系统标题区域 - 根据用户角色显示不同标题 -->
    <div class="system-header" :class="{'user-header': !isAdmin}">
      <h1 class="system-title">{{ isAdmin ? '若依药品进销存管理系统' : '若依药品商城' }}</h1>
      <p class="system-subtitle">{{ isAdmin ? '智能药品管理 · 高效进销存 · 安全可控' : '精选药品 · 安心购买 · 快速配送' }}</p>
    </div>

    <!-- 数据统计卡片 - 管理员显示完整统计，用户只显示部分 -->
    <el-row :gutter="20" class="stats-cards" v-if="isAdmin">
      <el-col :span="6">
        <el-card class="stats-card drug-stats" shadow="hover">
          <div class="stats-content">
            <div class="stats-icon">
              <i class="el-icon-first-aid-kit"></i>
            </div>
            <div class="stats-info">
              <div class="stats-number">{{ drugStats.totalDrugs || 0 }}</div>
              <div class="stats-label">药品总数</div>
            </div>
          </div>
        </el-card>
      </el-col>

      <el-col :span="6">
        <el-card class="stats-card order-stats" shadow="hover">
          <div class="stats-content">
            <div class="stats-icon">
              <i class="el-icon-shopping-cart"></i>
            </div>
            <div class="stats-info">
              <div class="stats-number">{{ drugStats.todayOrders || 0 }}</div>
              <div class="stats-label">今日订单</div>
            </div>
          </div>
        </el-card>
      </el-col>

      <el-col :span="6">
        <el-card class="stats-card inventory-stats" shadow="hover">
          <div class="stats-content">
            <div class="stats-icon">
              <i class="el-icon-warning-outline"></i>
            </div>
            <div class="stats-info">
              <div class="stats-number">{{ drugStats.lowInventory || 0 }}</div>
              <div class="stats-label">库存预警</div>
            </div>
          </div>
        </el-card>
      </el-col>

      <el-col :span="6">
        <el-card class="stats-card factory-stats" shadow="hover">
          <div class="stats-content">
            <div class="stats-icon">
              <i class="el-icon-office-building"></i>
            </div>
            <div class="stats-info">
              <div class="stats-number">{{ drugStats.totalFactories || 0 }}</div>
              <div class="stats-label">合作厂家</div>
            </div>
          </div>
        </el-card>
      </el-col>
    </el-row>

    <!-- 用户端简化的统计卡片 -->
    <el-row :gutter="20" class="stats-cards" v-else>
      <el-col :span="12">
        <el-card class="stats-card drug-stats" shadow="hover">
          <div class="stats-content">
            <div class="stats-icon">
              <i class="el-icon-first-aid-kit"></i>
            </div>
            <div class="stats-info">
              <div class="stats-number">{{ drugStats.availableDrugs || 0 }}</div>
              <div class="stats-label">可购药品</div>
            </div>
          </div>
        </el-card>
      </el-col>

      <el-col :span="12">
        <el-card class="stats-card order-stats" shadow="hover">
          <div class="stats-content">
            <div class="stats-icon">
              <i class="el-icon-tickets"></i>
            </div>
            <div class="stats-info">
              <div class="stats-number">{{ drugStats.myTotalOrders || 0 }}</div>
              <div class="stats-label">我的订单</div>
            </div>
          </div>
        </el-card>
      </el-col>
    </el-row>




    <!-- 管理员数据区域 -->
    <template v-if="isAdmin">
      <el-row :gutter="20" class="data-section">
        <el-col :span="24">
          <el-card class="data-card" shadow="never">
            <template #header>
              <div class="card-header">
                <span>全部订单</span>
                <el-button type="text" @click="handleViewAllOrders">查看全部</el-button>
              </div>
            </template>

            <!-- 最简单的固定高度容器 -->
            <div class="scroll-container">
              <div v-if="recentAllOrders.length > 0">
                <div v-for="order in recentAllOrders" :key="order.orderId" class="order-item">
                  <div class="order-info">
                    <span class="order-drug">{{ order.drugName }}</span>
                    <span class="order-quantity">x{{ order.quantity }}</span>
                  </div>
                  <div class="order-meta">
                    <span class="order-time">{{ formatTime(order.createTime) }}</span>
                    <span class="order-amount">¥{{ order.totalPrice }}</span>
                  </div>
                </div>
              </div>
              <div v-else class="empty-data">
                <i class="el-icon-document"></i>
                <p>暂无订单数据</p>
              </div>
            </div>
          </el-card>
        </el-col>
      </el-row>
    </template>

    <!-- 用户端数据区域 -->
    <template v-else>
      <el-row :gutter="20" class="data-section">
        <el-col :span="24">
          <el-card class="data-card" shadow="never">
            <template #header>
              <div class="card-header">
                <span>最近订单</span>
                <el-button type="text" @click="handleMyOrders">查看全部</el-button>
              </div>
            </template>
            <div v-if="userRecentOrders.length > 0">
              <div v-for="order in userRecentOrders" :key="order.orderId" class="order-item">
                <div class="order-info">
                  <span class="order-drug">{{ order.drugName }}</span>
                  <span class="order-quantity">x{{ order.quantity }}</span>
                </div>
                <div class="order-meta">
                  <span class="order-time">{{ formatTime(order.createTime) }}</span>
                  <span class="order-amount">¥{{ order.totalPrice }}</span>
                </div>
              </div>
            </div>
            <div v-else class="empty-data">
              <i class="el-icon-document"></i>
              <p>暂无订单记录</p>
            </div>
          </el-card>
        </el-col>
      </el-row>
    </template>

    <!-- 系统信息 - 管理员显示完整信息，用户显示简化信息 -->
    <el-row :gutter="20" class="system-info">
      <el-col :span="24">
        <el-card shadow="never">
          <template #header>
            <div class="card-header">
              <span>{{ isAdmin ? '系统信息' : '账户信息' }}</span>
            </div>
          </template>
          <div class="info-content">
            <p v-if="isAdmin">系统版本：v{{ version }}</p>
            <p v-if="!isAdmin">登录用户：{{ '用户' }}</p>
            <p>登录时间：{{ loginTime }}</p>
            <p>{{ isAdmin ? '欢迎使用若依药品进销存管理系统！' : '欢迎使用若依药品商城！' }}</p>
          </div>
        </el-card>
      </el-col>
    </el-row>
  </div>
</template>

<script>
import { getDashboardStats, getRecentOrders,getAllOrders, } from '@/api/dashboard'
export default {
  name: "Index",
  data() {
    return {
      version: "3.8.5",
      isAdmin: false, // 用户角色标识
      userInfo: {},   // 用户信息

      // 管理员数据
      drugStats: {
        totalDrugs: 0,
        todayOrders: 0,
        lowInventory: 0,
        totalFactories: 0,
        availableDrugs: 0,
        myTotalOrders: 0
      },
      recentOrders: [],
      recentAllOrders: [],
      // warningDrugs: [],

      // 用户数据
      userOrderStats: {
        todayOrders: 0,
      },
      userRecentOrders: [],
      hotDrugs: [],

      loginTime: new Date().toLocaleString()
    };
  },
  created() {
    this.checkUserRole();
    this.loadDashboardData();
  },
  methods: {
    /** 检查用户角色 */
    checkUserRole() {
      // 从Vuex或本地存储获取用户信息
      const userInfo = this.$store.getters.userInfo || JSON.parse(localStorage.getItem('userInfo') || '{}');
      this.userInfo = userInfo;

      // 判断是否为管理员
      const roles = userInfo.roles || [];
      this.isAdmin = roles.includes('admin') || roles.includes('管理员');
      console.log('用户角色：', roles)
    },

    /** 从数据库加载首页数据 */
    async loadDashboardData() {
      try {
        if (this.isAdmin) {
          // 管理员加载全局数据
          const [statsResponse, ordersResponse,allOrdersResponse] = await Promise.all([
            getDashboardStats(),
            getRecentOrders(),
            getAllOrders(),
          ]);

          if (statsResponse.code === 200) {
            this.drugStats = statsResponse.data;
          }
          if (ordersResponse.code === 200) {
            this.recentOrders = ordersResponse.data;
          }if (allOrdersResponse.code === 200) {
            this.recentAllOrders = allOrdersResponse.data;
          }
        } else {
          // 用户加载个人数据
          const [statsResponse,ordersResponse] = await Promise.all([
            getDashboardStats(),
            getRecentOrders(),
          ]);
          if (statsResponse.code === 200) {
            this.drugStats = statsResponse.data;
          }
          if (ordersResponse.code === 200) {
            this.userRecentOrders = ordersResponse.data;
          }
        }
      } catch (error) {
        console.error('加载首页数据失败:', error);
        this.$message.error('数据加载失败，请刷新页面重试');
      }
    },

    /** 格式化时间显示 */
    formatTime(time) {
      if (!time) return '';
      const date = new Date(time);
      return `${date.getFullYear()}-${(date.getMonth() + 1).toString().padStart(2, '0')}-${date.getDate().toString().padStart(2, '0')} ${date.getHours().toString().padStart(2, '0')}:${date.getMinutes().toString().padStart(2, '0')}`;
    },


  }
};
</script>

<style scoped lang="scss">
.home {
  padding: 20px;

  .system-header {
    text-align: center;
    margin-bottom: 30px;
    padding: 30px;
    background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
    border-radius: 10px;
    color: white;
    box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1);

    &.user-header {
      background: linear-gradient(135deg, #ff6b6b 0%, #feca57 100%);
    }
  }

  .system-title {
    font-size: 32px;
    margin-bottom: 10px;
    font-weight: bold;
  }

  .system-subtitle {
    font-size: 16px;
    opacity: 0.9;
  }

  .stats-cards {
    margin-bottom: 20px;

    .stats-card {
      border-radius: 10px;
      border: none;
      transition: all 0.3s ease;

      &:hover {
        transform: translateY(-5px);
      }
    }

    .stats-content {
      display: flex;
      align-items: center;
      padding: 15px;
    }

    .stats-icon {
      font-size: 40px;
      margin-right: 15px;
      opacity: 0.8;
    }

    .stats-info {
      flex: 1;
    }

    .stats-number {
      font-size: 28px;
      font-weight: bold;
      margin-bottom: 5px;
    }

    .stats-label {
      font-size: 14px;
      color: #666;
    }

    .drug-stats .stats-icon { color: #67C23A; }
    .order-stats .stats-icon { color: #E6A23C; }
    .inventory-stats .stats-icon { color: #F56C6C; }
    .factory-stats .stats-icon { color: #409EFF; }
    .user-stats .stats-icon { color: #FF6B6B; }
  }

  .quick-actions {
    margin-bottom: 20px;

    .quick-card {
      border-radius: 10px;
    }

    .card-header {
      display: flex;
      justify-content: space-between;
      align-items: center;
      font-weight: bold;
      font-size: 16px;
    }

    .quick-buttons {
      text-align: center;

      .el-button {
        margin: 0 10px;
        padding: 12px 24px;
        font-size: 14px;
      }
    }
  }

  .data-section {
    margin-bottom: 20px;

    .data-card {
      border-radius: 10px;
      height: 300px;
    }

    .card-header {
      display: flex;
      justify-content: space-between;
      align-items: center;
      font-weight: bold;
    }

    .order-item, .warning-item, .drug-item {
      padding: 12px 0;
      border-bottom: 1px solid #f0f0f0;

      &:last-child {
        border-bottom: none;
      }
    }

    .order-info, .warning-info, .drug-info {
      display: flex;
      justify-content: space-between;
      align-items: center;
      margin-bottom: 5px;
    }

    .order-drug, .warning-drug, .drug-name {
      font-weight: 500;
    }

    .order-quantity {
      color: #666;
    }

    .order-meta, .drug-meta {
      display: flex;
      justify-content: space-between;
      font-size: 12px;
      color: #999;
    }

    .warning-desc {
      font-size: 12px;
      color: #f56c6c;
    }

    .empty-data {
      text-align: center;
      color: #999;
      padding: 60px 0;

      i {
        font-size: 40px;
        margin-bottom: 10px;
      }

      p {
        margin: 0;
      }
    }
  }

  .system-info {
    .info-content {
      p {
        margin: 8px 0;
        color: #666;
      }
    }
  }
}

/* 最简单的滚动条样式 */
.scroll-container {
  max-height: 200px;    /* 固定高度 */
  overflow-y: auto;     /* 垂直滚动条 */
  padding: 0 10px;      /* 内边距 */
}


.order-item:last-child {
  border-bottom: none;
}

</style>
