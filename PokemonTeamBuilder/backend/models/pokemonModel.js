// Pokemon model for defining the schema for Pokemon associated with teams
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
    hp: DateTypes.INTEGER,
    attack: DataTypes.INTEGER,
    defense: DataTypes.INTEGER,
    specialAttack: DataTypes.INTEGER,
    specialDefense: DataTypes.INTEGER,
    speed: DataTypes.INTEGER,
}, {
    tableName: 'pokemon',
    timestamps: false,
});

module.exports = Pokemon;