<template>
  <div>
    <div class="header-search">
      <div class="header-input">
        <span class="header-span-search"></span>
        <span class="header-span-info">七夕日,爱的日</span>
      </div>
      <div>
        <mt-button size="small" plain class="header-btn" @click="loginIn" :style="loginBtn">登录</mt-button>
        <i class="login-su" :style="loginIcon" @click="myhuanxiong"></i>
      </div>
      <!-- 购物车a链接 -->
      <a href="javascript:;" class="header-cart-a"></a>
    </div>
  </div>
</template>

<script>
export default {
  data() {
    return {
      loginBtn: { display: "block" },
      loginIcon: { display: "none" }
    };
  },
  methods: {
    loginIn() {
      this.$router.push("/Login");
    },
    loadMoreLogin(e) {
      // 发送ajax请求session数据
      this.axios.get("sessinfo").then(result => {
        // this.uname = result.data;
        if (result.data.code == 1) {
          this.loginBtn.display = "none";
          this.loginIcon.display = "block";
        } else {
          this.loginBtn.display = "block";
          this.loginIcon.display = "none";
        }
      });
    },
    // 跳转我的主页
    myhuanxiong() {
      this.$router.push("/MyRacoon");
    }
  },
  created() {
    this.loadMoreLogin();
  }
};
</script>

<style>
@import url("../../assets/css/headerse.css");
</style>


