const routes = [
  {
    path: "/",
    name: "",
    component: () => import("layouts/MainLayout.vue"),
    children: [
      {
        path: "",
        name: "LOGIN",
        component: () => import("src/pages/Login.vue"),
      },
      {
        path: "/administrador",
        name: "administrador",
        component: () => import("src/pages/Administrador.vue"),
      },
      {
        path: "/cajero",
        name: "cajero",
        component: () => import("src/pages/Cajero.vue"),
      },
      {
        path: "/cambiarpass",
        name: "cambiarpass",
        component: () => import("src/pages/Cambiar_pass.vue"),
      },
      {
        path: "/editarinf",
        name: "editarinf",
        component: () => import("src/pages/Editar_inf.vue"),
      },
      {
        path: "/encargado",
        name: "encargado",
        component: () => import("src/pages/Encargado.vue"),
      },
      {
        path: "/entercode",
        name: "entercode",
        component: () => import("src/pages/Enter_code.vue"),
      },
      {
        path: "/entermail",
        name: "enteremail",
        component: () => import("src/pages/Enter_mail.vue"),
      },
      {
        path: "/gestionaringresos",
        name: "gestionaringresos",
        component: () => import("src/pages/Gestionar_ingresos.vue"),
      },
      {
        path: "/gestionarrol",
        name: "gestionarrol",
        component: () => import("src/pages/Gestionar_rol.vue"),
      },
      {
        path: "/gestionarusuarios",
        name: "gestionarusuario",
        component: () => import("src/pages/Gestionar_usuarios.vue"),
      },
      {
        path: "/gestionarvueltas",
        name: "gestionarvueltas",
        component: () => import("src/pages/Gestionar_vueltas.vue"),
      },
      {
        path: "/nuevocliente",
        name: "nuevocliente",
        component: () => import("src/pages/Nuevo_cliente.vue"),
      },
      {
        path: "/register",
        name: "register",
        component: () => import("src/pages/Register.vue"),
      },
      {
        path: "/usuario",
        name: "usuario",
        component: () => import("src/pages/Usuario.vue"),
      },
    ],
  },

  // Always leave this as last one,
  // but you can also remove it
  {
    path: "/:catchAll(.*)*",
    component: () => import("pages/Error404.vue"),
  },
];

export default routes;
