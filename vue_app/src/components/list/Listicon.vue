<template>
    <div class="left">
        <!-- 分页页面的子组件 -->
        <ul>
            <li v-for="(item, i) of list " :key="i">
                <img :src="`http://127.0.0.1:5050/img/list/`+item.img_url" alt="" class="imgli">
               <div class="title">{{item.title}}</div>
            </li>
        </ul>
    </div>
</template>
<script>
export default {
    data(){
        return {
           list:[], 
        }
    },
    methods:{
        LoadMore(){
            var url="list";
            this.axios(url).then((res)=>{
                this.list=res.data.data
                //console.log(this.list)
            })
        }
    },
    created(){
        this.LoadMore();
    }
}
</script>
<style scoped>
div.left{
    margin-left:-60px;
    margin-top:-18px;
}
    ul{
        list-style-type:none ;
    }
    ul li{
        float:left;
    
    }
    ul li img.imgli{
        width:70px;
        height:70px;
    }
     ul li div.title{
         font-size:.35rem;
     }
</style>
