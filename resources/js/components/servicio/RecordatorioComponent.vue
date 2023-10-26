<template>
    <div class="modal fade" id="recordatoriosview" tabindex="-1" aria-labelledby="ServicioModalLabel" aria-hidden="true">
        <div class="modal-dialog modal-lg modal-dialog-centered">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="ServicioModalLabel">
                        <span>Recordatorios </span>
                    </h5>
                    <button type="button" id="closemodelservicio" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>

                <div class="modal-body">
                    <form class="needs-validation" @submit.prevent="guardar" novalidate>
                        <div class="row">
                            <div class="col-md-6">
                                <div class="form-group">
                                    <label for="nombre" class="col-form-label">Nombre:</label>
                                    <input type="text" class="form-control" id="nombre" placeholder="" v-model="data.nombre" required>
                                    <div class="invalid-feedback">
                                        Se requiere Nombre.
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="dias" class="col-form-label">Días:</label>
                                    <input type="number" class="form-control" id="dias" placeholder="" v-model="data.dias" required>
                                    <div class="invalid-feedback">
                                        Se requiere días.
                                    </div>
                                </div>

                            </div>
                             <div class="col-md-6">
                                 <div class="form-group">
                                    <label for="mensaje" class="col-form-label">Mensaje:</label>
                                    <textarea class="form-control" id="mensaje" v-model="data.mensaje" rows="6" required></textarea>
                                    <div class="invalid-feedback">
                                        Se requiere mensaje.
                                    </div>
                                </div>
                             </div>
                             <div class="col-12 text-right">
                                 <button type="submit" class="btn btn-primary">Guardar</button>
                             </div>
                        </div>

                    </form>
                    <div class="row justify-content-center mt-3">
                        <div class="col-12">
                            <h4 class="text-white">Recordatorios</h4>
                        </div>
                        <div class="col-12">
                            <div class="table-responsive">
                                <table class="table table-hover">
                                    <caption>Lista de recordatorios</caption>
                                    <thead>
                                        <tr>
                                            <th scope="col">Nombre</th>
                                            <th scope="col">Días</th>
                                            <th scope="col">Mensaje</th>
                                            <th scope="col">Acción</th>

                                        </tr>
                                    </thead>
                                    <tbody>
                                        <tr v-for="(item,index) in recordatorios" :key="'record'+index">
                                            <!-- <th scope="row">{{ index+1 }}</th> -->
                                            <td>{{ item.nombre }}</td>
                                            <td>{{ item.dias }}</td>
                                            <td>{{ item.mensaje }}</td>
                                            <td>
                                                <button type="button" class="btn btn-primary btn-lg" @click="editar(item)">
                                                    <i class="bi bi-pencil-square"></i>
                                                </button>
                                                <button type="button" class="btn btn-primary btn-lg" @click="eliminarrecordatorio(item)">
                                                    <i class="bi bi-trash"></i>
                                                </button>
                                            </td>
                                        </tr>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- <div class="modal-footer">

                </div> -->

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
                recordatorios:[],
                // model for datastore
                data: {
                    id:'',
                    nombre:'',
                    servicio_id:'',
                    dias:'',
                    mensaje:''
                }
            };
        },
        created(){
            EventBus.$on('recordatorio-view', servicioId => {
                this.data.servicio_id = servicioId;
                setTimeout(() => {
                    this.getResults();
                }, 1000);

            });
        },
        mounted() {
            console.log('Component mounted.')
        },
        methods: {
            getResults(){
                let loader = Vue.$loading.show({
                color: 'red'
                },{
                // slots
                });
                axios.get('/recordatorio/?id='+this.data.servicio_id)
                    .then(response => {
                        console.log(response);
                        this.recordatorios = response.data.data;
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
                    axios.put('/recordatorio/'+this.data.id, this.data)
                    .then( (response) => {
                        this.data.id = '';
                        this.data.nombre = '';
                        this.data.mensaje = '';
                        this.data.dias = '';
                        this.toastedmensaje(response.data.mensaje);
                        console.log(response);
                        // EventBus.$emit('servicio-changed', 'cambios');
                        loader.hide();
                        this.getResults();
                    })
                    .catch( (error) => {
                        this.toastedmensaje("Los datos proporcionados no son válidos");
                        console.log(error);
                        loader.hide();
                    });
                }else{
                    axios.post('/recordatorio', this.data)
                    .then( (response) => {
                        // EventBus.$emit('servicio-changed', 'cambios');
                        this.data.id = '';
                        this.data.nombre = '';
                        this.data.mensaje = '';
                        this.data.dias = '';
                        console.log(response);
                        this.toastedmensaje(response.data.mensaje);
                        loader.hide();
                        this.getResults();
                    })
                    .catch( (error) => {
                        this.toastedmensaje("Los datos proporcionados no son válidos");
                        console.log(error);
                        loader.hide();
                    });
                }

            },
            editar(item){
                this.data.id = item.id;
                this.data.nombre = item.nombre;
                this.data.mensaje = item.mensaje;
                this.data.dias = item.dias;
            },
            toastedmensaje(mensaje){
                this.$toasted.global.my_app_car({
                    message : mensaje
                });
            },
            eliminarrecordatorio(item){
                if(confirm('¿Eliminar Recordatorio?')){
                    let loader = Vue.$loading.show({
                    color: 'red'
                    },{
                    // slots
                    });
                    axios.delete('/recordatorio/'+item.id)
                        .then( (response) => {
                            console.log(response);
                            this.toastedmensaje(response.data.mensaje);
                            loader.hide();
                            this.getResults();
                        })
                        .catch( (error) => {
                            this.toastedmensaje("Los datos proporcionados no son válidos");
                            console.log(error);
                            loader.hide();
                        });
                }

            },
        },

    }
</script>
