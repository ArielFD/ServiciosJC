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
        color="primary"
        label="Crear"
        class="col q-ma-md"
        @click="data.cardCreate = true"
      />
      <q-dialog v-model="data.cardCreate">
        <q-card class="my-card">
          <q-card-section>
            <div class="text-h6">Nuevo Usuario</div>
          </q-card-section>

          <q-card-section class="q-pa-sm">
            <q-input
              v-model="data.username"
              label="Nombre de Usuario"
              class="my-input"
              lazy-rules
              :rules="store.state.inputRules"
            />
            <q-input
              v-model="data.nombre"
              label="Nombre"
              class="my-input"
              lazy-rules
              :rules="store.state.inputRules"
            />
            <q-input
              v-model="data.apellidos"
              label="Apellidos"
              class="my-input"
              lazy-rules
              :rules="store.state.inputRules"
            />
            <q-input
              v-model="data.email"
              label="Email"
              lazy-rules
              :rules="store.state.emailRules"
            >
              <template v-slot:prepend>
                <q-icon name="mail" />
              </template>
            </q-input>
            <q-input
              ref="passRef"
              class="q-mt-md my-input"
              v-model="data.password"
              prefix="Password:"
              filled
              :type="data.isPwd ? 'password' : 'text'"
              lazy-rules
              :rules="store.state.passRules"
            >
              <template v-slot:append>
                <q-icon
                  :name="data.isPwd ? 'visibility_off' : 'visibility'"
                  class="cursor-pointer"
                  @click="data.isPwd = !data.isPwd"
                />
              </template>
            </q-input>
            <q-input
              v-model="data.ci"
              label="Carnet Identidad"
              class="my-input"
              :rules="[store.methods.myRule]"
            />
            <q-input
              v-model="data.telefono"
              label="Telefono"
              class="my-input"
              lazy-rules
              :rules="store.state.inputTelephone"
            />
            <q-input
              v-model="data.dirPart"
              label="Direccion Particular"
              lazy-rules
              :rules="store.state.inputRules"
            />
            <q-input
              v-model="data.noSolapin"
              label="No Solapin"
              class="my-input"
              lazy-rules
              :rules="store.state.inputRules"
            />
            <q-select
              filled
              v-model="data.rol"
              :options="data.option"
              label="Rol"
            />
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
            <div class="text-h6">Editar Usuario</div>
          </q-card-section>

          <q-card-section>
            <q-input
              v-model="data.usernameedit"
              label="Nombre de Usuario"
              class="my-input"
              lazy-rules
              :rules="store.state.inputRules"
            />
            <q-input
              v-model="data.nombreedit"
              label="Nombre"
              class="my-input"
              lazy-rules
              :rules="store.state.inputRules"
            />
            <q-input
              v-model="data.apellidosedit"
              label="Apellidos"
              class="my-input"
              lazy-rules
              :rules="store.state.inputRules"
            />
            <q-input
              v-model="data.emailedit"
              label="Email"
              lazy-rules
              :rules="store.state.emailRules"
            >
              <template v-slot:prepend>
                <q-icon name="mail" />
              </template>
            </q-input>
            <q-input
              v-model="data.ciedit"
              label="Carnet Identidad"
              class="my-input"
              :rules="[store.methods.myRule]"
            />
            <q-input
              v-model="data.telefonoedit"
              label="Telefono"
              class="my-input"
              lazy-rules
              :rules="store.state.inputTelephone"
            />
            <q-input
              v-model="data.dirPartedit"
              label="Direccion Particular"
              lazy-rules
              :rules="store.state.inputRules"
            />
            <q-input
              v-model="data.noSolapinedit"
              label="No Solapin"
              class="my-input"
              lazy-rules
              :rules="store.state.inputRules"
            />
            <q-select
              filled
              v-model="data.roledit"
              :options="data.option"
              label="Rol"
            />
          </q-card-section>

          <q-separator />

          <q-card-actions align="right">
            <q-btn
              v-close-popup
              flat
              color="primary"
              label="Cambiar Contraseña"
              @click="sendMail"
            />
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

      <q-dialog v-model="data.cardPass">
        <q-card class="my-card">
          <q-card-section>
            <div class="text-h6">Cambiar Contraseña</div>
          </q-card-section>

          <q-card-section>
            <q-input
              ref="passRef"
              class="q-mt-md my-input"
              v-model="data.newPass"
              prefix="Password:"
              filled
              :type="data.isPwd ? 'password' : 'text'"
              lazy-rules
              :rules="store.state.passRules"
            >
              <template v-slot:append>
                <q-icon
                  :name="data.isPwd ? 'visibility_off' : 'visibility'"
                  class="cursor-pointer"
                  @click="data.isPwd = !data.isPwd"
                />
              </template>
            </q-input>
          </q-card-section>

          <q-separator />

          <q-card-actions align="right">
            <q-btn
              v-close-popup
              flat
              color="primary"
              label="Cambiar Contraseña"
              @click="resetPass"
            />
          </q-card-actions>
        </q-card>
      </q-dialog>

      <q-btn
        color="primary"
        label="Delete"
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
import { useQuasar } from "quasar";

export default {
  setup() {
    const $q = useQuasar();
    const store = inject("store");
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
        {
          name: "name",
          align: "center",
          label: "Name",
          field: "name",
          sortable: true,
        },
        {
          name: "apellidos",
          align: "center",
          label: "Apellidos",
          field: "apellidos",
          sortable: true,
        },
        {
          name: "CI",
          align: "center",
          label: "CI",
          field: "CI",
          sortable: true,
        },
        {
          name: "Telefono",
          align: "center",
          label: "Telefono",
          field: "Telefono",
          sortable: true,
        },
        {
          name: "DirPart",
          align: "center",
          label: "DirPart",
          field: "DirPart",
          sortable: true,
        },
        {
          name: "NoSolapin",
          align: "center",
          label: "NoSolapin",
          field: "NoSolapin",
          sortable: true,
        },
        {
          name: "Rol",
          align: "center",
          label: "Rol",
          field: "Rol",
          sortable: true,
        },
      ],
      rows: [],
      search: "",

      password: "",
      email: "",
      username: "",
      nombre: "",
      apellidos: "",
      ci: "",
      telefono: "",
      dirPart: "",
      noSolapin: "",
      rol: "",
      rolId: "",

      options: [],
      option: [],

      emailedit: "",
      passwordedit: "",
      usernameedit: "",
      nombreedit: "",
      apellidosedit: "",
      ciedit: "",
      telefonoedit: "",
      dirPartedit: "",
      noSolapinedit: "",
      roledit: "",
      rolIdedit: "",

      newPass: "",
      token: "",
      cardPass: false,
      cardEdit: false,
      cardCreate: false,
      isPwd: true,
      confirmed: true,
      filterToggle: {
        breakfast: true,
      },
    });

    onMounted(() => {
      axios
        .get(process.env.VUE_APP_URL+"/api/clientes", {
          headers: {
            Authorization: "Bearer " + store.state.jwt,
          },
        })
        .then(function (response) {
          console.log(response);
          for (let i = 0; i < response.data.length; i++) {
            data.rows.push({
              name: response.data[i].username,
              email: response.data[i].email,
              nombre: response.data[i].Nombre,
              apellidos: response.data[i].Apellidos,
              CI: response.data[i].NoIdentidad,
              Telefono: response.data[i].Telefono,
              DirPart: response.data[i].DireccionParticular,
              NoSolapin: response.data[i].NoSolapin,
              Rol: response.data[i].role.name,
              id: response.data[i].id,
              category: "breakfast",
            });
            console.log(data.rows);
          }
        })
        .catch(function (error) {
          console.log(error);
        });

      axios
        .get(process.env.VUE_APP_URL+"/api/users-permissions/roles", {
          headers: {
            Authorization: "Bearer " + store.state.jwt,
          },
        })
        .then(function (response) {
          response.data.roles.forEach((element) => {
            data.option.push(element.name);
            data.options.push({
              name: element.name,
              id: element.id,
            });
          });
          console.log(data.options);
        })
        .catch(function (error) {
          console.log(error);
        });
    });

    async function sendMail() {
      data.cardPass = true;
      console.log(data.emailedit);
      await axios
        .post(process.env.VUE_APP_URL+"/api/auth/forgot-password", {
          email: data.emailedit, // user's email
        })
        .then((response) => {
          console.log("Your user received an email");
          store.state.alerts[1].message = "Enviado email de confirmacion!";
          $q.notify(store.state.alerts[1]);
          axios
            .get(process.env.VUE_APP_URL+"/api/clientes", {
              headers: {
                Authorization: "Bearer " + store.state.jwt,
              },
            })
            .then(function (response) {
              console.log(response);
              response.data.forEach((element) => {
                if (element.email === data.emailedit) {
                  data.token = element.resetPasswordToken;
                }
              });
            })
            .catch(function (error) {
              console.log(error);
            });
        })
        .catch((error) => {
          console.log("An error occurred:", error.response);
          store.state.alerts[0].message =
            "Error con el envio de emai de confirmacion!";
          $q.notify(store.state.alerts[0]);
        });
    }

    async function resetPass() {
      axios
        .post(process.env.VUE_APP_URL+"/api/auth/reset-password", {
          code: data.token,
          password: data.newPass,
          passwordConfirmation: data.newPass,
        })
        .then((response) => {
          console.log("Your user's password has been reset.");
          store.state.alerts[1].message = "Password Reiniciado!";
          $q.notify(store.state.alerts[1]);
        })
        .catch((error) => {
          console.log("An error occurred:", error.response);
          store.state.alerts[0].message = "Error con Reinicio de contraseña!";
          $q.notify(store.state.alerts[0]);
        });
    }

    function editFields(params) {
      (data.emailedit = selected.value[0].email),
        (data.usernameedit = selected.value[0].name),
        (data.nombreedit = selected.value[0].nombre),
        (data.apellidosedit = selected.value[0].apellidos),
        (data.ciedit = selected.value[0].CI),
        (data.telefonoedit = selected.value[0].Telefono),
        (data.dirPartedit = selected.value[0].DirPart),
        (data.roledit = selected.value[0].Rol),
        (data.noSolapinedit = selected.value[0].NoSolapin),
        (data.cardEdit = true);
    }

    function Create() {
      console.log(data.options);
      console.log(data.rol);
      data.options.forEach((element) => {
        if (data.rol == element.name) {
          data.rolId = element.id;
        }
      });
      axios
        .post(process.env.VUE_APP_URL+"/api/users", {
          email: data.email,
          username: data.username,
          password: data.password,
          confirmed: data.confirmed,
          Nombre: data.nombre,
          Apellidos: data.apellidos,
          NoIdentidad: data.ci,
          Telefono: data.telefono,
          DireccionParticular: data.dirPart,
          NoSolapin: data.noSolapin,
          role: {
            id: data.rolId,
          },
          headers: {
            Authorization: "Bearer " + store.state.jwt,
          },
        })
        .then(function (response) {
          console.log(response);
          data.rows.push({
            name: data.username,
            email: data.email,
            nombre: data.nombre,
            apellidos: data.apellidos,
            CI: data.ci,
            Telefono: data.telefono,
            DirPart: data.dirPart,
            NoSolapin: data.noSolapin,
            Rol: data.rol,
            id: "",
            category: "breakfast",
          });
        })
        .catch(function (error) {
          console.log(error.response);
        });
    }

    function Delete(params) {
      axios
        .delete(process.env.VUE_APP_URL+`/api/users/${selected.value[0].id}`, {
          headers: {
            Authorization: "Bearer " + store.state.jwt,
          },
        })
        .then(function (response) {
          data.rows.forEach((element, index) => {
            if (element === selected.value[0]) {
              data.rows.splice(index, 1);
            }
          });
        })
        .catch(function (error) {
          console.log(error);
        });
    }

    function Edit(params) {
      data.options.forEach((element) => {
        if (data.roledit == element.name) {
          data.rolIdedit = element.id;
        }
      });
      axios
        .put(process.env.VUE_APP_URL+`/api/users/${selected.value[0].id}`, {
          headers: {
            Authorization: "Bearer " + store.state.jwt,
          },
          email: data.emailedit,
          username: data.usernameedit,
          confirmed: data.confirmed,
          Nombre: data.nombreedit,
          Apellidos: data.apellidosedit,
          NoIdentidad: data.ciedit,
          Telefono: data.telefonoedit,
          DireccionParticular: data.dirPartedit,
          NoSolapin: data.noSolapinedit,
          role: {
            id: data.rolIdedit,
          },
        })
        .then(function (response) {
          console.log(response);
          selected.value[0].name = data.usernameedit;
          selected.value[0].email = data.emailedit;
          selected.value[0].nombre = data.nombreedit;
          selected.value[0].apellidos = data.apellidosedit;
          selected.value[0].CI = data.ciedit;
          selected.value[0].Telefono = data.telefonoedit;
          selected.value[0].DirPart = data.dirPartedit;
          selected.value[0].NoSolapin = data.noSolapinedit;
          selected.value[0].Rol = data.roledit;
        })
        .catch(function (error) {
          console.log(error.response);
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
      editFields,
      sendMail,
      resetPass,
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