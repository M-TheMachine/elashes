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
            <!-- <div class="col text-right">
                <a href="/exportVentas" class="btn btn-primary btn-lg">EXPORTAR</a>
                <a href="/nuevaventa" class="btn btn-primary btn-lg">Crear</a>
            </div> -->
            <!-- <div class="col-12">
                <div class="form-row">
                    <div class="form-group col-6">
                        <label for="f_ini" class="text-white">INICIO</label>
                        <div class="input-group">
                            <input type="date" v-model="f_ini" @input="getResults()" class="form-control" id="f_ini">
                            <div class="input-group-append">
                                <button class="btn btn-outline-secondary" type="button" @click="f_ini='';getResults()">X</button>
                            </div>
                        </div>

                    </div>
                    <div class="form-group col-6">
                        <label for="f_fin" class="text-white">FIN</label>
                        <div class="input-group">
                            <input type="date" v-model="f_fin" @input="getResults()" class="form-control" id="f_fin">
                            <div class="input-group-append">
                                <button class="btn btn-outline-secondary" type="button" @click="f_fin='';getResults()">X</button>
                            </div>
                        </div>

                    </div>
                </div>
            </div> -->
        </div>
        <div class="row align-content-center align-items-center  justify-content-between bg2">
            <!-- <div class="container">
                <div class="row  align-content-center align-items-center  justify-content-between"> -->
                    <div class="col">
                        <h1 class="titleh1 m-0">RECORDATORIOS</h1>
                    </div>
                    <div class="col text-right">
                        <!-- <button data-toggle="modal" data-backdrop="static" data-target="#confirmacionModalCenter" class="btn btn-primary btn-lg">Guardar</button> -->
                        <div class="btn-group btn-group-lg" role="group" aria-label="Basic example">
                            <button type="button" class="btn btn-secondary" :disabled="datos.current_page == 1" @click="getResults(datos.current_page-1)">
                                <i class="bi bi-chevron-left"></i>
                            </button>
                            <button type="button" class="btn btn-secondary" :disabled="datos.current_page == datos.last_page" @click="getResults(datos.current_page+1)">
                                <i class="bi bi-chevron-right"></i>
                            </button>
                        </div>
                        <div  role="toolbar" aria-label="Toolbar with button groups">
                            <div class="btn-group mt-2" role="group" aria-label="First group">
                                <button type="button" class="btn btn-secondary" v-bind:class="{ active: estado == '1'}" @click="cambiarestado(1)">Recordado</button>
                                <button type="button" class="btn btn-secondary" v-bind:class="{ active: estado == '0'}" @click="cambiarestado(0)">Pendiente</button>
                                <button type="button" class="btn btn-secondary" v-bind:class="{ active: estado == 'todos'}" @click="cambiarestado('todos')">Todos</button>
                            </div>
                        </div>
                    </div>
                <!-- </div>
            </div> -->
        </div>
        <div class="row justify-content-center mt-3">
            <div class="col-12">
                <div class="table-responsive">
                    <table class="table table-bordered table-hover">
                        <caption>Lista de ventas ({{ datos.from }} - {{ datos.to }} de {{ datos.total }})</caption>
                        <thead>
                            <tr>
                                <!-- <th scope="col">Ficha</th> -->
                                <th scope="col">Servicio</th>
                                <th scope="col">Cliente</th>
                                <th scope="col">Fecha del servicio</th>
                                <th scope="col">Fecha a Recordar</th>
                                <th scope="col">Recordatorio</th>
                                <th scope="col">Recordado</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr v-for="(item,index) in datos.data" :key="'rec'+index">
                                <!-- <td>{{ item.venta.ficha }}</td> -->
                                <td>{{ item.venta.servicio.nombre }}</td>
                                <td>{{ item.venta.cliente.nombre }}</td>
                                <!-- <td>{{ item.venta.total }}</td> -->
                                <td>{{ item.venta.created_at | luxon("yyyy-MM-dd") }}</td>
                                <td>{{ item.fecha }}</td>
                                <td>
                                    <p class="m-0">
                                        {{ item.recordatorio.nombre }}
                                    </p>
                                    <p class="m-0">
                                        {{ item.recordatorio.mensaje }}
                                    </p>

                                </td>
                                <td>

                                    <input class="w3-check m-2" type="checkbox" @change="checkrecordatorio(item)" v-model="item.recordado" checked>

                                    <!-- <label class="switch">
                                        <input type="checkbox" @change="checkrecordatorio(item)" v-model="item.recordado" checked>
                                        <span class="slider round"></span>
                                    </label> -->
                                    <a name="whatsapp" id="whatsapp" class="btn btn-primary" :href="'https://wa.me/591'+item.venta.cliente.celular+'?text='+item.recordatorio.mensaje" target="_blank" role="button">
                                        <i class="bi bi-whatsapp"></i>
                                    </a>
                                </td>
                            </tr>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>
</template>

<script>
    var a = 1;
    import { EventBus } from '../event-bus.js';
    // require('../error-val');
    export default {
        data() {
        return {
            optionsEstados: ['aceptado','anulado'],
            textbuscar:'',
            datos:{},
            pageval:1,
            f_ini:'',
            f_fin:'',
            estado:'todos',
        };
        },
        mounted() {
            console.log('Component mounted.');
        },
        created(){
            this.getResults();
        },
         methods: {
            cambiarestado(estado){
                this.estado = estado;
                this.getResults();
            },
            getResults(page = 1) {
                console.log("reload data");
                // console.log("init get");
                let loader = Vue.$loading.show({
                    color: 'red'
                    },{
                    // slots
                    });
                axios.get('/recordatorioventa/?page=' + page+'&search='+this.textbuscar+'&f_ini='+this.f_ini+'&f_fin='+this.f_fin+'&estado='+this.estado)
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
            checkrecordatorio(data){
                console.log(data);
                let loader = Vue.$loading.show({
                color: 'red'
                },{
                // slots
                });
                console.log("guardar");
                var formData = new FormData();
                // formData.append("id", data.id);
                formData.append("recordado", data.recordado ? 1 : 0);
                formData.append('_method', 'PUT');
                axios.post('/recordatorioventa/'+data.id, formData)
                    .then( (response) => {
                        console.log(response);
                        this.toastedmensaje(response.data.mensaje);
                        // if(response.data.mensaje == 'Recordatorio actualizadas correctamente'){
                        //     this.getResults();
                        // }
                        loader.hide();
                    })
                    .catch((error) => {
                        this.errors.record(error.response.data);
                        loader.hide();
                        this.toastedmensaje("Los datos proporcionados no son válidos");
                    });
            },
            toastedmensaje(mensaje){
                this.$toasted.global.my_app_car({
                    message : mensaje
                });
            },
         }
    }
</script>
