var express = require('express');
var { engine } = require('express-handlebars');

var app = express();
var os = require("os");
var morgan  = require('morgan');

app.engine('handlebars', engine());
app.set('view engine', 'handlebars');
app.use(express.static('static'));
app.use(morgan('combined'));

// Configuration
var port = process.env.PORT || 8080;
var message = process.env.MESSAGE || "Welcome!";
var logo = process.env.LOGO || "kubernetes"
var negative = process.env.NEGATIVE

if (negative == "true"){
  logo = logo + "_negative"
} else {
  negative = ""
}

logo = logo + ".png"

app.get('/', function (req, res) {
    res.render('home', {
      message: message,
      platform: os.type(),
      release: os.release(),
      hostName: os.hostname(),
      logo,
      negative
    });
});

// Set up listener
app.listen(port, function () {
  console.log("Listening on: http://%s:%s", os.hostname(), port);
});