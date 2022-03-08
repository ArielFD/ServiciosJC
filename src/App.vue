<template>
  <router-view v-on:click="handleActivity" v-on:mousemove="handleActivity" v-on:keyup="handleActivity"/>
</template>
<script>

import { defineComponent,provide } from 'vue';
import store from "./store"
import { onMounted, onUpdated, onUnmounted, inject } from "vue";
import socket from "./socket";
import { useRouter, useRoute } from "vue-router";

export default defineComponent({
  name: 'App',
  setup(){
    const router = useRouter();
    const route = useRoute();
    provide("store",store)
    provide("socket",socket)
    
    var idleTime = 0;
    var idleInterval = setInterval(timerIncrement, 30000);
    //v-on:scroll="handleScroll"
    function handleActivity(params) {
      idleTime=0
    }

    function timerIncrement() {
        idleTime = idleTime + 1;
        if (idleTime > 2) { // 10 minutes
            console.log("reload");
            router.push("/");
        }
    }

    onMounted(() => {
      store.methods.getToken()
      store.methods.getUser()
    })

    return{
      handleActivity,
      timerIncrement
    }
  }
})
</script>
