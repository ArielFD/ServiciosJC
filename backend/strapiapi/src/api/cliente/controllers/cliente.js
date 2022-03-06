'use strict';

/**
 *  cliente controller
 */

const { createCoreController } = require('@strapi/strapi').factories;

module.exports = createCoreController('api::cliente.cliente'
, ({ strapi }) =>  ({

async find(ctx, next, { populate } = {}) {
    console.log("fetchAll");
    const users = await strapi.service('api::cliente.cliente').fetchAll(ctx.query.filters, populate);
    console.log("Usuario",users);
    ctx.body = users
  },

async findOne(ctx) {
    const user = ctx.state.user;
    if (!user) {
      return ctx.unauthorized();
    }

    ctx.body = user
  },
})
);