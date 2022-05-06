const express = require('express');
const app = express()
const port = 3000


// Path for static files
const path = require('path');

// Morgan for logging
var morgan = require('morgan')
app.use(morgan(':method :url :status'))

// Static files

app.get('/', function(req, res) {
  res.sendFile(path.join(__dirname, 'public/html_pages/home.html'));
});

app.get('/home', function(req, res) {
  res.sendFile(path.join(__dirname, 'public/html_pages/home.html'));
});

app.get('/users', function(req, res) {
  res.sendFile(path.join(__dirname, 'public/html_pages/users.html'));
});

app.get('/reviews', function(req, res) {
  res.sendFile(path.join(__dirname, 'public/html_pages/reviews.html'));
});

app.get('/restaurants', function(req, res) {
  res.sendFile(path.join(__dirname, 'public/html_pages/restaurants.html'));
});

app.get('/categories', function(req, res) {
  res.sendFile(path.join(__dirname, 'public/html_pages/categories.html'));
});

app.get('/categories_restaurant', function(req, res) {
  res.sendFile(path.join(__dirname, 'public/html_pages/categories_restaurant.html'));
});


// Port set up
app.listen(port, () => {
    console.log(`Example app listening on port ${port}`)
  })