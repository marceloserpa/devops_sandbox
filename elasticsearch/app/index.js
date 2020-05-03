'use strict'

const express = require('express')
const { Client } = require('@elastic/elasticsearch')
const client = new Client({ node: 'http://localhost:9200' })

const bodyParser = require('body-parser')
let app = express();
app.use(bodyParser.urlencoded({ extended: true }))
app.use(bodyParser.json());

app.get('/health', (req, res) => {
    res.send('up')
})

app.post('/movies/search', async (req, res) => {
    const term = req.body.term
    console.log(`term to search is: ${term}`)

    try{
        const { body } = await client.search({
            index: 'movies',
            body: {
                query: {
                    multi_match: {
                        "query":    term,
                        "fields": [ "title^2", "synopsis", "category" ],
                        "type":     "most_fields"
                    }
                }
            }
        })
        res.send(body.hits.hits)
    } catch (err){
        if(err.meta.body.status == 404) {
            res.send(`Not found movie for ${term} `)
        } else {
            console.log(err)        
            res.send('Some error happened')
        }
    }
})

app.post('/movies', async (req, res) => {
    const movie = {
        id: req.body.id,
        title: req.body.title,        
        synopsis: req.body.synopsis,
        category: req.body.category 
    }

    try{
        await client.index({
            index: 'movies',
            body: movie
        })
        res.send(`The movie ${movie.title} was registered successfully`)
    } catch (err) {
        res.send(err)
    }

})

const port = 9000
app.listen(port, () => console.log(`running port ${port}`))


















