<template>
  <q-page>
    <h5>REGISTER</h5>
    <q-input v-model="data.username" label="Nombre de Usuario" />
    <q-input
      v-model="data.email"
      type="email"
      prefix="Email:"
      @keyup.enter="register"
    >
      <template v-slot:prepend>
        <q-icon name="mail" />
      </template>
    </q-input>
    <q-input
      class="q-mt-md"
      v-model="data.password"
      prefix="Password:"
      filled
      :type="data.isPwd ? 'password' : 'text'"
      @keyup.enter="register"
    >
      <template v-slot:append>
        <q-icon
          :name="data.isPwd ? 'visibility_off' : 'visibility'"
          class="cursor-pointer"
          @click="data.isPwd = !data.isPwd"
        />
      </template>
    </q-input>
    <div class="row-4 q-pa-md">
      <q-btn
        color="primary"
        label="Create Acount"
        class="col q-ma-sm"
        @click="register"
      />
      <q-btn color="primary" label="Cancelar" class="col q-ma-sm" to="/" />
    </div>
  </q-page>
</template>

<script>
import { ref, inject, computed, reactive } from "vue";
import { useRouter, useRoute } from "vue-router";
import axios from "axios";

export default {
  
  setup() {

    const router = useRouter();
    const route = useRoute();

    let data = reactive({
      password: "",
      isPwd: true,
      email: "",
      username: "",
    });

    async function register() {
      await axios
        .post("http://localhost:1337/api/auth/local/register", {
          username: data.username,
          email: data.email,
          password: data.password,
        })
        .then((response) => {
          console.log("User profile", response.data.user);
          axios
            .post(`http://localhost:1337/api/auth/send-email-confirmation`, {
              email: response.data.user.email, // user's email
            })
            .then((response) => {
              console.log("Your user received an email");
              router.push("/");
            })
            .catch((error) => {
              console.error("An error occurred:", error.response);
            });
        })
        .catch((error) => {
          console.log("An error occurred:", error.response);
        });
    }
    
    return {
      data,
      register
    };
  },
};
</script>

<style lang="sass">
</style>