import request from '@/utils/request'

// 购买药品
export function buyDrugs(buyItems) {
  return request({
    url: '/pill/drugClient/buy',
    method: 'post',
    data: buyItems
  })
}

// 查询药品购买列表
export function listDrugClient(query) {
  return request({
    url: '/pill/drugClient/list',
    method: 'get',
    params: query
  })
}

