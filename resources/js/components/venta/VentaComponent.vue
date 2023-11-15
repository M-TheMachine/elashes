<template>
    <div class="container-fluid">

        <button hidden="true" v-shortkey="['ctrl', 'alt', 'f']" @shortkey="theAction">Open</button>

        <div class="row justify-content-between align-items-center bg-black">
            <div class="col py-3">
                <form @submit.prevent="getResults()">
                    <div class="input-group input-group-lg">
                        <input type="text" class="form-control" placeholder="Escribe un servicio o el nombre de u   n cliente..." v-model="textbuscar" aria-label="" aria-describedby="button-addon2">
                        <div class="input-group-append">
                            <button class="btn btn-outline-secondary btn-primary" type="submit" id="button-addon2">
                                <i class="bi bi-search"></i>
                            </button>
                        </div>
                    </div>
                </form>
            </div>
            <div class="col text-right">
                <!-- <a href="/exportVentas" class="btn btn-primary btn-lg">EXPORTAR</a> -->
                <a href="/nuevaventa" class="btn btn-primary btn-lg">Creartoko</a>
                <!-- <div class="btn-group">
                    <button class="btn btn-secondary btn-lg dropdown-toggle" type="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                        COLUMNAS
                    </button>
                    <div class="dropdown-menu">
                        <a class="dropdown-item" href="#">Action</a>
                        <a class="dropdown-item" href="#">Another action</a>
                        <a class="dropdown-item" href="#">Something else here</a>
                        <div class="dropdown-divider"></div>
                        <a class="dropdown-item" href="#">Separated link</a>
                    </div>
                </div> -->
            </div>
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
                        <h1 class="titleh1 m-0">VENTAS</h1>
                    </div>
                    <div class="col text-right">
                        <button data-toggle="modal" data-backdrop="static" data-target="#confirmacionModalCenter" class="btn btn-success btn-lg">Guardar</button>
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
                        <caption>Lista de ventas ({{ datos.from }} - {{ datos.to }} de {{ datos.total }})</caption>
                        <thead>
                            <tr>
                                <th scope="col">Ficha</th>
                                <th scope="col">Servicio</th>
                                <th scope="col">Cliente</th>
                                <th scope="col">Fecha de creación</th>
                                <th scope="col">Total</th>
                                <th scope="col">Estdo</th>
                                <th scope="col">Operador</th>
                                <th scope="col">Técnica</th>
                                <!-- <th scope="col">Acción</th> -->
                            </tr>
                        </thead>
                        <tbody>
                            <tr v-for="(item,index) in datos.data" :key="'ser'+index">
                                <td>{{ item.ficha }}</td>
                                <td>{{ item.servicio.nombre2 }} / {{ item.servicio.nombre }}</td>
                                <td>{{ item.cliente.nombre }}</td>
                                <td>{{ item.created_at | luxon("yyyy-MM-dd HH:mm") }}</td>
                                <td>{{ item.total }}</td>
                                <!-- <td>
                                    <button type="button" class="btn btn-secondary btn-lg" @click="selectventa = item" data-toggle="modal" data-target="#confirmacionModalCenter">{{ item.estado }}</button>
                                </td> -->
                                <td>
                                    <!-- <span class="badge" v-bind:class="[item.estado == 'aceptado' ? 'badge-success' : 'badge-danger'  ]" style="font-size: 24px;">{{ item.estado }}</span> -->
                                    <div class="form-group">
                                        <!-- <label for="estado_val" class="col-form-label">Estado</label> -->
                                        <multiselect v-model="item.estado" :options="optionsEstados" :searchable="false" :close-on-select="true" :show-labels="false" placeholder="Elige un estado"></multiselect>
                                    </div>
                                </td>
                                <td style="width: 200px;">
                                    <!-- {{ item.user ? item.user.nombre : 'Sin asignar' }} -->
                                    <div class="form-group">
                                        <!-- <label :for="'operador_idval'+index" class="col-form-label">Operaria:</label> -->
                                        <multiselect :name="'operador_idval'+index" :id="'operador_idval'+index" v-model="item.user" :options="operadores" track-by="nombre" label="nombre" :multiple="false" :limit="1" :max-height="600" :show-no-results="false" :hide-selected="false" :show-labels="false" placeholder="Operaria"><span slot="noResult">No se encontraron elementos. Considere cambiar la consulta de búsqueda.</span></multiselect>
                                    </div>
                                </td>

                                <td style="width: 200px;">
                                    <!-- {{ item.user ? item.user.nombre : 'Sin asignar' }} -->
                                    <div class="form-group">
                                        <!-- <label :for="'operador_idval'+index" class="col-form-label">Operaria:</label> -->
                                        <multiselect :name="'tecnica_idval'+index" :id="'tecnica_idval'+index" v-model="item.tecnica" :options="tecnicas" track-by="nombre" label="nombre" :multiple="false" :limit="1" :max-height="600" :show-no-results="false" :hide-selected="false" :show-labels="false" placeholder="Técnica"><span slot="noResult">No se encontraron elementos. Considere cambiar la consulta de búsqueda.</span></multiselect>
                                    </div>
                                </td>

                                <!-- <td>                                    
                                    <button type="button" class="btn btn-primary btn-lg" @click="print(item)">
                                        <i class="bi bi-printer-fill"></i>
                                    </button>
                                </td> -->
                            </tr>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
        <div class="modal fade" id="confirmacionModalCenter" tabindex="-1" role="dialog" aria-labelledby="confirmacionModalCenterTitle" aria-hidden="true">
            <div class="modal-dialog modal-dialog-centered" role="document">
                <div class="modal-content">
                    <form class="needs-validation" @submit.prevent="confirmarcodigo()" novalidate>
                        <div class="modal-header">
                            <h5 class="modal-title">Confirmar</h5>
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                            </button>
                        </div>
                        <div class="modal-body">
                            <!-- <div class="form-group">
                                <label for="operador_ided" class="col-form-label">Operaria:</label>
                                <multiselect name="operador_ided" id="operador_ided" v-model="operador" :options="operadores" track-by="nombre" label="nombre" :multiple="false" :limit="1" :max-height="600" :show-no-results="false" :hide-selected="false" :show-labels="false" placeholder="Selecciona una operaria"><span slot="noResult">No se encontraron elementos. Considere cambiar la consulta de búsqueda.</span></multiselect>
                            </div>
                            <div class="form-group">
                                <label for="estadoed" class="col-form-label">Estado:</label>
                                <select class="form-control" id="estadoed" aria-label="" v-model="data.estado" required>
                                    <option value="aceptado">Aceptado</option>
                                    <option value="anulado">Anulado</option>
                                </select>
                                <div class="invalid-feedback">
                                    Se requiere Estado.
                                </div>
                            </div> -->
                            <div class="form-group row">
                                <label for="codigof" class="col-sm-2 col-form-label">Código</label>
                                <div class="col-sm-10">
                                    <input type="password" class="form-control form-control-lg" v-model="codigo" id="codigof" value="" required>
                                    <div class="invalid-feedback">
                                        Se requiere código de usuario.
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="modal-footer">
                            <button type="submit" class="btn btn-primary">Confirmar</button>
                            <button type="button" class="btn btn-secondary" data-dismiss="modal">Cerrar</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>

        <print-ticket-component></print-ticket-component>
    </div>
</template>

<script>
    var a = 1;
    import { EventBus } from '../event-bus.js';
    import Errors  from '../error-val';
    // import Hotkeys from 'vue-hotkeys-rt';
    // require('../error-val');
    export default {
        data() {
            return {
                optionsEstados: ['aceptado','anulado'],
                errors: new Errors(),
                codigo:'',
                operadores:[],
                operador:{},
                tecnicas:[],
                tecnica:{},
                sucursals:[],
                textbuscar:'',
                datos:{},
                pageval:1,
                f_ini:'',
                f_fin:'',

                switchVentas:1,

            };
        },
        mounted() {
            console.log('Component mounted.');

        },
        created(){
            this.getResults();
            this.getOperadores();
            this.getTecnicas();
            EventBus.$on('venta-changed', newCounter => {
                console.log(newCounter);
                // this.carrito = newCounter;
                this.getResults();
            });
        },
        methods: {
            print (item) {
                EventBus.$emit('venta-print', item);
                console.log(item);
                // Pass the element id here
                setTimeout(async() => {
                   await this.$htmlToPaper('printMe');
                }, 500);

            },
            getResults(page = 1) {
                console.log("reload data");
                // console.log("init get");
                let loader = Vue.$loading.show({
                    color: 'red'
                    },{
                    // slots
                    });
                axios.get('/venta?page=' + page+'&search='+this.textbuscar+'&f_ini='+this.f_ini+'&f_fin='+this.f_fin+'&switchVentas='+this.switchVentas)
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
               this.data = {
                    id:item.id,
                    estado:item.estado,
                };
                this.operadores.forEach(element => {
                    if(item.user_id == element.id){
                        this.operador = element;
                    }
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
            confirmarcodigo(){
                let loader = Vue.$loading.show({
                color: 'red'
                },{
                // slots
                });
                console.log("guardar");
                var formData = new FormData();
                formData.append("codigo", this.codigo ? this.codigo : '');
                formData.append("ventas", JSON.stringify(this.datos.data));
                // formData.append("user_id", this.operador ? this.operador.id : '');

                // formData.append('_method', 'PUT');
                axios.post('/ventasupdate', formData)
                    .then( (response) => {
                        console.log(response);
                        this.toastedmensaje(response.data.mensaje);
                        if(response.data.mensaje == 'Ventas actualizadas correctamente'){
                            this.getResults();
                        }
                        loader.hide();
                    })
                    .catch((error) => {
                        this.errors.record(error.response.data);
                        loader.hide();
                        this.toastedmensaje("Los datos proporcionados no son válidos");
                    });
                    // .catch( (error) => {
                    //     console.log(error);
                    //     loader.hide();
                    // });
            },
            toastedmensaje(mensaje){
                this.$toasted.global.my_app_car({
                    message : mensaje
                });
            },

            theAction (event) {
                this.switchVentas = this.switchVentas == 1 ? 0 : 1;
                this.getResults();
                console.log(event);
                // switch (event.srcKey) {
                //     case 'up':
                //         console.log("up");
                //     break
                // }
                    
            },
        }            
    }
</script>
