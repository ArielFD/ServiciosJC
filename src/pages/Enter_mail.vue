<template>
  <q-page>
    <h5>INGRESE EMAIL POR FAVOR</h5>
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
import { defineComponent, ref, reactive,inject } from "vue";
import { useRouter, useRoute } from "vue-router";
import axios from "axios";
import { api } from 'boot/axios.js'
import { useQuasar } from 'quasar'

export default {
  setup() {
    const router = useRouter();
    const route = useRoute();
    const store = inject("store");
    const $q = useQuasar() 

    let data = reactive({
      email: "",
    });

    async function sendMail() {
      await api
        .post("/api/auth/forgot-password", {
          email: data.email, // user's email
        })
        .then((response) => {
          console.log("Your user received an email",response);
          store.state.alerts[1].message="Enviado email de confirmacion!"
          $q.notify(store.state.alerts[1])
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