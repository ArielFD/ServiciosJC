<template>
  <q-layout view="lHh Lpr lFf" class="red-color">
    <q-header elevated>
      <q-toolbar class="text-center">
        <q-btn
          flat
          dense
          round
          icon="menu"
          aria-label="Menu"
          @click="toggleLeftDrawer"
        />

        <q-toolbar-title> Joven Club Service </q-toolbar-title>

        <div></div>
      </q-toolbar>
    </q-header>

    <q-drawer v-model="leftDrawerOpen" show-if-above bordered>
      <q-list>
        <q-item-label header> Preferencias </q-item-label>

        <EssentialLink
          v-for="link in essentialLinks"
          :key="link.title"
          v-bind="link"
        />
      </q-list>
    </q-drawer>

    <q-page-container class="contenedor q-pa-md">
      <div class="row justify-center q-mt-xl">
        <q-avatar rounded color="primary" text-color="white">J</q-avatar>
      </div>
      <router-view />
    </q-page-container>
  </q-layout>
</template>

<script>
import EssentialLink from "components/EssentialLink.vue";

const linksListAdmin = [
  {
    title: "Editar Informacion",
    caption: "Editar Informacion",
    icon: "settings",
    link: "/editInf",
  },
  {
    title: "Gestionar vueltas",
    caption: "Gestionar vueltas",
    icon: "cached",
    link: "/editInf",
  },
  {
    title: "Gestionar Ingresos",
    caption: "Gestionar Ingresos",
    icon: "paid",
    link: "/editInf",
  },
  {
    title: "Gestionar Roles",
    caption: "Gestionar Roles",
    icon: "supervisor_account",
    link: "/editInf",
  },
  {
    title: "Gestionar Clientes",
    caption: "Gestionar Clientes",
    icon: "group_add",
    link: "/editInf",
  },
];

const linksListAuth = [
  {
    title: "Editar Informacion",
    caption: "Editar Informacion",
    icon: "settings",
    link: "/editInf",
  },
  {
    title: "Gestionar vueltas",
    caption: "Gestionar vueltas",
    icon: "cached",
    link: "/editInf",
  },
];

import { defineComponent, ref, reactive, computed, watch } from "vue";
import { onMounted, onUpdated, onUnmounted, inject } from "vue";
import axios from "axios";
import { useRouter, useRoute } from "vue-router";

export default defineComponent({
  name: "MainLayout",

  components: {
    EssentialLink,
  },

  setup() {
    const router = useRouter();
    const route = useRoute();
    const store = inject("store");
    const leftDrawerOpen = ref(false);
    let data = reactive({
      linkslist: [
        {
          title: "Cerrar Sesion",
          caption: "Cerrar Sesion",
          icon: "cancel",
          link: "/",
        },
      ],
      jwt: store.state.jwt,
    });
    // + store.state.jwt,
    onMounted(() => {});

    const interval = setInterval(function () {
      sendGetRequest();
    }, 5000);

    const sendGetRequest = async () => {
      try {
        const resp = await axios
          .get("http://localhost:1337/api/clientes", {
            headers: {
              Authorization: "Bearer " + store.state.jwt,
            },
          })
          .then(function (response) {
            console.log(response);
            if (response.data.role.id === 3) {
              linksListAdmin.forEach((element) => {
                data.linkslist.unshift({
                  title: element.title,
                  caption: element.caption,
                  icon: element.icon,
                  link: element.link,
                });
              });
              clearInterval(interval);
            } else if (response.data.role.id === 1) {
              linksListAuth.forEach((element) => {
                data.linkslist.unshift({
                  title: element.title,
                  caption: element.caption,
                  icon: element.icon,
                  link: element.link,
                });
              });
            }
            clearInterval(interval);
          })
          .catch(function (error) {
            console.log(error);
          });
      } catch (err) {
        // Handle Error Here
        console.log(err);
      }
    };

    return {
      data,
      essentialLinks: data.linkslist,
      leftDrawerOpen,
      toggleLeftDrawer() {
        leftDrawerOpen.value = !leftDrawerOpen.value;
      },
      sendGetRequest,
    };
  },
});
</script>

<style lang="sass">
// .contenedor
//   background-color: #6667AB
</style>