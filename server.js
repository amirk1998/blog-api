require('dotenv').config();
const express = require('express');
const connectDB = require('./config/database');
const errorHandler = require('./utils/errorHandler');
const userRoutes = require('./routes/users');
const postRoutes = require('./routes/posts');

const app = express();

// Connect to MongoDB
connectDB();

// Middleware
app.use(express.json());

// Routes
app.use('/api/users', userRoutes);
app.use('/api/posts', postRoutes);

// Error handling middleware
app.use(errorHandler);

const PORT = process.env.PORT || 3000;
app.listen(PORT, () => {
  console.log(`Server is running on port ${PORT}`);
});