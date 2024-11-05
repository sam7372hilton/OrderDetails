
const cds = require('@sap/cds');
module.exports = cds.service.impl(async function (srv) {
    const { OrderSrv } = srv.entities;

    srv.before('READ', OrderSrv, async (req) => {
        const user = cds.context.user;      
        const orders = await cds.tx(req).run(SELECT.from(OrderSrv));
        return orders;
    });
});
