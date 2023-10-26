<template>
    <div class="container-fluid">
        <div class="row justify-content-between">
            <div class="col">
                <a href="javascript:history.go(-1)" class="btn btn-primary btn-lg">Volver</a>
                <button type="button" class="btn btn-primary btn-lg" @click="editar(data)" data-backdrop="static" data-toggle="modal" data-target="#formCliente">Editar</button>
                <button type="button" class="btn btn-primary btn-lg" @click="nuevo" data-backdrop="static" data-toggle="modal" data-target="#formCliente">Crear</button>
            </div>
            <div class="col text-right">
                <!-- <div class="btn-group btn-group-lg" role="group" aria-label="Basic example">
                    <button type="button" class="btn btn-secondary" :disabled="datos.current_page == 1" @click="getResults(datos.current_page-1)">
                        <i class="bi bi-chevron-left"></i>
                    </button>
                    <button type="button" class="btn btn-secondary" :disabled="datos.current_page == datos.last_page" @click="getResults(datos.current_page+1)">
                        <i class="bi bi-chevron-right"></i>
                    </button>
                </div> -->
            </div>
            <div class="col-12 text-left">
                <div class="card" style="width: 100%;">
                    <div class="card-body" v-if="data">
                        <h5 class="card-title">Cliente</h5>
                        <h6 class="card-subtitle mb-2 text-muted">Nombre: <span class="card-text">{{ data.nombre }}</span></h6>

                        <h6 class="card-subtitle mb-2 text-muted">Fecha de creación: <span class="card-text">{{ data.created_at | luxon("yyyy-MM-dd HH:mm") }}</span></h6>

                        <h6 class="card-subtitle mb-2 text-muted">Celular: <span class="card-text">{{ data.celular }}</span></h6>

                        <h6 class="card-subtitle mb-2 text-muted">CI: <span class="card-text">{{ data.ci }}</span></h6>

                        <h6 class="card-subtitle mb-2 text-muted">Fecha de nacimiento: <span class="card-text">{{ data.fecha_nacimiento }}</span></h6>
                        <h6 class="card-subtitle mb-2 text-muted">Correo electrónico: <span class="card-text">{{ data.email }}</span></h6>
                        <h6 class="card-subtitle mb-2 text-muted">Observaciones: <span class="card-text">{{ data.observaciones }}</span></h6>

                    </div>
                </div>
            </div>
        </div>
        <div class="row align-content-center align-items-center  justify-content-between mt-3">
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
                        <caption>Lista de clientes ({{ datos.from }} - {{ datos.to }} de {{ datos.total }})</caption>
                        <thead>
                            <tr>
                                <th scope="col">Servicio</th>
                                <th scope="col">Sucursal</th>
                                <th scope="col">Fecha de creacion</th>
                                <th scope="col">Total</th>
                                <th scope="col">Estado</th>
                                <th scope="col">Operador</th>

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
                                <td>{{ item.user ? item.user.nombre : 'Sin asignar' }}</td>
                            </tr>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
        <clientes-form-component></clientes-form-component>
        <servicio-form-component></servicio-form-component>
    </div>
</template>

<script>
    var a = 1;
    import { EventBus } from '../event-bus.js';
    export default {
        props:['id'],
        data() {
            return {
                data:{},
                textbuscar:'',
                datos:{},
                pageval:1,
            };
        },
        mounted() {
            console.log(this.id);
            console.log('Component mounted.');
            this.getcliente();
            this.getResults();
        },
        created(){
            EventBus.$on('cliente-changed', newCounter => {
                console.log(newCounter);
                // this.carrito = newCounter;
                this.getcliente();
            });
        },
         methods: {
            getcliente(){
                let loader = Vue.$loading.show({
                    color: 'red'
                    },{
                    // slots
                    });
                axios.get('/cliente/'+this.id)
                    .then(response => {
                        console.log(response);
                        this.data = response.data.data;
                        loader.hide();
                    });
            },
            getResults(page = 1) {
                console.log("init get");
                let loader = Vue.$loading.show({
                    color: 'red'
                    },{
                    // slots
                    });
                axios.get('/ventasCliente/?page=' + page+'&id='+this.id+'&search='+this.textbuscar)
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
                EventBus.$emit('cliente-edit');
            },
            editar(item){
                let data = {
                        id:item.id,
                        nombre:item.nombre,
                        ci:item.ci,
                        celular:item.celular,
                        fecha_nacimiento:item.fecha_nacimiento,
                        email:item.email,
                        observaciones:item.observaciones,
                    };
                EventBus.$emit('cliente-edit', data);
            }
         }
    }
</script>
