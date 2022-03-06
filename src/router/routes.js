const routes = [
  {
    path: "/",
    name: "",
    component: () => import("layouts/MainLayout.vue"),
    children: [
      {
        path: "",
        name: "Login",
        component: () => import("src/pages/Login.vue"),
      },
      {
        path: "/cambiarpass",
        name: "Cambiar_Password",
        component: () => import("src/pages/Cambiar_pass.vue"),
      },
      {
        path: "/editarinf",
        name: "Editar_Password",
        component: () => import("src/pages/Editar_inf.vue"),
      },
      {
        path: "/entercode",
        name: "Entrar_Codigo",
        component: () => import("src/pages/Enter_code.vue"),
      },
      {
        path: "/entermail",
        name: "Entrar_Email",
        component: () => import("src/pages/Enter_mail.vue"),
      },
      {
        path: "/gestionaringresos",
        name: "Gestionar_Ingresos",
        component: () => import("src/pages/Gestionar_ingresos.vue"),
      },
      {
        path: "/gestionarrol",
        name: "Gestionar_Roles",
        component: () => import("src/pages/Gestionar_rol.vue"),
      },
      {
        path: "/gestionarusuarios",
        name: "Gestionar_Usuarios",
        component: () => import("src/pages/Gestionar_usuarios.vue"),
      },
      {
        path: "/gestionarvueltas",
        name: "Gestionar_Vueltas",
        component: () => import("src/pages/Gestionar_vueltas.vue"),
      },
      {
        path: "/register",
        name: "Registro",
        component: () => import("src/pages/Register.vue"),
      },
      {
        path: "/usuario",
        name: "Usuario",
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
