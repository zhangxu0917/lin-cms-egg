/*
 * @Description: In User Settings Edit
 * @Author: your name
 * @Date: 2019-08-30 09:53:35
 * @LastEditTime: 2019-08-30 19:14:48
 * @LastEditors: Please set LastEditors
 */
'use strict';

const Service = require('egg').Service;

const Utils = require('../utils');
const { filterNullObj } = Utils;

const Sequelize = require('sequelize');
const Op = Sequelize.Op;
// const sCol = Sequelize.col;
// const sFn = Sequelize.fn;

const moment = require('moment');

class ColumnsService extends Service {
  // 添加栏目
  async add() {
    const { ctx } = this;
    const { cname } = ctx.request.body;
    // 找出最大的cid
    // const maxCid = ctx.model.Article.max('cid');
    const requestObj = {
      cname,
    };

    const result = await ctx.model.Columns.create(requestObj);
    return result;
  }
  // 获取栏目详情
  async info(cid) {
    const { ctx } = this;
    const result = await ctx.model.Columns.findOne({ where: { cid } });
    return result;
  }
  // 编辑栏目
  async edit(cid) {
    const { ctx } = this;
    const requestObj = ctx.request.body;
    const result = await ctx.model.Columns.update(requestObj, { where: { cid } });
    return result;
  }
  // 删除栏目(软删除)
  async del(cid) {
    const { ctx } = this;
    const requestObj = {
      is_delete: 1,
    };
    const result = await ctx.model.Columns.update(requestObj, { where: { cid } });
    return result;
  }
  // 删除栏目(硬删除-数据库直接删除)
  async remove(cid) {
    const { ctx } = this;
    const result = await ctx.model.Columns.destroy({ where: { cid } });
    return result;
  }

  // 栏目列表
  async list() {
    const { ctx } = this;
    const requestObj = ctx.request.body;
    const { page, limit, startTime, endTime } = ctx.request.body;
    // 过滤空数据
    const reqObj = filterNullObj(requestObj);
    const whereObj = {
      is_delete: 0,
    };
    let results = {};
    // 标题
    if (reqObj.cname) {
      whereObj.cname = {
        [Op.like]: `%${reqObj.cname}%`,
      };
    }
    // 状态
    if (reqObj.status >= 0) {
      whereObj.status = reqObj.status;
    }

    // 创建时间
    if (startTime && endTime) {
      if (startTime === endTime) {
        // console.log('相等');
        whereObj.created_at = {
          // 大于等于
          [Op.gte]: startTime,
          // 小于
          [Op.lte]: moment(endTime).add(1, 'days'),
        };
      } else {
        whereObj.created_at = {
          // 大于等于
          [Op.gte]: startTime,
          // 小于
          [Op.lte]: endTime,
        };
      }

    }

    // 栏目列表(分页)
    const list = await ctx.model.Columns.findAll({
      where: whereObj,
      // 返回过滤字段(浏览量和软删除)
      attributes: { exclude: [ 'is_delete' ] },
      order: [
        // 创建时间-倒序
        [ 'created_at', 'DESC' ],
        [ 'cid', 'DESC' ],
      ],
      // 条数
      limit,
      offset: (page - 1) * limit,
    });

    if (list.length === 0 || !list) {
      results = {
        list: [],
        total: 0,
      };
      return results;
    }

    // 统计总条数
    const total = await ctx.model.Columns.count({
      where: whereObj,
    });

    results = {
      list,
      total,
    };

    return results;

  }

}

module.exports = ColumnsService;
