import request from '@/utils/request'

// 查询地址列表
export function listAddress() {
  return request({
    url: '/system/address/list',
    method: 'get'
  })
}

// 新增地址
export function addAddress(data) {
  return request({
    url: '/system/address',
    method: 'post',
    data: data
  })
}

// 修改地址
export function updateAddress(data) {
  return request({
    url: '/system/address',
    method: 'put',
    data: data
  })
}

// 删除地址
export function deleteAddress(addressId) {
  return request({
    url: '/system/address/' + addressId,
    method: 'delete'
  })
}

// 设置默认地址
export function setDefaultAddress(addressId) {
  return request({
    url: '/system/address/default/' + addressId,
    method: 'put'
  })
}
