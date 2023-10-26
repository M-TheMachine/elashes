<template>
<div>
    <div class="modal fade p-0" id="formServicioVenta" tabindex="-1" aria-labelledby="ServicioVentaModalLabel" aria-hidden="true">
        <div class="modal-dialog modal-dialog-scrollable modal-fullscreen modal-dialog-centered">
            <div class="modal-content">
                <div class="modal-header bg2">
                    <!-- <h5 class="modal-title" id="ServicioVentaModalLabel">
                        <span>SERVICIOS CLIENTE</span>
                    </h5> -->
                    <!-- <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button> -->
                    <div class="row align-content-center align-items-center  justify-content-between w-100 m-0">
                        <!-- <div class="container">
                            <div class="row  align-content-center align-items-center  justify-content-between"> -->
                                    <div v-if="!categoria.id" class="col-12 text-center">
                                        <div class="row align-content-center justify-content-between bg2">
                                            <div class="col ">
                                                <h1 class="titleh1 m-0">SELECCIONA UNA CATEGORÍA</h1>
                                            </div>
                                            
                                        </div>
                                    </div>

                                    <div v-else class="col-12 text-center">

                                        <div class="row align-content-center align-items-center  justify-content-between bg2">
                                            <div class="col text-left">
                                                <a class="btn btn-success btn-lg" @click="categoriaSeleccionada('')">Volver</a>
                                            </div>
                                            <div class="col-md-8 text-center">
                                                <h1 class="titleh1 m-0">
                                                     SELECCIONA UN SERVIIO</h1>
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

                                        </div>
                                        
                                    </div>
                                
                                
                            <!-- </div>
                        </div> -->
                    </div>
                </div>
                <div class="modal-body">

                    <div class="row mt-4" >

                        <div v-if="!categoria.id" class="col-7 col-md-7 col-lg-9" style="min-height: 50vh;">
                            <div class="row row-cols-1 row-cols-md-2 row-cols-lg-3 row-cols-xl-4">
                                <div class="col mb-4" v-for="(item,index) in categorias" :key="'serv'+index">
                                    <div class="card bg-dark text-white cardpoint" @click="categoriaSeleccionada(item)">
                                        <img :src="ifexitcar(item) " class="" alt="">

                                        <span class="badge badge-warning checkpromocion" v-if="item.promocion">Promoción</span>
                                        <span class="badge badge-warning checkpromocion" v-if="item.extra">Extra</span>

                                        <img :src="item.imagen" class="card-img" alt="">
                                        
                                        <div class="card-img-overlay servicioimgbg d-flex p-3">

                                            <div style="bottom:0; position: absolute;">
                                                <h4 class="card-title m-0">{{ item.nombre }}</h4>
                                                <p style="font-size:12px; line-height: 1.5;">{{ item.nombre2 }}</p>
                                            </div>

                                            <!-- <p class="card-text">This is a wider card with supporting text below as a natural lead-in to additional content. This content is a little bit longer.</p>
                                            <p class="card-text">Last updated 3 mins ago</p> -->
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div v-else class="col-7 col-md-7 col-lg-9" style="min-height: 50vh;">
                            <div v-if="datos" class="row row-cols-1 row-cols-md-2 row-cols-lg-3 row-cols-xl-4">
                                <div class="col mb-4" v-for="(item,index) in datos.data" :key="'serv'+index">
                                    <div class="card bg-dark text-white cardpoint" @click="modalAsignacion(item)" >
                                        <img :src="ifexitcar(item) ? '/imgweb/icon/1.png' :'/imgweb/icon/0.png'" class="checkservicios" alt="">

                                        <span class="badge badge-warning checkpromocion" v-if="item.promocion">Promoción</span>
                                        <span class="badge badge-danger checkextra" v-if="item.extra">Extra</span>

                                        <img :src="item.imagen" class="card-img" alt="">
                                        
                                        <div class="card-img-overlay servicioimgbg d-flex p-3">

                                            <div style="bottom:0; position: absolute;">
                                                <h4 class="card-title m-0">{{ item.nombre }}</h4>
                                                <p style="font-size:12px; line-height: 1.5;">{{ item.nombre2 }}</p>
                                            </div>

                                            <!-- <p class="card-text">This is a wider card with supporting text below as a natural lead-in to additional content. This content is a little bit longer.</p>
                                            <p class="card-text">Last updated 3 mins ago</p> -->
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div class="col-7 col-md-7 col-lg-9 h-50" v-if="!datos" style="min-height: 50vh;">
                            <h1>Sin resultados</h1>
                        </div>
                        <div class="col-5 col-md-5 col-lg-3">
                            <div class="listservicio mw-100">
                                <h3 class="text-center hservicios">Servicios seleccionados</h3>
                                <ul class="list-group p-1">
                                    <li v-for="(item,index) in ventas" :key="'vent'+index" class=" list-group-item d-flex justify-content-between align-items-center liservicio">
                                        {{ item.servicio.nombre }}
                                        <span class="ml-3" @click="removeSer(index)">
                                            <i class="bi bi-x-circle-fill" style="color: #f37f7d;"></i></span>
                                    </li>
                                    <!-- <li class="list-group-item d-flex justify-content-between align-items-center liservicio">
                                        A second list item
                                        <span class="badge badge-success badge-pill">❌</span>
                                    </li>
                                    <li class="list-group-item d-flex justify-content-between align-items-center liservicio">
                                        A third list item
                                        <span class="badge badge-success badge-pill">❌</span>
                                    </li> -->
                                </ul>
                            </div>

                        </div>
                    </div>

                </div>
                <div class="modal-footer">
                    <div class="row w-100 align-items-center justify-content-between">
                        <div class="col-6">
                            <h5 class="">Lista de Servicios ({{ datos.from }} - {{ datos.to }} de {{ datos.total }})</h5>
                        </div>
                        <div class="col-6 text-md-right">
                            <button type="button" class=" btn btn-success bg-confirm" data-dismiss="modal">LISTO</button> 
                        </div>
                    </div>
                    
                </div>
            </div>
        </div>
    </div>

    <div class="modal fade" id="asignacionModalCenter" tabindex="-1" role="dialog" aria-labelledby="asignacionModalCenterTitle" aria-hidden="true">
        <div class="modal-dialog modal-lg modal-dialog-centered" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLongTitle">ASIGNACIÓN</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <div class="form-group">
                        <label for="operiaria_id" class="col-form-label">Operaria:</label>
                        <multiselect name="categoria_id" id="categoria_id" v-model="operador" :options="operadores" track-by="nombre" label="nombre" :multiple="false" :limit="1" :max-height="600" :show-no-results="false" :hide-selected="false" :show-labels="false" placeholder="Selecciona una operaria"><span slot="noResult">No se encontraron elementos. Considere cambiar la consulta de búsqueda.</span></multiselect>
                    </div>

                    <div class="form-group">
                        <label for="tecnica_id" class="col-form-label">Técnica:</label>
                        <multiselect name="tecnica_id" id="tecnica_id" v-model="tecnica" :options="tecnicasSelect" track-by="nombre" label="nombre" :multiple="false" :limit="1" :max-height="600" :show-no-results="false" :hide-selected="false" :show-labels="false" placeholder="Selecciona una técnica"><span slot="noResult">No se encontraron elementos. Considere cambiar la consulta de búsqueda.</span></multiselect>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-primary" @click="sinasignar" data-dismiss="modal">SIN OPERADOR</button>
                    <button type="button" class="btn btn-success btn-lg" @click="asignar" data-dismiss="modal">CONFIRMAR</button>
                    <button type="button" class="btn btn-secondary btn-lg" data-dismiss="modal">CANCELAR</button>
                </div>
            </div>
        </div>
    </div>
</div>

</template>

<script>
    import { EventBus } from '../event-bus.js';
    export default {
        props:[],
        data() {
            return {
                serviciosSelect:{},
                categoria:{},
                categorias:[],
                // datos:[],
                operadores:[],
                tecnicas:[],
                tecnicasSelect:[],
                tecnica:'',
                textbuscar:'',
                datos:{},
                pageval:1,
                sucursals:[],
                operador:'',
                ventas:[],
            };
        },
        created(){
            EventBus.$on('servicios-venta', newData => {

                if(localStorage.getItem('ventas')){
                    try {
                        this.ventas = JSON.parse(localStorage.getItem('ventas'));
                        // this.calitemsubtotal();
                    } catch(e) {
                        localStorage.removeItem('ventas');
                    }
                }
            });
            EventBus.$on('carrito-ventas', newData => {
                this.ventas = newData ? newData : [];
            });
        },
        mounted() {
            this.getOperadores();
            this.getResults();
            this.getcategorias();
            this.getTecnicas();
            console.log('Component mounted.')
        },
        methods: {
            getResults(page = 1) {
                let id = this.categoria.id ? this.categoria.id : '';
                // console.log("init get");
                let loader = Vue.$loading.show({
                    color: 'red'
                    },{
                    // slots
                    });
                axios.get('/getservicios/?page=' + page+'&search='+this.textbuscar+'&categoria_id='+id)
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
            getcategorias(){
                let loader = Vue.$loading.show({
                color: 'red'
                },{
                // slots
                });
                axios.get('/getcategorias')
                    .then(response => {
                        console.log(response);
                        this.categorias = response.data.data;
                        loader.hide();
                    });
            },
            getOperadores(){
                let loader = Vue.$loading.show({
                    color: 'red'
                    },{
                    // slots
                    });
                axios.get('/getOperadors')
                    .then(response => {
                        console.log(response);
                        this.operadores = response.data.data;
                        loader.hide();
                    });
            },
            getTecnicas(){
                let loader = Vue.$loading.show({
                    color: 'red'
                    },{
                    // slots
                    });
                axios.get('/gettecnicas')
                    .then(response => {
                        console.log(response);
                        this.tecnicas = response.data.data;
                        loader.hide();
                    });
            },
            sinasignar(){
                let val = {
                    servicio : this.serviciosSelect,
                    operador : '',
                    tecnica : this.tecnica ? this.tecnica : '',
                    cantidad : 1,
                    subtotal : this.serviciosSelect.precio,
                    descuento : 0,
                    total : this.serviciosSelect.precio
                };
                if(!this.ventas.find(element => (element.servicio.id == this.serviciosSelect.id))){
                    this.ventas.push(val);
                    this.toastedmensaje("Servicio agregado correctamente");
                }else{
                    let index = this.ventas.findIndex(element => (element.servicio.id == this.serviciosSelect.id));
                    this.ventas[index] = val;
                    this.toastedmensaje("Servicio actualizado correctamente");
                }

                this.saveCats();
            },
            asignar(){
                if (this.operador) {
                    let val = {
                        servicio : this.serviciosSelect,
                        operador : this.operador,
                        tecnica : this.tecnica,
                        cantidad : 1,
                        subtotal : this.serviciosSelect.precio,
                        descuento : 0,
                        total : this.serviciosSelect.precio
                    };
                    if(!this.ventas.find(element => (element.servicio.id == this.serviciosSelect.id))){
                        this.ventas.push(val);
                        this.toastedmensaje("Servicio agregado correctamente");
                    }else{
                        let index = this.ventas.findIndex(element => (element.servicio.id == this.serviciosSelect.id));
                        this.ventas[index] = val;
                        this.toastedmensaje("Servicio actualizado correctamente");
                    }
                    this.saveCats();

                }else{
                    this.toastedmensaje("Seleccione una operaria");
                }

            },
            saveCats() {
                EventBus.$emit('carrito-ventas', this.ventas);
                const parsed = JSON.stringify(this.ventas);
                localStorage.setItem('ventas', parsed);
            },
            ifexitcar(tag) {
            // ensure they actually typed something
                if(!this.ventas.find(element => (element.servicio.id == tag.id))){
                    // console.log("true");
                    return false;
                }else{
                    return true;
                }
            },
            removeSer(x) {
                this.ventas.splice(x, 1);
                this.saveCats();
                this.toastedmensaje("Se removió el servicio");
            },
            guardar(){
                console.log(this.operador);
            },
            toastedmensaje(mensaje){
                this.$toasted.global.my_app_car({
                    message : mensaje
                });
            },
            addCategoria(item){
                if (!item) {
                    this.categoria={};
                }
                console.log(item);
                this.getResults();
                //this.data.categoria_id = item.id;
            },
            categoriaSeleccionada(item){
                if (!item) {
                    this.categoria={};
                }else{
                    this.categoria = item;
                }
                console.log(item);
                this.getResults();
                //this.data.categoria_id = item.id;
            },
            modalAsignacion(item){
                this.tecnicasSelect = [];
                this.tecnicas.forEach(element => {
                    if (element.categoria_id==item.categoria_id) {
                        this.tecnicasSelect.push(element);
                    }
                });
                this.serviciosSelect=item;
                $("#asignacionModalCenter").modal();
            }
        },

    }
</script>
<style>
    .multiselect__tags {
        min-height: 46px !important;
    }

</style>