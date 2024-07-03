const { Registry, collectDefaultMetrics } = require("prom-client");
const express = require("express");
const cors = require("cors");
const bodyParser = require("body-parser");
const { error } = require("winston");
const userRoutes = require("./api/routes/userRoutes");
const { USER_SERVICE_PORT, APPLICATION_PORT } = require("./config");
const registry = new Registry(); // Create a Registry instance
collectDefaultMetrics({ register: registry }); // Collect default metrics

const app = express();
app.use(cors());
app.use(bodyParser.json());
app.use(bodyParser.urlencoded({ extended: true }));

app.get("/metrics", async (req, res) => {
  res.set("Content-Type", "text/plain");
  res.send(await registry.metrics()); // Use the metrics function
});

app.use(userRoutes);

// Error handling for unsupported routes
app.use((req, res, next) => {
  const error = new Error("Not Found");
  error.status = 404;
  next(error);
});

// Error handler
app.use((error, req, res, next) => {
  res.status(error.status || 500);
  res.json({
    error: {
      message: error.message,
    },
  });
});

const APP_PORT = APPLICATION_PORT || 8881;

app.listen(APP_PORT, () => {
  console.log(`User Service running on #${APP_PORT}`);
});
