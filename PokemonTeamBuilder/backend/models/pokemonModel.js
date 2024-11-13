// backend/models/pokemonModel.js

/**
 * Pokemon schema to define attributes for each Pokemon.
 * Stores basic data such as name, types and stats.
 */
const { DataTypes } = require('sequelize');
const sequelize = require('../config/database');

const Pokemon = sequelize.define('Pokemon', {
    id: {
        type: DataTypes.INTEGER,
        primaryKey: true,
    },
    name: {
        type: DataTypes.STRING,
        allowNull: false,
    },
    type1: {
        type:  DataTypes.STRING,
        allowNull: false,
    },
    type2: {
        type: DataTypes.STRING,
        allowNull: true, //allows null value to accommodate Pokemon with only one type
    },
    hp: {
        type: DataTypes.INTEGER,
        allowNull: false,
    },
    attack: {
        type: DataTypes.INTEGER,
        allowNull: false,
    },
    defense: {
        type: DataTypes.INTEGER,
        allowNull: false,
    },
    specialAttack: {
        type: DataTypes.INTEGER,
        allowNull: false,
    },
    specialDefense: {
        type: DataTypes.INTEGER,
        allowNull: false,
    },
    speed: {
        type: DataTypes.INTEGER,
        allowNull: false,
    },
}, {
    tableName: 'pokemon',
    timestamps: false,
});

module.exports = Pokemon;