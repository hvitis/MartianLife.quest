import Vue from 'vue/dist/vue.esm';
import Vuex from 'vuex';
Vue.use(Vuex);

import locationStore from './stores/locations.store';

const store = new Vuex.Store({
  modules: {
    locationStore
  }
});

export default store;
