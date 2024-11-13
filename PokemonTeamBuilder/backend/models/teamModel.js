// backend/models/teamModel.js

/**
 * Team schema for the database, defining structure and constraints.
 * Each team has a list of Pokemon (1-6) with validation for team size.
 */
const { DataTypes } = require('sequelize');
const sequelize = require('../config/database'); //Database connection

const Team = sequelize.define('Team', {
    teamName: {
        type: DataTypes.STRING,
        allowNull: false,
        validate: {
            notEmpty: true,
        },
    },
    userId: {
        type: DataTypes.INTEGER,
        allowNull: false,
    },
});

const TeamPokemon = sequelize.define('TeamPokemon', {
    pokemonId: {
        type: DataTypes.INTEGER,
        allowNull: false,
    },
    primaryType: {
        type: DataTypes.STRING,
        allowNull: false,
    },
    secondaryType: {
        type: DataTypes.STRING,
        allowNull: true, // Allows for Pokémon with a single type
    },
});

Team.hasMany(TeamPokemon, { as: 'pokemonList' });
TeamPokemon.belongsTo(Team);

module.exports = { Team, TeamPokemon };