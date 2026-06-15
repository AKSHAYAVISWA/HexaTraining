

use("customer_order_tracker");


db.customer_feedback.insertOne({
    customer_id: 1,
    customer_name: "Arun",
    order_id: 101,
    feedback: "Delivery was delayed by two days.",
    rating: 3,
    feedback_date: new Date()
});


db.customer_feedback.insertMany([
    {
        customer_id: 1,
        customer_name: "Arun",
        order_id: 101,
        feedback: "Delivery was delayed by two days.",
        rating: 3,
        feedback_date: new Date()
    },
    {
        customer_id: 2,
        customer_name: "Priya",
        order_id: 102,
        feedback: "Excellent delivery service.",
        rating: 5,
        feedback_date: new Date()
    },
    {
        customer_id: 3,
        customer_name: "Rahul",
        order_id: 103,
        feedback: "Package arrived damaged.",
        rating: 2,
        feedback_date: new Date()
    },
    {
        customer_id: 4,
        customer_name: "Divya",
        order_id: 104,
        feedback: "Very fast delivery.",
        rating: 5,
        feedback_date: new Date()
    },
    {
        customer_id: 5,
        customer_name: "Karthik",
        order_id: 105,
        feedback: "Good service and packaging.",
        rating: 4,
        feedback_date: new Date()
    }
]);



// View all documents
db.customer_feedback.find();

// Pretty format
db.customer_feedback.find().pretty();

// Find one customer
db.customer_feedback.find({ customer_id: 1 });

// Find by rating
db.customer_feedback.find({ rating: 5 });

// Find delayed delivery complaints
db.customer_feedback.find({ feedback: /delayed/i });


db.customer_feedback.find(
    {},
    {
        customer_name: 1,
        rating: 1,
        _id: 0
    }
);


db.customer_feedback.updateOne(
    { customer_id: 1 },
    { $set: { rating: 4 } }
);


db.customer_feedback.updateMany(
    { rating: 5 },
    { $set: { feedback_status: "Positive" } }
);

db.customer_feedback.deleteOne({ customer_id: 5 });


db.customer_feedback.deleteMany({ rating: 1 });

// Highest rating first
db.customer_feedback.find().sort({ rating: -1 });

// Lowest rating first
db.customer_feedback.find().sort({ rating: 1 });

db.customer_feedback.find().limit(3);

db.customer_feedback.countDocuments();

db.customer_feedback.countDocuments({ rating: 5 });

db.customer_feedback.distinct("customer_name");

// Rating greater than 3
db.customer_feedback.find({ rating: { $gt: 3 } });

// Rating less than 4
db.customer_feedback.find({ rating: { $lt: 4 } });

// Rating between 3 and 5
db.customer_feedback.find({ rating: { $gte: 3, $lte: 5 } });


// AND
db.customer_feedback.find({
    $and: [
        { rating: { $gte: 4 } },
        { customer_name: "Priya" }
    ]
});

// OR
db.customer_feedback.find({
    $or: [
        { rating: 5 },
        { rating: 4 }
    ]
});


// Search feedback containing "delivery"
db.customer_feedback.find({ feedback: /delivery/i });

// Search feedback containing "package"
db.customer_feedback.find({ feedback: /package/i });

// Average Rating
db.customer_feedback.aggregate([
    {
        $group: {
            _id: null,
            average_rating: { $avg: "$rating" }
        }
    }
]);

// Maximum Rating
db.customer_feedback.aggregate([
    {
        $group: {
            _id: null,
            highest_rating: { $max: "$rating" }
        }
    }
]);

// Minimum Rating
db.customer_feedback.aggregate([
    {
        $group: {
            _id: null,
            lowest_rating: { $min: "$rating" }
        }
    }
]);

// Total Feedback Count
db.customer_feedback.aggregate([
    {
        $group: {
            _id: null,
            total_feedbacks: { $sum: 1 }
        }
    }
]);


db.customer_feedback.aggregate([
    {
        $group: {
            _id: "$rating",
            total_customers: { $sum: 1 }
        }
    }
]);



db.customer_feedback.find().sort({ rating: -1 }).limit(3);



// Customer ID Index
db.customer_feedback.createIndex({ customer_id: 1 });

// Rating Index
db.customer_feedback.createIndex({ rating: 1 });

// Customer Name Index
db.customer_feedback.createIndex({ customer_name: 1 });

// Text Search Index
db.customer_feedback.createIndex({ feedback: "text" });


db.customer_feedback.find({
    $text: { $search: "delivery" }
});


db.customer_feedback.getIndexes();

db.customer_feedback.dropIndex({ rating: 1 });

db.customer_feedback.stats();
