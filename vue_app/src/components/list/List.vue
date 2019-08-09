<template>
    <div class="Recoonlist">
        <headerse></headerse>
        <!-- listbox -->
        <div class="listbox">
            <div class="leftlist">
                <ul class="left_ul" > 
                    <li  v-for="(item,i) of lis" :key="i">
                        <div class="listColor " :data-i=i @click="checked"  >{{item}}</div> 
                    </li>
                </ul>
            </div>
            <!-- 展示框 -->
            <div class="rightlist">
                <ul id="rightUl">
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
                    <li>
                        <h6>奶粉</h6>
                        <div></div>
                    </li>
                    <li>
                        <h6>奶粉</h6>
                        <div></div>
                    </li>
                    <li>
                        <h6>奶粉</h6>
                        <div></div>
                    </li>
                    <li>
                        <h6>奶粉</h6>
                        <div></div>
                    </li>
                    <li>
                        <h6>奶粉</h6>
                        <div></div>
                    </li>
                    <li>
                        <h6>奶粉</h6>
                        <div></div>
                    </li>
                    <li>
                        <h6>奶粉</h6>
                        <div></div>
                    </li>
                    <li>
                        <h6>奶粉</h6>
                        <div></div>
                    </li>
                    <li>
                        <h6>奶粉</h6>
                        <div></div>
                    </li>
                    <li>
                        <h6>奶粉</h6>
                        <div></div>
                    </li>
                    <li>
                        <h6>奶粉</h6>
                        <div></div>
                    </li>
                    <li>
                        <h6>奶粉</h6>
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
        checked(e){
            var div=e.target;//获得当前元素
            var i=e.target.dataset.i; //拿到对应的下标来关联面板
            var ulLis=div.parentElement.parentElement.children;//获取所有的li
            var divs=document.querySelectorAll(" li div.listColor");//获取所有div
             //如果点击div没有出现背景样式  
            if(div.className!="color"){
                //遍历除当前点击div外其他div中的clas样式清掉
                for(var item of divs){
                    item.className="";//在给当前div添加样式color
                    item.className="listColor";
                    
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
            lis:["为你分类","美容彩妆","奶粉纸尿裤","母婴专区","营养保健","数码专家","个人洗护","服饰鞋靴","运动户外","手表配饰","家居生活","轻奢","充值中心","服饰鞋靴","运动户外","手表配饰","家居生活","轻奢","充值中心","美容彩妆","奶粉纸尿裤","母婴专区","营养保健"],
            active:"",
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
    font-size: .35rem; 
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
