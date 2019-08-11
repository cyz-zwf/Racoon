import Vue from 'vue'
import Vuex from 'vuex'

Vue.use(Vuex)

export default new Vuex.Store({
  state: { 
    cartCount: 0   //保存购物车数量
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
    }
  },
  getters: {
    getCartCount(state) {
      return state.cartCount;
    }
  },
  actions: {}
})