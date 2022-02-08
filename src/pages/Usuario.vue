<template>
  <q-page>
    <h5>USUARIO</h5>
    <q-table
      title="Servicios"
      dense
      :rows="data.rows"
      :columns="data.columns"
      row-key="name"
      class="q-mb-md"
    />
    <span>Clientes Activos: 10</span>
  </q-page>
</template>

<script>
import { onMounted, onUpdated, onUnmounted } from "vue";
import { ref, inject, computed, reactive } from "vue";
import axios from "axios";
export default {
  setup() {
    let data = reactive({
      columns: [
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
        },
      ],
      rows: [],
    });

    onMounted(() => {
         axios
          .get("http://localhost:1337/api/usuarios", {
            headers: {
              Authorization:
                "Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MTEsImlhdCI6MTY0NDAzNDEyMiwiZXhwIjoxNjQ2NjI2MTIyfQ.ixzyJ6L19ctekhVbeqJNZ3Gw-9mp40lUAo6_UhLjMc8",
            },
          })
          .then(function (response) {
            console.log(response.data.data.length);
            for (let i = 0; i < response.data.data.length; i++) {
              data.rows.push({
                name: response.data.data[i].attributes.NombreServicio,
                Precio: response.data.data[i].attributes.PrecioServicio,
              });
            }
          })
          .catch(function (error) {
            console.log(error);
          });
      
    });

    return {
      data,
    };
  },
};
</script>

<style lang="sass">
</style>

