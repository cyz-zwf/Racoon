import Vue from 'vue'
import Vuex from 'vuex'

Vue.use(Vuex)

export default new Vuex.Store({
  state: {
    cartCount: 0,  //保存购物车数量
    isLogin: false,
    back:null,
  },
  mutations: {
    addItem(state) {
      state.cartCount++;
    },
    subItem(state) {
      state.cartCount--;
    },
    clearItem(state) {
      state.cartCount = 0;
    },
    Login(state) {
      state.isLogin = true;
    },
    Logout(state) {
      state.isLogin = false;
    },
    changeBack(state){
      state.back="myhome";
    },
    recoverBack(state){
      state.back=null;
    }
  },
  getters: {
    getCartCount(state) {
      return state.cartCount;
    },
    getIsLogin(state){
      return state.isLogin;
    },
    getBack(state){
      return state.back;
    }
  },
  actions: {}
})