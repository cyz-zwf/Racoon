<template>
  <div>
    <div class="app-index">
      <article class="image-row image-row-1" >
        <a href="javascript:;" class="item" style="height: 0.604444rem;">
          <img :src="'http://127.0.0.1:5050/'+list[0].pic" alt />
        </a>
      </article>
     <div class="icon-slider">
        <ul class="m-slider image-row-5">
          <li class="icon-box" style="height: 4.58333rem;">
            <a href="javascript:;" v-for="n in 10" :key="n" style="height: 2.29167rem; width: 2rem;">
              <img :src="'http://127.0.0.1:5050/'+list[n].pic" alt />
            </a>
          </li>
        </ul>
      </div>
      <article class="image-row image-row-1">
        <a href="javascript:;" class="item" style="height: 2.29167rem;">
          <img :src="'http://127.0.0.1:5050/'+list[31].pic" alt />
        </a>
      </article>
      <article class="image-row image-row-left-right image-row-2">
        <section class="left">
          <a href="javascript:;" class="item">
            <img :src="'http://127.0.0.1:5050/'+list[38].pic" alt />
          </a>
        </section>
        <section class="right">
          <a href="javascript:;" class="item">
            <img :src="'http://127.0.0.1:5050/'+list[39].pic" alt />
          </a>
          <a href="javascript:;" class="item">
            <img :src="'http://127.0.0.1:5050/'+list[40].pic" alt />
          </a>
        </section>
      </article>
      <article class="image-row image-row-1">
        <a href="javascript:;" class="item" style="height: 3.60417rem;">
          <img :src="'http://127.0.0.1:5050/'+list[29].pic" alt />
        </a>
      </article>
     <article class="image-row image-row-1">
        <a href="javascript:;" class="item">
          <img :src="'http://127.0.0.1:5050/'+list[30].pic" alt />
        </a>
        <!-- <a href="javascript:;" class="item">
          <img :src="'http://127.0.0.1:5050/'+list[19].pic" alt />
        </a> -->
      </article>
      <article class="image-row image-row-1">
        <a href="javascript:;" class="item">
          <img :src="'http://127.0.0.1:5050/'+list[32].pic" alt />
        </a>
      </article>
      <article class="image-row image-row-3">
        <a href="javascript:;" class="item">
          <img :src="'http://127.0.0.1:5050/'+list[33].pic" alt />
        </a>
        <a href="javascript:;" class="item">
          <img :src="'http://127.0.0.1:5050/'+list[34].pic" alt />
        </a>
        <a href="javascript:;" class="item">
          <img :src="'http://127.0.0.1:5050/'+list[35].pic" alt />
        </a>
      </article>
      <article class="image-row image-row-1">
        <a href="javascript:;" class="item">
          <img :src="'http://127.0.0.1:5050/'+list[36].pic" alt />
        </a>
      </article>
      <article class="image-row">
        <a href="javascript:;" class="item">
          <img :src="'http://127.0.0.1:5050/'+list[17].pic" alt />
        </a>
      </article>
      <div class="channel">
          <div class="block">
              <div class="block_slot">
                  <div class="flash-sale">
                      <div class="head">
                        <div class="head_item title" style="color: rgb(51, 51, 51);"  >限时抢购</div>
                      </div>
                      <div class="body">
                          <img :src="'http://127.0.0.1:5050/'+list[20].pic" alt="">
                          <img :src="'http://127.0.0.1:5050/'+list[21].pic" alt="">
                      </div>
                  </div>
              </div>
              <div class="block_slot">
                  <div class="entry-big">
                      <p class="title" style="color: rgb(51, 51, 51);margin:0;    margin-right: 0.133333rem;">必买清单</p>
                      <p class="block_benefit" style="color: rgb(51, 51, 51);margin:0;">什么值得买</p>
                      <div class="body">
                          <img class="body_image" :src="'http://127.0.0.1:5050/'+list[26].pic" alt="">
                          <img class="body_image" :src="'http://127.0.0.1:5050/'+list[27].pic" alt="">
                      </div>
                  </div>
              </div>
              <div class="block_slot">
                  <div class="entry-small">
                      <p class="title"  style="color: rgb(51, 51, 51);">考拉奥莱</p>
                      <p class="block_benefit" style="color: rgb(51, 51, 51);">大牌5折清仓</p>
                      <img class="block_image" :src="'http://127.0.0.1:5050/'+list[28].pic" alt="">
                  </div>
              </div>
              <div class="block_slot">
                  <div class="entry-small">
                      <p class="title"  style="color: rgb(51, 51, 51);">好物推荐</p>
                      <p class="block_benefit" style="color: rgb(255, 0, 0);">999+好评已种草</p>
                      <img class="block_image" :src="'http://127.0.0.1:5050/'+list[41].pic" alt="">
                  </div>
              </div>
              <div class="block_slot">
                  <div class="entry-small">
                      <p class="title"  style="color: rgb(51, 51, 51);">品牌闪购</p>
                      <p class="block_benefit" style="color: rgb(51, 51, 51);">199减100起</p>
                      <img class="block_image" :src="'http://127.0.0.1:5050/'+list[23].pic" alt="">
                  </div>
              </div>
          </div>
      </div> 
    </div>
  </div>
</template>
 <script>
export default {
  data() {
    return {
      list: [],
    };
  },
  methods: {
    loadMore() {
      // 获取商品分页数据
      this.axios.get("index").then(result => {
        console.log(result);
        this.list = result.data.data;
      });
    }
  },
  created() {
    this.loadMore();
    
  }
};
</script>
 <style scoped>
.app-index {
  margin-top: 232.6px;
  height:2000px;
}
ul,li,div{
      margin: 0;
    padding: 0;
    outline: none;
}
li {
    list-style: none;
}
img {
    vertical-align: middle;
}
.image-row{
  margin-bottom:-0.013333rem;
  display:flex;
  justify-content: center;
  overflow: hidden;
  font-size: 0;
}
.image-row .item{
  width:10rem;
}
.image-row .item img{
  width:100%;
  height: 100%;
}
.icon-slider{
    position: relative;
    overflow: hidden;
    height: 4.58333rem;
    background-color: rgb(255, 255, 255);
}
.icon-slider .m-slider{
    position: relative;
    left: 0;
    top: 0;
    white-space: nowrap;
    font-size: 0;
    line-height: 0;
    margin:0;
}
.icon-slider .m-slider li{
   display:inline-flex;
   justify-content: center;
   align-items: center;
   flex-wrap: wrap;
   box-pack: center;
}
.icon-slider .m-slider li a{
  height: 2.29167rem;
  width: 2rem;
}
.icon-slider .m-slider li a img{
  width: 100%;
  height: 100%;
}
.image-row-left-right{
  display:flex;
  width:10rem;
}
.image-row-left-right .left{
  display:block;
}
.image-row-left-right .left a{
  display:block;
  width:5rem;
  height: 5rem;
}
.image-row-left-right .left img{
  width:100%;
  height: 100%;
}
.image-row-left-right .right{
  display: flex;
  flex-direction: column;
}
.image-row-left-right .right a{
 display: block;
  width: 5rem;
  height: 2.5rem;
}
.image-row-3 .item{
  width:3.33333rem;
}
.channel{
      overflow: hidden;
}
.channel .block{
  display: flex;
  flex-wrap: wrap;
  width: 100%;
  margin-left:1px;
  box-sizing: border-box;
  overflow: hidden;
}
.channel .block_slot {
    -webkit-box-flex: 1;
    flex-grow: 1;
    box-sizing: border-box;
    border-bottom: 1px solid #f0f0f0;
    border-right: 1px solid #f0f0f0;
}
.channel .block_slot p{
  margin:0;
}
.channel .block_slot .flash-sale{
    width: 4.953333rem;
    box-sizing: border-box;
    height: 4.093333rem;
    padding-top: 0.266667rem;
    overflow: hidden;
    padding-left: 0.4rem;
}
.channel .block_slot .flash-sale .head{
  display: flex;
  align-items:center;
}
.flash-sale .head .head_item {
    box-sizing: border-box;
    height: 0.706667rem;
    line-height: 0.706667rem;
    vertical-align: middle;
}
.flash-sale .head .head_item.title {
    padding-right: 0.186667rem;
    font-size: 18px;
    font-weight: bold;
}
.channel .block_slot .flash-sale .body{
  display:flex;
  align-items: center;
  padding:0.16rem 0;
  justify-content:space-around;
}
.channel .block_slot .flash-sale .body img{
      display: block;
    height: 2.053333rem;
    width: 2.053333rem;
}
.channel .block_slot .entry-big {
    width: 4.966667rem;
    box-sizing: border-box;
    height: 4.093333rem;
    padding-top: 0.266667rem;
    overflow: hidden;
    padding-left: 0.4rem;
}
.channel .block_slot .entry-big .title {
    display: block;
    height: 0.706667rem;
    line-height: 0.64rem;
    float: left;
    font-size: 18px;
    font-weight: bold;
    font-size: 0.453333rem;
}
.channel .block_slot .entry-big .block_benefit {
    display: block;
    font-size: 0.293333rem;
    line-height: 0.64rem;
    float: left;
}
.channel .block_slot .entry-big .body{
  display: flex;
  justify-content: flex-start;
  align-items:center;
  clear: both;
}
.entry-big .body .body_image:not(:last-child) {
    margin-right: 0.133333rem;
}

.entry-big .body .body_image {
    margin-top: 0.306667rem;
    height: 2.053333rem;
    width: 2.053333rem;
}
.entry-small {
    padding-top: 0.266667rem;
    overflow: hidden;
    height: 4.506667rem;
    box-sizing: border-box;
    display: flex;
    -webkit-box-orient: vertical;
    -webkit-box-direction: normal;
    flex-direction: column;
    -webkit-box-pack: start;
    justify-content: flex-start;
    -webkit-box-align: center;
    align-items: center;
}
.entry-small .title {
    font-weight: bold;
    font-size: 0.453333rem;
}
.entry-small .block_benefit {
    font-size: 0.319829rem;
}
.entry-small .block_image {
    margin-top: 0.56rem;
    height: 2.053333rem;
    width: 2.053333rem;
}
</style>