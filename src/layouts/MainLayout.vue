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

    <q-drawer v-model="leftDrawerOpen" show-if-above bordered>
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
      <div class="row justify-center">
        <q-img
          src="~assets/Simpal.png"
          width='50%'
          max-width="360px"
        />
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
    title: "Editar Informacion",
    caption: "Editar Informacion",
    icon: "settings",
    link: "/editarinf",
  }
];

const linksListEncCaj = [
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
    onMounted(() => {
      console.log("mounted");
    });
    onUpdated(() => {
      console.log("update");
      console.log(router.currentRoute.value.path);
      axios
        .get(process.env.VUE_APP_URL+"/api/clientes/$", {
          headers: {
            Authorization: "Bearer " + store.state.jwt,
          },
        })
        .then(function (response) {
          console.log("respuesta",response);
          if (response.data.role.id === 3 && router.currentRoute.value.matched[1].path!="/") {
            console.log("id1",router.currentRoute.value);
            linksListAdmin.forEach((element) => {
              data.linkslist.unshift({
                title: element.title,
                caption: element.caption,
                icon: element.icon,
                link: element.link,
              });
            });
            if (data.linkslist.length > 6) data.linkslist.splice(0, 5);
          } else if (response.data.role.id === 1 && router.currentRoute.value.matched[1].path!="/") {
            console.log("id2",response.data.role.id);
            linksListAuth.forEach((element) => {
              data.linkslist.unshift({
                title: element.title,
                caption: element.caption,
                icon: element.icon,
                link: element.link,
              });
            });
            if (data.linkslist.length > 2) data.linkslist.splice(0, 1);
          }else if (response.data.role.id === 16 ||  response.data.role.id === 17 && router.currentRoute.value.matched[1].path!="/") {
            console.log("id2",response.data.role.id);
            linksListEncCaj.forEach((element) => {
              data.linkslist.unshift({
                title: element.title,
                caption: element.caption,
                icon: element.icon,
                link: element.link,
              });
            });
            if (data.linkslist.length > 3) data.linkslist.splice(0, 2);
          }
           else if (router.currentRoute.value.matched[1].path == "/") {
            data.linkslist.splice(0, data.linkslist.length-1);
            
          }
        })
        .catch(function (error) {
          console.log(error);
        });
    });
    onUnmounted(() => {
      console.log("unmounted");
    });
    // let filter = computed(() => {
    //   return {
    //     list:data.linkslist
    //     // lunch: data.filterToggle.lunch,
    //     // dinner: data.filterToggle.dinner,
    //   };
    // });

    // const interval = setInterval(function () {
    //   sendGetRequest();
    // }, 100000);

    const sendGetRequest = async () => {
      try {
        const resp = await axios
          .get(process.env.VUE_APP_URL+"/api/clientes/$", {
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
            }else if (response.data.role.id === 16 || response.data.role.id === 17) {
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
      console.log("newValue", newValue);
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
// .contenedor
//   background-color: #6667AB
</style>