/*
 * @Description: In User Settings Edit
 * @Author: your name
 * @Date: 2019-08-26 10:44:32
 * @LastEditTime: 2019-08-28 20:10:12
 * @LastEditors: Please set LastEditors
 */
'use strict';

/* 基础的校验规则 */
const BaseRule = {
  id: [
    { required: true, message: 'ID不能为空' },
    { type: 'number', message: 'ID类型为数字' },
  ],
  username: [
    { required: true, message: '用户名不能为空' },
    { type: 'string', message: '用户名必须是字符串' },
  ],
  password: [
    { required: true, message: '密码不能为空' },
    { type: 'string', message: '密码类型为字符串' },
    {
      type: 'string',
      min: 6,
      max: 20,
      message: '密码长度为6-20位',
    },
  ],
  page: [
    { required: true, message: 'page不能为空' },
    { type: 'number', message: 'page类型为数字' },
  ],
  // 管理员-分组id
  group_id: [{ required: true, message: '分组不能为空' }],
  // 序号
  sort: [
    { required: true, message: '序号不能为空' },
    { type: 'number', message: '序号类型为数字' },
  ],
  img_url: [
    { required: true, message: '图片地址不能为空' },
    { type: 'url', message: '图片地址为url标准地址' },
  ],
  is_show: [
    { required: true, message: '是否显示:不能为空' },
    { type: 'enum', enum: [ 0, 1 ], message: '是否显示:参数错误' },
  ],
  // 文章标题
  title: [
    { required: true, message: '标题不能为空' },
    { type: 'string', min: 4, max: 30, message: '标题为4-30个字符' },
  ],
  // 文章-作者
  author: [
    { required: true, message: '作者不能为空' },
    { type: 'string', min: 2, max: 10, message: '作者为4-10个字符' },
  ],
  // 文章-封面
  cover: [
    { required: true, message: '封面图片不能为空' },
    { type: 'url', message: '封面图片为url标准地址' },
  ],
  // 文章-链接地址
  url: [
    { required: true, message: '链接地址不能为空' },
    { type: 'url', message: '链接地址错误' },
  ],
  // 文章-内容
  content: [
    { required: true, message: '内容不能为空' },
    { type: 'string', min: 20, message: '内容最少20个字符' },
  ],
  // 文章-状态
  status: [
    { required: true, message: '状态不能为空' },
    { type: 'enum', enum: [ 0, 1 ], message: '状态参数错误' },
  ],
};

module.exports = BaseRule;

