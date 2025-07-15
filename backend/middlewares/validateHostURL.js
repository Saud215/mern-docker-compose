import { allowedOrigins } from "../utils/corsUtils.js";

const validateHostURL = (req, res, next) => {
  const origin = req.headers.origin;
  let frontendOrigin;

  if (typeof origin === "string") {
    const lenOfURL = origin.length - 4;
    frontendOrigin = origin.substring(0, lenOfURL) + "5173";
  }

  if (frontendOrigin && !allowedOrigins.includes(frontendOrigin)) {
    allowedOrigins.push(frontendOrigin);
  }
  next();
};

export default validateHostURL;
