// 加载第三方模块
// express   mysql   fs cors
// web服务器
const express=require("express");
// 数据库
const mysql=require("mysql");
// 跨域
const cors=require("cors");
// session 
// const session=require("express-session");
// 配置数据连接池
var pool=mysql.createPool({
	host:'127.0.0.1',
	port:3306,
	user:'root',
	password:'',
	database:'racoon',
	connectionLimit:15,
});
var app = express();
app.use(
	cors({
	  origin: ["http://127.0.0.1:8888", "http://localhost:8888"],
	  credentials: true
	})
  );
app.use(express.static("public"));
app.listen(5050);
app.get("/index", (req, res) => {
	var sql = "select hid,pic,href from racoon_index_product";
	pool.query(sql,[], (err, result) => {
		if (err) throw err;
		res.send({ code: 1, msg: "查询成功", data: result });
	});
});
app.get("/cart",(req,res) => {
	var uid = req.query.uid;
	var sql = "SELECT id,img_url,title,price,count,spec FROM racoon_cart WHERE uid=?";
	pool.query(sql,[uid],(err,result)=>{
		if(err) throw err;
		res.send({code:1,data:result});
	})
})