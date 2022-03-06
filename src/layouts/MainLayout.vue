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

        <q-toolbar-title> Simuladores Palacio </q-toolbar-title>

        <div></div>
      </q-toolbar>
    </q-header>

    <q-drawer v-model="leftDrawerOpen" show-if-above v-if="data.drawer">
      <q-list>
        <q-item-label header> Preferencias </q-item-label>

        <EssentialLink
          v-for="link in data.linkslist"
          :key="link.title"
          v-bind="link"
        />
      </q-list>
    </q-drawer>

    <q-page-container class="contenedor q-pa-md q-mt-md">
      <div class="row justify-center q-mb-md">
        <q-img src="~assets/Simpal.png" width="50%" style="max-width: 300px" />
      </div>
      <router-view/>
    </q-page-container>
  </q-layout>
</template>

<script>
import EssentialLink from "components/EssentialLink.vue";

const linksListAdmin = [
  {
    title: "Cerrar Sesion",
    caption: "Cerrar Sesion",
    icon: "cancel",
    link: "/",
  },
  {
    title: "Editar Informacion",
    caption: "Editar Informacion",
    icon: "settings",
    link: "/editarinf",
  },
  {
    title: "Gestionar vueltas",
    caption: "Gestionar vueltas",
    icon: "cached",
    link: "/gestionarvueltas",
  },
  {
    title: "Gestionar Ingresos",
    caption: "Gestionar Ingresos",
    icon: "paid",
    link: "/gestionaringresos",
  },
  {
    title: "Gestionar Roles",
    caption: "Gestionar Roles",
    icon: "supervisor_account",
    link: "/gestionarrol",
  },
  {
    title: "Gestionar Usuarios",
    caption: "Gestionar Usuarios",
    icon: "group_add",
    link: "/gestionarusuarios",
  },
];

const linksListAuth = [
  {
    title: "Cerrar Sesion",
    caption: "Cerrar Sesion",
    icon: "cancel",
    link: "/",
  },
  {
    title: "Editar Informacion",
    caption: "Editar Informacion",
    icon: "settings",
    link: "/editarinf",
  },
];

const linksListEncCaj = [
  {
    title: "Cerrar Sesion",
    caption: "Cerrar Sesion",
    icon: "cancel",
    link: "/",
  },
  {
    title: "Editar Informacion",
    caption: "Editar Informacion",
    icon: "settings",
    link: "/editarinf",
  },
  {
    title: "Gestionar vueltas",
    caption: "Gestionar vueltas",
    icon: "cached",
    link: "/gestionarvueltas",
  },
];

import { defineComponent, ref, reactive, computed, watch } from "vue";
import { onMounted, onUpdated, onUnmounted, inject } from "vue";
import axios from "axios";
import { api } from "boot/axios.js";
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
      linkslist: [],
      jwt: store.state.jwt,
      drawer: false,
    });
    // + store.state.jwt,

    onMounted(() => {
      api
        .get("/api/clientes/$", {
          headers: {
            Authorization: "Bearer " + store.state.jwt,
          },
        })
        .then(function (response) {
          console.log(response);
          if (
            response.data.role.id === 3 &&
            router.currentRoute.value.matched[1].path != "/"
          ) {
            data.drawer = true;
            linksListAdmin.forEach((element) => {
              data.linkslist.unshift({
                title: element.title,
                caption: element.caption,
                icon: element.icon,
                link: element.link,
              });
            });
            if (data.linkslist.length > 7) data.linkslist.splice(0, 6);
          } else if (
            response.data.role.id === 1 &&
            router.currentRoute.value.matched[1].path != "/"
          ) {
            data.drawer = true;
            linksListAuth.forEach((element) => {
              data.linkslist.unshift({
                title: element.title,
                caption: element.caption,
                icon: element.icon,
                link: element.link,
              });
            });
            if (data.linkslist.length > 3) data.linkslist.splice(0, 2);
          } else if (
            response.data.role.id === 16 ||
            (response.data.role.id === 17 &&
              router.currentRoute.value.matched[1].path != "/")
          ) {
            data.drawer = true;
            linksListEncCaj.forEach((element) => {
              data.linkslist.unshift({
                title: element.title,
                caption: element.caption,
                icon: element.icon,
                link: element.link,
              });
            });
            if (data.linkslist.length > 4) data.linkslist.splice(0, 3);
          } else if (router.currentRoute.value.matched[1].path == "/") {
            data.linkslist.splice(0, data.linkslist.length);
            localStorage.removeItem("jwt");
            store.state.jwt = null;
            if (store.state.user.rememberMe == false) {
              localStorage.removeItem("userData");
              store.state.user = null;
            }
            data.drawer = false;
          }
        })
        .catch(function (error) {
          console.log(error);
        });
    });
    onUpdated(() => {
      api
        .get("/api/clientes/$", {
          headers: {
            Authorization: "Bearer " + store.state.jwt,
          },
        })
        .then(function (response) {
          console.log(response);
          if (
            response.data.role.id === 3 &&
            router.currentRoute.value.matched[1].path != "/"
          ) {
            data.drawer = true;
            linksListAdmin.forEach((element) => {
              data.linkslist.unshift({
                title: element.title,
                caption: element.caption,
                icon: element.icon,
                link: element.link,
              });
            });
            if (data.linkslist.length > 7) data.linkslist.splice(0, 6);
          } else if (
            response.data.role.id === 1 &&
            router.currentRoute.value.matched[1].path != "/"
          ) {
            data.drawer = true;
            linksListAuth.forEach((element) => {
              data.linkslist.unshift({
                title: element.title,
                caption: element.caption,
                icon: element.icon,
                link: element.link,
              });
            });
            if (data.linkslist.length > 3) data.linkslist.splice(0, 2);
          } else if (
            response.data.role.id === 16 ||
            (response.data.role.id === 17 &&
              router.currentRoute.value.matched[1].path != "/")
          ) {
            data.drawer = true;
            linksListEncCaj.forEach((element) => {
              data.linkslist.unshift({
                title: element.title,
                caption: element.caption,
                icon: element.icon,
                link: element.link,
              });
            });
            if (data.linkslist.length > 4) data.linkslist.splice(0, 3);
          } else if (router.currentRoute.value.matched[1].path == "/") {
            data.linkslist.splice(0, data.linkslist.length);
            localStorage.removeItem("jwt");
            store.state.jwt = null;
            if (store.state.user.rememberMe == false) {
              localStorage.removeItem("userData");
              store.state.user = null;
            }
            data.drawer = false;
          }
        })
        .catch(function (error) {
          console.log(error);
        });
    });

    const sendGetRequest = async () => {
      try {
        const resp = await api
          .get("/api/clientes/$", {
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
            } else if (
              response.data.role.id === 16 ||
              response.data.role.id === 17
            ) {
              linksListEncCaj.forEach((element) => {
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

    watch(data.jwt, (newValue) => {
      sendGetRequest;
    });

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
.contenedor
  background-image: url("~assets/whatsapp.jpeg")
  // background-color: silver
//   background-image: radial-gradient(circle at 100% 150%, silver 24%, white 24%, white 28%, silver 28%, silver 36%, white 36%, white 40%, transparent 40%, transparent),radial-gradient(circle at 0    150%, silver 24%, white 24%, white 28%, silver 28%, silver 36%, white 36%, white 40%, transparent 40%, transparent),radial-gradient(circle at 50%  100%, white 10%, silver 10%, silver 23%, white 23%, white 30%, silver 30%, silver 43%, white 43%, white 50%, silver 50%, silver 63%, white 63%, white 71%, transparent 71%, transparent),radial-gradient(circle at 100% 50%, white 5%, silver 5%, silver 15%, white 15%, white 20%, silver 20%, silver 29%, white 29%, white 34%, silver 34%, silver 44%, white 44%, white 49%, transparent 49%, transparent),radial-gradient(circle at 0    50%, white 5%, silver 5%, silver 15%, white 15%, white 20%, silver 20%, silver 29%, white 29%, white 34%, silver 34%, silver 44%, white 44%, white 49%, transparent 49%, transparent)
//   background-size: 100px 50px
</style>