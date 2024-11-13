// backend/routes/teamRoutes.js

/**
 * Routes for team operations, mapped to team controller functions.
 * Handles team creation and update requests.
 */

const express = require('express');
const router = express.Router();
const teamController = require('../controllers/teamController');

// Route for creating a new team
router.post('/api/teams', teamController.createTeam);

// Route for updating an existing team
router.put('/api/teams/:id', teamController.updateTeam);

module.exports = router;