import Vue from 'vue'
import App from './App.vue'
import router from './router'
import store from './store'
import axios from "axios"
axios.defaults.baseURL = "http://127.0.0.1:5050/"
Vue.prototype.axios = axios
import MintUI from "mint-ui"
import "mint-ui/lib/style.css"
/* 引入轮博图组件必备,务删,我试过,后果很严重!!! */
import {
    Swipe,
    SwipeItem
} from "mint-ui";
Vue.component(Swipe.name, Swipe);
Vue.component(SwipeItem.name, SwipeItem);

Vue.use(MintUI)
Vue.config.productionTip = false

new Vue({
    router,
    store,
    render: h => h(App)
}).$mount('#app')