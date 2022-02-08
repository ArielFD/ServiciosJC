import { reactive } from "vue";
import axios from "axios";


const state = reactive({
  jwt: ""
});

const methods = {

  

  async requestUsers() {
    const { data } = await axios.get("http://localhost:1337/users", {
      headers: {
        Authorization: "Bearer " + state.jwt,
      },
    });

    console.log(data);
  },
};

const getters = {
  verMail() {
    return state.email;
  },
};

export default {
  state,
  methods,
  getters,
};
