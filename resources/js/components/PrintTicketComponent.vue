<template>
    <div class="d-none">
        <div id="printMe">
            <div class="container" v-if="selectval.ficha">
                <div class="row justify-content-center">
                    <div class="col-md-8">
                        <div class="card">
                            <!-- <div class="card-header">TICKET <b>#{{ selectval.ficha }}</b></div> -->

                            <div class="card-body">

                                <p><strong>Cliente: </strong>. {{ selectval.cliente.nombre }}</p>
                                <p><strong>Servicio: </strong>. {{ selectval.servicio.nombre2 }} / {{ selectval.servicio.nombre }}</p>
                                <p><strong>Operaria: </strong>. {{ selectval.user ? selectval.user.nombre : 'Sin asignar' }}</p>
                            </div>
                        </div>
                    </div>
                </div>
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
                selectval: {},
            }
        },
        created(){
            EventBus.$on('venta-print', data => {
                this.selectval = data;
                console.log(this.selectval);
            });
        },
        mounted() {
            console.log('Component mounted.')
        }
    }
</script>
