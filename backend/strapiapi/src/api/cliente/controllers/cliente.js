'use strict';

/**
 *  cliente controller
 */

const { createCoreController } = require('@strapi/strapi').factories;

module.exports = createCoreController('api::cliente.cliente'
, ({ strapi }) =>  ({

//     // async index(ctx, next) { // called by GET /hello 
//     //     ctx.body = 'Hello World!'; // we could also send a JSON
//     //   },

//     // Method 1: Creating an entirely custom action
//     async exampleAction(ctx) {
//         console.log("test");
//       try {
//         ctx.body = 'ok';
//       } catch (err) {
//         ctx.body = err;
//       }
//     },
  
//     // Method 2: Wrapping a core action (leaves core logic in place)
//     async find(ctx) {
//         console.log("Probando cosas",ctx);
//       // some custom logic here
//       ctx.query = { ...ctx.query, populate:"*" }
      
//       // Calling the default core action
//       const { data, meta } = await super.find(ctx);
  
//       // some more custom logic
//       meta.date = Date.now()
  
//       return { data, meta };
//     },
  
//     // Method 3: Replacing a core action
//     async findOne(ctx) {
//         console.log("findOne");
//       const { id } = ctx.params;
//       const { query } = ctx;
  
//       const entity = await strapi.service('api::cliente.cliente').findOne(id, query);
//       const sanitizedEntity = await this.sanitizeOutput(entity, ctx);
  
//       return this.transformResponse(sanitizedEntity);
//     }
//   })

// fetchAll(params, populate) {
//     console.log("fetchAll");
//     return strapi.query('plugin::users-permissions.user').findMany({ where: params, populate: ['role'] });
//   },

async find(ctx, next, { populate } = {}) {
    console.log("fetchAll");
    const users = await strapi.service('api::cliente.cliente').fetchAll(ctx.query.filters, populate);
    console.log("Usuario",users);
    ctx.body = users
    //await Promise.all(users.map(user => sanitizeOutput(user, ctx)));
  }

// async find(ctx) {
//     const user = ctx.state.user;
//     if (!user) {
//       return ctx.unauthorized();
//     }

//     ctx.body = user
//     //await sanitizeOutput(user, ctx);
//   },
})
);