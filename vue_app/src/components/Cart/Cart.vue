<template>
  <div class="cart">
    <!-- Cart.vue组件 -->
    <!-- 1.头部 -->
    <mt-header fixed title="购物车">
      <mt-button slot="right" class="top_btn"></mt-button>
    </mt-header>
    <!-- 2.商品 -->
    <div class="warehouse">
      <!-- 2.1商品头部 -->
      <div class="warehouse-header">
          <!-- 2.1.1选中框 -->
        <div class="warehouse-checkbox">
          <div class="checkbox">
            <img slot="icon" src="http://127.0.0.1:5050/img/cart/cart_unselected.png" />
          </div>
        </div>
        <!-- 2.1.2店名 -->
        <div class="warehouse-name">
          <img slot="icon" src="http://127.0.0.1:5050/img/cart/cart_shop.png" />
          <router-link to="/" class="warehouse-shop-link">LAMAVO奢侈品专营店＞</router-link>
        </div>
      </div>
      <!-- 2.2商品主体 -->
      <div class="warehouse-body">
        <div class="cartitem">
          <div class="cartitem-left">
            <div class="checkbox">
              <img slot="icon" src="http://127.0.0.1:5050/img/cart/cart_unselected.png" />
            </div>
          </div>
          <div class="cartitem-right">
            <div class="cartitem-flex">
              <div class="cartitem-image">
                <img src="http://127.0.0.1:5050/img/cart/dior-perfume.webp" />
              </div>
              <div class="cartitem-detail">
                <div class="cartitem-title">
                  <div class="tag">
                    <span>特价</span>
                  </div>
                  Dior 迪奥 迪奥小姐花漾女士淡香水
                </div>
                <div class="cartitem-con">
                  <div class="cartitem-info">
                    <div class="cartitem-info-con">
                      100毫升 ∨
                    </div>
                    <div class="cartitem-info-price">￥738</div>
                  </div>
                </div>
              </div>
            </div>
            <div class="cartitem-footer">
            </div>
          </div>
        </div>
      </div>
      <div class="warehouse-footer"></div>
    </div>
  </div>
</template>
<script>
export default {
  
}
</script>
<style scoped>
/* 1.顶部 */
.mint-header{
  height:45px;
  background-color: #fff;
  color:#000;
  border-bottom: 1px solid #f0f0f0;
  font-size: 18px;
}
.top_btn{
  width: 25px;
  background: url("http://127.0.0.1:5050/img/ic_message.png") no-repeat;
  background-size: 100%;
  margin-top: 18px;
}
/* 2.商品 */
.warehouse{
  width:100%;
  display: flex;  /* 弹性布局 */
  position: relative;
  flex-direction: column;
  background: #fff;
  margin-top:45px;
  margin-bottom: 10px;
  padding-bottom: 10px;
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
  width: 15px;
  height: 15px;
  margin-right: 5px;
}
.warehouse-shop-link{
  text-decoration: none;
  color:#333;
}
/* 2.2商品主体 */
.cartitem{
  display: flex;
  color:#333;
  font-size: 12px;
  user-select: none;  /* 文字不被选中 */
  padding-top: 12px;
  background-color: #fff;
}
.cartitem-left,.cartitem-right{
  display: flex;
}
.cartitem-left{
  width: 45px;
  height: 90px;
  align-items: center;
  justify-content: center;
  box-sizing: border-box;
}
.cartitem-right{
  width: 330px;
  height: 123px;
  flex-direction: column;
  padding-bottom: 10px;
  border-bottom: 1px solid #f0f0f0;
}
.cartitem-flex{
  display: flex;
}
.cartitem-image{
  position: relative;
  width: 90px;
  height: 90px;
  border-radius: 5px;
  overflow: hidden;
}
.cartitem-image img{
  width:100%;
  height: 100%;
  display: block;
}
.cartitem-detail{
  display: flex;
  flex-direction: column;
  padding-left: 12px; 
  padding-right: 15px;
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
  color: #69451f;
  border-radius: 8px;
  background: #ccbead;
}
.cartitem-title .tag span{
  font-size: 8px;
  padding: 0 5px;
}
.cartitem-con,.cartitem-info{
  display: flex;
}
.cartitem-info{
  flex-direction: column;
  justify-content: flex-start;
  margin-top: 7px;
  margin-right: 5px;
}
.cartitem-info-con{
  height:18px;
  border: 1px solid #e5e5e5;
  background: #f0f0f0;
  border-radius: 3px;
  padding: 2px 3px;
  color: #999;
  line-height: 18px;
}
</style>
