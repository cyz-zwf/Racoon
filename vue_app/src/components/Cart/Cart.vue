<template>
  <div class="cart">
    <!-- Cart.vue组件 -->
    <!-- 1.头部 -->
    <mt-header fixed title="购物车">
      <mt-button slot="right" class="top_btn"></mt-button>
    </mt-header>
    <!-- 2.商品 -->
    <!-- 正常显示的界面 -->
    <div class="warehouse-w" v-if="isLogin==1">
      <div class="warehouse">
        <!-- 2.1商品头部 -->
        <div class="warehouse-header">
            <!-- 2.1.1选中框 -->
          <div class="warehouse-checkbox">
            <div class="checkbox">
              <img slot="icon" :src="ca?'http://127.0.0.1:5050/img/cart/cart_selected.png':'http://127.0.0.1:5050/img/cart/cart_unselected.png'" @click="checkAll" />
            </div>
          </div>
          <!-- 2.1.2 -->
          <div class="warehouse-name">
            <img slot="icon" src="http://127.0.0.1:5050/img/cart/cart_ziying.png"  />
            <router-link to="/" class="warehouse-shop-link">自营直邮仓</router-link>
          </div>
        </div>
        <!-- 2.2商品主体 -->
        <div class="warehouse-body">
          <div class="cartitem" v-for="(item,i) of list" :key="i">
            <div class="cartitem-left">
              <div class="checkbox">
                <img slot="icon" :src="item.cb?'http://127.0.0.1:5050/img/cart/cart_selected.png':'http://127.0.0.1:5050/img/cart/cart_unselected.png'"  @click="check" :data-i=i />
              </div>
            </div>
            <div class="cartitem-right">
              <div class="cartitem-flex">
                <div class="cartitem-image">
                  <img :src="`http://127.0.0.1:5050/img/cart/${item.img_url}`"/>
                </div>
                <div class="cartitem-detail">
                  <div class="cartitem-title">
                    <div class="tag">
                      <span>特价</span>
                    </div>
                    {{item.title}}
                  </div>
                  <div class="cartitem-con">
                    <!-- 规格与价格区域 -->
                    <div class="cartitem-info">
                      <div class="cartitem-info-con">
                        {{item.spec}}
                      </div>
                      <div class="cartitem-info-bottom">
                        <div class="cartitem-info-fee">商品已包税</div>
                        <div class="cartitem-info-price">￥{{item.price}}</div>
                      </div>
                    </div>
                    <!-- 数量加减与删除区域 -->
                    <div class="cartitem-ops">
                      <div class="number-mvp">
                        <div class="number-mvp-inner">
                          <div class="number-minus">
                            <div class="number-minus-inner" @click="minus" :data-i='i' :data-lid="item.lid"></div>
                          </div>
                          <input type="text" v-model="item.count" class="number-value" disabled>
                          <!-- <div class="number-value">{{item.count}}</div> -->
                          <div class="number-plus">
                            <div class="number-plus-inner" @click="plus" :data-i='i' :data-lid="item.lid"></div>
                          </div>
                        </div>
                      </div>
                      <div class="cartitem-del">
                        <div class="cartitem-del-icon" :data-id="item.id" @click="delItem"></div>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
      <!-- 3.底部 -->
      <div class="fixed-bottom">
        <div class="billvar">
          <!-- 左侧全选框 -->
          <div class="billbar-left">
            <div class="checkbox">
              <img slot="icon" :src="ca?'http://127.0.0.1:5050/img/cart/cart_selected.png':'http://127.0.0.1:5050/img/cart/cart_unselected.png'" @click="checkAll"/>
              <div style="margin-left:8px" @click="checkAll">全选</div>
            </div>
          </div>
          <!-- 总价 -->
          <div class="billbar-center">
            <div class="billbar-price">
              总价: <span>￥{{total}}</span>
            </div>
          </div>
          <!-- 结算按钮 -->
          <div class="billbar-right">
            <div class="billbar-button">结算</div>
          </div>
        </div>
      </div>
    </div>
    <!-- 购物车空时显示的界面 -->
    <div class="cartempty-page" v-else-if="isLogin==0">
      <div class="cartempty-page-inner">
        <div><img src="http://127.0.0.1:5050/img/cart/emptyCart.png" class="cartempty-page-icon"></div>
        <div class="cartempty-page-text">购物车空空如也，赶紧去逛逛吧!</div>
        <div>
          <a href="http://127.0.0.1:8888/#/Home" class="cartempty-page-button">去逛逛</a>
        </div>
      </div>
    </div>
    <!-- 未登录时显示的界面 -->
    <div class="unlogin-page" v-else>
      <!-- <div><img src="http://127.0.0.1:5050/img/cart/nav.png" class="unlogin-page-nav"></div> -->
      <div class="unlogin-page-inner">
        <div><img src="http://127.0.0.1:5050/img/cart/emptyCart.png" class="unlogin-page-icon"></div>
        <div class="unlogin-page-text">那么多好商品，你都不加购物车?</div>
        <div>
          <a href="http://127.0.0.1:8888/#/Login" class="unlogin-page-button">登录并同步购物车商品</a>
        </div>
      </div>
    </div>
    <recommend></recommend>
  </div>
  
</template>
<script>
// 引用recommend组件
import Recommend from "../common/Recommend"
export default {
  data(){
    return{
      // count:[],
      list:[],
      total:0,
      isLogin:1,
      // ca变量绑定全选框状态
      ca:false
    }
  },
  methods:{
    LoadMore(){
      
      this.ca=0;
      var url="cart";
      this.axios.get(url).then(result=>{
        if(result.data.code>0){
          this.isLogin=1;
          this.list=result.data.data;
          // var i=0;
          // for(var item of rows){
          //   // item.cb=false;
          //   this.count[i]=item.count;
          //   i++;
          // }
        }else if(result.data.code<0){
          this.isLogin=-1;
        }else{
          this.isLogin=0;
        }
      })
    },
    updateCount(){
      this.total=0;
      var url="cart";
      this.axios.get(url).then(result=>{
        var rows=result.data.data;
        var i=0;
        for(var item of rows){
          this.list[i].count=rows[i].count;
        }
      })
      for(var item of this.list){
        var p=item.price;
        var c=item.count;
        if(item.cb){
          this.total+=c*p;
        }
      }
    },
    check(e){
      var i=e.target.dataset.i;
      var p,c;
      this.total=0;
      this.list[i].cb=!this.list[i].cb
      var flag=true;
      for(var item of this.list){
        p=item.price;
        c=item.count;
        if(item.cb){
          this.total+=c*p;
        }else{
          this.ca=false;
          flag=false;
        }
      }
      if(flag){
        this.ca=true;
      }
    },
    checkAll(){
      this.ca=!this.ca;
      if(this.ca){
        for(var item of this.list){
          item.cb=true;
          var p=item.price;
          var c=item.count;
          this.total+=c*p;
        }
      }else{
        for(var item of this.list){
          item.cb=false;
          this.total=0;
        }
      }
    },
    minus(e){
      var i=e.target.dataset.i;
      var lid=e.target.dataset.lid;
      if(this.list[i].count>1){
        this.list[i].count-=1;
      };
      //发送axios请求
      var url="updateCount";
      var obj={count:this.list[i].count,lid};
      this.axios.get(url,{params:obj}).then(result=>{
        this.updateCount();
      }) 
    },
    plus(e){
      var i=e.target.dataset.i;
      // this.count[i]+=1;
      // console.log(this.count[i])
      var lid=e.target.dataset.lid;
      this.list[i].count+=1;
      //发送axios请求
      var url="updateCount";
      var obj={count:this.list[i].count,lid};
      this.axios.get(url,{params:obj}).then(result=>{
        this.updateCount();
      })
    },
    delItem(e){
      var id=e.target.dataset.id;
      this.$messagebox.confirm('',{
        message:"确定要删除我吗~",
        title:"很抢手哦~下次不一定能买到",
        confirmButtonText:"留在购物车",
        cancelButtonText:"狠心删除",
      }).then(err=>{return}).catch(action=>{
        var url="delItem";
        var obj={id};
        this.axios.get(url,{params:obj}).then(result=>{
          this.LoadMore();
          if(result.data.code>0){
            this.$toast("删除成功")
          }
        })
      })
    }
  },
  created(){
    this.LoadMore();
  },
  mounted(){ //为list中每一项添加cb属性
  },
  components:{
    "recommend":Recommend
  }
}
</script>
<style scoped>
/* 1.顶部 */
.cart{
  background: #f0f0f0;
}
.mint-header{
  height:45px;
  background-color: #fff;
  color:#000;
  border-bottom: 1px solid #f0f0f0;
  font-size: 18px;
}
.top_btn{
  width: 25px;
  background: url("http://127.0.0.1:5050/img/cart/cart_message.png") no-repeat;
  background-size: 100%;
  margin-top: 18px;
}
/* 2.商品 */
.warehouse-w{margin-top: 45px;}
.warehouse{
  width:100%;
  display: flex;  /* 弹性布局 */
  position: relative;
  flex-direction: column;
  background: #fff;
  margin-bottom: .266667rem;
  padding-bottom: .266667rem;
}
/* 2.1商品头部 */
.warehouse .warehouse-header{
  width: 100%;
  height: 40px;
  display: flex;
  align-items: center;
  box-sizing: border-box;
  background: #fafafa;
  border-bottom: 1px solid #ececec;
  /* position: fixed;
  z-index: 2; */
}
.warehouse-checkbox{
  width: 45px;
  display: flex;
  justify-content: center;
}
.checkbox{
  display: flex;
  align-items: center;
}
.checkbox img{
  display: block;
  height: 20px;
  width: 20px;
}
.warehouse-name{
  display: flex;
  align-items: center;
  font-size: 13px;
}
.warehouse-name img{
  height: .4rem;
  margin-right: .13333rem;
}
.warehouse-shop-link{
  text-decoration: none;
  color:#333;
}
/* 2.2商品主体 */
.warehouse-body{
  margin-bottom:1rem;
}
.cartitem{
  display: flex;
  color:#333;
  font-size: 12px;
  user-select: none;  /* 文字不被选中 */
  padding: .32rem 0 0;
  background-color: #fff;
}
.cartitem-left,.cartitem-right{
  display: flex;
}
.cartitem-left{
  width: 1.2rem;
  height: 2.4rem;
  align-items: center;
  justify-content: center;
  box-sizing: border-box;
}
.cartitem-right{
  width: 8.986667rem;
  flex-direction: column;
  padding-bottom: .266667rem;
  border-bottom: 1px solid #f0f0f0;
}
.cartitem-flex{
  display: flex;
}
.cartitem-image{
  position: relative;
  width: 2.4rem;
  height: 2.4rem;
  border-radius: 5px;
  overflow: hidden;
}
.cartitem-image img{
  width: 100%;
  height: 100%;
  display: block;
}
.cartitem-detail{
  /* width: 240px;
  height: 95px; */
  flex:1;
  display: flex;
  flex-direction: column;
  padding: 0 .4rem 0 .32rem;
  text-align: left;
  box-sizing: border-box;
}
.cartitem-title{
  font-size: 13px;
  overflow: hidden;
  text-overflow: ellipsis;
  word-break: break-all;
  display: -webkit-box;
  -webkit-line-clamp: 1;
  -webkit-box-orient: vertical;
}
.cartitem-title .tag{
  display: inline-block;
  margin-right: 2px;
  color: #ff1e32;
  border-radius: 8px;
  box-sizing: border-box;
  border: 1px solid #ff1e32;
} 
.cartitem-title .tag span{
  font-size: 8px;
  padding: 0 5px;
}
.cartitem-con,.cartitem-info{
  display: flex;
  padding-top: .1rem;
}
/* 规格与价格 */
.cartitem-info{
  width: 3.07rem;
  flex-direction: column;
  justify-content: flex-start;
  margin-top: .219rem;
  margin-right: 5px;
}
.cartitem-info-con,.cartitem-info-fee{
  color: #999;
  margin-bottom: .186667rem;
}
.cartitem-info-bottom{
  display: flex;
  flex-direction: column;
  justify-content: flex-end;
  margin-top: 0.16rem;
}
.cartitem-info-fee{
  padding-bottom: .05rem;
}
.cartitem-info-price{
  line-height: 1;
  color: #f00;
  font-size: 13px;
}
/* 数量加减区域 */
.cartitem-ops{
  display: flex;
  flex-direction: column;
  padding-top:9px;
  box-sizing: border-box;
}
.number-mvp{
  display: inline-block;
  border: 1px solid #aaa;
  border-radius: 2px;
  overflow: hidden;
  user-select: none;
}
.number-mvp-inner{
  display: flex;
}
.number-minus{
  width: .666667rem;
  height: .666667rem;
  position: relative;
  border-right:1px solid #aaa;
}
.number-minus-inner,.number-plus-inner{
  position: absolute;
  top:50%;
  left:50%;
  width:1rem;
  height:1rem;
  transform: translate(-50%,-50%);
}
.number-minus-inner::before{
  position:absolute;
  top:50%;
  left:50%;
  transform: translate(-50%,-50%);
  content: "";
  display: block;
  width:0.266667rem;
  height:2px;
  background: #666;
}
.number-value{
  width: 1.093333rem;
  /* width: 42px; */
  line-height: .666667rem;
  text-align: center;
  font-weight: 700;
  border:0;
  padding:0;
  background: #fff;
}
.number-plus{
  width: .666667rem;
  height: .666667rem;
  position: relative;
  border-left:1px solid #aaa;
}
.number-plus-inner::after,.number-plus-inner::before{
  position:absolute;
  top:50%;
  left:50%;
  transform: translate(-50%,-50%);
  content: "";
  display: block;
  width:0.266667rem;
  height:2px;
  background: #666;
}
.number-plus-inner::after{
  width:2px;
  height:0.266666rem;
}
/* 删除 */
.cartitem-del{
  height: 0.8988rem;
  display: flex;
  justify-content: flex-end;
  align-items: flex-end;
  margin-top:5px;
}
.cartitem-del-icon{
  width: .386667rem;
  height: .44rem;
  background: url("http://127.0.0.1:5050/img/cart/cart_del.png") no-repeat 50% 50%;
  background-size: 100%;
}
/* 底部区域 */
.fixed-bottom{
  position: fixed;
  left:0;
  bottom:0;
  width:100%;
  z-index:2;
  margin-bottom: 53px;
}
.billvar{
  display: flex;
  align-items: stretch;
  height:1.333333rem;
  background: #fff;
}
.billbar-left,.billbar-center{
  display: flex;
  box-sizing: border-box;
  border-top:1px solid #ccc;
}
.billbar-left{
  font-size:12px;
  align-items: center;
  padding-left: .266667rem;
  padding-left: .31rem;
}
.billbar-center{
  flex:1;
  flex-direction: column;
  align-items: flex-end;
  justify-content: center;
  padding-right: .266667rem;
}
.billbar-price{
  font-size: 15px;
  color: #333;
}
.billbar-price span{
  color: #e31436;
  font-weight: 700;
}
.billbar-right{
  display: flex;
  align-items: stretch;
}
.billbar-button{
  display: flex;
  color: #fff;
  background: #e31436;
  padding: 0 .666667rem;
  font-size: 15px;
  height: 1.33333rem;
  align-items: center;
}
/* 未登录显示的界面 */
.unlogin-page{
  position: relative;
  top: 45px;
  width:100%;
  height: 100%;
  background: #fff;
  font-size:15px;
  padding:40px 0;
  margin-bottom: 45px;
}
.unlogin-page,.unlogin-page-inner{
  display: flex;
  align-items: center;
  justify-content: center;
}
.unlogin-page-inner{
  flex-direction: column;
}
.unlogin-page-icon{
  width: 2.666667rem;
  height:2.666667rem;
}
.unlogin-page-text{
  margin: .533333rem 0 .8rem;
  color:#333;
}
.unlogin-page-button{
  text-decoration: none;
  display: block;
  width: 4.5rem;
  height: 1.066667rem;
  background: #ff1e32;
  color: #fff;
  border-radius: .5rem;
  text-align: center;
  line-height: 1.066667rem;
  font-size:14px;
}
/* 空购物车的界面 */
.cartempty-page{
  position: relative;
  top: 45px;
  width:100%;
  height: 100%;
  background: #fff;
  font-size:15px;
  padding:40px 0;
  margin-bottom: 45px;
}
.cartempty-page,.cartempty-page-inner{
  /* margin-top: 45px; */
  display: flex;
  align-items: center;
  justify-content: center;
}
.cartempty-page-inner{
  flex-direction: column;
}
.cartempty-page-icon{
  width: 2.666667rem;
  height:2.666667rem;
}
.cartempty-page-text{
  margin: .533333rem 0 .8rem;
  color:#333;
}
.cartempty-page-button{
  text-decoration: none;
  display: block;
  width: 2.5rem;
  height: 1.066667rem;
  background: #ff1e32;
  color: #fff;
  border-radius: .5rem;
  text-align: center;
  line-height: 1.066667rem;
  font-size:14px;
}
</style>
