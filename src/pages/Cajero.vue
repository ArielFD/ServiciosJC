<template>
  <q-page>
    <h5>CAJERO</h5>
    <q-table
      title="Servicios"
      dense
      :rows="rows"
      :columns="columns"
      row-key="name"
      class="q-mb-md"
    />
    <span >Clientes Activos: 10</span>
    <div class="column justify-start items-center" style="height: 150px">
      <div class="col-4">
        <q-btn color="primary" label="Nuevo CLiente" class="col q-ma-md" />
      </div>
      <div class="col-4">
        <q-btn color="primary" label="Ver Clientes" class="col q-ma-md" />
      </div>
      <div class="col-4">
        <q-btn color="primary" label="Cierre del Dia" class="col q-ma-md" />
      </div>
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