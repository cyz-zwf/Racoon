<template>
  <div class="recommend">
    <article>
      <div class="arti">为你推荐</div>
    </article>
    <div class="commodities">
      <div class="commodity" v-for="(item,i) of list" :key="i">
        <div class="img">
          <img :src="`http://127.0.0.1:5050/img/recommend/${item.img_url}`">
        </div>
        <div class="text">
          <div class="title">
            <p class="title-m">{{item.title}}</p>
          </div>
          <div class="price">
            <p class="price-m">￥{{item.price}}</p>
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
      var url="recommend";
      this.axios.get(url).then(result=>{
        this.list=result.data.data;
      })
    }
  },
  created(){
    this.LoadMore();
  }
}
</script>
<style scoped>
.recommend{
  padding-bottom: 2.7rem;
}
.arti{
  background: #f0f0f0;
  font-size: 18px;
  padding: 15px 0;
}
.commodities{
  padding: .133333rem;
  display: flex;
  flex-wrap: wrap;
  background: #f2f2f2;
}
.commodity{
  box-sizing: border-box;
  /* width: 4.6rem; */
  width: 45%;
  padding: 0.093333rem 0;
  margin: 0.1323rem;
  border: 1px solid #ececec;
  border-radius: 0.106667rem;
  background: #fff;
}
/* 图片 */
.commodity .img{
  position: relative;
  width: 100%;
  display: block;
  padding-top:100%;
}
.commodity .img img{
  width:100%;
  height:100%;
  position: absolute;
  top:0;
  left:0;
  margin-bottom: 0.0666667rem;
}
.commodity .text{
  margin: 0.066667rem 0.213333rem 0.066667rem;
}
/* 标题 */
.commodity .title{
  height: 0.853333rem;
  display: flex;
  align-items: center;
  font-size: 14px;
  line-height: 18px;
  margin-top: 0.2666667rem;
  color:#333;
  text-align: left;
}
.commodity .title-m{
  overflow: hidden;
  text-overflow:ellipsis;
  display: -webkit-box;
  word-break: break-all;
  -webkit-line-clamp: 2;
  -webkit-box-orient: vertical;
}
/* 价格 */
.commodity .price{
  display: flex;
  align-items: center;
  font-weight:700;
  margin-top: 0.093333rem;
  margin-left: -0.026667rem;
}
.commodity .price-m{
  font-size: 17px;
  color: #f00;
  margin: 0;
}
</style>