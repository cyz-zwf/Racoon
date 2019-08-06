<template>
  <div class="cart">
    <!-- Cart.vue组件 -->
    <!-- 1.头部 -->
    <mt-header fixed title="购物车">
      <mt-button slot="right" class="top_btn"></mt-button>
    </mt-header>
    <!-- 2.商品 -->
    <div class="warehouse-w">
      <div class="warehouse">
        <!-- 2.1商品头部 -->
        <div class="warehouse-header">
            <!-- 2.1.1选中框 -->
          <div class="warehouse-checkbox">
            <div class="checkbox">
              <img slot="icon" src="http://127.0.0.1:5050/img/cart/cart_unselected.png" />
            </div>
          </div>
          <!-- 2.1.2 -->
          <div class="warehouse-name">
            <img slot="icon" src="http://127.0.0.1:5050/img/cart/cart_ziying.png" />
            <router-link to="/" class="warehouse-shop-link">自营直邮仓</router-link>
          </div>
        </div>
        <!-- 2.2商品主体 -->
        <div class="warehouse-body">
          <div class="cartitem" v-for="(item,i) of list" :key="i">
            <div class="cartitem-left">
              <div class="checkbox">
                <img slot="icon" :src="item.cb?'http://127.0.0.1:5050/img/cart/cart_selected.png':'http://127.0.0.1:5050/img/cart/cart_unselected.png'"  @click="check(item.id)"/>
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
                            <div class="number-minus-inner" @click="minus"></div>
                          </div>
                          <div class="number-value">{{item.count}}</div>
                          <div class="number-plus">
                            <div class="number-plus-inner" @click="plus"></div>
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
    </div>
  </div>
</template>
<script>
export default {
  data(){
    return{
      list:[]
    }
  },
  methods:{
    LoadMore(){
      var url="cart";
      var obj={uid:1};
      this.axios.get(url,{params:obj}).then(result=>{
        var rows=result.data.data;
        for(var item of rows){
          item.cb=false;
        }
        this.list=rows;
      })
    },
    check(id){
      this.list[id-1].cb=!this.list[id-1].cb;
    },
    minus(){},
    plus(){},
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
    this.LoadMore()
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
  margin-bottom:1.5rem;
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
  width: 240px;
  height: 95px;
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
  min-width: 1.093333rem;
  line-height: .666667rem;
  text-align: center;
  font-weight: 700;
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
</style>
