<template>
  <q-page>
    <h5>{{ $route.name }}</h5>
    <q-input v-model="text" label="Nombre" />
    <q-input v-model="text" label="Apellidos" />
    <q-input v-model="text" label="CI" />
    <div class="q-pt-md">
      <q-input
        v-model.number="model"
        type="number"
        filled
        style="max-width: 200px"
      />
    </div>
    <div class="column">
      <q-btn color="primary" label="Nuevo CLiente" class="q-mt-xl col self-center" />
    </div>
  </q-page>
</template>

<script>
import { defineComponent, ref } from "vue";

export default defineComponent({
  setup() {
    return {
      model: ref(10),
      text: ref(""),
    };
  },
});
</script>

<style lang="sass">
</style>