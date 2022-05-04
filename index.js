const express = require('express');
const app = express()
const port = 3000


// Path for static files
const path = require('path');

// Morgan for logging
var morgan = require('morgan')
app.use(morgan(':method :url :status'))

// Static files
app.get('/users', function(req, res) {
    res.sendFile(path.join(__dirname, 'html_pages/users.html'));
  });

app.get('/reviews', function(req, res) {
    res.sendFile(path.join(__dirname, 'html_pages/reviews.html'));
  });


// Port set up
app.listen(port, () => {
    console.log(`Example app listening on port ${port}`)
  })