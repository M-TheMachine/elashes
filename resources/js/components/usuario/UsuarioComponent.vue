<template>
    <div class="container-fluid">
        <div class="row justify-content-between align-items-center bg-black">
            <div class="col py-3">
                <form @submit.prevent="getResults">
                    <div class="input-group input-group-lg">
                        <input type="text" class="form-control" placeholder="" v-model="textbuscar" aria-label="" aria-describedby="button-addon2">
                        <div class="input-group-append">
                            <button class="btn btn-outline-secondary btn-primary" type="submit" id="button-addon2">
                                <i class="bi bi-search"></i>
                            </button>
                        </div>
                    </div>
                </form>
            </div>
            <div class="col text-right">
                <button type="button" class="btn btn-primary btn-lg"  @click="nuevo" data-toggle="modal" data-target="#formUsuario">Crear</button>
            </div>
        </div>
        <div class="row align-content-center align-items-center  justify-content-between bg2">
            <!-- <div class="container">
                <div class="row  align-content-center align-items-center  justify-content-between"> -->
                    <div class="col">
                        <h1 class="titleh1 m-0">USUARIOS</h1>
                    </div>
                    <div class="col text-right">
                        <div class="btn-group btn-group-lg" role="group" aria-label="Basic example">
                            <button type="button" class="btn btn-secondary" :disabled="datos.current_page == 1" @click="getResults(datos.current_page-1)">
                                <i class="bi bi-chevron-left"></i>
                            </button>
                            <button type="button" class="btn btn-secondary" :disabled="datos.current_page == datos.last_page" @click="getResults(datos.current_page+1)">
                                <i class="bi bi-chevron-right"></i>
                            </button>
                        </div>
                    </div>
                <!-- </div>
            </div> -->
        </div>
        <div class="row justify-content-center mt-3">
            <div class="col-12">
                <div class="table-responsive">
                    <table class="table table-bordered table-hover">
                        <caption>Lista de Sucursales ({{ datos.from }} - {{ datos.to }} de {{ datos.total }})</caption>
                        <thead>
                            <tr>
                                <th scope="col">Nombre</th>
                                <th scope="col">Fecha de creación</th>
                                <th scope="col">Rol</th>
                                <th scope="col">Sucursal</th>
                                <th scope="col">CI</th>
                                <th scope="col">Servicios</th>
                                <th scope="col">Acción</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr v-for="(item,index) in datos.data" :key="'ser'+index">
                                <td>{{ item.nombre }}</td>
                                <td>{{ item.created_at | luxon }}</td>
                                <td>{{ item.rol }}</td>
                                <td>
                                    <p v-for="(item,index) in item.sucursals" :key="'ss'+index">{{ item.nombre }}</p>
                                </td>
                                <td>{{ item.ci }}</td>
                                <td>{{ item.ventas_count }}</td>
                                <td>
                                    <a type="button" class="btn btn-primary btn-lg" :href="'/verusuario/'+item.id">
                                        <i class="bi bi-eye"></i>
                                    </a>
                                     <button type="button" class="btn btn-primary btn-lg" @click="editar(item)" data-toggle="modal"  data-target="#formUsuario">
                                        <i class="bi bi-pencil-square"></i>
                                    </button>
                                </td>
                            </tr>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
        <usuario-form-component></usuario-form-component>
    </div>
</template>

<script>
    var a = 1;
    import { EventBus } from '../event-bus.js';
    export default {
        data() {
        return {
            textbuscar:'',
            datos:{},
            pageval:1,
        };
        },
        mounted() {
            console.log('Component mounted.');
            this.getResults();
        },
        created(){
            EventBus.$on('usuario-changed', newCounter => {
                console.log(newCounter);
                // this.carrito = newCounter;
                this.getResults();
            });
        },
         methods: {

            getResults(page = 1) {
                // console.log("init get");
                let loader = Vue.$loading.show({
                    color: 'red'
                    },{
                    // slots
                    });
                axios.get('/usuario/?page=' + page+'&search='+this.textbuscar)
                    .then(response => {
                        console.log(response);
                        this.datos = response.data.data;
                        this.pageval = this.datos.current_page;
                        // if(a != 1){
                        //     $("#scrollUp").trigger("click");
                        // }
                        // a++;
                        loader.hide();
                    });
            },

            nuevo(){
                 EventBus.$emit('usuario-edit');
            },
            editar(item){
               let data = {
                    id:item.id,
                    nombre:item.nombre,
                    celular:item.celular,
                    ci:item.ci,
                    fecha_nacimiento:item.fecha_nacimiento,
                    username:item.username,
                    email:item.email,
                    password:'',
                    password_confirmation:'',
                    sucursals:item.sucursals,
                    rol:item.rol,
                    codigo:item.codigo,
                };
                EventBus.$emit('usuario-edit', data);
            },
            toastedmensaje(mensaje){
                this.$toasted.global.my_app_car({
                    message : mensaje
                });
            },
         }
    }
</script>
