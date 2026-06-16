
use SupplyChainDB

db.shipments.insertMany([
{
    shipment_id: 101,
    order_id: 1,
    supplier: "ABC Suppliers",
    destination: "Chennai",
    shipment_date: new Date("2026-06-01"),
    status: "Delivered"
},
{
    shipment_id: 102,
    order_id: 2,
    supplier: "XYZ Traders",
    destination: "Bangalore",
    shipment_date: new Date("2026-06-02"),
    status: "In Transit"
},
{
    shipment_id: 103,
    order_id: 3,
    supplier: "ABC Suppliers",
    destination: "Hyderabad",
    shipment_date: new Date("2026-06-03"),
    status: "Pending"
}
]);

db.shipments.find();

db.shipments.find(
    { status: "Delivered" }
);

db.shipments.find(
    { supplier: "ABC Suppliers" }
);


db.shipments.updateOne(
    { shipment_id: 102 },
    { $set: { status: "Delivered" } }
);


db.shipments.deleteOne(
    { shipment_id: 103 }
);


db.shipments.find().sort(
    { shipment_date: -1 }
);


db.shipments.countDocuments();


db.shipments.aggregate([
{
    $group: {
        _id: "$status",
        totalShipments: { $sum: 1 }
    }
}
]);


db.shipments.createIndex(
    { shipment_id: 1 }
);

db.shipments.createIndex(
    { status: 1 }
);

db.shipments.createIndex(
    { supplier: 1 }
);


db.shipments.getIndexes();
