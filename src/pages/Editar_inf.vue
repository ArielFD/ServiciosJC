<template>
  <q-page class="q-pt-xl">
    <q-input v-model="text" label="Nombre" :dense="dense" />
    <q-input v-model="text" label="Apellidos" :dense="dense" />
    <q-input v-model="text" label="CI" :dense="dense" />
    <q-input v-model="text" label="Direccion Particular" :dense="dense" />
    <q-input
        filled
        v-model="phone"
        label="Phone"
        mask="(###) # ### - ####"
        fill-mask
        hint="Mask: (+53) 5 535 - 7290"
      />
    <q-input v-model="text" label="Solapin" :dense="dense" />
    <div class="row q-pa-lg q-mt-md">
        <span class="col">To Change Password Click: </span>
      <q-btn
        color="primary"
        label="HERE"
        class="col-4"
      />
    </div>
  </q-page>
</template>

<script>
import { defineComponent, ref } from "vue";

export default defineComponent({
  setup() {
    return {
      text: ref(""),
      ph: ref(""),
      dense: ref(false),
      phone: ref(""),
      isPwd: ref(true),

      email: ref(""),
    };
  },
});
</script>

<style lang="sass">
</style>