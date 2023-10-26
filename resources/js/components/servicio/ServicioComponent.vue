<template>
    <div class="container-fluid">
        <div class="row justify-content-between align-items-center bg-black">
            <div class="col py-3">
                <form @submit.prevent="getResults">
                    <div class="input-group input-group-lg">
                        <input type="text" class="form-control" placeholder="" v-model="textbuscar" aria-label="" aria-describedby="button-addon2">
                        <div class="input-group-append">
                            <button class="btn btn-outline-secondary btn-primary" type="submit" id="button-sss">
                                <i class="bi bi-search"></i>
                            </button>
                        </div>
                    </div>
                </form>
            </div>

            <div class="col text-right">
                <button type="button" class="btn btn-primary btn-lg"  data-backdrop="static" data-toggle="modal" data-target="#formTecnica">Crear técnica</button>
                <button type="button" class="btn btn-primary btn-lg"  @click="nuevo" data-backdrop="static" data-toggle="modal" data-target="#formServicio">Crear</button>
            </div>
            
        </div>
        <div class="row align-content-center align-items-center  justify-content-between bg2">
            <!-- <div class="container">
                <div class="row  align-content-center align-items-center  justify-content-between"> -->
                    <div class="col">
                        <h1 class="titleh1 m-0">SERVICIOS</h1>
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
                        <caption>Lista de Servicios ({{ datos.from }} - {{ datos.to }} de {{ datos.total }})</caption>
                        <thead>
                            <tr>
                                <th scope="col">Categoria</th>
                                <th scope="col">Servicio</th>
                                <!-- <th scope="col">Técnica</th> -->
                                <th scope="col">Precio</th>
                                <th scope="col">Comisión</th>
                                <th scope="col">Acción</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr v-for="(item,index) in datos.data" :key="'ser'+index">
                                <!-- <th scope="row">{{ index+1 }}</th> -->
                                <td>{{ item.nombre2 }}</td>
                                <td>{{ item.nombre }}</td>
                                <!-- <td>{{ item.tecnica }}</td> -->
                                <td style="width:200px"> 
                                    <form @submit.prevent="actualizarPrecio(item)">
                                        <div class="input-group input-group-lg">
                                            <input type="text" class="form-control" placeholder="" aria-label="" v-model="item.precio">
                                            <div class="input-group-append">
                                                <button class="btn btn-outline-success btn-primary" id="button-sss" type="submit">
                                                    <i class="bi bi-check-square"></i>
                                                </button>
                                            </div>
                                        </div>
                                    </form>
                                    
                                    <!-- {{ item.precio }} -->
                                </td>
                                <td style="width:200px"> 
                                    <form @submit.prevent="actualizarComision(item)">
                                        <div class="input-group input-group-lg">
                                            <input type="text" class="form-control" placeholder="" aria-label="" v-model="item.comision">
                                            <div class="input-group-append">
                                                <button class="btn btn-outline-success btn-primary" id="button-sss" type="submit">
                                                    <i class="bi bi-check-square"></i>
                                                </button>
                                            </div>
                                        </div>
                                    </form>
                                    
                                    <!-- {{ item.precio }} -->
                                </td>
                                <td>
                                    <!-- <a type="button" class="btn btn-primary btn-lg" :href="'/vercliente/'+item.id">
                                        <i class="bi bi-eye"></i>
                                    </a> -->
                                     <button type="button" class="btn btn-primary btn-lg" @click="editar(item)" data-backdrop="static" data-toggle="modal"  data-target="#formServicio">
                                        <i class="bi bi-pencil-square"></i>
                                    </button>
                                    <button type="button" class="btn btn-primary btn-lg" @click="recordatorios(item)" data-backdrop="static" data-toggle="modal"  data-target="#recordatoriosview">
                                        <!-- <i class="bi bi-pencil-square"></i> -->
                                        Recordatorios
                                    </button>
                                </td>
                            </tr>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
        <tecnica-form-component></tecnica-form-component>
        <servicio-form-component></servicio-form-component>
        <recordatorio-form-component></recordatorio-form-component>
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
            EventBus.$on('servicio-changed', newCounter => {
                console.log(newCounter);
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
                axios.get('/servicio/?page=' + page+'&search='+this.textbuscar)
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
                EventBus.$emit('servicio-edit');
            },
            editar(item){
                let data = {
                    id:item.id,
                    nombre:item.nombre,
                    imagen:item.imagen,
                    precio:item.precio,
                    comision:item.comision,
                    codigo:item.codigo,
                    tecnica:item.tecnica,
                    promocion:item.promocion,
                    extra:item.extra,
                    estado:item.estado,
                    categoria_id:item.categoria_id,
                };
                EventBus.$emit('servicio-edit', data);
            },
            recordatorios(item){
                EventBus.$emit('recordatorio-view', item.id);
            },

            toastedmensaje(mensaje){
                this.$toasted.global.my_app_car({
                    message : mensaje
                });
            },

            actualizarPrecio(data){
                let loader = Vue.$loading.show({
                color: 'red'
                },{
                // slots
                });
                console.log("guardar");
                var formData = new FormData();

                formData.append("id", data.id);
                formData.append("nombre", data.nombre);
                formData.append("precio", data.precio);
                formData.append("comision", data.comision);
                formData.append("codigo", data.codigo);
                formData.append("estado", data.estado);
                formData.append("promocion", data.promocion ? 1 : 0);
                if (data.categoria_id) {
                    formData.append("categoria_id", data.categoria_id);
                }

                formData.append('_method', 'PUT');
                axios.post('/servicio/'+data.id, formData, {
                    headers: {
                    'Content-Type': 'multipart/form-data'
                    }
                })
                .then( (response) => {
                    this.toastedmensaje(response.data.mensaje);
                    console.log(response);
                    loader.hide();
                })
                .catch( (error) => {
                    this.toastedmensaje("Los datos proporcionados no son válidos");
                    console.log(error);
                    loader.hide();
                });
            },

            actualizarComision(data){
                let loader = Vue.$loading.show({
                color: 'red'
                },{
                // slots
                });
                console.log("guardar");
                var formData = new FormData();

                formData.append("id", data.id);
                formData.append("nombre", data.nombre);
                formData.append("precio", data.precio);
                formData.append("comision", data.comision);
                formData.append("codigo", data.codigo);
                formData.append("estado", data.estado);
                formData.append("promocion", data.promocion ? 1 : 0);
                if (data.categoria_id) {
                    formData.append("categoria_id", data.categoria_id);
                }

                formData.append('_method', 'PUT');
                axios.post('/servicio/'+data.id, formData, {
                    headers: {
                    'Content-Type': 'multipart/form-data'
                    }
                })
                .then( (response) => {
                    this.toastedmensaje(response.data.mensaje);
                    console.log(response);
                    loader.hide();
                })
                .catch( (error) => {
                    this.toastedmensaje("Los datos proporcionados no son válidos");
                    console.log(error);
                    loader.hide();
                });
            },
        }
    }
</script>
