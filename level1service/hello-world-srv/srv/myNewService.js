module.exports = srv => {
    srv.before("CREATE", "InsertStudent", async (req, res) => {
       // checks the emails are not personal gmail
       if(typeof req.data.email === "undefined") req.error(500, "Email missing!");
       if(req.data.email.toLowerCase().indexOf("gmail") !== -1) {
            req.error(500, "Personal email is not allowed");
       }
    });
};