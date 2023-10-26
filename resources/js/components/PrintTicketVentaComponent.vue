<template>
    <div class="d-none">
        <div id="printMe">
            <div class="container" v-for="(item,index) in selectval" :key="'ve'+index">
                <div class="row justify-content-center">
                    <div class="col-md-8">
                        <div class="card">
                            <!-- <div class="card-header">TICKET #{{ item.ficha }}</div> -->

                            <div class="card-body">
                                <p><strong>Cliente: </strong>. {{ item.cliente.nombre }}</p>
                                <p><strong>Servicio: </strong>. {{ item.servicio.nombre2 }} / {{ item.servicio.nombre }}</p>
                                <p><strong>Operaria: </strong>. {{ item.user ? item.user.nombre : 'Sin asignar' }}</p>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="saltopagina"></div>
            </div>
        </div>
    </div>
</template>

<script>
    import { EventBus } from './event-bus.js';
    export default {
        props:[],
        data() {
            return {
                selectval: [],
            }
        },
        created(){
            EventBus.$on('multi-venta-print', data => {
                this.selectval = data;
                console.log(this.selectval);
            });
        },
        mounted() {
            console.log('Component mounted.')
        }
    }
</script>
