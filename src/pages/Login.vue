<template>
  <q-page class="row justify-center">
    <div
      class="row justify-center text-h3 text-weight-bolder q-pa-lg"
      v-if="data.fallo"
    >
      <p class="text-primary text-capitalize">Intentelo mas tarde</p>
    </div>
    <div class="col-md-6 col-sm-10" v-if="!data.fallo">
      <q-card>
        <q-card-section>
          <div class="row items-center no-wrap">
            <div class="col">
              <div class="text-h6">Loguin</div>
            </div>

            <div class="col-auto">
              <!-- <q-btn color="grey-7" round flat icon="more_vert">
                <q-menu cover auto-close>
                  <q-list>
                    <q-item clickable>
                      <q-item-section>Remove Card</q-item-section>
                    </q-item>
                    <q-item clickable>
                      <q-item-section>Send Feedback</q-item-section>
                    </q-item>
                    <q-item clickable>
                      <q-item-section>Share</q-item-section>
                    </q-item>
                  </q-list>
                </q-menu>
              </q-btn> -->
            </div>
          </div>
        </q-card-section>

        <q-card-section>
          <form @submit.prevent.stop="onSubmit">
            <q-input
              ref="nameRef"
              filled
              v-model="data.email"
              label="Email"
              lazy-rules
              :rules="store.state.emailRules"
            >
              <template v-slot:prepend>
                <q-icon name="mail" />
              </template>
            </q-input>
            <q-input
              ref="passRef"
              class="q-mt-sm"
              v-model="data.password"
              prefix="Password:"
              filled
              :type="data.isPwd ? 'password' : 'text'"
              @keyup.enter="Login"
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
            <a href="/#/entermail" style="text-decoration: none"
              >Olvidaste la Contraseña?</a
            >
            <div>
              <q-checkbox v-model="data.rememberMe" label="Recordarme" />
            </div>
            <q-separator />
            <q-card-actions class="justify-end">
              <div>
                <q-btn
                  color="primary"
                  label="LOGIN"
                  class="col self-center"
                  type="submit"
                  flat
                />
              </div>
              <div>
                <q-btn
                  color="primary"
                  label="Register"
                  class="col self-end"
                  to="/register"
                  flat
                />
              </div>
            </q-card-actions>
          </form>
        </q-card-section>
      </q-card>
    </div>
  </q-page>
</template>

<script>
import { ref, inject, computed, reactive } from "vue";
import { useRouter, useRoute } from "vue-router";
import { onMounted, onUpdated, onUnmounted } from "vue";
import axios from "axios";
import { useQuasar } from "quasar";
import { api } from "boot/axios.js";

export default {
  name: "Login",
  setup() {
    const store = inject("store");
    const socket = inject("socket");
    const router = useRouter();
    const route = useRoute();
    const $q = useQuasar();

    const nameRef = ref(null);

    let data = reactive({
      password: "",
      isPwd: true,
      email: "",
      username: "",
      rememberMe: false,
      fallo: false,
    });

    socket.on("join", async (data) => {
      console.log("join");
    });

    onMounted(() => {
      if (!localStorage.getItem("fallo")) {
        localStorage.setItem("fallo", "0");
      }
      if (
        localStorage.getItem("userData") &&
        JSON.parse(localStorage.getItem("userData")).rememberMe
      ) {
        (data.email = JSON.parse(localStorage.getItem("userData")).email),
          (data.password = JSON.parse(
            localStorage.getItem("userData")
          ).password),
          (data.rememberMe = JSON.parse(
            localStorage.getItem("userData")
          ).rememberMe);
      }
    });

    async function Login() {
      await api
        .post("/api/auth/local", {
          identifier: data.email,
          password: data.password,
        })
        .then(function (response) {
          console.log(response);
          store.state.alerts[1].message = "Sesion Iniciada, Bienvenido!!!";
          $q.notify(store.state.alerts[1]);
          store.state.jwt = response.data.jwt;
          store.state.user = response.data.user;
          store.state.user.password = data.password;
          store.state.user.rememberMe = data.rememberMe;
          localStorage.setItem("jwt", response.data.jwt);
          localStorage.setItem("userData", JSON.stringify(store.state.user));
          localStorage.setItem("fallo", "0");
          router.push("/usuario");
          conect(store.state.jwt);
          socket.emit("join", {});
        })
        .catch(function (error) {
          console.log(error.response);
          let temp = parseInt(localStorage.getItem("fallo"));
          temp++;
          localStorage.setItem("fallo", temp);
          if (temp > 5) {
            data.fallo = true;
            resetTimeOut();
          }
          store.state.alerts[0].message = "Credenciales incorrectas";
          $q.notify(store.state.alerts[0]);
        });
    }

    function resetTimeOut(params) {
      setTimeout(() => {
        data.fallo = false;
        localStorage.setItem("fallo", "0");
      }, 300000);
    }

    function conect(token) {
      socket.auth = { token };
      socket.connect();
    }

    function onSubmit() {
      nameRef.value.validate();

      if (nameRef.value.hasError) {
        $q.notify({
          color: "negative",
          message: "Incorrect Username or Password",
        });
        // form has error
      } else {
        Login();
      }
    }

    return {
      store,
      data,
      Login,
      onSubmit,
      nameRef,
      conect,
      resetTimeOut,
    };
  },
};
</script>

<style lang="sass">
.my-card
  max-width: 600px
</style>


