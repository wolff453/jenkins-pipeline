const express = require('express')

const app = express()



app.use(express.json())

app.get('/user', (req, res) => {
    res.status(200).send({
        name: 'user'
    })
})

app.listen(3000, () => console.log('Conectado'))