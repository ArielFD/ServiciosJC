<template>
  <q-page>
    <h5>USUARIO</h5>
    <q-table
      title="Permisos de Sistema"
      dense
      :rows="rows"
      :columns="columns"
      row-key="name"
      class="q-mb-md"
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
const columns = [
  {
    name: "Nombre",
    required: true,
    label: "Nombre",
    align: "left",
    field: (row) => row.name,
    format: (val) => `${val}`,
    sortable: true,
  },
  {
    name: "Descripcion",
    align: "center",
    label: "Descripcion",
    field: "Descripcion",
    sortable: true,
  }
];

const rows = [
  {
    name: "User",
    Descripcion: 1
  },
  {
    name: "Cajero",
    Descripcion: 2
  },
  {
    name: "Encargado",
    Descripcion: 3
  },
  {
    name: "Administrador",
    Descripcion: 4
  }
];

export default {
  setup() {
    return {
      columns,
      rows,
    };
  },
};
</script>

<style lang="sass">
</style>