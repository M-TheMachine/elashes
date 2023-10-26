<template>
    <div class="container-fluid">
        <div class="row justify-content-between align-items-center bg-black">
            <!-- <div class="col py-3">
                <form @submit.prevent="getResults()">
                    <div class="input-group input-group-lg">
                        <input type="text" class="form-control" placeholder="" v-model="textbuscar" aria-label="" aria-describedby="button-addon2">
                        <div class="input-group-append">
                            <button class="btn btn-outline-secondary btn-primary" type="submit" id="button-addon2">
                                <i class="bi bi-search"></i>
                            </button>
                        </div>
                    </div>
                </form>
            </div> -->

            <div class="col-12">
                <div class="form-row">
                    <div class="form-group col-md-4">
                        <div>
                            <label class="typo__label text-white">Cliente</label>
                            <!-- <label class="typo__label" for="ajax">Buscar cliente</label> -->
                            <multiselect @input="getResults()" v-model="selectcliente" id="ajaxCliente" label="nombre" track-by="id" placeholder="Buscar cliente" open-direction="bottom" :options="clientes" :multiple="false" :searchable="true" :loading="isLoadingCliente" :internal-search="false" :clear-on-select="false" :close-on-select="true" :options-limit="300" :limit="3" :limit-text="limitTextCli" :max-height="600" :show-no-results="false" :hide-selected="false" @search-change="asyncFindCliente">
                                <template slot="tag" slot-scope="{ option, remove }"><span class="custom__tag"><span>{{ option.nombre }}</span><span class="custom__remove" @click="remove(option)">❌</span></span></template>
                                <span slot="noResult">No se encontraron elementos. Considere cambiar la consulta de búsqueda.</span>
                            </multiselect>
                        </div>
                    </div>
                    <div class="form-group col-md-4">
                        <div>
                            <label class="typo__label text-white">Operador</label>
                            <!-- <label class="typo__label" for="ajax">Buscar cliente</label> -->
                            <multiselect @input="getResults()" name="operador_id" id="operador_id" v-model="selectoperador" :options="operadores" track-by="nombre" label="nombre" :multiple="false" :limit="1" :max-height="600" :show-no-results="false" :hide-selected="false" :show-labels="false" placeholder="Selecciona una operaria"><span slot="noResult">No se encontraron elementos. Considere cambiar la consulta de búsqueda.</span></multiselect>
                        </div>
                    </div>
                    <div class="form-group col-md-4">
                        <div>
                            <label class="typo__label text-white">Servicio</label>
                            <!-- <label class="typo__label" for="ajax">Buscar cliente</label> -->
                            <multiselect @input="getResults()" v-model="selectservicio" id="ajaxServicio" label="nombre" track-by="id" placeholder="Buscar Servicio" open-direction="bottom" :options="servicios" :multiple="false" :searchable="true" :loading="isLoadingServicio" :internal-search="false" :clear-on-select="false" :close-on-select="true" :options-limit="300" :limit="3" :limit-text="limitTextSer" :max-height="600" :show-no-results="false" :hide-selected="false" @search-change="asyncFindServicios">
                                <template slot="tag" slot-scope="{ option, remove }"><span class="custom__tag"><span>{{ option.nombre }}</span><span class="custom__remove" @click="remove(option)">❌</span></span></template>
                                <span slot="noResult">No se encontraron elementos. Considere cambiar la consulta de búsqueda.</span>
                            </multiselect>
                        </div>
                    </div>
                </div>
                <div class="form-row">
                    <div class="form-group col-6">
                        <label for="f_ini" class="text-white">INICIO</label>
                        <div class="input-group">
                            <input type="date" v-model="f_ini" @input="getResults()" class="form-control" id="f_ini">
                            <!-- <input type="datetime-local" value="{{ isset($f_ini) ? $f_ini : old('f_ini') }}" class="form-control" id="fini" name="f_ini" placeholder="Fecha Inicio"> -->
                            <div class="input-group-append">
                                <button class="btn btn-outline-secondary" type="button" @click="f_ini='';getResults()">X</button>
                            </div>
                        </div>

                    </div>
                    <div class="form-group col-6">
                        <label for="f_fin" class="text-white">FIN</label>
                        <div class="input-group">
                            <input type="date" v-model="f_fin" @input="getResults()" class="form-control" id="f_fin">
                            <!-- <input type="datetime-local" value="{{ isset($f_fin) ? $f_fin : old('f_fin') }}" class="form-control" id="ffin" name="f_fin" placeholder="Fecha Fin"> -->
                            <div class="input-group-append">
                                <button class="btn btn-outline-secondary" type="button" @click="f_fin='';getResults()">X</button>
                            </div>
                        </div>

                    </div>
                </div>
            </div>
        </div>
        <div class="row align-content-center align-items-center  justify-content-between bg2">
            <!-- <div class="container">
                <div class="row  align-content-center align-items-center  justify-content-between"> -->
                    <div class="col">
                        <h1 class="titleh1 m-0">{{ susursaldata.nombre }} - VENTAS</h1>
                    </div>
                    <div class="col text-right">
                        <!-- <a href="/reporteVenta" class="btn btn-primary btn-lg">EXPORTAR</a> -->

                        <div class="btn-group">
                            <!-- <button class="btn btn-primary btn-lg" type="button">
                                EXPORTAR
                            </button> -->
                            <button type="button" class="btn btn-lg btn-secondary dropdown-toggle dropdown-toggle-split" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                EXPORTAR POR <span class="sr-only">Toggle Dropdown</span>
                            </button>
                            <div class="dropdown-menu">
                                <button class="dropdown-item" v-bind:class="{ active: order=='ventas.created_at' }" @click="order='ventas.created_at';reporteVenta()">Fecha</button>
                                <button class="dropdown-item" v-bind:class="{ active: order=='clientev' }" @click="order='clientev';reporteVenta()">Cliente</button>
                                <button class="dropdown-item" v-bind:class="{ active: order=='operadora' }" @click="order='operadora';reporteVenta()">Operador</button>
                                <button class="dropdown-item" v-bind:class="{ active: order=='serviciov' }" @click="order='serviciov';reporteVenta()">Servicio</button>
                                <!-- <div class="dropdown-divider"></div>
                                <a class="dropdown-item" href="#">Separated link</a> -->
                            </div>
                        </div>


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
                                <th scope="col">Caja</th>
                                <th scope="col">Comision</th>
                                <th scope="col">Total</th>
                                <th scope="col">Estado</th>
                                <th scope="col">Operador</th>
                                <th scope="col">Acción</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr v-for="(item,index) in datos.data" :key="'ser'+index">
                                <td>{{ item.ficha }}</td>
                                <td>{{ item.servicio.nombre }}</td>
                                <td>{{ item.cliente.nombre }}</td>
                                <td>{{ item.created_at | luxon("yyyy-MM-dd HH:mm") }}</td>
                                <td>Bs. {{ item.caja }}</td>
                                <td>Bs. {{ item.comision }}</td>
                                <td>{{ item.total }}</td>
                                <!-- <td>
                                    <button type="button" class="btn btn-secondary btn-lg" @click="selectventa = item" data-toggle="modal" data-target="#confirmacionModalCenter">{{ item.estado }}</button>
                                </td> -->
                                <td>
                                    <span class="badge" v-bind:class="[item.estado == 'aceptado' ? 'badge-success' : 'badge-danger'  ]" style="font-size: 24px;">{{ item.estado }}</span>
                                    <!-- <div class="form-group">
                                        <multiselect v-model="item.estado" :options="optionsEstados" :searchable="false" :close-on-select="true" :show-labels="false" placeholder="Elige un estado"></multiselect>
                                    </div> -->
                                </td>
                                <td style="width: 200px;">
                                    {{ item.user ? item.user.nombre : 'Sin asignar' }}
                                </td>
                                <td>
                                    <!-- <a type="button" class="btn btn-primary btn-lg" :href="'/verusuario/'+item.id">
                                        <i class="bi bi-eye"></i>
                                    </a> -->
                                    <!-- <button type="button" class="btn btn-primary btn-lg" @click="editar(item)"  data-toggle="modal" data-target="#confirmacionModalCenter">
                                        <i class="bi bi-pencil-square"></i>
                                    </button> -->
                                    <button type="button" class="btn btn-primary btn-lg" @click="print(item)">
                                        <i class="bi bi-printer-fill"></i>
                                    </button>
                                </td>
                            </tr>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
        <print-ticket-component></print-ticket-component>
    </div>
</template>

<script>
    var a = 1;
    import { EventBus } from '../event-bus.js';
    // require('../error-val');
    export default {
        props:['susursal'],
        data() {
            return {
                selectcliente: null,
                clientes: [{}],
                isLoadingCliente: false,
                selectoperador: null,
                operadores: [{}],
                selectservicio: null,
                servicios: [{}],
                isLoadingServicio: false,
                susursaldata: {},
                textbuscar:'',
                datos:{},
                pageval:1,
                f_ini:'',
                f_fin:'',
                order:"ventas.created_at",

                totalCaja: 0,
                totalComision: 0,
            };
        },
        mounted() {
            console.log('Component mounted.');
        },
        created(){
            this.susursaldata = JSON.parse(this.susursal);
            this.asyncFindCliente('');
            this.asyncFindServicios('');
            this.getResults();
            this.getOperadores();
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
                console.log(this.selectcliente);
                console.log("reload data");
                // console.log("init get");
                let loader = Vue.$loading.show({
                    color: 'red'
                    },{
                    // slots
                    });
                axios.get('/ventasSucursal?page=' + page+'&sucursal_id='+this.susursaldata.id+'&cliente_id='+(this.selectcliente ? this.selectcliente.id : '')+'&operador_id='+(this.selectoperador ? this.selectoperador.id:'')+'&servicio_id='+(this.selectservicio ? this.selectservicio.id : '')+'&search='+this.textbuscar+'&f_ini='+this.f_ini+'&f_fin='+this.f_fin)
                    .then(response => {
                        console.log(response);
                        this.datos = response.data.data;
                        this.totalCaja = response.data.caja;
                        this.totalComision = response.data.comision;
                        this.pageval = this.datos.current_page;
                        // if(a != 1){
                        //     $("#scrollUp").trigger("click");
                        // }
                        // a++;
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
            toastedmensaje(mensaje){
                this.$toasted.global.my_app_car({
                    message : mensaje
                });
            },
            asyncFindCliente (query) {

                this.isLoadingCliente = true
                axios.get('/clientesdata/?search='+query)
                    .then(response => {
                        console.log(response);
                        if (response.data.data.length>0) {
                            this.clientes = response.data.data;
                        }else{
                            this.clientes = [];
                        }

                        this.isLoadingCliente = false
                    });
            },
            limitTextCli (count) {
                return `y ${count} otros clientes`
            },
            asyncFindServicios (query) {

                this.isLoadingServicio = true
                axios.get('/serviciosdata/?search='+query)
                    .then(response => {
                        console.log(response);
                        if (response.data.data.length>0) {
                            this.servicios = response.data.data;
                        }else{
                            this.servicios = [];
                        }

                        this.isLoadingServicio= false
                    });
            },
            limitTextSer (count) {
                return `y ${count} otros servicios`
            },
            reporteVenta(){
                let title = "Sucursal : "+this.susursaldata.nombre+" - Dirección : "+this.susursaldata.direccion;
                window.open('/exportVentasSucursal?sucursal_id=' + this.susursaldata.id+'&title='+title+'&order='+this.order+'&cliente_id='+(this.selectcliente ? this.selectcliente.id : '')+'&operador_id='+(this.selectoperador ? this.selectoperador.id:'')+'&servicio_id='+(this.selectservicio ? this.selectservicio.id : '')+'&search='+this.textbuscar+'&f_ini='+this.f_ini+'&f_fin='+this.f_fin, '_blank');
            }
         }
    }
</script>
