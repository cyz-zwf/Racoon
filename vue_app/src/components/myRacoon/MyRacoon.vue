<template>
  <div>
    <div class="myracoon_header">
      <span>我的浣熊</span>
      <div class="right_imgs">
        <img @click="toSettings" class="settings" src="http://127.0.0.1:5050/img/myracoon/settings.png" />
        <img @click="toMessages" class="message" src="http://127.0.0.1:5050/img/myracoon/cart_message.png" />
      </div>
    </div>
    <div class="user_background">
      <div class="user_icon_container">
        <img v-show="!this.isLogin" class="user_icon" src="http://127.0.0.1:5050/img/myracoon/noLog.png">
        <img v-show="this.isLogin" class="user_icon" src="http://127.0.0.1:5050/img/myracoon/user_icon.png">
      </div>
      <div v-show="!isLogin" class="username" @click="toLogin">登录/注册</div>
      <div v-show="isLogin" class="username">小浣熊</div>
    </div>
    <div class="my_order">
      <div style="color:#333">我的订单</div>
      <div style="color:#999;font-size:13px" class="search_all">查看全部</div>
    </div>
    <div class="status_list">
      <div class="flex status_list_item">
        <div style="width:35px;height:35px">
          <img style="width:28px;height:28px" src="http://127.0.0.1:5050/img/myracoon/all.png" />
        </div>
        <div>全部</div>
      </div>
      <div class="flex status_list_item">
        <div style="width:35px;height:35px">
          <img
            style="width:30px;height:28px"
            src="http://127.0.0.1:5050/img/myracoon/pendingPayment.png"
          />
        </div>
        <div>待付款</div>
      </div>
      <div class="flex status_list_item">
        <div style="width:35px;height:35px">
          <img style="width:28px;height:28px" src="http://127.0.0.1:5050/img/myracoon/deliver.png" />
        </div>
        <div>待发货</div>
      </div>
      <div class="flex status_list_item">
        <div style="width:35px;height:35px">
          <img style="width:30px;height:30px" src="http://127.0.0.1:5050/img/myracoon/receipt.png" />
        </div>
        <div>待收货</div>
      </div>
      <div class="flex status_list_item">
        <div style="width:35px;height:35px">
          <img style="width:30px;height:30px" src="http://127.0.0.1:5050/img/myracoon/refund.png" />
        </div>
        <div>退款退货</div>
      </div>
    </div>
    <div style="background:#f0f0f0;height:10px"></div>
    <div class="bottom_base">
      <span>我的优惠券</span>
      <div v-show="isLogin">68张优惠券</div>
      <div v-show="!isLogin"></div>
    </div>
    <div class="bottom_base">
      <span>我的钱包</span>
      <div v-show="isLogin">总额100亿</div>
      <div v-show="!isLogin"></div>
    </div>
    <div class="bottom_base">
      <span>我的关注</span>
      <div></div>
    </div>
    <div class="bottom_base">
      <span>我的收藏</span>
      <div></div>
    </div>
    <div class="bottom_base">
      <span>关于浣熊</span>
      <div></div>
    </div>
    <recommend></recommend>
  </div>
</template>
<script>
import Recommend from "../common/Recommend"
export default {
  data() {
    return {
      isLogin:false
    };
  },
  components:{
    "recommend":Recommend
  },
  methods: {
    exit() {
      // console.log(111);
      // this.$messagebox.confirm("是否确认退出?").then(action => {
      //   console.log(222);
      //   var url = "logout";
      //   this.axios.get(url).then(res => {
      //     console.log(333)
      //     this.$toast("退出成功")
      //   });
      // });    
      var url = "logout";
      this.axios.get(url).then(res=>{
        console.log(111);
        this.$router.push("/")
        console.log(222);
      })
    },
    toLogin(){
      this.$router.push("/Login")
    },
    judge(){
      this.axios.get("sessinfo").then(res=>{
        console.log(res)
        if(res.data.code>0){
          this.isLogin=true
        }
        console.log(this.isLogin);
      })
    },
    toSettings(){
       this.$router.push("/Settings")
    },
    toMessages(){
      this.$router.push("/Messages")
    }
  },
  mounted() {
    this.judge();
  },
};
</script>
<style scoped>
.flex {
  display: flex;
}
.myracoon_header {
  height: 45px;
  text-align: center;
  font-size: 18px;
  line-height: 45px;
  position: relative;
}
.right_imgs {
  float: right;
}
.right_imgs > .settings {
  position: absolute;
  width: 20px;
  height: 20px;
  top: 12.5px;
  right: 45px;
}
.right_imgs > .message {
  position: absolute;
  width: 23px;
  height: 23px;
  top: 11px;
  right: 10px;
}
.user_background {
  height: 141px;
  background: url("http://127.0.0.1:5050/img/myracoon/user_background.png")
    no-repeat;
  background-color: #f1f5fa;
  background-size: cover;
  padding-top: 23px;
  padding-bottom: 5px;
}
.user_icon {
  width: 65px;
  height: 65px;
  /* background-image: url("http://127.0.0.1:5050/img/myracoon/user_icon.png"); */
  background-size: cover;
  border-radius: 50%;
}
.username {
  text-align: center;
  font-size: 20px;
}
.my_order {
  display: flex;
  height: 48px;
  justify-content: space-between;
  padding: 0 15px;
  line-height: 48px;
  font-size: 15px;
  border-bottom: solid 1px #f0f0f0;
}
.status_list {
  display: flex;
  height: 60px;
  font-size: 13px;
  color: #333;
  justify-content: space-around;
  padding-top: 5px;
}
.status_list_item {
  display: flex;
  flex-direction: column;
  align-items: center;
  justify-content: space-around;
}
.bottom_base {
  display: flex;
  justify-content: space-between;
  height: 48px;
  border-bottom: solid 1px #f0f0f0;
  line-height: 48px;
  color: #333;
  font-size: 15px;
  padding: 0 15px;
}
.bottom_base > div,
.search_all {
  background-image: url(http://127.1:5050/img/myracoon/right.png);
  background-size: 22px 22px;
  background-repeat: no-repeat;
  background-position: center right;
  padding-right: 25px;
}
.bottom_list {
  display: flex;
  justify-content: space-around;
  height: 70px;
  color: #848689;
  font-size: 13px;
  padding: 20px 25px;
  align-items: center;
}
.recommend{
    padding-bottom: 1.4rem;
}
</style>