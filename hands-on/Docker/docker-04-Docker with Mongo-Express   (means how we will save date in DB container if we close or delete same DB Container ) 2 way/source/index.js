const express = require('express');
const mongoose = require('mongoose')


//init app
const PORT = process.env.PORT || 4000;;
const app = express (); 


// connect db
const DB_USER= 'root';
const DB_PASSWORD = 'example';
const DB_PORT = 27017;
const DB_HOST = 'mongo'

const URI= `mongodb://${DB_USER}:${DB_PASSWORD}@${DB_HOST}:${DB_PORT}`;
mongoose
.connect(URI)
.then(() => console.log('connect to db ...'))
.catch((err) => console.log('faild to connect to dp: ', err));

app.get('/', (req, res) => res.send('<h1> Hi Sh3poz<h1>'));

app.listen(PORT, () => console.log(`Hi its working Fine on port: ${PORT}`));
