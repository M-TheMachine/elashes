<template>
    <div class="modal fade" id="formCliente" tabindex="-1" aria-labelledby="clienteModalLabel" aria-hidden="true">
        <div class="modal-dialog modal-lg modal-dialog-centered">

            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="clienteModalLabel">
                        <span v-if="data.id">Editar Cliente</span>
                        <span v-else>Nuevo Cliente</span>
                    </h5>
                    <button type="button" id="closemodalcliente" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <form class="needs-validation" @submit.prevent="guardar" novalidate>
                <div class="modal-body">

                        <div class="form-group">
                            <label for="nombre" class="col-form-label">Nombre completo:</label>
                            <input type="text" class="form-control" id="nombre" placeholder="" v-model="data.nombre" required>
                            <div class="invalid-feedback">
                                Se requiere Nombre.
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-4 form-group">
                                <label for="ci" class="col-form-label">CI:</label>
                                <input type="text" class="form-control" id="ci" placeholder="" v-model="data.ci" required>
                                <div class="invalid-feedback">
                                    Se requiere CI.
                                </div>
                            </div>
                            <div class="col-md-4 form-group">
                                <label for="celular" class="col-form-label">Celular:</label>
                                <div class="input-group">
                                    <div class="input-group-prepend">
                                        <div class="input-group-text">+591</div>
                                    </div>
                                    <input type="text" class="form-control" id="celular" placeholder="" v-model="data.celular" required>
                                    <div class="invalid-feedback">
                                        Se requiere Celular.
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-4 form-group">
                                <label for="fecha_nacimiento" class="col-form-label">Fecha de nacimiento:</label>
                                <input type="date" class="form-control" id="fecha_nacimiento" placeholder="" v-model="data.fecha_nacimiento">
                            </div>
                        </div>

                        <div class="form-group">
                            <label for="observaciones" class="col-form-label">Observaciones:</label>
                            <textarea type="text" class="form-control" id="observaciones" placeholder="" v-model="data.observaciones" required></textarea>                            
                        </div>

                        <div class="form-group">
                            <label for="email" class="col-form-label">Correo electrónico:</label>
                            <input type="email" class="form-control" id="email" placeholder="" v-model="data.email">
                            <div class="invalid-feedback">
                                Se requiere correo electrónico.
                            </div>
                        </div>
                        
                        <!-- <div class="form-group">
                            <label for="message-text" class="col-form-label">Message:</label>
                            <textarea class="form-control" id="message-text"></textarea>
                        </div> -->
                        <!-- <hr class="my-4"> -->


                </div>
                <div class="modal-footer">
                    <button type="submit" class="btn btn-primary float-right">Guardar</button>
                </div>
                </form>
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
                // model for datastore
                data: {
                    id:'',
                    nombre:'',
                    ci:'',
                    celular:'',
                    fecha_nacimiento:'',
                    email:'',
                    observaciones:'',
                }
            };
        },
        created(){
            EventBus.$on('cliente-edit', newCliente => {
                if(newCliente){
                    console.log(newCliente);
                    this.data = newCliente;
                }else{
                    this.data = {
                        id:'',
                        nombre:'',
                        ci:'',
                        celular:'',
                        fecha_nacimiento:'',
                        email:'',
                        observaciones:'',
                    };
                }
            });
        },
        mounted() {
            console.log('Component mounted.')
        },
        methods: {
            guardar(){
                let loader = Vue.$loading.show({
                color: 'red'
                },{
                // slots
                });
                console.log("guardar");
                if (this.data.id) {
                    axios.put('/cliente/'+this.data.id, this.data)
                    .then( (response) => {
                        EventBus.$emit('cliente-changed', 'cambios');
                        console.log(response);
                        this.toastedmensaje(response.data.mensaje);
                        setTimeout(() => {
                            loader.hide();
                            document.getElementById('closemodalcliente').click();
                        }, 1000);
                    })
                    .catch( (error) => {
                        this.toastedmensaje("Los datos proporcionados no son válidos");
                        console.log(error);
                        loader.hide();
                    });
                }else{
                    axios.post('/cliente', this.data)
                    .then( (response) => {
                        EventBus.$emit('cliente-changed', 'cambios');
                        this.data = {
                            id:'',
                            nombre:'',
                            ci:'',
                            celular:'',
                            fecha_nacimiento:'',
                            email:'',
                            observaciones:'',
                        };
                        console.log(response);
                        this.toastedmensaje(response.data.mensaje);

                        setTimeout(() => {
                            loader.hide();
                            document.getElementById('closemodalcliente').click();
                            // if (window.location.pathname != '/clientes') {
                            //     window.location.href = '/clientes';
                            // }
                        }, 1000);


                    })
                    .catch( (error) => {
                        this.toastedmensaje("Los datos proporcionados no son válidos");
                        console.log(error);
                        loader.hide();
                    });
                }

            },
            toastedmensaje(mensaje){
                this.$toasted.global.my_app_car({
                    message : mensaje
                });
            }
        },

    }
</script>
