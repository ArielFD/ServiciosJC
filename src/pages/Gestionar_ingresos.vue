<template>
  <q-page>
    <h5>Ingresos</h5>
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
      title="Rol"
      dense
      :rows="data.rows"
      :columns="data.columns"
      row-key="name"
      class="q-mb-md q-mt-md"
      :selected-rows-label="getSelectedString"
      selection="single"
      v-model:selected="selected"
      :filter="filter"
      :filter-method="customFilter"
    >
      <template v-slot:top>
        <div style="width: 100%" class="row justify-end">
          <div class="col" style="max-width: 300px">
            <q-input dense debounce="400" color="primary" v-model="data.search">
              <template v-slot:prepend>
                <q-icon name="search" />
              </template>
            </q-input>
          </div>
        </div>
      </template>
    </q-table>

    <q-field filled >
      <template v-slot:control>
        <div class="self-center full-width no-outline text-center text-h4 text-weight-bolder">
          {{data.total}}
        </div>
      </template>
    </q-field>
  </q-page>
</template>

<script>
import { onMounted, onUpdated, onUnmounted } from "vue";
import { ref, inject, computed, reactive,watch } from "vue";
import axios from "axios";
import { api } from 'boot/axios.js'
import moment from "moment";
import { Dialog } from "quasar";

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
      search:"",
      filterToggle: {
        breakfast: true,
      },
      total:0
    });

    onMounted(() => {
      api
        .get("/api/ingresos", {
          headers: {
            Authorization:
              "Bearer "+store.state.jwt,
              },
        })
        .then(function (response) {
          for (let i = 0; i < response.data.data.length; i++) {
            data.total+=response.data.data[i].attributes.Cantidad
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
          }
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

    watch(data,(newValue) => {
      data.total=0
      data.rows.forEach(element => {
        if(element.category=="breakfast"){
          data.total+=element.Cantidad
        }
      });
    })

    function getDates(startDate, stopDate) {
      var currentDate = moment(startDate).format("DD-MM-YYYY");
      var stopDate = moment(stopDate).format("DD-MM-YYYY");
      data.rows.forEach((element) => {
        const arr=element.Fecha.split("-")
        let temp=arr[0]
        arr[0]=arr[1]
        arr[1]=temp
        arr.join("-")
        console.log(moment(arr.join("-")));
        if (
          moment(arr.join("-")).format("DD-MM-YYYY") >= currentDate &&
          moment(arr.join("-")).format("DD-MM-YYYY") <= stopDate
        ) {
          element.category="breakfast"
        } else {
          element.category = "";
        }
      });
    }

    // function getDates(startDate, stopDate) {
    //   // var dateArray = data.rows;
    //   var currentDate = moment(startDate).format("DD-MM-YYYY");
    //   var stopDate = moment(stopDate).format("DD-MM-YYYY");
    //   data.rows.forEach((element) => {
    //     if (
    //       moment(element.Fecha).format("MM-DD-YYYY") >= currentDate &&
    //       moment(element.Fecha).format("MM-DD-YYYY") <= stopDate
    //     ) {
    //       element.category = "breakfast";
    //     } else {
    //       element.category = "";
    //     }
    //   });
    // }

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
      
    }

    return {
      store,
      data,
      selected,
      getSelectedString,
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