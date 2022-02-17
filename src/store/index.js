import { reactive } from "vue";
import axios from "axios";


const state = reactive({
  jwt: "",
  alerts : [
    { color: 'negative',message:'', icon: 'error'},
    { color: 'positive', message: '', icon: 'done' },
    { color: 'warning', message: '', icon: 'warning' },
  ],
  emailRules:[
    val => (val && val.length > 0) || 'Please type something'
  ],
  inputRules:[
    val => (val && val.length > 0) || 'Please type something',
  ],
  ageRules:[],
  passRules:[],
  linksListAdmin : [
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
  ]
});

const methods = {

};

const getters = {
};

export default {
  state,
  methods,
  getters,
};
