<template>
    <div class="modal fade" id="formTecnica" tabindex="-1" aria-labelledby="ServicioModalLabel" aria-hidden="true">
        <div class="modal-dialog modal-lg modal-dialog-centered">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="ServicioModalLabel">
                        <span v-if="data.id">Editar Tecnica</span>
                        <span v-else>Nueva Tecnica</span>
                    </h5>
                    <button type="button" id="closemodeltecnica" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                
                <div class="modal-body">
                    <form class="needs-validation" @submit.prevent="guardar" novalidate>
                        <div class="row">
                            <div class="col-md-6">
                                <div class="form-group">
                                    <label for="categoria_id" class="col-form-label">Categoría:</label>
                                        <multiselect @input="addCategoria" name="categoria_id" id="categoria_id" v-model="categoria" :options="categorias" :multiple="false" :limit="1" :max-height="600" :show-no-results="false" :hide-selected="false" :show-labels="false" placeholder="Categoria" track-by="nombre2" label="nombre2"><span slot="noResult">No se encontraron elementos. Considere cambiar la consulta de búsqueda.</span></multiselect>
                                    </div>
                            </div>
                            <div class="col-md-6">                            
                                <div class="form-group">
                                    <label for="nombre" class="col-form-label">Nombre de la técnica:</label>
                                    <input type="text" class="form-control" id="nombre" placeholder="" v-model="data.nombre" required>
                                    <div class="invalid-feedback">
                                        Se requiere Nombre.
                                    </div>
                                </div>                                
                            </div> 

                            <div class="col-md-12">
                                <div class="form-group">
                                    <label for="nombre" class="col-form-label">Descripción:</label>
                                    <textarea type="text" class="form-control" id="descripcion" placeholder="" v-model="data.descripcion" required></textarea><br>  
                                    <button type="submit" class="btn btn-primary float-right">Guardar</button>
                                </div>                                                           
                            </div>                       
                        </div>

                        <div class="form-group">
                            
                        </div>
                    </form>

                    <div class="row align-content-center align-items-center  justify-content-between mt-3">
                        <div class="col">
                            <h4 class="text-white">Técnicas</h4>
                        </div>
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
                            <div class="btn-group btn-group-lg" role="group" aria-label="Basic example">
                                <button type="button" class="btn btn-secondary" :disabled="datos.current_page == 1" @click="getResults(datos.current_page-1)">
                                    <i class="bi bi-chevron-left"></i>
                                </button>
                                <button type="button" class="btn btn-secondary" :disabled="datos.current_page == datos.last_page" @click="getResults(datos.current_page+1)">
                                    <i class="bi bi-chevron-right"></i>
                                </button>
                            </div>
                        </div>

                        <div class="col-12">
                            <div class="table-responsive">
                                <table class="table table-hover">
                                    <caption>Lista de técnicas ({{ datos.from }} - {{ datos.to }} de {{ datos.total }})</caption>
                                    <thead>
                                        <tr>
                                            <th scope="col">Técnica</th>
                                            <th scope="col">Descripcion</th>     
                                            <th scope="col">Acción</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <tr v-for="(item,index) in datos.data" :key="'cli'+index">
                                            <!-- <th scope="row">{{ index+1 }}</th> -->
                                            <td>{{ item.nombre }}</td>
                                            <td>{{ item.descripcion }}</td>
                                            <td style="width: 135px;">                                                
                                                <button type="button" class="btn btn-primary btn-lg" @click="editar(item)" data-backdrop="static" data-toggle="modal"  data-target="">
                                                    <i class="bi bi-pencil-square"></i>
                                                </button>
                                                <button type="button" class="btn btn-primary btn-lg" @click="eliminar(item)">
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
                <div class="modal-footer">
                    
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
                categoria:{},
                categorias:[],
                textbuscar:'',
                datos:{},
                pageval:1,
                
                // model for datastore
                data: {
                    id:'',
                    nombre:'',
                    categoria_id:'',
                    descripcion:'',
                }
            };
        },
        created(){

        },
        mounted() {
            this.getcategorias();
            this.getResults();
            console.log('Component mounted.')
        },
        methods: {
           
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
            getResults(page = 1) {
                console.log("init get");
                let loader = Vue.$loading.show({
                    color: 'red'
                    },{
                    // slots
                    });
                axios.get('/tecnica/?page=' + page+'&id='+this.id+'&search='+this.textbuscar)
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
                var formData = new FormData();
                
                formData.append("nombre", this.data.nombre);
                formData.append("descripcion", this.data.descripcion);                
                if (this.data.categoria_id) {
                    formData.append("categoria_id", this.data.categoria_id);
                }

                if (this.data.id) {
                    formData.append('_method', 'PUT');
                    axios.post('/tecnica/'+this.data.id, formData, {
                        headers: {
                        'Content-Type': 'multipart/form-data'
                        }
                    })
                    .then( (response) => {
                        this.toastedmensaje(response.data.mensaje);
                        console.log(response);
                        loader.hide();
                        this.data = {
                            id:'',
                            nombre:'',                    
                            categoria_id:'',
                            descripcion:''
                        };
                        this.getResults();

                    })
                    .catch( (error) => {
                        this.toastedmensaje("Los datos proporcionados no son válidos");
                        console.log(error);
                        loader.hide();
                    });
                }else{
                    axios.post('/tecnica', formData, {
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
                            categoria_id:'',
                            descripcion:''
                        };
                        this.getResults();
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
            editar(item){
                this.data = {
                    id:item.id,
                    nombre:item.nombre,
                    descripcion:item.descripcion,
                    categoria_id:item.categoria_id
                };
                this.categorias.forEach(element => {
                    if(element.id == item.categoria_id){
                        console.log(element);
                        this.categoria = element;
                    }
                });

            },
            eliminar(item){
                if (confirm('¿Esta seguro de eliminar esta técnica?')) {
                    let loader = Vue.$loading.show({
                    color: 'red'
                    },{
                    // slots
                    });
                    axios.delete('/tecnica/'+item.id)
                    .then( (response) => {
                        
                    
                        this.getResults();
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
            },
            
            accionTecnica(newData){
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
                        descripcion:'',
                    };
                }
            },
            addCategoria(item){
                console.log(item);
                this.data.categoria_id = item.id;
            }
        },

    }
</script>
