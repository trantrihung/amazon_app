import express from 'express';
import { MyModel as UserSchema } from '../models/user.js';
import bcryptjs from 'bcryptjs';
import jwt from 'jsonwebtoken';

const authRouter = express.Router();

//SIGN UP
authRouter.post('/api/signup', async (req, res) => {
  try {
    const { email, password } = req.body;
    const existingUser = await UserSchema.findOne({ email });
    if (existingUser) {
      return res.status(400).json({ msg: 'Email already exits' });
    }
    const hashedPassword = await bcryptjs.hash(password, 8);
    let user = new UserSchema({
      email,
      password: hashedPassword,
    });
    user = await user.save();
    res.json(user);
  } catch (e) {
    res.status(500).json({ error: e.message });
  }
});

// SIGN IN
authRouter.post('/api/signin', async (req, res) => {
  try {
    const { email, password } = req.body;

    const user = await UserSchema.findOne({ email });
    if (!user) {
      return res.status(400).json({ msg: 'User with this email does not exist!' });
    }
    const isMatch = await bcryptjs.compare(password, user.password);
    if (!isMatch) {
      return res.status(400).json({ msg: 'Incorrect password!' });
    }

    const token = jwt.sign({ id: user._id }, 'passwordKey');
    res.json({ token, ...user._doc });
  } catch (e) {
    res.status(500).json({ error: e.message });
  }
});

export { authRouter };
