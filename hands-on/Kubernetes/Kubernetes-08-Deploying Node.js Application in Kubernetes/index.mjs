import express from 'express'
import os from 'os'


const app = express()
const PORT = 3000

app.get("/", (req,res)=>{
     const message = ` Hi Hassan Im Pod ${os.hostname()}`
     res.send(message)
})

app.listen(PORT, ()=>{
    console.log(`Web Server is listening at port ${PORT}`)
    console.log(os.hostname())
})