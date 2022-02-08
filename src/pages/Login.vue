<template>
  <q-page>
    <h5>{{ $route.name }}</h5>
    <q-input
      v-model="data.email"
      type="email"
      prefix="Email:"
      @keyup.enter="sendEmail"
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
      @keyup.enter="sendEmail"
    >
      <template v-slot:append>
        <q-icon
          :name="data.isPwd ? 'visibility_off' : 'visibility'"
          class="cursor-pointer"
          @click="data.isPwd = !data.isPwd"
        
        />
      </template>
    </q-input>
    <a href="/#/entermail" style="text-decoration: none"
      >Olvidaste la Contraseña?</a
    >
    <div class="column">
      <q-btn
        @click="sendEmail"
        color="primary"
        label="LOGIN"
        class="q-mt-xl col self-center"
      />
    </div>
    <div class="column">
      <q-btn padding="md" color="primary" round icon="add" size="35px"
      class="q-mt-xl col self-end" to=/register />
    </div>
  </q-page>
</template>

<script>
import { ref, inject, computed, reactive } from "vue";
import { useRouter, useRoute } from "vue-router";
import axios from "axios";

export default {
  name: "Login",
  setup() {
    const store = inject("store");
    const router = useRouter();
    const route = useRoute();

    let data = reactive({
      password: "",
      isPwd: true,
      email: "",
      username: "",
    });

    async function sendEmail() {
      await axios
        .post("http://localhost:1337/api/auth/local", {
          identifier: data.email,
          password: data.password,
        })
        .then(function (response) {
          console.log(response);
          store.state.jwt = response.data.jwt;
          console.log(store.state.jwt);
          router.push("/usuario");
        })
        .catch(function (error) {
          console.log(error);
        });
    }

    return {
      store,
      data,
      sendEmail,
    };
  },
};
</script>
