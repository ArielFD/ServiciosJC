<template>
  <q-page>
    <h5>INGRESE EMAIL PORFAVOR</h5>
    <q-input v-model="data.email" type="email" prefix="Email:">
      <template v-slot:prepend>
        <q-icon name="mail" />
      </template>
    </q-input>
    <div class="row q-pa-md">
      <q-btn color="primary" label="Aceptar" class="col q-ma-md" @click="sendMail"/>
      <q-btn color="primary" label="Cancelar" class="col q-ma-md" to="/"/>
    </div>
  </q-page>
</template>

<script>
import { defineComponent, ref, reactive } from "vue";
import { useRouter, useRoute } from "vue-router";
import axios from "axios";

export default {
  setup() {
    const router = useRouter();
    const route = useRoute();

    let data = reactive({
      email: "",
    });

    async function sendMail() {
      await axios
        .post("http://localhost:1337/api/auth/forgot-password", {
          email: data.email, // user's email
        })
        .then((response) => {
          console.log("Your user received an email");
          store.state.alerts[1].message="Enviado email de confirmacion!"
          $q.notify(store.state.alerts[1])
          router.push("/entercode");
        })
        .catch((error) => {
          console.log("An error occurred:", error.response);
          store.state.alerts[0].message="Error con el envio de emai de confirmacion!"
          $q.notify(store.state.alerts[0])
        });
    }
    return {
      data,
      sendMail
    };
  },
};
</script>

<style lang="sass">
</style>