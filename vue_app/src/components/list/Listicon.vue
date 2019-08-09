<template>
    <div>
        <!-- 分页页面的子组件 -->
        <ul>
            <li v-for="(item, i) of list " :key="i">
                <img :src="`http://127.0.0.1:5050/img/list/`+item.img_url" alt="">
               <div>{{item.title}}</div>
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
                console.log(this.list)
            })
        }
    },
    created(){
        this.LoadMore();
    }
}
</script>
<style scoped>
    ul{
        list-style-type:none !important;
    }
</style>
