/*
 * @Description: In User Settings Edit
 * @Author: your name
 * @Date: 2019-08-27 11:32:16
 * @LastEditTime: 2019-08-27 11:34:27
 * @LastEditors: Please set LastEditors
 */

'use strict';

/**
 * @param {Egg.Application} app - egg application
 */
module.exports = app => {
  const { router, controller } = app;
  // 添加Banner
  router.post('/api/home/banner/add', app.jwt, controller.home.addBanner);
};