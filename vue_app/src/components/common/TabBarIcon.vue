<template>
    <div>
        <!-- 底部导航图片组件 -->
        <img :src="focused? selectedImage : normalImage" alt="" class="imgstyle"/>
    </div>
</template>
<script>
export default {
    props:{
        focused:false,
        selectedImage:{default:""},
        normalImage:{default:""}
    }
}
</script>
<style scoped>
    .imgstyle{
        width:35px;
        height:35px;
    }
</style>