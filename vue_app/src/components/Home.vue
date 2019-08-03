<template>
    <div>
        <!-- 顶部导航条 -->
        <!-- 调用子组件 传参-->
        <!-- 面板组件 -->
        <mt-tab-container v-model="active">
            <mt-tab-container-item id="index">
                这里是主页内容组件
            </mt-tab-container-item>
            <mt-tab-container-item id="list">
                这里是分类内容组件
                <list></list>
            </mt-tab-container-item>
            <mt-tab-container-item id="cart">
                这里是购物车内容组件
            </mt-tab-container-item>
            <mt-tab-container-item id="myhome">
                这里是我的浣熊内容组件
            </mt-tab-container-item>
        </mt-tab-container>
        <!-- 底部的导航条 -->
        <mt-tabbar v-model="active" fixed>
            <mt-tab-item id="index" @click.native="ChangeState(0)">
                <tabbaricon :selectedImage="require('../assets/ic_index_selected.png')"
            :normalImage="require('../assets/ic_index_normal.png')"
            :focused="currentIndex[0].isSelect"></tabbaricon>
                首页
            </mt-tab-item>
            <mt-tab-item id="list" @click.native="ChangeState(1)">
               <tabbaricon :selectedImage="require('../assets/ic_list_selected.png')"
                :normalImage="require('../assets/ic_list_normal.png')"
                :focused="currentIndex[1].isSelect"></tabbaricon>
                分类
            </mt-tab-item>
            <mt-tab-item id="cart" @click.native="ChangeState(2)">
                <tabbaricon :selectedImage="require('../assets/ic_shop_selected.png')"
            :normalImage="require('../assets/ic_shop_normal.png')"
            :focused="currentIndex[2].isSelect"></tabbaricon>
                购物车
            </mt-tab-item>
            <mt-tab-item id="myhome" @click.native="ChangeState(3)">
                <tabbaricon :selectedImage="require('../assets/ic_myhome_selected.png')"
            :normalImage="require('../assets/ic_myhome_normal.png')"
            :focused="currentIndex[3].isSelect"></tabbaricon>
                我的浣熊
            </mt-tab-item>
        </mt-tabbar>
    </div>
</template>
<script>
// 引入子组件
import TabBarIcon from './common/TabBarIcon'  //引入底部导航图片组件
import List from './list/List.vue' //引入分类子组件

export default {
    // 注册子组件
    components:{
        "tabbaricon" : TabBarIcon,  //注册底部导航图片组件
        "list": List, //注册分页子组件
    },
    data(){
        return {
            active:"index",
            currentIndex:[
                {isSelect:true},
                {isSelect:false},
                {isSelect:false},
                {isSelect:false},
            ]
        }
    },
    methods:{
        ChangeState(idx){
            for(var i=0;i<this.currentIndex.length;i++){
                var ui=idx;
                if(ui==i){
                    this.currentIndex[i].isSelect=true;
                }else{
                    this.currentIndex[i].isSelect=false;
                }
            }
        }
    },
}
</script>
<style scoped>
    /* 底部导航条组件默认样式  */
    .mint-tabbar>.mint-tab-item{
        color:#999;
    }
    /* 修改组件选择的样式 */
    .mint-tabbar>.mint-tab-item.is-selected{
        background-color:transparent;
        color:#7A5228;
    }
</style>