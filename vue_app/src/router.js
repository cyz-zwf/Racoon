import Vue from 'vue'
import Router from 'vue-router'
// 引入组件
import Home from './components/Home.vue'
<<<<<<< HEAD
import Cart from './components/Cart/Cart.vue'
=======
import MyRacoon from './components/myRacoon/MyRacoon.vue'
import Cart from './components/common/Cart.vue'
>>>>>>> 73b16b3d6af8322b11eab018a693549704fb014d

Vue.use(Router)

export default new Router({
  routes: [
   //为组件指定访问路径
   {path:'/Home',component:Home},
   {path:'/MyRacoon',component:MyRacoon},
   {path:'/Cart',component:Cart},
  ]
})
