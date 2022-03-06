<template>
  <router-view />
</template>
<script>

import { defineComponent,provide } from 'vue';
import store from "./store"
import { onMounted, onUpdated, onUnmounted, inject } from "vue";
import socket from "./socket";

export default defineComponent({
  name: 'App',
  setup(){

    provide("store",store)
    
    onMounted(() => {
      store.methods.getToken()
      store.methods.getUser()
    })

    
  }
})
</script>
