const express = require("express");
const mysql = require("mysql2");

const app = express();

const db = mysql.createConnection({
    host: "10.0.3.246",
    user: "shopuser",
    password: "Password@123",
    database: "shopdb"
});

db.connect((err) => {
    if (err) {
        console.log("Database connection failed:", err);
    } else {
        console.log("Database connected successfully");
    }
});

app.get("/", (req, res) => {
    res.send("Application Layer Running");
});

app.get("/products", (req, res) => {
    db.query("SELECT * FROM products", (err, result) => {
        if (err) {
            res.json({ error: err });
        } else {
            res.json(result);
        }
    });
});

app.listen(8080, () => {
    console.log("Server running on port 8080");
});