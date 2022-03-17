const express = require("express");
const knex = require("knex");
const app = express();
const conn = knex({
  client: "mysql",
  connection: {
    host: "127.0.0.1",
    port: 3306,
    user: "root",
    password: "root",
    database: "c_dbs",
  },
});

const data = {
  name: "Russell Bitch Sr.",
  children: [{ name: "Sarge Bitch Jr." }, { name: "Hunter Bitch Jr." }],
};

app.get("/crystal", function (req, res) {
  res.json({ facts: ["Crystal is the best", "Crystal is awesome"] });
});

app.get("/mysql", async function (req, res) {
  const results = await conn.select("*").from("dvd").where(req.query).limit(20);
  res.json(results);
});

app.get("/Tri-jay", function (req, res) {
  res.json({
    protocol: req.protocol,
    path: req.path,
    query: req.query,
    headers: req.headers,
    unknown: `Russell, Sarge, and Hunter are awesome so is ${req.query.name} ${req.query.shirt}`,
    msg: `${data.name}, ${data.children[0].name}, and ${data.children[1].name}`,
    date: new Date(),
  });
});

app.listen(3000);
