const express = require('express');
const bodyParser = require('body-parser');
const userRouter = require('./routers/user.router')
const rapportRouter = require('./routers/rapport.router')


const app = express();


app.use(bodyParser.json());

app.use("/",userRouter);
app.use('/rapport',rapportRouter)


module.exports = app;