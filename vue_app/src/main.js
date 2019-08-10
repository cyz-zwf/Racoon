import Vue from 'vue'
import App from './App.vue'
import router from './router'
import store from './store'
import axios from "axios"
axios.defaults.baseURL = "http://127.0.0.1:5050/"
// 7.配置axios 在发生ajax时,保存session信息
axios.defaults.withCredentials = true;
Vue.prototype.axios = axios
import MintUI from "mint-ui"
import "mint-ui/lib/style.css"
import HeaderLb from './components/Index/HeaderLb.vue'

// 顶部搜索和轮播
Vue.component("headerlb", HeaderLb);
import HeaderSe from './components/Index/HeaderSe.vue'
// 顶部搜索框,使用方法同下
Vue.component("headerse", HeaderSe);
import Recommend from './components/common/Recommend'
Vue.component("recommend", Recommend);

// 全局轮播图,想用直接写<headerhbmove></headerhbmove>,无需担心路径
import HeaderLbMove from './components/Index/HeaderLbMove.vue'
Vue.component("headerhbmove", HeaderLbMove);

Vue.use(MintUI)
Vue.config.productionTip = false

new Vue({
    router,
    store,
    render: h => h(App)
}).$mount('#app')