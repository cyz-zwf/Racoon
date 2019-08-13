<template>
  <div class="container">
    <mt-header title="消息中心">
      <router-link to="/" slot="left">
        <mt-button icon="back" @click="back"></mt-button>
      </router-link>
    </mt-header>
    <div v-for="(item,i) of list" :key="i" class="msg_list">
      <img style="width:36px;margin-left:10px" :src="`http://127.0.0.1:5050/img/myracoon/${item.img_url}`">
      <div class="titleStyle">
        <span>{{item.uname}}</span>
        <span class="longText">{{item.content}}</span>
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
  methods: {
    getMsgList(){
      this.axios.get("msgList").then(res=>{
        this.list=res.data.data;
      });
    },    
    back(){
      this.$store.commit("changeBack")
    }
  },
  mounted() {
    this.getMsgList();
  },
};
</script>
<style scoped>
  .mint-header{
    color:#000;
    font-size: 18px;
    background:#fff;
    border-bottom:1px solid #f0f0f0;
  }
  .msg_list{
    display: flex;
    height:60px;
    font-size:15px;
    align-items: center;
    border-bottom:1px solid #f0f0f0;
  }
  .titleStyle{
    display: flex;
    flex-direction: column;
    align-items: baseline;
    margin-left: 10px;
  }
  .longText{
  font-size: 13px;
  overflow: hidden;
  text-overflow: ellipsis;
  word-break: break-all;
  display: -webkit-box;
  -webkit-line-clamp: 1;
  -webkit-box-orient: vertical;
  margin-top:5px;
  color:#888;
}
</style>