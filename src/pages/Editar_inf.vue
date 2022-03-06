<template>
  <q-page>
    <h5>Editar Informacion</h5>
    <q-input
      v-model="data.username"
      label="Nombre de Usuario"
      class="my-input"
      lazy-rules
      :rules="store.state.inputRules"
    />
    <q-input
      v-model="data.nombre"
      label="Nombre"
      class="my-input"
      lazy-rules
      :rules="store.state.inputRules"
    />
    <q-input
      v-model="data.apellidos"
      label="Apellidos"
      class="my-input"
      lazy-rules
      :rules="store.state.inputRules"
    />
    <q-input
      v-model="data.email"
      label="Email"
      class="my-input2"
      lazy-rules
      :rules="store.state.emailRules"
    >
      <template v-slot:prepend>
        <q-icon name="mail" />
      </template>
    </q-input>
    <q-input
      v-model="data.ci"
      label="Carnet Identidad"
      class="my-input"
      :rules="[store.methods.myRule]"
    />
    <q-input
      v-model="data.telefono"
      label="Telefono"
      class="my-input"
      lazy-rules
      :rules="store.state.inputTelephone"
    />
    <q-input
      v-model="data.dirPart"
      label="Direccion Particular"
      class="my-input2"
      lazy-rules
      :rules="store.state.inputRules"
    />
    <q-input
      v-model="data.noSolapin"
      label="No Solapin"
      class="my-input"
      lazy-rules
      :rules="store.state.inputRules"
    />
    <div class="row q-pa-lg q-mt-md justify-end">
      <div class="q-ma-sm">
        <span class="col">Cambiar Contraseña : </span>
      </div>
      <q-btn color="primary" label="Click" class="col-4" @click="sendMail" />

      <q-dialog v-model="data.cardPass">
        <q-card class="my-card">
          <q-card-section>
            <div class="text-h6">Nueva Contraseña</div>
          </q-card-section>

          <q-card-section class="q-pa-sm">
            <q-input
              ref="passRef"
              class="q-mt-md my-input"
              v-model="data.newPass"
              prefix="Password:"
              filled
              :type="data.isPwd ? 'password' : 'text'"
              lazy-rules
              :rules="store.state.passRules"
            >
              <template v-slot:append>
                <q-icon
                  :name="data.isPwd ? 'visibility_off' : 'visibility'"
                  class="cursor-pointer"
                  @click="data.isPwd = !data.isPwd"
                />
              </template>
            </q-input>
          </q-card-section>

          <q-separator />

          <q-card-actions align="right">
            <q-btn
              v-close-popup
              flat
              color="primary"
              label="Confirmar"
              @click="resetPass"
            />
          </q-card-actions>
        </q-card>
      </q-dialog>
    </div>
    <div class="row justify-center">
      <q-btn
        color="primary"
        label="Guardar Cambios"
        class="full-width"
        @click="Edit"
      />
    </div>
  </q-page>
</template>

<script>
import { onMounted, onUpdated, onUnmounted } from "vue";
import { ref, inject, computed, reactive } from "vue";
import axios from "axios";
import { api } from 'boot/axios.js'
import { useRouter, useRoute } from "vue-router";
import { Dialog } from "quasar";
import { useQuasar } from "quasar";

export default {
  setup() {
    const router = useRouter();
    const route = useRoute();
    const store = inject("store");
    const $q = useQuasar();
    let data = reactive({
      username: "",
      nombre: "",
      apellidos: "",
      email: "",
      password: "",
      isPwd: true,
      ci: "",
      telefono: "",
      dirPart: "",
      noSolapin: "",
      id: "",
      cardPass: false,
      token: "",
      newPass: "",
    });

    onMounted(() => {
      api
        .get("/api/clientes/$", {
          headers: {
            Authorization: "Bearer " + store.state.jwt,
          },
        })
        .then(function (response) {
          console.log(response);
          data.apellidos = response.data.Apellidos;
          data.dirPart = response.data.DireccionParticular;
          data.noSolapin = response.data.NoSolapin;
          data.nombre = response.data.Nombre;
          data.telefono = response.data.Telefono;
          data.email = response.data.email;
          data.username = response.data.username;
          data.ci = response.data.NoIdentidad;
          data.id = response.data.id;
        })
        .catch(function (error) {
          console.log(error);
        });
    });

    function Edit(params) {
      api
        .put(`/api/users/${data.id}`, {
          headers: {
            Authorization: "Bearer " + store.state.jwt,
          },
          email: data.email,
          username: data.username,
          Nombre: data.nombre,
          Apellidos: data.apellidos,
          NoIdentidad: data.ci,
          Telefono: data.telefono,
          DireccionParticular: data.dirPart,
          NoSolapin: data.noSolapin,
        })
        .then(function (response) {
          console.log(response);
          router.push("/usuario");
        })
        .catch(function (error) {
          console.log(error.response);
        });
    }

    async function sendMail() {
      data.cardPass = true;
      await api
        .post("/api/auth/forgot-password", {
          email: data.email, // user's email
        })
        .then((response) => {
          console.log(response);
          api
            .get("/api/clientes/$", {
              headers: {
                Authorization: "Bearer " + store.state.jwt,
              },
            })
            .then(function (response) {
              console.log(response);
              data.token = response.data.resetPasswordToken;
            })
            .catch(function (error) {
              console.log(error);
            });
        })
        .catch((error) => {
          console.log("An error occurred:", error.response);
        });
    }

    async function resetPass() {
      api
        .post("/api/auth/reset-password", {
          code: data.token,
          password: data.newPass,
          passwordConfirmation: data.newPass,
        })
        .then((response) => {
          console.log(response);
          store.state.alerts[1].message = "Password Reiniciado!";
          $q.notify(store.state.alerts[1]);
        })
        .catch((error) => {
          console.log("An error occurred:", error.response);
          store.state.alerts[0].message = "Error con Reinicio de contraseña!";
          $q.notify(store.state.alerts[0]);
        });
    }

    return {
      data,
      store,
      Edit,
      sendMail,
      resetPass,
    };
  },
};
</script>

<style lang="sass" scoped>
.my-card
  width: 100%
  max-width: 500px

.my-input
  width: 100%
  max-width: 200px

.my-input2
  width: 100%
  max-width: 400px
</style>