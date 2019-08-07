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

// 主页
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