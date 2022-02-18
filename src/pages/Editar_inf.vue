<template>
  <q-page class="q-pt-xl" >
    <h5>Editar Informacion</h5>
    <q-input
      v-model="data.username"
      label="Nombre de Usuario"
      class="my-input"
      style="max-width: 300px"
    />
    <q-input v-model="data.nombre" label="Nombre" class="my-input" style="max-width: 300px"/>
    <q-input v-model="data.apellidos" label="Apellidos" class="my-input" style="max-width: 300px"/>
    <q-input v-model="data.email" label="Email" style="max-width: 600px">
      <template v-slot:prepend>
        <q-icon name="mail" />
      </template>
    </q-input>
    <q-input
      ref="passRef"
      class="q-mt-md my-input"
      v-model="data.password"
      prefix="Password:"
      filled
      :type="data.isPwd ? 'password' : 'text'"
      lazy-rules
      :rules="store.state.passRules"
      style="max-width: 300px"
    >
      <template v-slot:append>
        <q-icon
          :name="data.isPwd ? 'visibility_off' : 'visibility'"
          class="cursor-pointer"
          @click="data.isPwd = !data.isPwd"
        />
      </template>
    </q-input>
    <q-input v-model="data.ci" label="Carnet Identidad" class="my-input" style="max-width: 200px"/>
    <q-input v-model="data.telefono" label="Telefono" class="my-input" style="max-width: 100px"/>
    <q-input v-model="data.dirPart" label="Direccion Particular" style="max-width: 600px"/>
    <q-input v-model="data.noSolapin" label="No Solapin" class="my-input" style="max-width: 100px"/>
    <div class="row q-pa-lg q-mt-md justify-end">
      <div class="q-ma-sm">
        <span class="col">To Change Password Click: </span>
      </div>
      <q-btn color="primary" label="HERE" class="col-4" />
    </div>
  </q-page>
</template>

<script>
import { onMounted, onUpdated, onUnmounted } from "vue";
import { ref, inject, computed, reactive } from "vue";
import axios from "axios";
import { Dialog } from "quasar";

export default {
  setup() {
    const store = inject("store");
    let data = reactive({
      username: "",
      nombre: "",
      apellidos: "",
      email: "",
      password: "",
      isPwd: false,
      ci: "",
      telefono: "",
      dirPart: "",
      noSolapin: "",
      phone: "",
    });
    return {
      data,
      store,
    };
  },
};
</script>

<style lang="sass">
</style>