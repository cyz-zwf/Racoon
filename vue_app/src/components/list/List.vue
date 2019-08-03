<template>
    <div class="Recoonlist">
        <div class="listbox">
            <div class="leftlist">
                <ul class="left_ul" v-for="(item,i) of lis" :key="i"> 
                    <li>{{item}}</li>
                </ul>
            </div>
            <div class="rightlist">
                
            </div>
        </div>
    </div>
</template>
<script>
export default {
    data(){
        return {
            lis:["为你分类","美容彩妆","奶粉纸尿裤","母婴专区","营养保健","数码专家","个人洗护","服饰鞋靴","运动户外","手表配饰","家居生活","轻奢","充值中心","服饰鞋靴","运动户外","手表配饰","家居生活","轻奢","充值中心","美容彩妆","奶粉纸尿裤","母婴专区","营养保健"],
        }
    }
}
</script>
<style scoped>
/* 最外层盒子 */
*{
    margin:0;padding:0;
}
.listbox{
    display:flex;
}
/* 左侧分类栏 */
.left_ul{
    list-style-type:none;
}
/* 设置每个li的值 */
.left_ul li{
    width:120px;
    height:50px;
    border:1px solid #000;
    line-height:50px;
}

/* 右侧分类栏 */
.rightlist{
    border:1px solid #000;
    width :289px;
}
</style>
