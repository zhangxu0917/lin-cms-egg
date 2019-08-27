/*
 * @Description: In User Settings Edit
 * @Author: your name
 * @Date: 2019-08-26 10:44:32
 * @LastEditTime: 2019-08-26 12:17:45
 * @LastEditors: Please set LastEditors
 */
'use strict';

const BaseRule = require('./base');
const { id, username, password, page, group_id } = BaseRule;
/* 管理员-校验规则 */
const AdminRule = {
  // 登录
  login: {
    // 用户名
    username,
    // 密码
    password,
    // 验证码
    vcode: [
      { required: true, message: '验证码不能为空' },
      {
        type: 'string',
        len: 4,
        message: '验证码长度为4位',
      },
    ],
  },
  // 获取个人信息
  info: {
    id: [
      { required: true, message: 'ID不能为空' },
    ],
  },
  // 列表
  list: {
    page,
  },
  // 添加
  add: {
    username,
    password,
    group_id,
  },
  // 编辑和删除用
  id: {
    id,
  },
};

module.exports = AdminRule;
