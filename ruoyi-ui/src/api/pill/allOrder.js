import request from '@/utils/request'

// 查询全部订单列表
export function listAllOrder(query) {
  return request({
    url: '/pill/allOrder/list',
    method: 'get',
    params: query
  })
}

// 查询全部订单详细
export function getAllOrder(orderId) {
  return request({
    url: '/pill/allOrder/' + orderId,
    method: 'get'
  })
}

// 新增全部订单
export function addAllOrder(data) {
  return request({
    url: '/pill/allOrder',
    method: 'post',
    data: data
  })
}

// 修改全部订单
export function updateAllOrder(data) {
  return request({
    url: '/pill/allOrder',
    method: 'put',
    data: data
  })
}

// 删除全部订单
export function delAllOrder(orderId) {
  return request({
    url: '/pill/allOrder/' + orderId,
    method: 'delete'
  })
}

// 更新订单状态
export function updateOrderStatus(orderId, status) {
  return request({
    url: '/pill/allOrder/status',
    method: 'put',
    data: {
      orderId: orderId,
      status: status
    }
  })
}
