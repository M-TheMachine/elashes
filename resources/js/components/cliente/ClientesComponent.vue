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
            <div class="col text-right" >
                <button type="button" class="btn btn-primary btn-lg"  @click="nuevo" data-backdrop="static" data-toggle="modal" data-target="#formCliente">Crear</button>
                <button type="button" v-if="user.rol == 'root' || user.rol == 'admin'" class="btn btn-primary btn-lg" data-toggle="modal" data-target="#importproducto">Importar</button>
                <a href="/exportClientes" v-if="user.rol == 'root' || user.rol == 'admin'" class="btn btn-primary btn-lg">Exportar</a>
                <!-- <button type="button" class="btn btn-primary btn-lg">Columnas</button> -->
            </div>
        </div>
        <div class="row align-content-center align-items-center  justify-content-between bg2">
            <!-- <div class="container">
                <div class="row  align-content-center align-items-center  justify-content-between"> -->
                    <div class="col">
                        <h1 class="titleh1 m-0">CLIENTES</h1>
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
                        <caption>Lista de Clientes ({{ datos.from }} - {{ datos.to }} de {{ datos.total }})</caption>
                        <thead>
                            <tr>
                                <th scope="col">Nombre</th>
                                <th scope="col">Fecha de creación</th>
                                <th scope="col">Fecha de ultimo servicio</th>
                                <th scope="col">CI</th>
                                <th scope="col">Servicios</th>
                                <th scope="col">Acción</th>

                            </tr>
                        </thead>
                        <tbody>
                            <tr v-for="(item,index) in datos.data" :key="'cli'+index">
                                <!-- <th scope="row">{{ index+1 }}</th> -->
                                <td>{{ item.nombre }}</td>
                                <td>{{ item.created_at | luxon }}</td>
                                <td> <span v-if="item.venta">{{ item.venta.created_at | luxon("yyyy-MM-dd HH:mm") }}</span> <span v-else>Sin ventas</span>  </td>
                                <td>{{ item.ci }}</td>
                                <td>{{ item.ventas_count }}</td>
                                <td>
                                    <a type="button" class="btn btn-primary btn-lg" :href="'/vercliente/'+item.id">
                                        <i class="bi bi-eye"></i>
                                    </a>
                                     <button type="button" class="btn btn-primary btn-lg" @click="editar(item)" data-backdrop="static" data-toggle="modal"  data-target="#formCliente">
                                        <i class="bi bi-pencil-square"></i>
                                    </button>
                                </td>
                            </tr>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
        <clientes-form-component></clientes-form-component>
        <div class="modal fade" id="importproducto" data-backdrop="static" data-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
            <form class="needs-validation" @submit.prevent="importarCliente" novalidate>
                <div class="modal-dialog">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title" id="staticBackdropLabel">Importar Clientes</h5>
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                            </button>
                        </div>
                        <div class="modal-body">
                            <div class="custom-file">
                                <input type="file" class="custom-file-input" id="customFile" @change="selectExcel" accept=".csv, application/vnd.openxmlformats-officedocument.spreadsheetml.sheet, application/vnd.ms-excel">
                                <label class="custom-file-label" for="customFile">Archivo excel</label>
                            </div>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-secondary" data-dismiss="modal">Cerrar</button>
                            <button type="submit" class="btn btn-primary">Importar</button>
                        </div>
                    </div>
                </div>
            </form>
        </div>
    </div>
</template>

<script>
    var a = 1;
    import { EventBus } from '../event-bus.js';
    export default {
        props:['usuario'],
        data() {
        return {
            textbuscar:'',
            datos:{},
            pageval:1,
            user:{},
            excelclientes:null
        };
        },
        mounted() {
            console.log('Component mounted.');
            this.getResults();
        },
        created(){
            this.user = JSON.parse(this.usuario);
            EventBus.$on('cliente-changed', newCounter => {
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
                axios.get('/cliente/?page=' + page+'&search='+this.textbuscar)
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
                        observaciones: item.observaciones,
                    };
                EventBus.$emit('cliente-edit', data);
            },
            toastedmensaje(mensaje){
                this.$toasted.global.my_app_car({
                    message : mensaje
                });
            },
            selectExcel(event){
                var input = event.target;
                // Ensure that you have a file before attempting to read it
                if (input.files && input.files[0]) {
                    this.excelclientes = input.files[0];
                }
            },
            importarCliente(){
                let loader = Vue.$loading.show({
                color: 'red'
                },{
                // slots
                });
                var formData = new FormData();
                formData.append("clientes_excel", this.excelclientes);
                axios.post('/importcl',formData, {
                    headers: {
                    'Content-Type': 'multipart/form-data'
                    }
                })
                .then( (response) => {
                    this.toastedmensaje(response.data.mensaje);
                    console.log(response);
                    // EventBus.$emit('servicio-changed', 'cambios');
                    loader.hide();
                })
                .catch( (error) => {
                    console.log(error);
                    loader.hide();
                });
            }
         }
    }
</script>
