using {Orders.db as Orders} from '../db/data-model';

service OrderService @(requires: 'authenticated-user') {

    entity OrderSrv @(restrict: [
        {grant: ['READ'],to : 'Viewer', where : 'OrderType = $user.OrderType'},
        {grant: ['WRITE'],to : 'Admin'},
        ])                   as projection on Orders.Orders;

    entity OrderItemsSrv    as projection on Orders.OrderItems;
    entity ScheduleLinesSrv as projection on Orders.ScheduleLines;

}
