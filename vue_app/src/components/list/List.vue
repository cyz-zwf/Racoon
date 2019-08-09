<template>
    <div class="Recoonlist">
        <headerse></headerse>
        <!-- listbox -->
        <div class="listbox">
            <div class="leftlist">
                <ul class="left_ul" v-for="(item,i) of lis" :key="i"> 
                    <li @click="activeColor">
                        <div class="listColor">{{item}}</div> 
                    </li>
                </ul>
            </div>
            <!-- 展示框 -->
            <div class="rightlist">
                <ul>
                    <li class="active">
                        <h6>为你分类</h6>
                        <div></div>
                    </li>
                    <li>
                        <h6>美容</h6>
                        <div></div>
                    </li>
                    <li>
                        <h6>奶粉</h6>
                        <div></div>
                    </li>
                </ul>
            </div>
        </div>
    </div>
</template>
<script>
export default {
    methods:{
        activeColor(e){
           console.log( e.target)
        }
    },
    data(){
        return {
            lis:["为你分类","美容彩妆","奶粉纸尿裤","母婴专区","营养保健","数码专家","个人洗护","服饰鞋靴","运动户外","手表配饰","家居生活","轻奢","充值中心","服饰鞋靴","运动户外","手表配饰","家居生活","轻奢","充值中心","美容彩妆","奶粉纸尿裤","母婴专区","营养保健"],
            active:"",
            activeColor:'',
        }
    }
}
</script>
<style scoped>
/* 最外层盒子 */
p{margin:0;padding:0}
.listbox{
  display:flex;
  margin-top:42px;
  border-top :1px solid rgba(133, 126, 126,.2);
}
/* 左侧分类栏 */
.left_ul{
    list-style-type:none;
    padding:0px;
    margin:0;
  
}
/* 左侧设置每个li的值 */
.left_ul li{
    width:120px;
    height:35px;
    font-size: .4rem; 
}
 li div.listColor{
    /* background-color:tomato; */
    width:100px;
    height:20px;
    text-align:center;
    line-height: 20px;
    border-radius:10px;
    margin-left:10px;
    margin-top:7.5px;
}
/* 右侧分类栏 */
.rightlist{
  width:100%;
  border-left:1px solid rgba(133, 126, 126,.2);
}
/* 右侧ul */
.rightlist ul{
    list-style-type:none;
}
.rightlist ul li{
    display:none;
}
/* 切换显示和隐藏 */
.rightlist ul li.active{
    display:block;
}
</style>
