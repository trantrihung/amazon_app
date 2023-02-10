import { authRouter } from "./auth.js"

export const route = (app) => {
  app.use("/user",authRouter);
}