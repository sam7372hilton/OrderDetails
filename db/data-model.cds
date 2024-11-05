namespace Orders.db;

using {
    cuid,
    temporal,
    managed
} from '@sap/cds/common';


entity Orders {
    key OrderNum   : Int16;
        CustomerID : String(36);
        OrderDate  : String(36);
        OrderName  : String(36);
        OrderType  : String(36);
        items      : Composition of many OrderItems
                         on items.OrderNum = $self;
        Scheduled  : Composition of many ScheduleLines
                         on Scheduled.OrderNum = $self;
}

// type OType : Int16 enum {
//     Food     = 1;
//     Non_Food = 2
// };


entity OrderItems {
    key OrderNum   : Association to Orders;
    key ItemNumber : String(36);
        MaterialID : String(36);
        Quantity   : String(36);
        Price      : String(36) default 0;
}

entity ScheduleLines {
    key ItemNumber       : String(36);
    key OrderNum         : Association to Orders;
        DeliveryQuantity : String(36);
        DeliveryDate     : String(36);

}
