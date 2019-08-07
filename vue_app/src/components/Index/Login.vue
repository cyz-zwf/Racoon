<template>
  <div class="g-bd-new">
    <header class="m-topnav-new">
      <div class="login-arrow-new">
        <img
          src="http://127.0.0.1:5050/img/haderimg/back.png"
          class="login-back"
          @click="loginBack"
        />
      </div>
      <span class="tit-new">用户登录</span>
    </header>
    <div class="m-cnt">
      <form id="login-form">
        <div class="m-container">
          <div class="inputbox">
            <input type="text" class="uname-input" placeholder="请输入用户名" v-model="uname" />
          </div>
          <div class="inputbox">
            <input type="password" class="upwd-input" placeholder="请输入密码" v-model="upwd" />
          </div>
          <div class="proto" style="font-size:0;">
            <span class="proto-span">登录即代表同意</span>
            <a href="javascript:;" class="proto-a">服务条框</a>
          </div>
          <div class="inputbox login-box">
            <a href="javascript:;" class="upwd-input login-btn" @click="nowLogin">立即登录</a>
          </div>
          <div class="m-unlogin" style="font-size:0;">
            <a href="javascript:;" class="m-unlogin-upwd">忘记密码?</a>
            <a href="javascript:;" class="m-unlogin-reg">快速注册</a>
          </div>

          <div class="other-login">
            <div class="other-login-tit">
              <span class="other-login-span" @click="changeIcon">其他登录方式</span>
              <img :src="'http://127.0.0.1:5050/img/haderimg/'+doIcon" class="other-down-icon" />
            </div>
            <ul class="other-login-way" v-show="typeIcon%2!==0">
              <li>
                <img src="http://127.0.0.1:5050/img/haderimg/cweiboway2.png" alt />
              </li>
              <li>
                <img src="http://127.0.0.1:5050/img/haderimg/qqway.png" alt />
              </li>
              <li>
                <img src="http://127.0.0.1:5050/img/haderimg/aliway.png" alt />
              </li>
              <li>
                <img src="http://127.0.0.1:5050/img/haderimg/emailway.png" alt />
              </li>
            </ul>
          </div>
        </div>
      </form>
    </div>
  </div>
</template>

<script>
export default {
  data() {
    return {
      uname: "",
      upwd: "",
      doIcon: "down-icon.png",
      typeIcon: 2
    };
  },
  methods: {
    loginBack() {
      this.$router.push("/");
    },
    // 立即登录
    nowLogin() {
      var [uname, upwd] = [this.uname, this.upwd];

      // 发送ajax请求
      this.axios
        .get("login", { params: { uname: uname, upwd: upwd } })

        .then(result => {
          if (result.data.code == -1) {
            this.$toast("用户名或密码错误");
          } else {
            // 登录成功 跳转首页
            this.$router.push("/");
            // console.log(result.data);
          }
        });
    },
    changeIcon() {
      if (this.typeIcon % 2 !== 0) {
        this.doIcon = "down-icon.png";
      } else {
        this.doIcon = "up-icon.png";
      }
      this.typeIcon += 1;
    }
  }
};
</script>

<style scoped>
.m-topnav-new {
  position: relative;
  width: 94%;
  height: 60px;
  /* background-color: #ff3264; */
  margin: 0 11px;
}
.login-arrow-new {
  position: absolute;
  top: 0;
  left: 0;
  width: 27px;
  height: 60px;
  /* background-color: aqua; */
  line-height: 60px;
}
.login-back {
  width: 27px;
  height: 27px;
  margin-top: 17px;
}
.tit-new {
  font-size: 18px;
  font-weight: 500;
  color: #333;
  position: absolute;
  top: 50%;
  left: 41%;
  transform: translateY(-50%);
}
.m-container {
  width: 100%;
}
.inputbox {
  width: 100%;
}
.uname-input,
.upwd-input {
  width: 90%;
  height: 42px;
  background-color: #f5f5f5;
  border-radius: 30px;
  box-sizing: border-box;
  border: 0;
  font-size: 14px;
  padding: 12px 40px 12px 10px;
  outline: none;
  font-weight: normal;
  margin-bottom: 3px;
}
.upwd-input {
  margin-bottom: 15px;
}
.proto {
  width: 100%;
  height: 18px;
  text-align: left;
  padding: 0 20px;
  box-sizing: border-box;
  line-height: 18px;
}
.proto-span,
.proto-a,
.m-unlogin-upwd,
.m-unlogin-reg {
  color: #999;
  font-size: 12px;
}
.proto-a {
  margin-left: 5px;
}
.login-box {
  box-sizing: border-box;
  margin-top: 10px;
}
.login-btn {
  display: block;
  background-image: linear-gradient(-90deg, #ff0000 0%, #ff3264 100%);
  font-size: 16px;
  color: #fff;
  text-align: center;
  text-decoration: none;
  margin: 0 auto;
  padding-left: 32px;
  cursor: pointer;
}
.m-unlogin {
  display: flex;
  justify-content: space-between;
  width: 100%;
  height: 18px;
  line-height: 18px;
  padding: 0 18px;
  box-sizing: border-box;
  margin-top: 15px;
}
.m-unlogin-upwd,
.m-unlogin-reg {
  text-decoration: none;
}
.other-login,
.other-login-tit {
  width: 100%;
  text-align: center;
}
.other-login {
  height: 16px !important;
  font-size: 0;
  margin-top: 72px;
}
.other-login-span {
  font-size: 14px;
  color: #666;
}
.other-down-icon {
  width: 14px;
  height: 14px;
  vertical-align: -15%;
  line-height: 16px;
  margin-left: 5px;
}
.other-login-way {
  box-sizing: border-box;
  font-size: 0;
  list-style: none;
  padding: 0;
  text-align: center;
  margin-top: 15px;
}
.other-login-way li {
  display: inline;
  margin-right: 21px;
}
.other-login-way li img {
  width: 36px;
  height: 36px;
}
</style>
