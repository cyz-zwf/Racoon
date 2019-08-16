<template>
  <div class="container">
    <mt-header title="设置">
      <router-link to="/" slot="left">
        <mt-button icon="back" @click="back"></mt-button>
      </router-link>
      <mt-button icon="more" slot="right"></mt-button>
    </mt-header>
    <div class="bottom_base">
      <span>个人信息</span>
      <div></div>
    </div>
    <div class="bottom_base">
      <span>我的实名认证</span>
      <div class="certification">未认证</div>
    </div>
    <div class="bottom_base">
      <span>我的收货地址</span>
      <div></div>
    </div>
    <div class="bottom_base">
      <span>我的发票抬头</span>
      <div></div>
    </div>
    <div style="background:#f0f0f0;height:10px"></div>
    <div class="bottom_base">
      <span>消息通知设置</span>
      <div></div>
    </div>
    <div class="bottom_base">
      <span>系统权限设置</span>
      <div></div>
    </div>
    <div class="bottom_base">
      <span>清空缓存</span>
      <div></div>
    </div>
    <div class="bottom_base">
      <span>商品详情页弹幕</span>
      <mt-switch></mt-switch>
    </div>
    <div class="bottom_base">
      <span>首页自动弹出视频内容</span>
      <mt-switch v-model="choose"></mt-switch>
    </div>
    <div class="bottom_base">
      <span>关于浣熊</span>
      <div>v1.0.13</div>
    </div>
    <div style="background:#f0f0f0;height:117px;padding-top:10px;position:reletive">
      <div v-if="isLogin" class="exit" @click="exitLogin">退出当前账号</div>
      <div class="uploaderror">上传网络异常报告</div>
    </div>
  </div>
</template>
<script>
export default {
  data(){
    return{
      choose:true,
      isLogin:false,
      active:"myhome"
    }
  },
  methods: {
    judge(){
      this.axios.get("sessinfo").then(res=>{
        if(res.data.code>0){
          this.isLogin=true
        }
      })
    },
    exitLogin(){
      this.axios.get("logout").then(res=>{
        if(res.data.code>0){
          this.$router.push("/Login")
        }
      })
    },
    back(){
      this.$store.commit("changeBack")
    }
  },
  mounted() {
    this.judge();
  },
};
</script>
<style scoped>
  .mint-header{
    color:#000;
    font-size: 18px;
    background:#fff;
  }
  .bottom_base {
  display: flex;
  justify-content: space-between;
  height: 48px;
  border-top: solid 1px #f0f0f0;
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
.certification{
  color:#999;
}
.exit{
  text-align: center;
  color:#f00;
  height:48px;
  font-size: 15px;
  background: #fff;
  line-height: 48px;
}
.uploaderror{
  text-align: center;
  color:#999;
  height:15px;
  font-size: 14px;
  line-height: 15px;
  text-decoration:underline;
  background-image: url("http://127.0.0.1:5050/img/myracoon/uploadError.png");
  background-repeat: no-repeat;
  background-position: 110px 0;
  margin-top:40px;
}
</style>