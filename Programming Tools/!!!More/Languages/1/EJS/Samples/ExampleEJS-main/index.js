const port=8080
const express=require('express')
const app=express()

//static files
app.use(express.static('public'))
app.use('/css', express.static(__dirname+'public/css'))
app.use('/img', express.static(__dirname+'public/img'))
//app.use('/js', express.static(__dirname+'public/js'))

// set views
app.set('views', './views')
app.set('view engine', 'ejs')


app.get('/', (req, res)=>{
    res.render('index', {my: "0"})
})

app.get('/contact', (req, res)=>{
    let savol=req.query.savol;
    res.render('index', { my: savol })
})

app.post('/contact', (req, res)=>{
    let savol=req.body.savol;
    console.log(req)
    res.render('index', { my: "aa" })
})

app.listen(port, ()=> console.log(`Server is running on port ${port}`))