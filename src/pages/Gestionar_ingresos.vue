<template>
    <q-page>
        <h5>Administrador</h5>
        <div class="row">
        <q-input v-model="date" filled type="date" hint="Desde" class="col q-pa-xs q-mb-sm"/>
        <q-input v-model="date" filled type="date" hint="Hasta" class="col q-pa-xs q-mb-sm"/>
        </div>
      <q-table
      title="Servicios"
      dense
      :rows="rows"
      :columns="columns"
      row-key="name"
      class="q-mb-md q-mt-md"
    />
    <div class="column">
        <q-field borderless stack-label class="col self-center">
        <template v-slot:control>
          <div class="variable1 self-center full-width no-outline" tabindex="0" style="font-size: 32px">5000$</div>
        </template>
      </q-field>
      </div>
    <div class="row q-pa-md">
      <q-btn color="primary" label="Aceptar" class="col q-ma-md" />
      <q-btn color="primary" label="Cancelar" class="col q-ma-md" />
    </div>
    </q-page>
</template>

<script>
import { defineComponent,ref } from 'vue'
const columns = [
  {
    name: "Fecha",
    required: true,
    label: "Fecha",
    align: "center",
    field: (row) => row.name,
    format: (val) => `${val}`,
    sortable: true,
  },
  {
    name: "Clientes",
    required: true,
    label: "Clientes",
    field: "Clientes",
    align: "center",
    sortable: true,
  },
  {
    name: "Ingresos",
    align: "center",
    label: "Ingresos",
    field: "Ingresos",
    sortable: true,
  }
];

const rows = [
  {
    name: "01/30/2022",
    Clientes: 250,
    Ingresos: 2500
  },
  {
    name: "02/30/2022",
    Clientes: 250,
    Ingresos: 2500
  }
];
export default defineComponent({
    setup() {
        return {
      search: ref(''),
      columns,
      rows,
      date:ref('')
    }
    },
})
</script>

<style lang="sass">
//.variable1
//  font-size: 32px
</style>