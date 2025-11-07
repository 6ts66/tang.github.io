// 用户信息存储工具

/**
 * 存储用户信息到sessionStorage
 */
export const setUserInfo = (userInfo) => {
  try {
    sessionStorage.setItem('userInfo', JSON.stringify(userInfo))
  } catch (error) {
    console.error('存储用户信息失败:', error)
  }
}

/**
 * 从sessionStorage获取用户信息
 */
export const getUserInfo = () => {
  try {
    const userInfo = sessionStorage.getItem('userInfo')
    return userInfo ? JSON.parse(userInfo) : null
  } catch (error) {
    console.error('获取用户信息失败:', error)
    return null
  }
}

/**
 * 清除存储的用户信息
 */
export const removeUserInfo = () => {
  try {
    sessionStorage.removeItem('userInfo')
  } catch (error) {
    console.error('清除用户信息失败:', error)
  }
}

/**
 * 检查是否有存储的用户信息
 */
export const hasUserInfo = () => {
  return !!getUserInfo()
}
