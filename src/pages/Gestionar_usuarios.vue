<template>
  <q-page>
    <h5>Usuarios</h5>
    <q-table
      title="Ingresos"
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
        color="positive"
        label="Create"
        class="col q-ma-md"
        @click="Create"
      />
      <q-btn
        label="Card"
        color="positive"
        @click="data.card = true"
        class="col q-ma-md"
      />
      <q-dialog v-model="data.card">
        <q-card class="my-card">
          <q-card-section>
          <div class="text-h6">Edit</div>
        </q-card-section>
        
          <q-card-section>
            <q-input v-model="data.username" label="Nombre de Usuario" />
            <q-input
              v-model="data.email"
              type="email"
              prefix="Email:"
              @keyup.enter="Edit"
            >
              <template v-slot:prepend>
                <q-icon name="mail" />
              </template>
            </q-input>
            <q-input
              class="q-mt-md"
              v-model="data.password"
              prefix="Password:"
              filled
              :type="data.isPwd ? 'password' : 'text'"
              @keyup.enter="Edit"
            >
              <template v-slot:append>
                <q-icon
                  :name="data.isPwd ? 'visibility_off' : 'visibility'"
                  class="cursor-pointer"
                  @click="data.isPwd = !data.isPwd"
                />
              </template>
            </q-input>
            <q-checkbox
              left-label
              v-model="data.confirmed"
              label="Confirmed?"
              checked-icon="task_alt"
              unchecked-icon="highlight_off"
            />
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
        color="positive"
        label="Delete"
        class="col q-ma-md"
        @click="Delete"
      />
    </div>
    <div class="row q-pa-md">
      <q-btn color="primary" label="Aceptar" class="col q-ma-md" />
      <q-btn color="primary" label="Cancelar" class="col q-ma-md" />
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
    const selected = ref([]);
    let data = reactive({
      columns: [
        {
          name: "UserName",
          required: true,
          label: "UserName",
          align: "left",
          field: (row) => row.name,
          format: (val) => `${val}`,
          sortable: true,
        },
        {
          name: "email",
          align: "center",
          label: "Email",
          field: "email",
          sortable: true,
        },
      ],
      rows: [],
      star: "",
      end: "",
      search: "",
      password: "",
      email: "",
      username: "",
      card: false,
      isPwd: false,
      confirmed: false,
      filterToggle: {
        breakfast: true,
      },
    });

    onMounted(() => {
      axios
        .get("http://localhost:1337/api/users", {
          headers: {
            Authorization:
              "Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MTEsImlhdCI6MTY0NDAzNDEyMiwiZXhwIjoxNjQ2NjI2MTIyfQ.ixzyJ6L19ctekhVbeqJNZ3Gw-9mp40lUAo6_UhLjMc8",
          },
        })
        .then(function (response) {
          for (let i = 0; i < response.data.length; i++) {
            data.rows.push({
              name: response.data[i].username,
              email: response.data[i].email,
              id: response.data[i].id,
              category: "breakfast",
            });
          }
        })
        .catch(function (error) {
          console.log(error);
        });
    });

    function Create() {
      axios
        .post("http://localhost:1337/api/users", {
          email: data.email,
          username: data.username,
          password: data.password,
          confirmed: data.confirmed,
          headers: {
            Authorization:
              "Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MTEsImlhdCI6MTY0NDQyNDQzNSwiZXhwIjoxNjQ3MDE2NDM1fQ.KcdGFK94K-7Hhh6XNhvTbk1jPZ0rlE_vOFdXis-9vps",
          },
        })
        .then(function (response) {
          console.log(response);
        })
        .catch(function (error) {
          console.log(error);
        });
    }

    function Delete(params) {
      axios
        .delete(`http://localhost:1337/api/users/${selected.value[0].id}`, {
          headers: {
            Authorization:
              "Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MTEsImlhdCI6MTY0NDQyNDQzNSwiZXhwIjoxNjQ3MDE2NDM1fQ.KcdGFK94K-7Hhh6XNhvTbk1jPZ0rlE_vOFdXis-9vps",
          },
        })
        .then(function (response) {
          console.log(response);
        })
        .catch(function (error) {
          console.log(error);
        });
    }

    function Edit(params) {
      axios
        .put(`http://localhost:1337/api/users/${selected.value[0].id}`, {
          headers: {
            Authorization:
              "Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MTEsImlhdCI6MTY0NDQyNDQzNSwiZXhwIjoxNjQ3MDE2NDM1fQ.KcdGFK94K-7Hhh6XNhvTbk1jPZ0rlE_vOFdXis-9vps",
          },
          email: data.email,
          username: data.username,
          password: data.password,
          confirmed: data.confirmed,
        })
        .then(function (response) {
          console.log(response);
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
      data,
      selected,
      getSelectedString,
      customFilter,
      filter,
      Create,
      Delete,
      Edit,
    };
  },
};
</script>

<style lang="sass">
</style>