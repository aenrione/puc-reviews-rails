import Vue from 'vue/dist/vue.esm';
import App from '../app.vue';
import '../css/application.css';
import "bootstrap";

document.addEventListener("turbolinks:load", () => {
  $('[data-toggle="tooltip"]').tooltip()
  $('[data-toggle="popover"]').popover()
})
 

document.addEventListener('DOMContentLoaded', () => {
  const app = new Vue({
    el: '#vue-app',
    components: { App },
  });

  return app;
});
