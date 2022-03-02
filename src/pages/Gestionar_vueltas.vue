<template>
  <q-page>
    <h5>Listado</h5>

    <q-table
      title="Ingresos"
      dense
      :rows="data.rows"
      :columns="data.columns"
      row-key="name"
      class="q-mb-md q-mt-md"
      :selected-rows-label="getSelectedString"
      selection="multiple"
      v-model:selected="selected"
      :filter="filter"
      :filter-method="customFilter"
    >
      <template v-slot:top>
        <div style="width: 100%" class="row justify-end">
          <div class="col-3">
            <q-input dense debounce="400" color="primary" v-model="data.search">
              <template v-slot:append>
                <q-icon name="search" />
              </template>
            </q-input>
          </div>
        </div>
      </template>
    </q-table>
    <div class="row justify-center">
      <q-input
        v-model.number="data.cantVueltas"
        min="0"
        type="number"
        filled
        class="col-6 q-ma-md"
        item-aligned
        :input-style="{ fontSize: '40px', textAlign: 'center' }"
      />
    </div>
    <div class="row">
      <q-btn
        color="primary"
        label="Retirar"
        class="col q-ma-md"
        @click="disminuirSaldo"
        v-if="data.rol === 'Encargado' || data.rol === 'Administrador'"
      />
      <q-btn
        color="primary"
        label="Ingresar"
        class="col q-ma-md"
        @click="aumentarSaldo"
        v-if="data.rol === 'Cajero' || data.rol === 'Administrador'"
      />
      <q-btn
        color="primary"
        label="Nuevo Cliente"
        class="col q-ma-md"
        @click="data.cardCreate = true"
        icon="group_add"
        v-if="data.rol === 'Cajero' || data.rol === 'Administrador'"
      />
      <q-dialog v-model="data.cardCreate">
        <q-card class="my-card">
          <q-card-section>
            <div class="text-h6">Nuevo Cliente</div>
          </q-card-section>

          <q-card-section>
            <div>
              <q-input
                v-model="data.nombreCliente"
                label="Nombre del Cliente"
                class="my-input"
                lazy-rules
                :rules="store.state.inputRules"
              />
              <q-input
                v-model="data.username"
                label="Nombre Usuario del Cajero"
                class="my-input"
                readonly
              />
            </div>
            <div class="row">
              <q-input
                v-model.number="data.cantVueltas"
                type="number"
                class="col my-input"
                item-aligned
                :input-style="{ fontSize: '20px', textAlign: 'center' }"
              />
              <q-input
                v-model.number="total"
                outlined
                class="col my-input"
                item-aligned
                :input-style="{ fontSize: '20px', textAlign: 'center' }"
              />
            </div>
          </q-card-section>

          <q-separator />

          <q-card-actions align="right">
            <q-btn
              v-close-popup
              flat
              color="primary"
              label="Crear"
              @click="Create"
            />
          </q-card-actions>
        </q-card>
      </q-dialog>
    </div>
  </q-page>
</template>

<script>
import { onMounted, onUpdated, onUnmounted } from "vue";
import { ref, inject, computed, reactive } from "vue";
import axios from "axios";
import { api } from 'boot/axios.js'
import moment from "moment";
import { getCurrentInstance } from "vue";
const instance = getCurrentInstance();

export default {
  setup() {
    const store = inject("store");
    const selected = ref([]);
    let data = reactive({
      columns: [
        {
          name: "id",
          required: true,
          label: "id",
          align: "left",
          field: (row) => row.name,
          format: (val) => `${val}`,
          sortable: true,
        },
        {
          name: "Fecha",
          align: "center",
          label: "Fecha",
          field: "Fecha",
          sortable: true,
        },
        {
          name: "NombreCliente",
          align: "center",
          label: "NombreCliente",
          field: "NombreCliente",
          sortable: true,
        },
        {
          name: "NombreTrabajador",
          align: "center",
          label: "NombreTrabajador",
          field: "NombreTrabajador",
          sortable: true,
        },
        {
          name: "VueltasRestantes",
          align: "center",
          label: "Vueltas Restantes",
          field: "VueltasRestantes",
          sortable: true,
        },
        {
          name: "Cantidad",
          align: "center",
          label: "Cantidad",
          field: "Cantidad",
          sortable: true,
        },
      ],
      rows: [],
      star: "",
      end: "",
      search: "",
      nombreCliente: "",
      fecha: "",
      precioServicio: 10,
      cantVueltas: 1,
      filterToggle: {
        breakfast: true,
      },
      cardCreate: false,
      rol: "Administrador",
      username: "",
      index: "",
      temp: 0,
    });

    onMounted(() => {
      sendGetRequest();
    });

    setInterval(function () {
      sendGetRequest();
    }, 1000);

    function sendGetRequest() {
      api
        .get("/api/clientes/$", {
          headers: {
            Authorization: "Bearer " + store.state.jwt,
          },
        })
        .then(function (response) {
          data.username = response.data.username;
          data.rol = response.data.role.name;
        })
        .catch(function (error) {
          console.log(error);
        });

      api
        .get("/api/ingresos", {
          headers: {
            Authorization: "Bearer " + store.state.jwt,
          },
        })
        .then(function (response) {
          console.log(data.rol);
          data.rows = [];
          for (let i = 0; i < response.data.data.length; i++) {
            console.log(response.data.data[i].attributes.VueltasRestantes);
            data.rows.push({
              name: response.data.data[i].id,
              NombreCliente: response.data.data[i].attributes.NombreCliente,
              NombreTrabajador:
                response.data.data[i].attributes.NombreTrabajador,
              Cantidad: response.data.data[i].attributes.Cantidad,
              VueltasRestantes:
                response.data.data[i].attributes.VueltasRestantes,
              Fecha: response.data.data[i].attributes.Fecha.split("-")
                .reverse()
                .join("-"),
              category: "breakfast",
            });
            if (
              response.data.data[i].attributes.VueltasRestantes == 0 &&
              data.rol == "Encargado"
            ) {
              console.log("true");
              data.rows.pop();
            }
          }
        })
        .catch(function (error) {
          console.log(error);
        });
    }

    let filter = computed(() => {
      return {
        search: data.search,
        breakfast: data.filterToggle.breakfast,
        // lunch: data.filterToggle.lunch,
        // dinner: data.filterToggle.dinner,
      };
    });

    let total = computed(() => {
      if (data.cantVueltas < 0) {
        data.cantVueltas = 0;
      }
      return data.cantVueltas * data.precioServicio;
    });

    function Create() {
      const d = new Date();
      data.fecha = d.toISOString();
      api
        .post("/api/ingresos", {
          data: {
            Fecha: data.fecha,
            NombreCliente: data.nombreCliente,
            NombreTrabajador: data.username,
            VueltasRestantes: data.cantVueltas,
            Cantidad: data.cantVueltas * data.precioServicio,
          },
          headers: {
            Authorization: "Bearer " + store.state.jwt,
          },
        })
        .then(function (response) {
          data.rows.forEach((element) => {
            if (element.name > data.temp) {
              data.temp = element.name;
            }
          });
          console.log(data.temp);
          data.rows.push({
            name: data.temp + 1,
            Fecha: data.fecha.substring(0, 10).split("-").reverse().join("-"),
            NombreCliente: data.nombreCliente,
            NombreTrabajador: data.username,
            VueltasRestantes: data.cantVueltas,
            Cantidad: data.cantVueltas * data.precioServicio,
            category: "breakfast",
          });
          data.cantVueltas = 1;
        })
        .catch(function (error) {
          console.log(error.response);
        });
    }

    function getDates(startDate, stopDate) {
      // var dateArray = data.rows;
      var currentDate = moment(startDate).format("DD-MM-YYYY");
      var stopDate = moment(stopDate).format("DD-MM-YYYY");
      data.rows.forEach((element) => {
        if (
          moment(element.Fecha).format("MM-DD-YYYY") >= currentDate &&
          moment(element.Fecha).format("MM-DD-YYYY") <= stopDate
        ) {
          element.category = "breakfast";
        } else {
          element.category = "";
        }
      });
    }

    function resetSearch() {
      data.rows.forEach((element) => {
        element.category = "breakfast";
      });
    }

    function customFilter(rows, terms) {
      // rows contain the entire data
      // terms contains whatever you have as filter

      const lowerSearch = terms.search ? terms.search.toLowerCase() : "";

      const filteredRows = rows.filter((row, i) => {
        let ans = false;
        //Gather toggle conditions
        let c1 = data.filterToggle.breakfast && row.category == "breakfast";
        // let c2 = data.filterToggle.lunch && row.category == "lunch"
        // let c3 = data.filterToggle.dinner && row.category == "dinner"

        //Gather search condition

        //Assume true in case there is no search
        let s1 = true;

        //If search term exists, convert to lower case and see which rows contain it
        if (lowerSearch != "") {
          s1 = false;
          //Get the values
          let s1_values = Object.values(row);
          //Convert to lowercase
          let s1_lower = s1_values.map((x) => x.toString().toLowerCase());

          for (let val = 0; val < s1_lower.length; val++) {
            if (s1_lower[val].includes(lowerSearch)) {
              s1 = true;
              break;
            }
          }
        }

        //assume row doesn't match
        ans = false;
        //check if any of the conditions match
        if (c1 && s1) {
          ans = true;
        }

        return ans;
      });

      return filteredRows;
    }

    function getSelectedString() {
      return selected.value.length === 0
        ? ""
        : `${selected.value.length} record${
            selected.value.length > 1 ? "s" : ""
          } selected of ${data.rows.length}`;
      log;
    }

    function aumentarSaldo() {
      selected.value.forEach(function (item, index, array) {
        data.rows.forEach((element) => {
          console.log(element);
          if (element.name === selected.value[index].name) {
            api
              .put(
                `/api/ingresos/${selected.value[index].name}`,
                {
                  headers: {
                    Authorization: "Bearer " + store.state.jwt,
                  },
                  data: {
                    VueltasRestantes:
                      element.VueltasRestantes + data.cantVueltas,
                    Cantidad:
                      element.Cantidad + data.precioServicio * data.cantVueltas,
                  },
                }
              )
              .then(function (response) {})
              .catch(function (error) {
                console.log(error);
              });
          }
        });
      });
      data.cantVueltas = 0;
    }

    function disminuirSaldo() {
      selected.value.forEach(function (item, index, array) {
        data.rows.forEach((element) => {
          if (element.name === selected.value[index].name) {
            if (element.VueltasRestantes - data.cantVueltas < 0) {
              api
                .put(
                  `/api/ingresos/${selected.value[index].name}`,
                  {
                    headers: {
                      Authorization: "Bearer " + store.state.jwt,
                    },
                    data: {
                      VueltasRestantes: 0,
                    },
                  }
                )
                .then(function (response) {})
                .catch(function (error) {
                  console.log(error);
                });
            } else {
              api
                .put(
                  `/api/ingresos/${selected.value[index].name}`,
                  {
                    headers: {
                      Authorization: "Bearer " + store.state.jwt,
                    },
                    data: {
                      VueltasRestantes:
                        element.VueltasRestantes - data.cantVueltas,
                    },
                  }
                )
                .then(function (response) {})
                .catch(function (error) {
                  console.log(error);
                });
            }
          }
        });
      });
      data.cantVueltas = 0;
    }

    return {
      store,
      data,
      selected,
      getSelectedString,
      aumentarSaldo,
      disminuirSaldo,
      customFilter,
      filter,
      getDates,
      resetSearch,
      total,
      Create,
    };
  },
};
</script>

<style lang="sass" scoped>
.my-card
  width: 100%
  max-width: 500px

.my-input
  width: 100%
  max-width: 200px
</style>