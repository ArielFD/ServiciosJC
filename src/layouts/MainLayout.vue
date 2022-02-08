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

        <q-toolbar-title>
          Joven Club Service
        </q-toolbar-title>

        <div></div>
      </q-toolbar>
    </q-header>
    
    <q-drawer
      v-model="leftDrawerOpen"
      show-if-above
      bordered
    >
      <q-list>
        <q-item-label
          header
        >
          Preferencias
        </q-item-label>

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
import EssentialLink from 'components/EssentialLink.vue'

const linksList = [
  {
    title: 'Editar Informacion',
    caption: 'Editar Informacion',
    icon: 'school',
    link: '/editInf'
  },
  {
    title: 'Cerrar Sesion',
    caption: 'Cerrar Sesion',
    icon: 'code',
    link: '/'
  }
  
];

import { defineComponent, ref } from 'vue'

export default defineComponent({
  name: 'MainLayout',

  components: {
    EssentialLink
  },

  setup () {
    const leftDrawerOpen = ref(false)

    return {
      essentialLinks: linksList,
      leftDrawerOpen,
      toggleLeftDrawer () {
        leftDrawerOpen.value = !leftDrawerOpen.value
      }
    }
  }
})
</script>

<style lang="sass">
// .contenedor
//   background-color: #6667AB

</style>