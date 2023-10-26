<template>
    <div class="container-fluid">
        <div class="row justify-content-between">
            <div class="col">
                <a href="javascript:history.go(-1)" class="btn btn-primary btn-lg">Volver</a>
                <button type="button" class="btn btn-primary btn-lg" @click="editar(data)" data-toggle="modal" data-target="#formUsuario">Editar</button>
                <button type="button" class="btn btn-primary btn-lg" @click="nuevo" data-toggle="modal" data-target="#formUsuario">Crear</button>
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
            <div class="col-12 text-left">
                <div class="card" style="width: 100%;">
                    <div class="card-body" v-if="data">
                        <div class="row">
                            <div class="col-md-6">
                                <h5 class="card-title">Usuario</h5>
                                <h6 class="card-subtitle mb-2 text-muted">Nombre:</h6>
                                <p class="card-text">{{ data.nombre }}</p>
                                <h6 class="card-subtitle mb-2 text-muted">Fecha de creación:</h6>
                                <p class="card-text">{{ data.created_at | luxon}}</p>
                                <h6 class="card-subtitle mb-2 text-muted">Celular:</h6>
                                <p class="card-text">{{ data.celular }}</p>
                                <h6 class="card-subtitle mb-2 text-muted">CI:</h6>
                                <p class="card-text">{{ data.ci }}</p>
                            </div>
                            <div class="col-md-6">
                                <h6 class="card-subtitle mb-2 text-muted">Fecha de nacimiento:</h6>
                                <p class="card-text">{{ data.fecha_nacimiento }}</p>
                                <h6 class="card-subtitle mb-2 text-muted">Rol:</h6>
                                <p class="card-text">{{ data.rol }}</p>
                                <h6 class="card-subtitle mb-2 text-muted">Email:</h6>
                                <p class="card-text">{{ data.email }}</p>
                                <h6 class="card-subtitle mb-2 text-muted">Sucursal:</h6>
                                <p class="card-text">
                                    <span v-for="(item,index) in data.sucursals" :key="'ss'+index">({{ item.nombre }}) </span>
                                </p>
                            </div>
                        </div>


                    </div>
                </div>
            </div>
        </div>
        <div class="row justify-content-center mt-3">
            <div class="col">
                <h4 class="text-white">Servicios</h4>
            </div>
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
                <div class="btn-group btn-group-lg" role="group" aria-label="Basic example">
                    <button type="button" class="btn btn-secondary" :disabled="datos.current_page == 1" @click="getResults(datos.current_page-1)">
                        <i class="bi bi-chevron-left"></i>
                    </button>
                    <button type="button" class="btn btn-secondary" :disabled="datos.current_page == datos.last_page" @click="getResults(datos.current_page+1)">
                        <i class="bi bi-chevron-right"></i>
                    </button>
                </div>
            </div>
            <div class="col-12">
                <div class="table-responsive">
                    <table class="table table-hover">
                        <caption>Lista de usuarios ({{ datos.from }} - {{ datos.to }} de {{ datos.total }})</caption>
                        <thead>
                            <tr>
                                <th scope="col">Servicio</th>
                                <th scope="col">Sucursal</th>
                                <th scope="col">Fecha de creacion</th>
                                <th scope="col">Total</th>
                                <th scope="col">Estado</th>
                                <th scope="col">Cliente</th>

                            </tr>
                        </thead>
                        <tbody>
                            <tr v-for="(item,index) in datos.data" :key="'cli'+index">
                                <!-- <th scope="row">{{ index+1 }}</th> -->
                                <td>{{ item.servicio.nombre }}</td>
                                <td>{{ item.sucursal.nombre }}</td>
                                <td>{{ item.created_at | luxon("yyyy-MM-dd HH:mm") }}</td>
                                <td>{{ item.total }}</td>
                                <td>{{ item.estado }}</td>
                                <td>{{ item.cliente.nombre }}</td>
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
        props:['id'],
        data() {
            return {
                data: {
                    id:'',
                    nombre:'',
                    celular:'',
                    ci:'',
                    fecha_nacimiento:'',
                    username:'',
                    email:'',
                    password:'',
                    password_confirmation:'',
                    sucursal_id:'',
                    rol:'',
                },
                textbuscar:'',
                datos:{},
                pageval:1,
            };
        },
        mounted() {
            console.log(this.id);
            console.log('Component mounted.');
            this.getdata();
            this.getResults();
        },
        created(){
            EventBus.$on('usuario-changed', newCounter => {
                console.log(newCounter);
                // this.carrito = newCounter;
                this.getdata();
            });
        },
         methods: {
            getdata(){
                let loader = Vue.$loading.show({
                    color: 'red'
                    },{
                    // slots
                    });
                axios.get('/usuario/'+this.id)
                .then(response => {
                    console.log(response);
                    this.data = response.data.data;
                    loader.hide();
                });
            },
            getResults(page = 1) {
                // console.log("init get");
                let loader = Vue.$loading.show({
                    color: 'red'
                },{
                    // slots
                });
                axios.get('/getserviciosusuario/?page=' + page+'&id='+this.id+'&search='+this.textbuscar)
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
                    sucursal_id:item.sucursal_id,
                    rol:item.rol,
                };
                EventBus.$emit('usuario-edit', data);
            },
         }
    }
</script>
