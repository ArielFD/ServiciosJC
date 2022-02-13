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
