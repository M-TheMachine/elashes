<template>
    <div class="modal fade" id="formUsuario" tabindex="-1" aria-labelledby="UsuarioModalLabel" aria-hidden="true">
        <div class="modal-dialog modal-lg modal-dialog-centered">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="UsuarioModalLabel">
                        <span v-if="data.id">Editar Usuario</span>
                        <span v-else>Nuevo Usuario</span>
                    </h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <form class="needs-validation" @submit.prevent="guardar" novalidate>

                        <div class="form-group">
                            <!-- <label for="sucursal_id" class="col-form-label">Sucursal:</label>
                            <multiselect name="sucursal_id" id="sucursal_id" v-model="data.sucursals" :options="sucursals" :multiple="true" :limit="3" :max-height="600" :show-no-results="false" :hide-selected="false" :show-labels="false" placeholder="Sucursal" track-by="nombre" label="nombre"><span slot="noResult">No se encontraron elementos. Considere cambiar la consulta de búsqueda.</span></multiselect> -->
                            <!-- <select class="form-control" id="sucursal_id" aria-label="" v-model="data.sucursal_id" required>
                                <option v-for="(item, index) in sucursals" :key="'suc'+index" :value="item.id">{{ item.nombre }}</option>
                            </select> -->
                            <!-- <div class="invalid-feedback">
                                Se requiere Sucursal.
                            </div> -->
                        </div>

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
                                <input type="date" class="form-control" id="fecha_nacimiento" placeholder="" v-model="data.fecha_nacimiento" required>
                                <div class="invalid-feedback">
                                    Se requiere Fecha de nacimiento.
                                </div>
                            </div>
                        </div>
                        
                        <div class="form-group">
                            <label for="email" class="col-form-label">Correo electrónico:</label>
                            <input type="text" class="form-control" id="email" placeholder="" v-model="data.email" required>
                            <div class="invalid-feedback">
                                Se requiere Correo electrónico.
                            </div>
                        </div>
                        
                        <div class="row">
                            <div class="col-md-4 form-group">
                                <label for="username" class="col-form-label">Nombre de usuario:</label>
                                <input type="text" class="form-control" id="username" placeholder="" v-model="data.username" required>
                                <div class="invalid-feedback">
                                    Se requiere Nombre de usuario.
                                </div>
                            </div>
                            <div class="col-md-4 form-group">
                                <label for="codigo" class="col-form-label">Código:</label>
                                <input type="text" class="form-control" id="codigo" placeholder="" v-model="data.codigo">
                            </div>
                            <div class="col-md-4 form-group">
                                <label for="rol" class="col-form-label">Rol:</label>
                                <select class="form-control" id="rol" aria-label="" v-model="data.rol" required>
                                    <option value="admin">Administrador</option>
                                    <option value="supervisor">Supervisor</option>
                                    <option value="secretario">Secretario</option>
                                    <option value="operador">Operador</option>
                                </select>
                                <div class="invalid-feedback">
                                    Se requiere Rol.
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            
                            <div class="col-md-6 form-group">
                                <label for="password" class="col-form-label">Contraseña:</label>
                                <input v-if="data.id" type="text" class="form-control" id="password" placeholder="" v-model="data.password">
                                <input v-else type="text" class="form-control" id="password" placeholder="" v-model="data.password" required>
                                <div class="invalid-feedback">
                                    Se requiere Contraseña.
                                </div>
                            </div>
                            <div class="col-md-6 form-group">
                                <label for="cpassword" class="col-form-label">Confirmar Contraseña:</label>
                                <input v-if="data.id" type="text" class="form-control" id="cpassword" placeholder="" v-model="data.password_confirmation">
                                <input v-else type="text" class="form-control" id="cpassword" placeholder="" v-model="data.password_confirmation" required>
                                <div class="invalid-feedback">
                                    Se requiere Confirmar Contraseña.
                                </div>
                            </div>
                        </div>

                        <div class="col-md-12">
                            <p class="text-center font-italic mb-0"><small>Mínimo 8 carácteres</small></p>
                        </div>
                        
                        <!-- <div class="form-group">
                            <label for="message-text" class="col-form-label">Message:</label>
                            <textarea class="form-control" id="message-text"></textarea>
                        </div> -->
                        <hr class="my-4">
                        <button type="submit" class="btn btn-primary float-right">Guardar</button>
                    </form>
                </div>
                <!-- <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Cerrar</button>
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
                sucursals:[],
                sucursals_id:[],
                // model for datastore
                data: {
                    id:'',
                    nombre:'',
                    celular:'',
                    ci:'',
                    fecha_nacimiento:'',
                    codigo:'',
                    username:'',
                    email:'',
                    password:'',
                    password_confirmation:'',
                    sucursals:[],
                    rol:'',
                }
            };
        },
        created(){
            EventBus.$on('usuario-edit', newData => {
                if(newData){
                    console.log(newData);
                    this.data = newData;
                }else{
                    this.data = {
                        id:'',
                        nombre:'',
                        celular:'',
                        ci:'',
                        fecha_nacimiento:'',
                        codigo:'',
                        username:'',
                        email:'',
                        password:'',
                        password_confirmation:'',
                        //sucursals:[],
                        rol:'',
                    };
                }
            });
        },
        mounted() {
            //this.getSucursals();
            console.log('Component mounted.')
        },
        methods: {
            getSucursals() {
                // console.log("init get");
                let loader = Vue.$loading.show({
                    color: 'red'
                    },{
                    // slots
                    });
                axios.get('/getsucursals')
                    .then(response => {
                        console.log(response);
                        this.sucursals = response.data.data;
                        loader.hide();
                    });
            },
            guardar(){
                let loader = Vue.$loading.show({
                color: 'red'
                },{
                // slots
                });
                //console.log(this.data.sucursals);
                var newdata = {
                    id: this.data.id,
                    nombre: this.data.nombre,
                    celular: this.data.celular,
                    ci:this.data.ci,
                    fecha_nacimiento:this.data.fecha_nacimiento,
                    codigo:this.data.codigo,
                    username:this.data.username,
                    email:this.data.email,
                    password:this.data.password,
                    password_confirmation:this.data.password_confirmation,
                    //sucursals:this.data.sucursals,
                    rol:this.data.rol,
                };
                //newdata.sucursals = JSON.stringify(this.data.sucursals);
                console.log(newdata);
                if (this.data.id) {
                    axios.put('/usuario/'+newdata.id, newdata)
                    .then( (response) => {
                        EventBus.$emit('usuario-changed', 'cambios');
                        console.log(response);
                        this.toastedmensaje(response.data.mensaje);
                        loader.hide();
                    })
                    .catch( (error) => {
                        this.toastedmensaje("Los datos proporcionados no son válidos");
                        console.log(error);
                        loader.hide();
                    });
                }else{
                    axios.post('/usuario', newdata)
                    .then( (response) => {
                        EventBus.$emit('usuario-changed', 'cambios');
                        this.data = {
                            id:'',
                            nombre:'',
                            celular:'',
                            ci:'',
                            fecha_nacimiento:'',
                            codigo:'',
                            username:'',
                            email:'',
                            password:'',
                            password_confirmation:'',
                            // sucursals:[],
                            rol:'',
                        };
                        console.log(response);
                        this.toastedmensaje(response.data.mensaje);
                        loader.hide();
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
