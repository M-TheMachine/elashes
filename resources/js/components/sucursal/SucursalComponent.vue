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
                <button type="button" class="btn btn-primary btn-lg"  @click="nuevo" data-backdrop="static" data-toggle="modal" data-target="#formSucursal">Crear</button>
            </div>
        </div>
        <div class="row align-content-center align-items-center  justify-content-between bg2">
            <!-- <div class="container">
                <div class="row  align-content-center align-items-center  justify-content-between"> -->
                    <div class="col">
                        <h1 class="titleh1 m-0">SUCURSALES</h1>
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
                        <caption>Lista de Sucursales ({{ datos.from }} - {{ datos.to }} de {{ datos.total }})</caption>
                        <thead>
                            <tr>
                                <th scope="col">Sucursal</th>
                                <th scope="col">Dirección</th>
                                <th scope="col">Teléfono</th>
                                <th scope="col">Acción</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr v-for="(item,index) in datos.data" :key="'ser'+index">
                                <td>{{ item.nombre }}</td>
                                <td>{{ item.direccion }}</td>
                                <td>{{ item.telefono }}</td>
                                <td>
                                    <a :href="'/verreportesucursal/'+item.id" class="btn btn-primary btn-lg">Reportes</a>

                                    <button v-if="user.rol == 'root' || user.rol == 'admin'" type="button" class="btn btn-primary btn-lg" @click="editar(item)" data-backdrop="static" data-toggle="modal"  data-target="#formSucursal">
                                        <i class="bi bi-pencil-square"></i>
                                    </button>
                                    <!-- <button type="button" class="btn btn-primary btn-lg" @click="selectsucursal = item;order='ventas.created_at'" data-backdrop="static" data-toggle="modal" data-target="#selectFechaModal">
                                        Ventas
                                    </button>
                                    <button type="button" class="btn btn-primary btn-lg" @click="selectsucursal = item;order='serviciov'" data-backdrop="static" data-toggle="modal" data-target="#selectFechaModal">
                                        Por Servicio
                                    </button>
                                    <button type="button" class="btn btn-primary btn-lg" @click="selectsucursal = item;order='clientev'" data-backdrop="static" data-toggle="modal" data-target="#selectFechaModal">
                                        Por Cliente
                                    </button>
                                    <button type="button" class="btn btn-primary btn-lg" @click="selectsucursal = item;order='operadora'" data-backdrop="static" data-toggle="modal" data-target="#selectFechaModal">
                                        Por Operador
                                    </button> -->
                                    <!-- <a href="/" class="btn btn-primary btn-lg">Ventas</a> -->
                                    <!-- <a href="/" class="btn btn-primary btn-lg">Por Servicio</a>
                                    <a href="/verreportesucursal" class="btn btn-primary btn-lg">Por Cliente</a>
                                    <a href="/" class="btn btn-primary btn-lg">Por Operador</a> -->

                                </td>
                            </tr>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
        <div class="modal fade" id="formSucursal" tabindex="-1" aria-labelledby="SucursalModalLabel" aria-hidden="true">
            <div class="modal-dialog modal-dialog-centered">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="SucursalModalLabel">
                            <span v-if="data.id">Editar Sucursal</span>
                            <span v-else>Nuevo Sucursal</span>
                        </h5>
                        <button type="button" class="close" id="closemodelsucursal" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                     <form class="needs-validation" @submit.prevent="guardar" novalidate>
                    <div class="modal-body">
                            <div class="row">
                                <div class="col-12">
                                    <div class="form-group">
                                        <label for="nombre" class="col-form-label">Sucursal:</label>
                                        <input type="text" class="form-control" id="nombre" placeholder="" v-model="data.nombre" required>
                                        <div class="invalid-feedback">
                                            Se requiere Nombre.
                                        </div>
                                    </div>
                                </div>
                                <div class="col-12">
                                    <div class="form-group">
                                        <label for="direccion" class="col-form-label">Dirección:</label>
                                        <input type="text" class="form-control" id="direccion" placeholder="" v-model="data.direccion">
                                        <div class="invalid-feedback">
                                            Se requiere Dirección.
                                        </div>
                                    </div>
                                </div>
                                <div class="col-12">
                                    <div class="form-group">
                                        <label for="telefono" class="col-form-label">Teléfono:</label>
                                        <input type="text" class="form-control" id="telefono" placeholder="" v-model="data.telefono">
                                        <div class="invalid-feedback">
                                            Se requiere Teléfono.
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <!-- <hr class="my-4"> -->
                    </div>
                    <div class="modal-footer">
                        <button type="submit" class="btn btn-primary">Guardar</button>
                    </div>
                    </form>
                </div>
            </div>
        </div>



        <!-- <div class="modal fade" id="selectFechaModal" tabindex="-1" role="dialog" aria-labelledby="FechaModalCenter" aria-hidden="true">
            <div class="modal-dialog modal-dialog-centered" role="document">
                <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLongTitle">Rango de fechas</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <div class="form-row">
                        <div class="form-group col-6">
                            <label for="f_ini" class="text-white">INICIO</label>
                            <input type="date" v-model="f_ini" class="form-control" id="f_ini">
                        </div>
                        <div class="form-group col-6">
                            <label for="f_fin" class="text-white">FIN</label>
                            <input type="date" v-model="f_fin" class="form-control" id="f_fin">
                        </div>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Cancelar</button>
                    <button type="button" @click="reporteVenta" class="btn btn-primary">Exportar</button>
                </div>
                </div>
            </div>
        </div> -->

    </div>
</template>

<script>
    var a = 1;
    export default {
        props:['usuario'],
        data() {
            return {
                user:{},
                selectsucursal:{},
                order:"",
                textbuscar:'',
                datos:{},
                pageval:1,
                data: {
                    id:'',
                    nombre:'',
                    direccion:'',
                    telefono:'',
                },
                f_ini:'',
                f_fin:'',
            };
        },
        mounted() {
            console.log('Component mounted.');
            this.getResults();
        },
        created(){
            this.user = JSON.parse(this.usuario);
        },
         methods: {
            getResults(page = 1) {
                // console.log("init get");
                let loader = Vue.$loading.show({
                    color: 'red'
                    },{
                    // slots
                    });
                axios.get('/sucursal/?page=' + page+'&search='+this.textbuscar)
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
            guardar(){
                let loader = Vue.$loading.show({
                color: 'red'
                },{
                // slots
                });
                console.log("guardar");
                if (this.data.id) {
                    axios.put('/sucursal/'+this.data.id, this.data)
                    .then( (response) => {
                        this.getResults();
                        console.log(response);
                        this.toastedmensaje(response.data.mensaje);
                        setTimeout(() => {
                            loader.hide();
                            document.getElementById('closemodelsucursal').click();
                        }, 1000);
                    })
                    .catch( (error) => {
                        this.toastedmensaje("Los datos proporcionados no son válidos");
                        console.log(error);
                        loader.hide();
                    });
                }else{
                    axios.post('/sucursal', this.data)
                    .then( (response) => {
                        this.getResults();
                        this.data = {
                            id:'',
                            nombre:'',
                            direccion:'',
                            telefono:''
                        };
                        console.log(response);
                        this.toastedmensaje(response.data.mensaje);
                        setTimeout(() => {
                            loader.hide();
                            document.getElementById('closemodelsucursal').click();
                        }, 1000);
                    })
                    .catch( (error) => {
                        this.toastedmensaje("Los datos proporcionados no son válidos");
                        console.log(error);
                        loader.hide();
                    });
                }

            },
            nuevo(){
                this.data = {
                    id:'',
                    nombre:'',
                    direccion:'',
                    telefono:''
                };
            },
            editar(item){
               this.data = {
                    id:item.id,
                    nombre:item.nombre,
                    direccion:item.direccion,
                    telefono:item.telefono,
                };
            },
            toastedmensaje(mensaje){
                this.$toasted.global.my_app_car({
                    message : mensaje
                });
            },
            reporteVenta(){
                let title = "Sucursal : "+this.selectsucursal.nombre+" - Dirección : "+this.selectsucursal.direccion;
                window.open('/exportVentasSucursal?sucursal_id=' + this.selectsucursal.id+'&title='+title+'&order='+this.order+'&f_ini='+this.f_ini+'&f_fin='+this.f_fin, '_blank');
            }
         }
    }
</script>
