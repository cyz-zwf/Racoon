import Vue from 'vue'
import Vuex from 'vuex'

Vue.use(Vuex)

export default new Vuex.Store({
  state: {
    isLogged:false,
  },
  mutations: {
    isLogin(){
      state.isLogged=true;
    },
    isLogout(){
      state.isLogged=false;
    }
  },
  actions: {

  }
})
