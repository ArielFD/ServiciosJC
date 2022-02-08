<template>
    <q-page>
        <h5>CAJERO</h5>
        <q-input v-model="search" filled type="search" hint="Search">
        <template v-slot:append>
          <q-icon name="search" />
        </template>
      </q-input>
      <q-table
      title="Servicios"
      dense
      :rows="rows"
      :columns="columns"
      row-key="name"
      class="q-mb-md q-mt-md"
    />
    <div class="row q-pa-md">
      <q-btn color="positive" label="Create" class="col q-ma-md" />
      <q-btn color="positive" label="Edit" class="col q-ma-md" />
      <q-btn color="positive" label="Delete" class="col q-ma-md" />
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
    name: "Numero",
    required: true,
    label: "Numero",
    align: "center",
    field: (row) => row.name,
    format: (val) => `${val}`,
    sortable: true,
  },
  {
    name: "Nombre",
    required: true,
    label: "Nombre",
    field: "Nombre",
    align: "center",
    sortable: true,
  },
  {
    name: "Apellidos",
    align: "center",
    label: "Apellidos",
    field: "Apellidos",
    sortable: true,
  },{
    name: "CI",
    align: "center",
    label: "CI",
    field: "CI",
    sortable: true,
  },
  {
    name: "Solapin",
    align: "center",
    label: "Solapin",
    field: "Solapin",
    sortable: true,
  }
];

const rows = [
  {
    name: "1",
    Nombre: "Ariel",
    Apellidos: "Ferrera",
    CI: 92011529009,
    Solapin: 1012
  },
  {
    name: "2",
    Nombre: "Lais",
    Apellidos: "Cifontes",
    CI: 94042230893,
    Solapin: 1011
  }
];
export default defineComponent({
    setup() {
        return {
      search: ref(''),
      columns,
      rows,
    }
    },
})
</script>

<style lang="sass">

</style>