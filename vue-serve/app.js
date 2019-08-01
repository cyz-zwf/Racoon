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
    database:'hf',
    connectionLimit:15,
});
var app = express();
app.use(
	cors({
	  // origin:["http://127.0.0.1:8080   ","http://localhost:8080"],
	  origin: ["http://127.0.0.1:8080", "http://localhost:8080"],
	  credentials: true
	})
  );
  app.use(express.static("public"));
app.listen(3000);
app.get("/index", (req, res) => {
	var sql = "select hid,pic,href from hf_index_product";
	pool.query(sql, (err, result) => {
		if (err) throw err;
		res.send({ code: 1, msg: "查询成功", data: result });
	});
});