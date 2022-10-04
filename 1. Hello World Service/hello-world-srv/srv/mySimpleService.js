module.exports = srv => {
    srv.on("somesrv", req => {
        return "Hello " + req.data.msg
    })
}