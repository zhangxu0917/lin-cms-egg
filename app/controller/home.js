/*
 * @Description: In User Settings Edit
 * @Author: your name
 * @Date: 2019-08-15 11:17:17
 * @LastEditTime: 2019-09-12 09:28:12
 * @LastEditors: Please set LastEditors
 */
'use strict';

const BaseController = require('./base');
const HomeRules = require('../rules/home');

class HomeController extends BaseController {

  async index() {
    const { ctx } = this;
    ctx.body = 'hi, egg';
  }

  // 添加banner
  async addBanner() {
    const { ctx, service } = this;
    const { title, sort, img_url, link } = ctx.request.body;

    // 校验规则
    const rules = HomeRules.addBanner;
    // 校验结果
    const validateResult = await ctx.validate(rules, {
      title, sort, img_url, link,
    });
    // 校验失败,返回错误信息
    if (!validateResult) return;

    // 插入到数据库
    const results = await service.home.addBanner();
    // 添加失败
    if (!results) {
      // 错误日志
      this.sendErrmsg('添加失败,请重试');
      return;
    }
    this.sendSuccess({}, '添加成功');
  }
  // 编辑banner
  async editBanner() {
    const { ctx, service } = this;
    const { id, sort, title, img_url, link } = ctx.request.body;

    const rules = HomeRules.editBanner;
    const validateResult = await ctx.validate(rules, { id, sort, title, img_url, link });
    if (!validateResult) return;

    const bannerInfo = await service.home.infoBanner(id);
    if (!bannerInfo) {
      this.sendErrmsg('ID不存在');
      return;
    }

    const results = await service.home.editBanner();
    if (!results) {
      this.sendErrmsg('修改失败,请重试');
      return;
    }

    this.sendSuccess({}, '修改成功');
  }
  // 是否显示Banner
  async editBannerShow() {
    const { ctx, service } = this;
    const { id, is_show } = ctx.request.body;

    const rules = HomeRules.isShow;
    const validateResult = await ctx.validate(rules, { id, is_show });
    if (!validateResult) return;

    const bannerInfo = await service.home.infoBanner(id);
    if (!bannerInfo) {
      this.sendErrmsg('ID不存在');
      return;
    }

    const results = await service.home.editBanner();
    if (!results) {
      this.sendErrmsg('修改失败,请重试');
      return;
    }

    this.sendSuccess({}, '修改成功');
  }
  // 删除Banner(软删除)
  async delBanner() {
    const { ctx, service } = this;
    const { id } = ctx.request.body;

    const rules = HomeRules.delBanner;
    const validateResult = await ctx.validate(rules, { id });
    if (!validateResult) return;

    const bannerInfo = await service.home.infoBanner(id);
    if (!bannerInfo) {
      this.sendErrmsg('ID不存在');
      return;
    }

    const results = await service.home.delBanner(id);
    if (!results) {
      this.sendErrmsg('删除失败,请重试');
      return;
    }

    this.sendSuccess({}, '删除成功');

  }
  // 获取Banner列表
  async listBanner() {
    const { ctx, service } = this;
    // 特别注意:GET请求的参数要在query里获取,POST的参数在body里
    // const { page } = ctx.request.body;
    const { page } = this.ctx.request.query;
    // console.log(`page: ${page}`);
    // console.log(typeof page);
    const req = {
      page: Number(page),
    };


    const rules = HomeRules.list;
    const validateResult = await ctx.validate(rules, req);
    if (!validateResult) return;

    const results = await service.home.listBanner(page);
    // 没有数据
    if (results.list.length === 0) {
      this.sendSuccess(results, '暂无数据');
      return;
    }

    this.sendSuccess(results, '列表获取成功');
  }
}

module.exports = HomeController;
