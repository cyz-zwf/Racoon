// 加载第三方模块
// express   mysql   fs cors
// web服务器
const express = require("express");
// 数据库
const mysql = require("mysql");
// 跨域
const cors = require("cors");
// session 
const session = require("express-session");
// 配置数据连接池
var pool = mysql.createPool({
    host: '127.0.0.1',
    port: 3306,
    user: 'root',
    password: '',
    database: 'racoon',
    connectionLimit: 15,
});
var app = express();
app.use(
    cors({
        origin: ["http://127.0.0.1:8888", "http://localhost:8888"],
        credentials: true
    })
);

// 配置session
app.use(session({
    secret: "128位字符串",
    resave: true,
    saveUninitiaLized: true
}));

app.use(express.static("public"));
app.listen(5050);

// 主页index部分
app.get("/index", (req, res) => {
    var sql = "select hid,pic,href from racoon_index_product";
    pool.query(sql, (err, result) => {
        if (err) throw err;
        res.send({
            code: 1,
            msg: "查询成功",
            data: result
        });
    });
});
// 主页section部分
app.get("/section", (req, res) => {
    var sql = "select pic,title,subtitle from racoon_index_section";
    pool.query(sql, (err, result) => {
        if (err) throw err;
        res.send({
            code: 1,
            msg: "查询成功",
            data: result
        });
    });
});

// 用户登录
// 用户名1:aaa 密码:123，
// 用户名2:bbb 密码:456
app.get("/login", (req, res) => {

    var [uname, upwd] = [req.query.uname, req.query.upwd];

    var sql = "select id,uname from racoon_login where uname=? and upwd=md5(?)";
    pool.query(sql, [uname, upwd], (err, result) => {

        if (err) throw err;
        if (result.length == 0) {
            res.send({
                code: -1,
                msg: "用户名或密码有误"
            });
            return;
        } else {
            // 1.将登录成功的凭据保存在session中
            req.session.uid = result[0].id;
            req.session.uname = result[0].uname;

            // 2.将成功消息返回到脚手架
            res.send({
                code: 1,
                msg: "登录成功",
                data: {
                    uid: req.session.uid,
                    uname: req.session.uname
                }
            });
        }
    })



})

app.get("/sessinfo", (req, res) => {

    var uname = req.session.uname;
    if (uname !== undefined) {
        res.send({
            code: 1
        });
        return;
    } else {
        res.send({
            code: -1
        });
    }
})
/* 购物车功能 */
app.get("/cart", (req, res) => {
    var uid = req.session.uid;
    if (!uid) { //未登录
        res.send({ code: -1, msg: "请先登录" });
        return;
    }
    var sql = "SELECT id,lid,img_url,title,price,count,spec FROM racoon_cart WHERE uid=?";
    pool.query(sql, [uid], (err, result) => {
        if (err) throw err;
        if(result.length>0){ //购物车有商品
            res.send({
                code: 1,
                data: result
            });
        }else{ //购物车无商品
            res.send({
                code: 0,
                msg:"购物车空空如也"
            });
        }
    })
})
app.get("/delItem", (req, res) => {
    var id = req.query.id;
    var sql = "DELETE FROM racoon_cart WHERE id =? ";
    pool.query(sql, [id], (err, result) => {
        if (err) throw err;
        if (result.affectedRows > 0) {
            res.send({
                code: 1,
                msg: "删除成功"
            });
        } else {
            res.send({
                code: -1,
                msg: "删除失败"
            })
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
    var uid = req.session.uid;
    if (!uid) {
        res.send({
            code: -1,
            msg: "请先登录"
        });
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
            res.send({
                code: 1,
                msg: "添加成功"
            })
        })
    })
})
// 测试：
// http://127.0.0.1:5050/addCart?lid=648&price=738&img_url="dior-perfume.webp"&title="Dior 迪奥 迪奥小姐花漾女士淡香水"&spec="100毫升"&uid=1

app.get("/updateCount", (req, res) => {
    var count = req.query.count;
    var uid = req.session.uid;
    var lid = req.query.lid;
    sql = `UPDATE racoon_cart SET count=${count} WHERE lid=${lid} AND uid=${uid}`;
    pool.query(sql, (err, result) => {
        if (err) throw err;
        res.send({
            code: 1,
            msg: "更新成功"
        })
    })
})
app.get("/recommend",(req,res)=>{
    var sql = "SELECT id,lid,img_url,price,title FROM racoon_recommend";
    pool.query(sql, (err, result) => {
        if (err) throw err;
        res.send({
            code: 1,
            data: result
        });
    })
})

app.get("/logout",(req,res)=>{
    // delete req.session.uid;
    // delete req.session.uname;
    req.session.destroy();
    // res.redirect("/");
    console.log(req.session);
})