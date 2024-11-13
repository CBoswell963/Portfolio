// backend/controllers/teamController.js

/**
 * Controller for handling team-related operations.
 * Manages team creation, updating, and validation for size and Pokemon types.
 */

const { Team, TeamPokemon } = require('../models/teamModel');
const { calculateTeamStats } = require('../services/statisticalAnalysisService'); // imprt statistical analysis service

// Create a new team
exports.createTeam = async(req, res) => {
    try {
        const { teamName, userId, pokemonList } = req.body;

        if (pokemonList.length < 1 || pokemonList.length > 6) {
            return res.status(400).json({ error: 'Team size must be between 1 and 6 Pokemon'});
        }

        const team = await Team.create({ teamName, userId });

        const teamPokemonEntries = pokemonList.map(pokemon => ({
            ...pokemon, // Include pokemonId, primaryType, and secondaryType is present
            TeamId: team.id,
        }));

        await TeamPokemon.bulkCreate(teamPokemonEntries);

        // calculate team stats
        const teamStats = calculateTeamStats(pokemonList); 

        res.status(201).json({ team, teamStats });
    }   catch (error) {
        res.status(500).json({ error: error.message });
    }
};

// Update an existing team
exports.updateTeam = async (req, res) => {
    try {
        const { id } = req.params;
        const { teamName, pokemonList } = req.body;

        if (pokemonList.length < 1 || pokemonList.length > 6) {
            return res.status(400).json({ error: 'Team size must be between 1 and 6 Pokemon.' });
        }

        const team = await Team.findByPk(id);
        if(!team) {
            return res.status(404).json({ error: 'Team not found.' });
        }

        team.teamName = teamName;
        await team.save();

        await TeamPokemon.destroy({ where: { TeamId: id } });
        const updatedPokemonEntries = pokemonList.map(pokemon => ({
            ...pokemon,
            TeamId: team.id,
        }));
        await TeamPokemon.bulkCreate(updatedPokemonEntries);

        //calculate updated team stats
        const teamStats = calculateTeamStats(pokemonList);

        res.status(200).json(team);
    }   catch (error) {
        res.status(500).json({ error: error.message });
    }
};