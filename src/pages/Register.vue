<template>
  <q-page>
    <h5>Registro de Usuario</h5>
    <form @submit.prevent.stop="onSubmit" class="q-gutter-md">
      <q-input v-model="data.username" label="Nombre de Usuario" />
      <q-input
        ref="emailRef"
        v-model="data.email"
        type="email"
        prefix="Email:"
        @keyup.enter="register"
        lazy-rules
        :rules="store.state.emailRules"
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
          label="Crear Cuenta"
          class="col q-ma-sm"
          @click="register"
        />
        <q-btn color="primary" label="Cancelar" class="col q-ma-sm" to="/" />
      </div>
    </form>
  </q-page>
</template>

<script>
import { ref, inject, computed, reactive } from "vue";
import { useRouter, useRoute } from "vue-router";
import axios from "axios";
import { useQuasar } from "quasar";

export default {
  setup() {
    const store = inject("store");
    const router = useRouter();
    const route = useRoute();
    const $q = useQuasar();

    let data = reactive({
      password: "",
      isPwd: true,
      email: "",
      username: "",
    });

    async function register() {
      await axios
        .post(process.env.VUE_APP_URL+"/api/auth/local/register", {
          username: data.username,
          email: data.email,
          password: data.password,
        })
        .then((response) => {
          console.log("User profile", response.data.user);
          axios
            .post(process.env.VUE_APP_URL+"/api/auth/send-email-confirmation", {
              email: response.data.user.email, // user's email
            })
            .then((response) => {
              console.log("Your user received an email");
              store.state.alerts[1].message =
                "Se le ha enviado un email de confirmacion!";
              $q.notify(store.state.alerts[1]);
              router.push("/");
            })
            .catch((error) => {
              console.error("An error occurred:", error.response);
              store.state.alerts[0].message =
                "Error al enviar el email de confirmacion!";
              $q.notify(store.state.alerts[0]);
            });
        })
        .catch((error) => {
          if(error.response.data.error.details.errors!=null){
          error.response.data.error.details.errors.forEach(element => {
            store.state.errors=store.state.errors+", "+element.message
            console.log(store.state.errors);
          });
          }else{
            store.state.errors=store.state.errors+", "+error.response.data.error.message
          }
          store.state.alerts[0].message = "Error al registrar el usuario! "+store.state.errors
          $q.notify(store.state.alerts[0]);
          store.state.errors=""
        });
    }

    function onSubmit() {
      // if (data.nameRef="") {
      //   // form has error
      //   $q.notify({
      //     icon: 'done',
      //     color: 'positive',
      //     message: 'Submitted'
      //   })
      // }
      // else {
      //   $q.notify({
      //     icon: 'done',
      //     color: 'positive',
      //     message: 'Submitted'
      //   })
      // }
    }

    return {
      store,
      data,
      register,
      onSubmit,
    };
  },
};
</script>

<style lang="sass">
</style>