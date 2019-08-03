<template>
  <div>
    <div class="top_icon">
      <div class="left border-radius login_avatar">
        <img src />
      </div>
      <img src="http://127.0.0.1:5050/img/ic_message.png" class="fixed message" />
      <img src="http://127.0.0.1:5050/img/myracoon/settings.png" class="fixed settings" />
    </div>
    <div class="padding-5">
      <div class="flex breadcrumbs">
        <div class="flex flex-column">
          <span class="bold margin-bottom-5">0</span>
          <span class="font-12">收藏</span>
        </div>|
        <div class="flex flex-column">
          <span class="bold margin-bottom-5">4</span>
          <span class="font-12">关注</span>
        </div>|
        <div class="flex flex-column">
          <span class="bold margin-bottom-5">2</span>
          <span class="font-12">浏览足迹</span>
        </div>|
        <div class="flex flex-column">
          <span class="bold margin-bottom-5">0</span>
          <span class="font-12">优惠券</span>
        </div>
      </div>
    </div>
    <div class="container padding-10">
      <div class="myOrder_container">
        <div class="flex myOrder padding-10">
          <span class="bold font-15">我的订单</span>
          <span class="font-12" style="line-height:17px">查看全部 ></span>
        </div>
        <div class="flex orderStatus padding-10">
          
        </div>
      </div>
    </div>
  </div>
</template>
<script>
export default {
  data() {
    return {};
  }
};
</script>
<style scoped>
* {
  box-sizing: border-box;
  padding: 0;
  margin: 0;
}
.top_icon {
  width: 100%;
  height: 50px;
  /* background: lightpink; */
  position: relative;
}
.right {
  float: right;
}
.left {
  float: left;
}
.font-15{
  font-size:15px;
}
.fixed {
  position: fixed;
}
.settings {
  width: 21px;
  height: 21px;
  right: 55px;
  top: 16px;
}
.message {
  width: 25px;
  height: 25px;
  right: 15px;
  top: 15px;
}
.border-radius {
  border-radius: 50%;
}
.login_avatar {
  width: 30px;
  height: 30px;
  background: lightgray;
  margin-left: 10px;
  margin-top: 10px;
  background-image: url(../../assets/ic_myhome_normal.png);
  background-size: cover;
}
.flex {
  display: flex;
}
.breadcrumbs {
  width: 100%;
  height: 60px;
  /* background: lightblue; */
  justify-content: space-around;
  align-items: center;
}
.flex-column {
  flex-direction: column;
}
.font-12 {
  font-size: 12px;
}
.bold {
  font-weight: bold;
}
.margin-bottom-5 {
  margin-bottom: 5px;
}
.padding-5 {
  padding: 5px;
}
.container {
  width: 100%;
  background: #eee;
}
.myOrder {
  justify-content: space-between;
}
.padding-10 {
  padding: 10px;
}
.myOrder_container{
  background: #fff;
  border-bottom:1px solid #eee;
}
</style>