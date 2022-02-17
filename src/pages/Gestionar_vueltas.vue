<template>
  <q-page>
    <h5>{{ $route.name }}</h5>
    <div class="row ">
      <q-input
        v-model="data.star"
        filled
        type="date"
        hint="Desde"
        class="col q-pa-xs q-mb-sm"
      />
      <q-input
        v-model="data.end"
        filled
        type="date"
        hint="Hasta"
        class="col q-pa-xs q-mb-sm"
      />
      <div class="q-pa-md q-gutter-sm">
      <q-btn flat round color="primary" icon="search" @click="getDates(data.star,data.end)"/>
      <q-btn flat round color="primary" icon="cached" @click="resetSearch"/>
      </div>
    </div>
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
        type="number"
        filled
        class="col-6 q-ma-md"
        item-aligned
        :input-style="{ fontSize: '40px', textAlign:'center' }"
      />
    </div>
    <div class="row">
      <q-btn
        color="primary"
        label="Retirar"
        class="col q-ma-md"
        @click="disminuirSaldo"
      />
      <q-btn
        color="primary"
        label="Ingresar"
        class="col q-ma-md"
        @click="aumentarSaldo"
      />
    </div>
  </q-page>
</template>

<script>
import { onMounted, onUpdated, onUnmounted } from "vue";
import { ref, inject, computed, reactive } from "vue";
import axios from "axios";
import moment from "moment";

export default {
  setup() {
    const store = inject("store");
    const selected = ref([]);
    let data = reactive({
      columns: [
        {
          name: "Fecha",
          required: true,
          label: "Fecha",
          align: "left",
          field: (row) => row.name,
          format: (val) => `${val}`,
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
      precioServicio: 10,
      cantVueltas: 1,
      filterToggle: {
        breakfast: true,
      },
    });

    onMounted(() => {
      axios
        .get("http://localhost:1337/api/ingresos", {
          headers: {
            Authorization:
              "Bearer "+store.state.jwt,
          },
        })
        .then(function (response) {
          for (let i = 0; i < response.data.data.length; i++) {
            data.rows.push({
              name: response.data.data[i].attributes.Fecha.split("-")
                .reverse()
                .join("-"),
              NombreCliente: response.data.data[i].attributes.NombreCliente,
              NombreTrabajador:
                response.data.data[i].attributes.NombreTrabajador,
              Cantidad: response.data.data[i].attributes.Cantidad,
              id: response.data.data[i].id,
              category: "breakfast",
            });
          }
          console.log(data.rows);
        })
        .catch(function (error) {
          console.log(error);
        });
    });

    let filter = computed(() => {
      return {
        search: data.search,
        breakfast: data.filterToggle.breakfast,
        // lunch: data.filterToggle.lunch,
        // dinner: data.filterToggle.dinner,
      };
    });

    function getDates(startDate, stopDate) {
      // var dateArray = data.rows;
      console.log(data.rows);
      var currentDate = moment(startDate).format("DD-MM-YYYY");
      var stopDate = moment(stopDate).format("DD-MM-YYYY");
      console.log("asd",startDate);
      data.rows.forEach((element) => {
        if (
          moment(element.name).format("MM-DD-YYYY") >= currentDate &&
          moment(element.name).format("MM-DD-YYYY") <= stopDate
        ) {
          console.log("true");
          element.category ="breakfast"
        } else {
          element.category ="";
        }
        
      });
    }

    function resetSearch(){
      data.rows.forEach(element => {
        element.category="breakfast"
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
        axios
          .put(
            `http://localhost:1337/api/ingresos/${selected.value[index].id}`,
            {
              headers: {
                Authorization:
                  "Bearer "+store.state.jwt,
                  },
              data: {
                Cantidad:
                  selected.value[index].Cantidad +
                  data.precioServicio * data.cantVueltas,
              },
            }
          )
          .then(function (response) {
            console.log(response);
            data.rows.forEach((item) => {
              if (item.id == selected.value[index].id) {
                item.Cantidad += data.precioServicio * data.cantVueltas;
              }
            });
          })
          .catch(function (error) {
            console.log(error);
          });
      });
    }

    function disminuirSaldo() {
      selected.value.forEach(function (item, index, array) {
        axios
          .put(
            `http://localhost:1337/api/ingresos/${selected.value[index].id}`,
            {
              headers: {
                Authorization:
                  "Bearer "+store.state.jwt,
                  },
              data: {
                Cantidad:
                  selected.value[index].Cantidad -
                  data.precioServicio * data.cantVueltas,
              },
            }
          )
          .then(function (response) {
            console.log(response);
            data.rows.forEach((item) => {
              if (item.id == selected.value[index].id) {
                item.Cantidad -= data.precioServicio * data.cantVueltas;
              }
            });
          })
          .catch(function (error) {
            console.log(error);
          });
      });
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
      resetSearch
    };
  },
};
</script>

<style lang="sass">
</style>