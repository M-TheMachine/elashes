<template>
    <div class="container-fluid">
        <div class="row justify-content-between align-items-center bg-black">
            <div class="col-md-3 py-3">
                <div>
                    <label class="typo__label text-white">Cliente</label>
                    <!-- <label class="typo__label" for="ajax">Buscar cliente</label> -->
                    <multiselect  @input="observacioncliente()" v-model="selectcliente" :custom-label="nombreCiConCelular" id="ajax" label="nombre" track-by="id" placeholder="Escribe el Nombre, CI o celular..." open-direction="bottom" :options="clientes" :multiple="false" :searchable="true" :loading="isLoading" :internal-search="false" :clear-on-select="false" :close-on-select="true" :options-limit="300" :limit="3" :limit-text="limitText" :max-height="600" :show-no-results="false" :hide-selected="false" @search-change="asyncFind">
                        <template slot="tag" slot-scope="{ option, remove }"><span class="custom__tag"><span>{{ option }}</span><span class="custom__remove" @click="remove(option)">❌</span></span></template>
                        <span slot="noResult">No se encontraron elementos. Considere cambiar la consulta de búsqueda.</span>
                    </multiselect>
                </div>
                    <!-- <pre class="language-json"><code>{{ selectcliente  }}</code></pre> -->
                <!-- <form @submit.prevent="getResults">
                    <div class="input-group input-group-lg">
                        <input type="text" class="form-control" placeholder="" v-model="textbuscar" aria-label="" aria-describedby="button-addon2">
                        <div class="input-group-append">
                            <button class="btn btn-outline-secondary btn-primary" type="submit" id="button-addon2">
                                <i class="bi bi-search"></i>
                            </button>
                        </div>
                    </div>
                </form> -->

                <!-- Modal -->
                <div class="modal fade" id="modalObservacionCliente" data-backdrop="static" data-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
                    <div  class="modal-dialog modal-dialog-centered">
                        <div class="modal-content">
                            <div class="modal-header">
                                <h5 class="modal-title" id="staticBackdropLabel">observación</h5>
                                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                <span aria-hidden="true">&times;</span>
                                </button>
                            </div>
                            <div v-if="selectcliente" class="modal-body text-center">
                                <h1 class="">
                                    <i class="bi bi-exclamation-triangle icon-danger"></i>
                                </h1>                            
                                <p>{{ selectcliente.observaciones }}</p>
                            </div>
                            <div class="modal-footer">
                                <button type="button" class="btn btn-secondary" data-dismiss="modal">Cerrar</button>
                            </div>
                        </div>
                    </div>
                </div>

            </div>
            <div class="col-md-3">
                <div>
                    <label class="typo__label text-white">Forma de pago</label>
                    <multiselect v-model="selectpago" :options="optionsPagos" :searchable="false" :close-on-select="true" :show-labels="false" placeholder="Elige un valor"></multiselect>
                </div>

            </div>
            <div class="col-md-1">
                <!-- <div class="custom-control custom-switch">
                    <input type="checkbox" class="custom-control-input" id="customSwitch1">
                    <label class="custom-control-label text-white" for="customSwitch1">Facturado</label>
                </div> -->

                <label class="switch">
                    <input type="checkbox" v-model="facturado" checked>
                    <span class="slider round"></span>
                    <!-- <span class="text-white">Facturado</span> -->
                </label>
            </div>
            <div class="col text-right">
                <button type="button" class="btn btn-primary btn-lg"  @click="nuevo" data-toggle="modal" data-target="#formCliente">NUEVO CLIENTE</button>
                <button type="button" id="addservice" class="btn btn-secondary btn-lg" @click="addservicio" data-backdrop="static" data-toggle="modal" data-target="#formServicioVenta">AGREGAR SERVICIOS</button>
                <button type="button" class="btn btn-success btn-lg" @click="guardar">CONFIRMAR</button>
            </div>
        </div>
        <div class="row align-content-center align-items-center  justify-content-between bg2">
            <!-- <div class="container">
                <div class="row  align-content-center align-items-center  justify-content-between"> -->
                    <!-- <div class="col">
                        <a href="javascript:history.go(-1)" class="btn btn-primary btn-lg">Volver</a>
                    </div> -->
                    <div class="col text-left">
                        <h1 class="titleh1 m-0">
                            <a href="/ventas" class="btn btn-primary btn-lg">Volver</a> NUEVA VENTA</h1>
                            <!-- <a href="javascript:history.go(-1)" class="btn btn-primary btn-lg">Volver</a> NUEVA VENTA</h1> -->
                    </div>
                    <!-- <div class="col text-right">
                        <div class="btn-group btn-group-lg" role="group" aria-label="Basic example">
                            <button type="button" class="btn btn-secondary" :disabled="datos.current_page == 1" @click="getResults(datos.current_page-1)">
                                <i class="bi bi-chevron-left"></i>
                            </button>
                            <button type="button" class="btn btn-secondary" :disabled="datos.current_page == datos.last_page" @click="getResults(datos.current_page+1)">
                                <i class="bi bi-chevron-right"></i>
                            </button>
                        </div>
                    </div> -->
                <!-- </div>
            </div> -->
        </div>
        <!-- <div class="row">
            <div class="col-12 text-left">
                <div class="card" style="width: 100%;">
                    <div class="card-body" v-if="data">
                        <h5 class="card-title">Cliente</h5>
                        <h6 class="card-subtitle mb-2 text-muted">Nombre:</h6>
                        <p class="card-text">{{ data.nombre }}</p>
                        <h6 class="card-subtitle mb-2 text-muted">Fecha de creación:</h6>
                        <p class="card-text">{{ data.created_at }}</p>
                        <h6 class="card-subtitle mb-2 text-muted">Celular:</h6>
                        <p class="card-text">{{ data.celular }}</p>
                        <h6 class="card-subtitle mb-2 text-muted">CI:</h6>
                        <p class="card-text">{{ data.ci }}</p>
                        <h6 class="card-subtitle mb-2 text-muted">Fecha de nacimiento:</h6>
                        <p class="card-text">{{ data.fecha_nacimiento }}</p>
                    </div>
                </div>
            </div>
        </div> -->


        <div class="row justify-content-center mt-3">
            <div class="col-12">
                <div class="table-responsive">
                    <table class="table table-bordered table-hover">
                        <caption>Lista de servicios</caption>
                        <thead>
                            <tr>
                                <th scope="col">Servicio</th>
                                <th scope="col">Costo</th>
                                <th scope="col">Cantidad</th>
                                <th scope="col">Descuento</th>
                                <th scope="col">Total</th>
                                <!-- <th scope="col">Estado</th> -->
                                <th scope="col">Acción</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr v-for="(item,index) in ventas" :key="'ser'+index">
                                <td>{{ item.servicio.nombre2 }} / {{ item.servicio.nombre }}</td>
                                <td>{{ item.servicio.precio }}</td>
                                <td>{{ item.cantidad }}</td>
                                <td style="width: 200px;">
                                    <div class="input-group input-group-lg">
                                        <input min="0" type="number" class="form-control" aria-label="Large" v-model="item.descuento" @change="calitemsubtotal(item)" @keyup="calitemsubtotal(item)">
                                    </div>
                                </td>
                                <td>{{ item.total }}</td>
                                <!-- <td>{{ item.estado }}</td> -->
                                <td>
                                    <button type="button" class="btn btn-primary btn-lg" @click="removeSer(index)">
                                        <i class="bi bi-x-lg"></i>
                                    </button>
                                </td>
                            </tr>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
        <clientes-form-component></clientes-form-component>
        <servicio-venta-component></servicio-venta-component>
        <print-ticket-venta-component></print-ticket-venta-component>
    </div>
</template>

<script>
    var a = 1;
    import { EventBus } from '../event-bus.js';
    export default {
        data() {
        return {
            facturado:false,
            optionsPagos: ['efectivo','tarjeta','transferencia'],
            selectcliente: null,
            selectpago: 'efectivo',
            clientes: [{}],
            isLoading: false,
            cliente:'',
            pageval:1,
            ventas:[]
        };
        },
        mounted() {
            if(localStorage.getItem('ventas')){
                try {
                    this.ventas = JSON.parse(localStorage.getItem('ventas'));
                    // this.calitemsubtotal();
                } catch(e) {
                    localStorage.removeItem('ventas');
                }
            }
        },
        created(){
            // $('#addservice').click();
            // document.getElementById("addservice").click();
            // document.ready( ()=>{
            //     console.log("documentreadystate")
            // }),
            document.onreadystatechange = function () {
                if (document.readyState == "complete") {
                    // console.log("documentreadystate");
                    setTimeout(() => {
                        EventBus.$emit('servicios-venta');
                        $("#formServicioVenta").modal();
                    }, 3500);

                }
            },
            
                // document.getElementById('msucursal').click();
            this.asyncFind('');
            EventBus.$on('venta-changed', newCounter => {
                console.log(newCounter);
                // this.carrito = newCounter;
            });
            EventBus.$on('carrito-ventas', newData => {
                this.ventas = newData ? newData : [];
            });

            EventBus.$on('cliente-changed', newCounter => {
                console.log(newCounter);
                // this.carrito = newCounter;
                this.asyncFind('');
            });
        },
        methods: {

            nombreCiConCelular ({ nombre, ci, celular }) {
                return `${nombre} — CI: ${ci} — Cel: ${celular}`
            },
            limitText (count) {
                return `y ${count} otros clientes`
            },
            asyncFind (query) {
                console.log(this.selectcliente);
                console.log(query);
                this.isLoading = true
                axios.get('/clientesdata/?search='+query)
                    .then(response => {
                        console.log(response);
                        if (response.data.data.length>0) {
                            this.clientes = response.data.data;
                        }else{
                            this.clientes = [];
                        }

                        this.isLoading = false
                    });
            },
            guardar(){
                if (this.selectcliente != null) {
                    if(this.ventas.length > 0){
                        let ventasdata = [];
                        this.ventas.forEach(element => {
                            ventasdata.push(
                                {
                                    cliente_id:this.selectcliente.id,
                                    pago:this.selectpago ? this.selectpago : 'efectivo',
                                    facturado:this.facturado,
                                    servicio_id:element.servicio.id,
                                    user_id:element.operador ? element.operador.id : '',
                                    tecnica_id:element.tecnica ? element.tecnica.id : '',
                                    precio:element.servicio.precio,
                                    cantidad:element.cantidad,
                                    subtotal:element.subtotal,
                                    descuento:element.descuento,
                                    total:element.total,
                                    descripcion:'',
                                    estado:'aceptado'
                                }
                            );
                        });
                        let data = {
                        ventas: JSON.stringify(ventasdata)
                        };
                        let loader = Vue.$loading.show({
                            color: 'red'
                        },{
                            // slots
                        });
                        axios.post('/venta', data)
                            .then( (response) => {
                                this.ventas = [];
                                this.saveCats();
                                console.log(response);
                                // this.print(response.data.data);
                                this.toastedmensaje(response.data.mensaje);
                                loader.hide();
                            })
                            .catch( (error) => {
                                this.toastedmensaje("Los datos proporcionados no son válidos");
                                console.log(error);
                                loader.hide();
                            });
                    }else{
                        this.toastedmensaje('Seleccione almenos un servicio para registrar la venta');
                    }

                }else{
                    this.toastedmensaje('Seleccione un cliente para registrar la venta');
                }

            },
            addservicio(){
                EventBus.$emit('servicios-venta');
            },
            nuevo(){
                EventBus.$emit('servicios-venta');
            },
            calitemsubtotal(tag) {
                if (tag.descuento>=0) {
                    console.log(tag);
                    let tagtotal = tag.servicio.precio;

                    // tag.total = tag.servicio ? tag.servicio.descuento.toFixed(2) * tag.cantidad : tag.servicio.precio.toFixed(2) * tag.cantidad;
                    tag.total = tagtotal.toFixed(2) - parseFloat(tag.descuento).toFixed(2);
                    //console.log(tagtotal);
                    this.saveCats();
                    
                }else{
                    tag.descuento = 0
                }
                
            },
            removeSer(x) {
                this.ventas.splice(x, 1);
                this.saveCats();
                this.toastedmensaje("Se removió el servicio");
            },
            saveCats() {
                EventBus.$emit('carrito-ventas', this.ventas);
                const parsed = JSON.stringify(this.ventas);
                localStorage.setItem('ventas', parsed);
            },
            editar(item){

            },
            toastedmensaje(mensaje){
                this.$toasted.global.my_app_car({
                    message : mensaje
                });
            },
            print (item) {
                EventBus.$emit('multi-venta-print', item);
                console.log(item);
                // Pass the element id here
                setTimeout(async() => {
                   await this.$htmlToPaper('printMe');
                }, 500);

            },

            observacioncliente(){
                if (this.selectcliente && this.selectcliente.observaciones) {
                    $("#modalObservacionCliente").modal();
                }
                
            }
        }
    }
</script>
