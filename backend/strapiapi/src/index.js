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

    io.use(async (socket, next) => {
      const token = socket.handshake.auth.token;
      try {
        const { id } = await strapi.plugins[
          "users-permissions"
        ].services.jwt.verify(token);
        console.log("verified: " + id);
        if (id) {
          const user = await strapi.db
            .query("plugin::users-permissions.user")
            .findOne({
              where: {
                id: id,
              },
            });

          if (user) socket.user_id = id;

          console.log("user" + id + ": " + user.username);
          next();
        } else {
          next(new Error("Invalid credentials"));
        }
      } catch (err) {
        console.log("Err occured, Try again!", err);
      }
    });

    io.on("connection", async function (socket) {
      console.log(
        "Connecting...[sk: " + socket.id + "]  userID: " + socket.user_id
      );
      // socket.on("join", ({ username, room }) => {
      //   console.log("user connected");
      //   console.log("username is ", username);
      //   console.log("room is...", room);
      // });

      socket.on("join", async (data) => {
        try {
          //console.log("user id: "+data.user_id);

          const user = await strapi.db
            .query("plugin::users-permissions.user")
            .update({
              where: { id: socket.user_id },
              data: {
                socketid: socket.id,
              },
            });

          console.log(user.username + user.socketid + " has joined");

          io.emit("join", {
          });
        } catch (err) {
          console.log("Err occured, Try again!", err);
        }
      });

      socket.on("updateIngresos", ({ content, to }) => {
        io.emit("updateIngresos", {
        });
      });

      socket.on("disconnect", () => {
        console.log("disconect");
      });
    });

    strapi.io = io;
  },
};
