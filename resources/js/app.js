/**
 * First we will load all of this project's JavaScript dependencies which
 * includes Vue and other libraries. It is a great starting point when
 * building robust, powerful web applications using Vue and Laravel.
 */

require('./bootstrap');

window.Vue = require('vue').default;



import Multiselect from 'vue-multiselect';

import Toasted from 'vue-toasted';
// import Loading from 'vue-loading-overlay';
import 'vue-loading-overlay/dist/vue-loading.css';
import Loading from 'vue-loading-overlay';

import VueHtmlToPaper from 'vue-html-to-paper';

const optionspr = {
    name: '_blank',
    specs: [
        'fullscreen=yes',
        'titlebar=yes',
        'scrollbars=yes'
    ],
    styles: [
        'https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css',
        'https://unpkg.com/kidlat-css/css/kidlat.css',
        '../css/landscape.css'
    ],
    timeout: 1000, // default timeout before the print window appears
    autoClose: true, // if false, the window will not close after printing
    windowTitle: window.document.title, // override the window title
};

Vue.use(VueHtmlToPaper, optionspr);



Vue.use(Loading, {
    // props
    color: 'green'
}, {
    // slots
});

Vue.use(Toasted, {
    iconPack: 'custom-class' // set your iconPack, defaults to material. material|fontawesome|custom-class
});

// options to the toast
let options = {
    type: 'success',
    icon: {
        name: 'fa fa-shopping-cart',
    },
    duration: 5000
};
// register the toast with the custom message
Vue.toasted.register('my_app_car',
    (payload) => {

        // if there is no message passed show default message
        if (!payload.message) {
            return "Oops.. "
        }
        // if there is a message show it with the message
        return payload.message;
    },
    options
);
let options1 = {
    type: 'info',
    icon: {
        name: 'fa fa-info',
    },
    duration: 5000
};
Vue.toasted.register('my_app_info',
    (payload) => {

        // if there is no message passed show default message
        if (!payload.message) {
            return "Oops.. "
        }
        // if there is a message show it with the message
        return payload.message;
    },
    options1
);

import VueLuxon from "vue-luxon";

Vue.use(VueLuxon);

Vue.use(require('vue-shortkey'))
// import Hotkeys from 'vue-hotkeys-rt'
// Vue.use(Hotkeys);
/**
 * The following block of code may be used to automatically register your
 * Vue components. It will recursively scan this directory for the Vue
 * components and automatically register them with their "basename".
 *
 * Eg. ./components/ExampleComponent.vue -> <example-component></example-component>
 */

// const files = require.context('./', true, /\.vue$/i)
// files.keys().map(key => Vue.component(key.split('/').pop().split('.')[0], files(key).default))

Vue.component('example-component', require('./components/ExampleComponent.vue').default);
Vue.component('clientes-component', require('./components/cliente/ClientesComponent.vue').default);
Vue.component('clientes-form-component', require('./components/cliente/ClienteFormComponent.vue').default);
Vue.component('clientes-detalle-component', require('./components/cliente/ClienteDetalleComponent.vue').default);
Vue.component('categorias-component', require('./components/categoria/CategoriasComponent.vue').default);
Vue.component('categoria-form-component', require('./components/categoria/CategoriaFormComponent.vue').default);
Vue.component('servicios-component', require('./components/servicio/ServicioComponent.vue').default);
Vue.component('servicio-form-component', require('./components/servicio/ServicioFormComponent.vue').default);
Vue.component('tecnica-form-component', require('./components/servicio/TecnicaFormComponent.vue').default);
Vue.component('sucursales-component', require('./components/sucursal/SucursalComponent.vue').default);
Vue.component('sucursales-detalle-component', require('./components/sucursal/VentasReporteComponent.vue').default);

Vue.component('usuarios-component', require('./components/usuario/UsuarioComponent.vue').default);
Vue.component('usuario-form-component', require('./components/usuario/UsuarioFormComponent.vue').default);
Vue.component('usuarios-detalle-component', require('./components/usuario/UsuarioDetalleComponent.vue').default);

Vue.component('venta-component', require('./components/venta/VentaComponent.vue').default);
Vue.component('nueva-venta-component', require('./components/venta/NuevaVentaComponent.vue').default);
Vue.component('servicio-venta-component', require('./components/venta/ServiciosVentaComponent.vue').default);
Vue.component('recordatorio-form-component', require('./components/servicio/RecordatorioComponent.vue').default);
Vue.component('print-ticket-component', require('./components/PrintTicketComponent.vue').default);
Vue.component('print-ticket-venta-component', require('./components/PrintTicketVentaComponent.vue').default);
Vue.component('recordatorio-component', require('./components/recordatorio/RecordatorioComponent.vue').default);
Vue.component('pagos-component', require('./components/pagos/pagosComponent.vue').default);


Vue.component('multiselect', Multiselect);
// Vue.component('hotkeys',Hotkeys);
/**
 * Next, we will create a fresh Vue application instance and attach it to
 * the page. Then, you may begin adding components to this application
 * or customize the JavaScript scaffolding to fit your unique needs.
 */

const app = new Vue({
    el: '#app',
});


// Example starter JavaScript for disabling form submissions if there are invalid fields
(function() {
    'use strict';

    // Fetch all the forms we want to apply custom Bootstrap validation styles to
    var forms = document.querySelectorAll('.needs-validation')

    // Loop over them and prevent submission
    Array.prototype.slice.call(forms)
        .forEach(function(form) {
            form.addEventListener('submit', function(event) {
                if (!form.checkValidity()) {
                    event.preventDefault()
                    event.stopPropagation()
                }

                form.classList.add('was-validated')
            }, false)
        })
})()