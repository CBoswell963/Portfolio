// Team model for defining the SQL schema for the Pokemon teams table
const { DataTypes } = require('sequelize');
const sequelize = require('../config/database'); //Database connection

const Team = sequelize.define('Team', {
    id: {
        type: DataTypes.INTEGER,
        primaryKey: true,
        autoIncrement: true,
    },
    userId: {
        type: DataTypes.INTEGER,
        allowNull: false,
    },
    name: {
        type: DataTypes.STRING,
        allowNull: false,
    },
    createdAt: {
        type: DataTypes.STRING,
        allowNull: false,
    },
}, {
    tableName: 'teams',
    timestamps: false,
});

module.exports = Team;