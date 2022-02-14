<template>
  <q-page>
    <h5>LOGIN</h5>
    <form @submit.prevent.stop="onSubmit" class="q-gutter-md">
    <q-input
      ref="emailRef"
      v-model="data.email"
      type="email"
      prefix="Email:"
      @keyup.enter="Login"
      lazy-rules
      :rules="store.state.emailRules"
    >
      <template v-slot:prepend>
        <q-icon name="mail" />
      </template>
    </q-input>
    <q-input
      ref="passRef"
      class="q-mt-md"
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
    <div class="column">
      <q-btn
        @click="Login"
        color="primary"
        label="LOGIN"
        class="q-mt-xl col self-center"
        type="submit"
      />
    </div>
    <div class="column">
      <q-btn padding="md" color="primary" round icon="add" size="35px"
      class="q-mt-xl col self-end" to="/register"/>
    </div>
    </form>
  </q-page>
</template>

<script>
import { ref, inject, computed, reactive } from "vue";
import { useRouter, useRoute } from "vue-router";
import axios from "axios";
import { useQuasar } from 'quasar'


export default {
  name: "Login",
  setup() {
    const store = inject("store");
    const router = useRouter();
    const route = useRoute();
    const $q = useQuasar() 

    let data = reactive({
      password: "",
      isPwd: true,
      email: "",
      username: "",
      nameRef:"",
    });

    
    async function Login() {
      await axios
        .post("http://localhost:1337/api/auth/local", {
          identifier: data.email,
          password: data.password,
        })
        .then(function (response) {
          console.log(response);
          store.state.alerts[1].message="Sesion Iniciada, Bienvenido!!!"
          $q.notify(store.state.alerts[1])
          store.state.jwt = response.data.jwt;
          console.log(store.state.jwt);
          router.push("/usuario");
        })
        .catch(function (error) {
          console.log(error.response);
          store.state.alerts[0].message="Credenciales incorrectas"
          $q.notify(store.state.alerts[0])
        });
    }

    function onSubmit () {

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
      Login,
      onSubmit
      
    };
  },
};
</script>
