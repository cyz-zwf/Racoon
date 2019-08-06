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
	pool.query(sql, (err, result) => {
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
app.get("/delItem",(req,res)=>{
	var id=req.query.id;
	var sql = "DELETE FROM racoon_cart WHERE id =? ";
	pool.query(sql,[id],(err,result)=>{
		if(err) throw err;
		if (result.affectedRows > 0) {
			res.send({ code: 1, msg: "删除成功" });
		} else {
			res.send({ code: -1, msg: "删除失败" })
		}
	})
})
app.get("/addCart", (req, res) => {
	// 1.参数
	var lid = req.query.lid;
	var price = req.query.price;
	var title = req.query.title;
	var spec = req.query.spec;
	var img_url = req.query.img_url;
	var uid = req.query.uid;  //在没有登录功能时使用
	//var uid = req.session.uid;  //有登录功能时使用
	if (!uid) {
		res.send({ code: -1, msg: "请先登录" });
		return;
	}
	// console.log(lid,price,title,uid)
	var sql = "SELECT id FROM racoon_cart WHERE lid=? AND uid=?";
	pool.query(sql, [lid, uid], (err, result) => {
		if (err) throw err;
		var sql = "";
		if (result.length == 0) {
			sql = `INSERT INTO racoon_cart VALUES(null,${lid},${img_url},${price},'${title}',${spec},1,${uid})`
		} else {
			sql = `UPDATE racoon_cart SET count=count+1 WHERE lid=${lid} AND uid=${uid}`;
		}
		pool.query(sql, (err, result) => {
			if (err) throw err;
			res.send({ code: 1, msg: "添加成功" })
		})
	})
})
// 测试：
// http://127.0.0.1:5050/addCart?lid=648&price=738&img_url="dior-perfume.webp"&title="Dior 迪奥 迪奥小姐花漾女士淡香水"&spec="100毫升"&uid=1
app.get("/updateCount",(req,res)=>{
	var count=req.query.count;
	var uid=req.query.uid;
	var lid=req.query.lid;
	sql = `UPDATE racoon_cart SET count=${count} WHERE lid=${lid} AND uid=${uid}`;
	pool.query(sql,(err,result)=>{
		if(err) throw err;
		res.send({code:1,msg:"更新成功"})
	})
})