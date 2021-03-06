/*
 * @Description: In User Settings Edit
 * @Author: your name
 * @Date: 2019-08-28 19:41:52
 * @LastEditTime: 2019-09-20 09:15:57
 * @LastEditors: Please set LastEditors
 */

'use strict';
const BaseRule = require('./base');
const { id, cid, title, author, cover, content, link, status, page, limit, startTime, endTime } = BaseRule;
const ArticleRules = {
  add: {
    cid,
    title,
    author,
    cover,
    url: link,
    content,
  },
  edit: {
    id,
    cid,
    title,
    author,
    cover,
    url: link,
    content,
    // status,
  },
  editStatus: {
    id,
    status,
  },
  del: {
    id,
  },
  list: {
    page,
    limit,
  },
  create_at: {
    startTime,
    endTime,
  },
};
module.exports = ArticleRules;
