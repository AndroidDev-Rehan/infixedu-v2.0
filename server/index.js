const express = require('express');
const stripe = require('stripe')('sk_test_51JAWNlKS0igSTFP1HI5vdkzgiFppGHQpwnv4A9zCK4txMU5WcSmKRyIKlVdMtv9zlZFmmBaQ3O4vgvKjRjP3TJQv00jfbG5aTn'); // Add your Secret Key Here

const app = express();

// This will make our form data much more useful
app.use(express.urlencoded({extended:true}));

const https = require('https')
const qs = require('querystring')
// Middleware for body parsing
const parseUrl = express.urlencoded({ extended: false })
const parseJson = express.urlencoded({ extended: false })

app.use((req, res, next) => {
  res.header("Access-Control-Allow-Origin", "*");
  res.header(
    "Access-Control-Allow-Headers",
    "Origin, X-Requested-With, Content-Type, Accept"
  );
  next();
});

app.post("/create-payment-intent",[parseUrl, parseJson], async (req, res) => {
    // let paymentData = req.body;
    try {
        const paymentIntent = await stripe.paymentIntents.create({
          amount: req.query.amount,
          currency: "usd",
          // payment_method_types: ['card'],
        });
        res.json({ clientSecret: paymentIntent.client_secret });
      } catch (err) {
        res.status(400).json({ error: { message: err.message } })
      }
});




// Future Code Goes Here

const port = process.env.PORT || 3000;
app.listen(port, () => console.log(`Example app listening at http://localhost:${port}`));