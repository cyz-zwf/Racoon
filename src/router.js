import Vue from 'vue'
import Router from 'vue-router'
// 引入组件
import Home from '../src/components/common/Home.vue'

Vue.use(Router)

export default new Router({
  routes: [
   //为组件指定访问路径
   {path:'/Home',component:Home}
  ]
})
