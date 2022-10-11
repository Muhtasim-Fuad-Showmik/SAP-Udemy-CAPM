this.new = "Fuad";
const { Students } = cds.entities("myCompany.hr.lms");

module.exports = srv => {
    //There are four kinds of services: on, to, before and after
    /**
     * on: works upon hitting the API
     * before: pre-processed before hitting the API
     * after: post-processed after hitting the API
     */

    // Sending a GET request using the service
    srv.on("READ", "GetStudent", async (req, res) => {
        // Used arrow function so that we can access globally defined variables
        // console.log(this.new);
        let result;
        
        // Collecting the conditions from the request URL
        const aFilter = req.data.email;
        if(typeof aFilter !== "undefined") {
            // Manually calling SELECT queries using the CAPM backend commands from the imported 'cds' module.
            // Where clause must be provided a key attribute-value pair and the query would trigger an error
            // if multiple records are returned after executing the query
            result = await cds.run(SELECT.from(Students).where({
                email: aFilter
            }));
        } else {
            // Selecting all students but limiting the number of records shown by 2
            // result = await cds.run(SELECT.from(Students).limit(2));
            result = await cds.run(SELECT.from(Students));
        }
        return result;
    });

    srv.after("READ", "GetStudent", data => {
        /**
         * Only the values can be updated in the after method. The number of objects
         * cannot be altered by any sort of filtering or any other processes. If the
         * service returned 4 objects upon hitting the API, we have to deal with 4
         * objects in our after method.
         * We also cannot add an extra property to our objects.
         */
    //    data.map(d => {
    //         d.first_name = d.first_name + " " + d.last_name;
    //         return d;
    //    });
    });

    srv.on("CREATE", "UpdateStudent", async (req, res) => {
        let firstName = req.data.first_name;
        let studentEmail = req.data.email;

        let result = await cds.run(UPDATE(Students).set({
            first_name: firstName
        }).where({ first_name: "Mr. " + firstName }));
        console.log(result);

        // Transactions
        // let returnData = await cds.transaction(req).run(() => {
        //     UPDATE(Students).set({
        //         first_name: firstName + "ny"
        //     }).where({ first_name: firstName });
        // }).then((resolve, reject) => {
        //     if(typeof resolve !== "undefined") {
        //         return "Successful Update!";
        //     } else {
        //         res.error(500, "Error in updating record");
        //     }
        // }).catch((err) => {
        //     console.log(err);
        //     res.error(500, "Error in updating record");
        // });

        return req.data;
    });

    srv.on("CREATE", "InsertStudent", async (req, res) => {
        let data = {
            "email": req.data.email,
            "first_name": req.data.first_name,
            "last_name": req.data.last_name,
            "date_sign_up": req.data.date_sign_up
        };
        let returnData = await cds.run(
            INSERT(data).into(Students)
        );
        console.log(returnData);
    });
};