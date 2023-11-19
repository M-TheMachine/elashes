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
                <button type="button" class="btn btn-primary btn-lg"  @click="nuevo" data-backdrop="static" data-toggle="modal" data-target="#formCategoria">Crear</button>
            </div>
        </div>
        <div class="row align-content-center align-items-center  justify-content-between bg2">
            <!-- <div class="container">
                <div class="row  align-content-center align-items-center  justify-content-between"> -->
                    <div class="col">
                        <h1 class="titleh1 m-0">CATEGORÍAS</h1>
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
                        <thead>
                            <tr>
                                <th scope="col">Nombre</th>
                                <th scope="col">Acción</th>

                            </tr>
                        </thead>
                        <tbody>
                            <tr v-for="(item,index) in datos.data" :key="'cli'+index">
                                <td>{{ item.nombre2 }}</td>
                                <td>
                                    <!-- <a type="button" class="btn btn-primary btn-lg" :href="'/vercliente/'+item.id">
                                        <i class="bi bi-eye"></i>
                                    </a> -->
                                     <button type="button" class="btn btn-primary btn-lg" @click="editar(item)" data-backdrop="static" data-toggle="modal"  data-target="#formCategoria">
                                        <i class="bi bi-pencil-square"></i>
                                    </button>
                                </td>
                            </tr>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
        <categoria-form-component></categoria-form-component>
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
        };
        },
        mounted() {
            console.log('Component mounted.');
            this.getResults();
        },
        created(){
            EventBus.$on('categoria-changed', newCounter => {
                console.log(newCounter);
                // this.carrito = newCounter;
                this.verd();
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
                axios.get('/categoria/?page=' + page+'&search='+this.textbuscar)
                    .then(response => {
                        console.log(response);
                        this.datos = response.data.data;
                        // if(a != 1){
                        //     $("#scrollUp").trigger("click");
                        // }
                        // a++;
                        loader.hide();
                    });
            },
            nuevo(){
                EventBus.$emit('categoria-edit');
            },
            editar(item){
                let data = {
                    id:item.id,
                    categoria_id:item.categoria_id,
                    nombre:item.nombre,
                    nombre2:item.nombre2,
                    imagen:item.imagen
                };
                EventBus.$emit('categoria-edit', data);
            }
         }
    }
</script>
