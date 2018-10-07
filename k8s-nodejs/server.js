var http = require("http")
var express = require("express")
var app = express();

app.get("/app", (req, res) => {
  res.send("Hello World with Node and Docker");
})

app.listen(9010)

console.log("localhost:9010/app");
