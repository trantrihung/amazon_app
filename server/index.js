import express from "express";
import { route } from "./routes/index.js";
import { connectDB } from "./config/index.js";

// INIT
const app = express();
const PORT = 3000;

//connect DB
connectDB();
app.use(express.json());

// ROUTE INITIAL
route(app);

app.listen(PORT, "0.0.0.0", () => {
  console.log(`Connected at port ${PORT}`);
});