<template>
  <q-page>
    <h5>Servicios</h5>
    <q-table
      title="Servicios"
      dense
      :rows="data.rows"
      :columns="data.columns"
      row-key="name"
      class="q-mb-md"
    />
  </q-page>
</template>

<script>
import { onMounted, onUpdated, onUnmounted } from "vue";
import { ref, inject, computed, reactive } from "vue";
import axios from "axios";

export default {
  setup() {
    const store = inject("store");
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
      jwt: store.state.jwt,
    });

    onMounted(() => {
      sendGetRequest();
    });

    const sendGetRequest = async () => {
      try {
        const resp = await axios
          .get(process.env.VUE_APP_URL+"/api/servicios", {
            headers: {
              Authorization: "Bearer " + store.state.jwt,
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
      } catch (err) {
        // Handle Error Here
        console.log(err);
      }
    };

    return {
      data,
      sendGetRequest,
    };
  },
};
</script>

<style lang="sass">
</style>

