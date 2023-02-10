import mongoose from "mongoose";

const UserSchema = mongoose.Schema({
  email: {
    require: true,
    type: String,
    validate: {
       validator: (value) => {
          const re =/^(([^<>()[\]\.,;:\s@\"]+(\.[^<>()[\]\.,;:\s@\"]+)*)|(\".+\"))@(([^<>()[\]\.,;:\s@\"]+\.)+[^<>()[\]\.,;:\s@\"]{2,})$/i;
          return value.match(re);
       },
       message: "Please enter a valid email address",
    },
  },
  password: {
    require: true,
    type: String,
  },
  name: {
    type: String,
    default: "",
  },
  address: {
    type: String,
    default: "",
  },
  type: {
    type: String,
    default: 'user',
  }
});

export const MyModel = mongoose.model("user", UserSchema )