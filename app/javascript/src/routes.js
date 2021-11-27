import Vue from 'vue/dist/vue.esm';
import VueRouter from 'vue-router';
Vue.use(VueRouter);
import shell from 'vue-shell'

Vue.use(shell);
import HomeIndex from './components/home/index.vue';
import ErrorsIndex from './components/errors/index.vue';
import Error500 from './components/errors/500.vue';
import Error404 from './components/errors/404.vue';

const router = new VueRouter({
  mode: 'history',
  base: `${I18n.prefix}`,
  routes: [
    { path: '/', component: HomeIndex, name: 'root_path' },
    { path: '/errors', component: ErrorsIndex, name: 'errors_path' },
    { path: '/500', component: Error500 },
    { path: '/404', component: Error404 },
    { path: '*', redirect: '/404' }
  ]
});

export default router;
