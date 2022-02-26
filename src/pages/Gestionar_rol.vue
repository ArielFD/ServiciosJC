<template>
  <q-page>
    <h5>Roles</h5>
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
    <div class="row q-pa-md">
      <q-btn
        color="primary"
        label="Crear"
        class="col q-ma-md"
        @click="data.cardCreate=true"
      />
      <q-dialog v-model="data.cardCreate">
        <q-card class="my-card">
          <q-card-section>
            <div class="text-h6">Crear Rol</div>
          </q-card-section>

          <q-card-section>
            <q-input v-model="data.nameRol" label="Nombre del Rol" class="my-input"/>
            <q-input v-model="data.descriptionRol"  label="Descripcion del Rol" autogrow />
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
      <q-btn
        label="Editar"
        color="primary"
        @click="editFields"
        class="col q-ma-md"
      />
      <q-dialog v-model="data.cardEdit">
        <q-card class="my-card">
          <q-card-section>
            <div class="text-h6">Editar Rol</div>
          </q-card-section>

          <q-card-section>
            <q-input v-model="data.nameRolEdit" label="Nombre del Rol" class="my-input"/>
            <q-input v-model="data.descriptionRolEdit"  label="Descripcion del Rol" autogrow />
          </q-card-section>

          <q-separator />

          <q-card-actions align="right">
            <q-btn
              v-close-popup
              flat
              color="primary"
              label="Edit"
              @click="Edit"
            />
          </q-card-actions>
        </q-card>
      </q-dialog>

      <q-btn
        color="primary"
        label="Eliminar"
        class="col q-ma-md"
        @click="Delete"
      />
    </div>
  </q-page>
</template>

<script>
import { onMounted, onUpdated, onUnmounted } from "vue";
import { ref, inject, computed, reactive } from "vue";
import axios from "axios";
import { Dialog } from "quasar";

export default {
  setup() {
    const store = inject("store");
    const selected = ref([]);
    let data = reactive({
      columns: [
        {
          name: "Rol",
          required: true,
          label: "Rol",
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
        },
      ],
      rows: [],
      search:"",
      nameRol: "",
      descriptionRol: "",
      nameRolEdit:"",
      descriptionRolEdit:"",
      cardCreate: false,
      cardEdit: false,
      isPwd: false,
      confirmed: false,
      filterToggle: {
        breakfast: true,
      },
    });

    onMounted(() => {
      axios
        .get("http://localhost:1337/api/users-permissions/roles", {
          headers: {
            Authorization: "Bearer " + store.state.jwt,
          },
        })
        .then(function (response) {
          console.log(response.data.roles[0].description);
          for (let i = 0; i < response.data.roles.length; i++) {
            data.rows.push({
              name: response.data.roles[i].name,
              Descripcion: response.data.roles[i].description,
              id: response.data.roles[i].id,
              category: "breakfast",
            });
          }
          console.log(data.rows);
        })
        .catch(function (error) {
          console.log(error);
        });
    });

    function editFields(params) {
      data.nameRolEdit=selected.value[0].name,
      data.descriptionRolEdit=selected.value[0].Descripcion,
      data.cardEdit=true
    }

    function Create() {
      axios
        .post("http://localhost:1337/api/users-permissions/roles", {
          name: data.nameRol,
          description: data.descriptionRol,
          headers: {
            Authorization: "Bearer " + store.state.jwt,
          },
        })
        .then(function (response) {
          console.log(response);
          data.rows.push(
            {
              name: data.nameRol,
              Descripcion: data.descriptionRol,
              id: "",
              category: "breakfast",
            }
          )
        })
        .catch(function (error) {
          console.log(error);
        });
    }

    function Delete(params) {
      axios
        .delete(
          `http://localhost:1337/api/users-permissions/roles/${selected.value[0].id}`,
          {
            headers: {
              Authorization: "Bearer " + store.state.jwt,
            },
          }
        )
        .then(function (response) {
          data.rows.forEach((element,index)=>{
            if(element===selected.value[0]){
              data.rows.splice(index,1)
            }
          })
        })
        .catch(function (error) {
          console.log(error);
        });
    }

    function Edit(params) {
      axios
        .put(
          `http://localhost:1337/api/users-permissions/roles/${selected.value[0].id}`,
          {
            headers: {
              Authorization: "Bearer " + store.state.jwt,
            },
            name: data.nameRolEdit,
            description: data.descriptionRolEdit,
          }
        )
        .then(function (response) {
          console.log(response);
          selected.value[0].name=data.nameRolEdit
          selected.value[0].Descripcion=data.descriptionRolEdit
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

    return {
      store,
      data,
      selected,
      getSelectedString,
      customFilter,
      filter,
      Create,
      Delete,
      Edit,
      editFields
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