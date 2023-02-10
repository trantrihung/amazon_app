import mongoose from "mongoose";

async function connectDB() {
  try {
    await mongoose.connect('mongodb+srv://brian:30101996@cluster0.euibpdr.mongodb.net/?retryWrites=true&w=majority')
    console.log('Connected!')

  } catch (error) {
    console.log("Connect DB failed");
  }
}
export {connectDB};
