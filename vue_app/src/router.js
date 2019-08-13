import Vue from 'vue'
import Router from 'vue-router'
// 引入组件

import Home from './components/Home.vue'
import MyRacoon from './components/myRacoon/MyRacoon.vue'
import Settings from "./components/myRacoon/Settings.vue"
import Messages from "./components/myRacoon/Messages.vue"

import Index from './components/common/Index.vue'
import Cart from './components/Cart/Cart.vue'

import Login from './components/Index/Login.vue' // 登录vue
import Recommend from './components/common/Recommend.vue' // 登录vue
import Details from './components/Index/Details.vue' // 详情vue
import HeaderLbMove from './components/Index/HeaderLbMove.vue'

Vue.use(Router)

export default new Router({
    routes: [
        //为组件指定访问路径
        {
            path: '/',
            component: Home
        },
        {
            path: '/Home',
            component: Home
        },
        {
            path: '/MyRacoon',
            component: MyRacoon
        },
        {
            path:'/Settings',
            component:Settings
        },
        {
            path:'/Messages',
            component:Messages
        },
        {
            path: '/Cart',
            component: Cart
        },
        {
            path: '/Index',
            component: Index
        },
        {
            path: '/Login',
            component: Login
        },
        {
            path: '/Recommend',
            component: Recommend
        },
        {
            path: '/Details',
            component: Details
        },
        {
            path: '/HeaderLbMove',
            component: HeaderLbMove
        }

    ]
})