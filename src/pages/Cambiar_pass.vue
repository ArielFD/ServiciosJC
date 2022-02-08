<template>
  <q-page>
    <h5>CAJERO</h5>
    <q-input
      class="q-mt-md"
      v-model="password"
      prefix="Old Password:"
      filled
      :type="isPwd ? 'password' : 'text'"
    >
     <template v-slot:append>
        <q-icon
          :name="isPwd ? 'visibility_off' : 'visibility'"
          class="cursor-pointer"
          @click="isPwd = !isPwd"
        />
      </template>
    </q-input>
    <q-input
      class="q-mt-md"
      v-model="password"
      prefix="New Password:"
      filled
      :type="isPwd ? 'password' : 'text'"
    >
     <template v-slot:append>
        <q-icon
          :name="isPwd ? 'visibility_off' : 'visibility'"
          class="cursor-pointer"
          @click="isPwd = !isPwd"
        />
      </template>
    </q-input>
    <q-input
      class="q-mt-md"
      v-model="password"
      prefix="Repeat Password:"
      filled
      :type="isPwd ? 'password' : 'text'"
    >
     <template v-slot:append>
        <q-icon
          :name="isPwd ? 'visibility_off' : 'visibility'"
          class="cursor-pointer"
          @click="isPwd = !isPwd"
        />
      </template>
    </q-input>
    <div class="column">
      <q-btn
        color="primary"
        label="Change Password"
        class="q-mt-xl col self-center"
      />
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
      password: ref(""),
      isPwd: ref(true),
    };
  },
});
</script>

<style lang="sass">
</style>