import Vue from 'vue'
import Router from 'vue-router'
// 引入组件

import Home from './components/Home.vue'
import MyRacoon from './components/myRacoon/MyRacoon.vue'

import Index from './components/common/Index.vue'

import Login from './components/Index/Login.vue' // 登录vue


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
            path: '/Index',
            component: Index
        },
        {
            path: '/Login',
            component: Login
        }

    ]
})