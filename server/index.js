// What are dependencies?
// standalone libraries organised into packages to perform specific tasks

const PORT = 3000
const express = require('express')
const app = express();
// creating an api
// listen() binds to the host 
app.listen(PORT,'0.0.0.0',()=>{
    console.log(`connected to port ${PORT}`)
})