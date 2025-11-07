// src/api/dashboard.js
import request from '@/utils/request'

// 获取仪表盘统计信息
export function getDashboardStats() {
  return request({
    url: '/pill/dashboard/stats',
    method: 'get'
  })
}

// 获取最近订单
export function getRecentOrders() {
  return request({
    url: '/pill/dashboard/recentOrders',
    method: 'get'
  })
}
// 获取全部订单
export function getAllOrders() {
  return request({
    url: '/pill/dashboard/allOrders',
    method: 'get'
  })
}

// 获取库存预警药品
export function getWarningDrugs() {
  return request({
    url: '/pill/dashboard/warningDrugs',
    method: 'get'
  })
}

