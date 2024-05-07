import express from 'express';
import bodyParser from 'body-parser';
import menuRotes from './routes/getbalance.js';

const app = express();
const PORT = 5055;

app.use(bodyParser.json());

app.post('/', (req, res) => {   
    const body = req.body;
    res.send(body);
});

app.use('/getbalance', menuRotes);


app.listen(PORT, () => {
    console.log(`Server running on port ${PORT}`);
})