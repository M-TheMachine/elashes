<template>
    <div class="modal fade" id="formServicio" tabindex="-1" aria-labelledby="ServicioModalLabel" aria-hidden="true">
        <div class="modal-dialog modal-lg modal-dialog-centered">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="ServicioModalLabel">
                        <span v-if="data.id">Editar Servicio</span>
                        <span v-else>Nuevo Servicio</span>
                    </h5>
                    <button type="button" id="closemodelservicio" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <form class="needs-validation" @submit.prevent="guardar" novalidate>
                <div class="modal-body">
                    <div class="row">
                        <div class="col-md-6 text-center">
                            <img :src="imageData ? imageData : data.imagen" alt="" width="100%" height="350" style="object-fit: cover;">
                            <div class="custom-file">
                                <input type="file" class="custom-file-input" id="customFile" @change="previewImage" accept="image/*">
                                <label class="custom-file-label" for="customFile">Imagen</label>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="form-group">
                                <label for="categoria_id" class="col-form-label">Categoría:</label>
                                <multiselect @input="addCategoria" name="categoria_id" id="categoria_id" v-model="categoria" :options="categorias" :multiple="false" :limit="1" :max-height="600" :show-no-results="false" :hide-selected="false" :show-labels="false" placeholder="Categoria" track-by="nombre2" label="nombre2"><span slot="noResult">No se encontraron elementos. Considere cambiar la consulta de búsqueda.</span></multiselect>
                            </div>
                            <div class="form-group">
                                <label for="nombre" class="col-form-label">Servicio:</label>
                                <input type="text" class="form-control" id="nombre" placeholder="" v-model="data.nombre" required>
                                <div class="invalid-feedback">
                                    Se requiere Nombre.
                                </div>
                            </div>

                            <!-- <h5 class="col-form-label font-weight-bold">Técnica:</h5>
                            <div v-for="(item, index) in tecnica" :key="index+'t'">                            
                                <input type="radio" :id="'tecnica'+index" name="tecnica" v-model="data.tecnica" :value="item">
                                <label :for="'tecnica'+index">{{ item }}</label>
                            </div> -->

                            <div class="form-group">
                                <label for="precio" class="col-form-label">Precio:</label>
                                <input type="text" class="form-control" id="precio" placeholder="" v-model="data.precio" required>
                                <div class="invalid-feedback">
                                    Se requiere precio.
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="comision" class="col-form-label">Comisión:</label>
                                <input type="text" class="form-control" id="comision" placeholder="" v-model="data.comision" required>
                                <div class="invalid-feedback">
                                    Se requiere comisión.
                                </div>
                            </div>
                            
                            <!-- <div class="form-group">
                                <label for="codigo" class="s-form-label">Código:</label>
                                <input type="text" class="form-control" id="codigo" placeholder="" v-model="data.codigo" required>
                                <div class="invalid-feedback">
                                    Se requiere codigo.
                                </div>
                            </div> -->
                            <div class="custom-control custom-checkbox my-1 mr-sm-2">
                                <div class="row">
                                    <div class="col-md-6">
                                        <input type="checkbox" class="custom-control-input" v-model="data.promocion" id="promocion">
                                        <label class="custom-control-label" for="promocion">Promoción</label>
                                    </div>
                                    <div class="col-md-6">
                                        <input type="checkbox" class="custom-control-input" v-model="data.extra" id="extra">
                                        <label class="custom-control-label" for="extra">Extra</label>
                                    </div>
                                </div>
                                
                            </div>
                            <!-- <div class="form-group">
                                <label for="descripcion" class="s-form-label">Descripción:</label>
                                <textarea class="form-control" id="descripcion" v-model="data.descripcion"></textarea>
                            </div> -->
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
                imageData:"",
                categoria:{},
                categorias:[],
                // tecnica:['Ninguno',
                //         'Ojo de gato',
                //         'Coreana',
                //         'Rusa',
                //         'Kawaii',
                //         'Volumen extremo'],

                // model for datastore
                data: {
                    id:'',
                    nombre:'',
                    imagen:'/imgweb/default.jpg',
                    precio:'',
                    comision:'',
                    codigo:'',
                    // tecnica:'',
                    estado:'habilitado',
                    categoria_id:'',
                    promocion:0,
                    extra:0
                }
            };
        },
        created(){
            EventBus.$on('servicio-edit', newData => {
                if(newData){
                    console.log(newData);
                    this.data = newData;
                    if(this.data.categoria_id != null){
                        this.categorias.forEach(element => {
                            if(element.id == this.data.categoria_id){
                                console.log(element);
                                this.categoria = element;
                            }
                        });
                    }
                }else{
                    this.data = {
                        id:'',
                        nombre:'',
                        imagen:'/imgweb/default.jpg',
                        precio:'',
                        comision:'',
                        codigo:'',
                        estado:'habilitado',
                        categoria_id:'',
                        promocion:0
                    };
                }
            });
        },
        mounted() {
            this.getcategorias();
            console.log('Component mounted.')
        },
        methods: {
            previewImage(event) {
                // Reference to the DOM input element
                var input = event.target;
                // Ensure that you have a file before attempting to read it
                if (input.files && input.files[0]) {
                    // create a new FileReader to read this image and convert to base64 format
                    var reader = new FileReader();
                    // Define a callback function to run, when FileReader finishes its job
                    reader.onload = (e) => {
                        // Note: arrow function used here, so that "this.imageData" refers to the imageData of Vue component
                        // Read image as base64 and set to imageData
                        this.imageData = e.target.result;
                    }
                    // Start the reader job - read file as a data url (base64 format)
                    reader.readAsDataURL(input.files[0]);

                    this.data.imagen = input.files[0];
                }
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
                        if(this.data.categoria_id != null){
                            this.categorias.forEach(element => {
                                if(element.id == this.data.categoria_id){
                                    console.log(element);
                                    this.categoria = element;
                                }
                            });
                        }
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
                var formData = new FormData();
                if (this.imageData) {
                    formData.append("imagen", this.data.imagen);
                }
                formData.append("id", this.data.id);
                formData.append("nombre", this.data.nombre);
                formData.append("precio", this.data.precio);
                formData.append("comision", this.data.comision);
                formData.append("codigo", this.data.codigo);
                if (this.data.tecnica) {
                    formData.append("tecnica", this.data.tecnica);
                }
                formData.append("estado", this.data.estado);
                formData.append("promocion", this.data.promocion ? 1 : 0);
                formData.append("extra", this.data.extra ? 1 : 0);
                if (this.data.categoria_id) {
                    formData.append("categoria_id", this.data.categoria_id);
                }

                if (this.data.id) {
                    formData.append('_method', 'PUT');
                    axios.post('/servicio/'+this.data.id, formData, {
                        headers: {
                        'Content-Type': 'multipart/form-data'
                        }
                    })
                    .then( (response) => {
                        this.toastedmensaje(response.data.mensaje);
                        console.log(response);
                        EventBus.$emit('servicio-changed', 'cambios');
                        setTimeout(() => {
                            loader.hide();
                            document.getElementById('closemodelservicio').click();
                        }, 1000);
                    })
                    .catch( (error) => {
                        this.toastedmensaje("Los datos proporcionados no son válidos");
                        console.log(error);
                        loader.hide();
                    });
                }else{
                    axios.post('/servicio', formData, {
                        headers: {
                        'Content-Type': 'multipart/form-data'
                        }
                    })
                    .then( (response) => {
                        EventBus.$emit('servicio-changed', 'cambios');
                        this.imageData = '';
                        this.categoria = '';
                        this.data = {
                            id:'',
                            nombre:'',
                            imagen:'/imgweb/default.jpg',
                            precio:'',
                            comision:'',
                            codigo:'',
                            estado:'habilitado',
                            categoria_id:'',
                            promocion:0
                        };
                        console.log(response);
                        this.toastedmensaje(response.data.mensaje);
                        setTimeout(() => {
                            loader.hide();
                            document.getElementById('closemodelservicio').click();
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
            },
            verevento(){
                EventBus.$emit('servicio-changed', 'dataf');
            },
            addCategoria(item){
                console.log(item);
                this.data.categoria_id = item.id;
            }
        },

    }
</script>
