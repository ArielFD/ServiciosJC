import { reactive } from "vue";
import axios from "axios";

const state = reactive({
  jwt: "",
  errors: "",
  alerts: [
    { color: "negative", message: "", icon: "error" },
    { color: "positive", message: "", icon: "done" },
    { color: "warning", message: "", icon: "warning" },
  ],
  emailRules: [(val) => (val && val.length > 0) || "Please type something"],
  inputRules: [(val) => (val && val.length > 0) || "Please type something"],
  inputTelephone: [(val) => (val && val.length==8) || "Incorrect tele"],
  ageRules: [(val) => (val > 0 && val < 100) || "Edad Incorrecta"],
  passRules: [],
  carnetID: [
    (val) => val.length == 11 || "CI Incorrecto longitud menor 11",
    (val) =>
      val.substring(0, 1) >= 0 ||
      val.substring(0, 1) <= 99 ||
      "CI Incorrecto anos",
    (val) =>
      val.substring(2, 3) >= 1 ||
      val.substring(2, 3) <= 12 ||
      "CI Incorrecto mes",
    (val) =>
      val.substring(4, 5) >= 1 ||
      val.substring(4, 5) <= 31 ||
      "CI Incorrecto dia",
  ],
  linksListAdmin: [
    {
      title: "Editar Informacion",
      caption: "Editar Informacion",
      icon: "settings",
      link: "/editarinf",
    },
    {
      title: "Gestionar vueltas",
      caption: "Gestionar vueltas",
      icon: "cached",
      link: "/Gestionar_Vueltas",
    },
    {
      title: "Gestionar Ingresos",
      caption: "Gestionar Ingresos",
      icon: "paid",
      link: "/Gestionar_Ingresos",
    },
    {
      title: "Gestionar Roles",
      caption: "Gestionar Roles",
      icon: "supervisor_account",
      link: "/Gestionar_Roles",
    },
    {
      title: "Gestionar Clientes",
      caption: "Gestionar Clientes",
      icon: "group_add",
      link: "/Gestionar_Usuarios",
    },
  ],
});

const methods = {
  myRule(val) {
    console.log(val.toString().substring(4, 6) <= "31");
    if (val.length != 11) {
      return "CI Incorrecto longitud menor que 11";
    }
    if (
      val.toString().substring(0, 2) < 0 ||
      val.toString().substring(0, 2) > 100
    ) {
      return "CI Incorrecto longitud anos";
    }
    if (
      val.toString().substring(2, 4) < 1 ||
      val.toString().substring(2, 4) > 12
    ) {
      return "CI Incorrecto longitud meses";
    }
    if (
      val.toString().substring(4, 6) < 1 ||
      val.toString().substring(4, 6) > 31
    ) {
      return "CI Incorrecto longitud dias";
    }
  },
};

const getters = {};

export default {
  state,
  methods,
  getters,
};
