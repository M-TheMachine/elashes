<template>
    <div class="modal fade" id="formCategoria" tabindex="-1" aria-labelledby="CategoriaModalLabel" aria-hidden="true">
        <div class="modal-dialog modal-lg modal-dialog-centered">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="CategoriaModalLabel">
                        <span v-if="data.id">Editar Categoria</span>
                        <span v-else>Nueva Categoria</span>
                    </h5>
                    <button type="button" id="closemodalcategoria" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <form class="needs-validation" @submit.prevent="guardar" novalidate>
                    <div class="modal-body">
                        <div class="row">
                            <div class="col-md-6">
                                <img :src="imageData ? imageData : data.imagen" alt="" width="100%">
                                <div class="custom-file">
                                    <input type="file" class="custom-file-input" id="customFile" @change="previewImage" accept="image/*">
                                    <label class="custom-file-label" for="customFile">Imagen</label>
                                </div>
                               
                            </div>
                            <div class="col-md-6">
                                <!-- <div class="form-group">
                                    <label for="categoria_id" class="col-form-label">Categoria Padre:</label>
                                    <multiselect @input="addCategoria" name="categoria_id" id="categoria_id" v-model="categoria" :options="categorias" :multiple="false" :limit="1" :max-height="600" :show-no-results="false" :hide-selected="false" :show-labels="false" placeholder="Categoria" track-by="nombre2" label="nombre2"><span slot="noResult">No se encontraron elementos. Considere cambiar la consulta de búsqueda.</span></multiselect>
                                </div> -->
                                <div class="form-group">
                                    <label for="nombre" class="col-form-label">Categoría:</label>
                                    <input type="text" class="form-control" id="nombre" placeholder="" v-model="data.nombre" required>
                                    <div class="invalid-feedback">
                                        Se requiere Nombre.
                                    </div>
                                </div>
                                <!-- <div class="form-group">
                                    <label for="descripcion" class="col-form-label">Descripción:</label>
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
                // model for datastore
                data: {
                    id:'',
                    nombre:'',
                    categoria_id:'',
                    imagen:''
                }
            };
        },
        created(){
            EventBus.$on('categoria-edit', newData => {
                if(newData){
                    console.log(newData);
                    this.data = newData;
                    if(this.data.imagen == null){
                        this.data.imagen = '/imgweb/default.jpg';
                    }
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
                        categoria_id:'',
                        nombre:'',
                        imagen:'/imgweb/default.jpg'
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
                var input = event.target;
                if (input.files && input.files[0]) {
                    var reader = new FileReader();
                    reader.onload = (e) => {
                        this.imageData = e.target.result;
                    }
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
                if (this.data.categoria_id) {
                    formData.append("categoria_id", this.data.categoria_id);
                }

                if (this.data.id) {
                    formData.append('_method', 'PUT');
                    axios.post('/categoria/'+this.data.id, formData, {
                        headers: {
                        'Content-Type': 'multipart/form-data'
                        }
                    })
                    .then( (response) => {
                        this.toastedmensaje(response.data.mensaje);
                        console.log(response);
                        EventBus.$emit('cliente-changed', 'cambios');
                        setTimeout(() => {
                            loader.hide();
                            document.getElementById('closemodalcategoria').click();
                        }, 1000);
                    })
                    .catch( (error) => {
                        this.toastedmensaje("Los datos proporcionados no son válidos");
                        console.log(error);
                        loader.hide();
                    });
                }else{
                    axios.post('/categoria', formData, {
                        headers: {
                        'Content-Type': 'multipart/form-data'
                        }
                    })
                    .then( (response) => {
                        EventBus.$emit('cliente-changed', 'cambios');
                        this.imageData = '';
                        this.categoria = '';
                        this.data = {
                            id:'',
                            nombre:'',
                            categoria_id:'',
                            imagen:'/imgweb/default.jpg'
                        };
                        console.log(response);
                        this.toastedmensaje(response.data.mensaje);
                        setTimeout(() => {
                            loader.hide();
                            document.getElementById('closemodalcategoria').click();
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
            addCategoria(item){
                console.log(item);
                this.data.categoria_id = item.id;
            }
        },

    }
</script>
