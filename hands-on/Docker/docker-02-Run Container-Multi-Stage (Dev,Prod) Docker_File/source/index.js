const express = require('express');

//init app
const PORT = process.env.PORT || 4000;;
const app = express (); 

app.get('/', (req, res) => res.send('<h1> Hi Sh3poz<h1>'));

app.listen(PORT, () => console.log('Hi its working Fine on port: ${PORT}'));
