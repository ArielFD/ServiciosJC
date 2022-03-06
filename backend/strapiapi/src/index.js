"use strict";

module.exports = {
  /**
   * An asynchronous register function that runs before
   * your application is initialized.
   *
   * This gives you an opportunity to extend code.
   */
  register(/*{ strapi }*/) {},

  /**
   * An asynchronous bootstrap function that runs before
   * your application gets started.
   *
   * This gives you an opportunity to set up your data model,
   * run jobs, or perform some special logic.
   */
  bootstrap({ strapi }) {
    const { Server } = require("socket.io");
    const io = new Server(strapi.server.httpServer, {
      cors: {
        origin: "http://localhost:8080", //process.env.FRONTEND_DOMAIN
        methods: ["GET", "POST"],
        allowedHeaders: ["my-custom-header"],
        credentials: true,
      },
    });

    io.on('connection', async function(socket) {
      console.log("conection");
      // socket.on("join", ({ username, room }) => {
      //   console.log("user connected");
      //   console.log("username is ", username);
      //   console.log("room is...", room);
      // });
      socket.on('disconnect',()=>{
        console.log("disconect");
      })
    });

    strapi.io = io;
  },
};
