<template>
    <div class="Recoonlist">
        <headerse></headerse>
        <!-- listbox -->
        <div class="listbox">
            <section class="leftlist" >
                <ul class="left_ul" > 
                    <li  v-for="(item,i) of lis" :key="i" >
                        <div class="listColor" :data-i=i @click="checked"  >{{item}}</div> 
                    </li>
                </ul>
            </section>
            <!-- 展示框 -->
            <div class="rightlist" >
                <ul id="rightUl">
                    <li class="active">
                        <h6>为你分类</h6>
                        <listicon></listicon>
                    </li>
                    <li>
                        <h6>美容彩妆</h6>
                        <listicon></listicon>
                    </li>
                    <li>
                        <h6>奶粉纸尿裤</h6>
                        <listicon></listicon>
                    </li>
                    <li>
                        <h6>母婴专区</h6>
                        <listicon></listicon>
                    </li>
                    <li>
                        <h6>营养保健</h6>
                        <listicon></listicon>
                    </li>
                    <li>
                        <h6>数码专家</h6>
                        <listicon></listicon>
                    </li>
                    <li>
                        <h6>个人洗护</h6>
                        <listicon></listicon>
                    </li>
                    <li>
                        <h6>服饰鞋靴</h6>
                        <listicon></listicon>
                    </li>
                    <li>
                        <h6>运动户外</h6>
                        <listicon></listicon>
                    </li>
                    <li>
                        <h6>手表配饰</h6>
                        <listicon></listicon>
                    </li>
                    <li>
                        <h6>家居生活</h6>
                        <listicon></listicon>
                    </li>
                    <li>
                        <h6>轻奢</h6>
                        <listicon></listicon>
                    </li>
                    <li>
                        <h6>充值中心</h6>
                        <listicon></listicon>
                    </li>
                     <li>
                        <h6>环球美食</h6>
                        <listicon></listicon>
                    </li>
                    <li>
                        <h6>全球工厂店</h6>
                        <listicon></listicon>
                    </li>
                    <li>
                        <h6>海外旗舰店</h6>
                        <listicon></listicon>
                    </li>
                    <li>
                        <h6>生鲜</h6>
                        <listicon></listicon>
                    </li>
                    <li>
                        <h6>宠物生活</h6>
                        <listicon></listicon>
                    </li>
                    <li>
                        <h6>国家地区馆</h6>
                    </li>
                </ul>
            </div>
        </div>
    </div>
</template>
<script>
import Listicon from './Listicon'//引入子组件
export default {
    methods:{
        init(){
            var i=document.querySelector("div.listColor");
            i.classList.add("color");

        },
        checked(e){
            var div=e.target;//获得当前元素
            var i=e.target.dataset.i; //拿到对应的下标来关联面板
            var ulLis=div.parentElement.parentElement.children;//获取所有的li
            var divs=document.querySelectorAll(" li div.listColor");//获取所有div
             //如果点击div没有出现背景样式  
            if(div.className!="color"){
                //遍历除当前点击div外其他div中的clas样式清掉
                for(var item of divs){

                    //当点击时背景变红后判断i 计算移动的位置
                    //1判断当0<i<=5的时候ul不变   2当6<=i<=10的时候移动到中部  3当11<=i<=15的时候移动到中部,当i>15
                    var ul= item.parentElement.parentElement
                    var style=getComputedStyle(ul)
                    if(i>5 && i<15){
                        ul.style.transition="all .5s linear";
                        ul.style.marginTop="-245px";
                    }
                          
                item.classList.remove("color");//在给当前div移除样式color(避免冲突)
                    
                    //切换内容 显示对应右侧的li
                    var rightUl=document.getElementById("rightUl");
                    var rightlis=rightUl.children; //获取右侧所有li 
                    //console.log(rightlis)
                    var li=rightlis[i];//下标赋值给当前li
                   // console.log(li.classList) 打印出的结果:DOMTokenList ["active", value: "active"]
                    if(li.classList.value!="active"){//如果 当前li的class值没有active
                        for(var item of rightlis ){ //遍历所有li
                            item.classList.value=""; //给所有li清空class属性
                        }
                    }
                    li.classList.value="active";//就给当前的li添加active

                }
            } 
            div.classList.add("color")//就显示背景   
            

        }
    },
    data(){
        return {
            lis:["为你分类","美容彩妆","奶粉纸尿裤","母婴专区","营养保健","数码专家","个人洗护","服饰鞋靴","运动户外","手表配饰","家居生活","轻奢","充值中心","环球美食","全球工厂店","海外旗舰店","生鲜","宠物生活","国家地区馆"],
            active:"",
        }
    },
    components:{
        "listicon" : Listicon
    },
    mounted(){
        this.init();
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
    margin-bottom:45px;
}
/* 左侧设置每个li的值 */
.left_ul li{
    width:120px;
    height:35px;
    font-size: .35rem; 
}

 li div.listColor{
    width:100px;
    height:20px;
    text-align:center;
    line-height: 20px;
    border-radius:10px;
    margin-left:10px;
    margin-top:7.5px;
}

.left_ul li div.color{
    width:100px;
    height:20px;
    text-align:center;
    line-height: 20px;
    border-radius:10px;
    margin-left:10px;
    margin-top:7.5px;
    background-color:#FF1E32;
    color:#fff;
}
/* 右侧分类栏 */
.rightlist{
  width:100%;
  border-left:1px solid rgba(133, 126, 126,.2);
        position: fixed;
    right: -128px;
    
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
.rightlist ul li h6{
    font-size:.35rem;
    margin-top: -26px;
    text-align:left;
     margin-left: -19px;
}
</style>
