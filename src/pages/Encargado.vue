<template>
  <q-page>
    <h5>USUARIO</h5>
    <q-table
      title="Servicios"
      dense
      :rows="rows"
      :columns="columns"
      row-key="name"
      class="q-mb-md"
    />
    <span >Clientes Activos: 10</span>
    <div class="column">
      <q-btn color="primary" label="Ver Clientes" class="q-mt-xl col self-center" />
    </div>
  </q-page>
</template>

<script>
const columns = [
  {
    name: "Servicios Activos",
    required: true,
    label: "Servicios Activos",
    align: "left",
    field: (row) => row.name,
    format: (val) => `${val}`,
    sortable: true,
  },
  {
    name: "Precio",
    align: "center",
    label: "Precio",
    field: "Precio",
    sortable: true,
  }
];

const rows = [
  {
    name: "Carros",
    Precio: 159
  },
  {
    name: "Motos",
    Precio: 237
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