<template>
  <q-page>
    <h5>INGRESE NUEVA CONTRASEÑA</h5>
    <q-input
      class="q-mt-md"
      v-model="data.newPass"
      prefix="New Password:"
      filled
      :type="data.isPwd ? 'password' : 'text'"
    >
      <template v-slot:append>
        <q-icon
          :name="data.isPwd ? 'visibility_off' : 'visibility'"
          class="cursor-pointer"
          @click="data.isPwd = !data.isPwd"
        />
      </template>
    </q-input>
    <q-input
      class="q-mt-md"
      v-model="data.confirmationPass"
      prefix="Confirm Password:"
      filled
      :type="data.isPwd ? 'password' : 'text'"
    >
      <template v-slot:append>
        <q-icon
          :name="data.isPwd ? 'visibility_off' : 'visibility'"
          class="cursor-pointer"
          @click="data.isPwd = !data.isPwd"
        />
      </template>
    </q-input>
    <div class="row q-pa-md">
      <q-btn
        color="primary"
        label="Aceptar"
        class="col q-ma-md"
        @click="resetPass"
      />
      <q-btn color="primary" label="Cancelar" class="col q-ma-md" to="/" />
    </div>
  </q-page>
</template>

<script>
import { onMounted, onUpdated, onUnmounted } from "vue";
import { ref, reactive,inject } from "vue";
import { useRouter, useRoute } from "vue-router";
import axios from "axios";
import { useQuasar } from 'quasar'

export default {
  setup() {
    const router = useRouter();
    const route = useRoute();
    const store = inject("store");
    const $q = useQuasar() 

    onMounted(() => {
      console.log(route.query);
    });
    
    let data = reactive({
      isPwd: true,
      ph: "",
      newPass: "",
      confirmationPass: "",
    });

    async function resetPass() {
      axios
        .post("http://localhost:1337/api/auth/reset-password", {
          "code": route.query.code,
          "password": data.newPass,
          "passwordConfirmation": data.confirmationPass,
        })
        .then((response) => {
          console.log("Your user's password has been reset.");
          store.state.alerts[1].message="Password Reiniciado!"
          $q.notify(store.state.alerts[1])
          router.push("/");
        })
        .catch((error) => {
          console.log("An error occurred:", error.response);
          store.state.alerts[0].message="Error con Reinicio de contraseña!"
          $q.notify(store.state.alerts[0])
        });
    }
    return {
      data,
      resetPass,
    };
  },
};
</script>

<style lang="sass">
</style>