import Vue from 'vue'
import App from './App.vue'
import router from './router'
import store from './store'
import axios from "axios"
axios.defaults.baseURL = "http://127.0.0.1:5050/"
Vue.prototype.axios = axios
import MintUI from "mint-ui"
import "mint-ui/lib/style.css"
import HeaderLb from './components/Index/HeaderLb.vue'
// 全局轮播图,想用直接写<headerlb></headerlb>,无需担心路径
Vue.component("headerlb", HeaderLb)

Vue.use(MintUI)
Vue.config.productionTip = false

new Vue({
    router,
    store,
    render: h => h(App)
}).$mount('#app')