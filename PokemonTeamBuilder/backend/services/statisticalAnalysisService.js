// backend/services/statisticalAnalysisService.js

/**
 * Statistical analysis service for Pokemon team.
 * Calculates total and average stats for a team of Pokemon.
 */

// Calculate team stats
exports.calculateTeamStats = (pokemonList) => {
    const stats = {
        totalHP: 0,
        totalAttack: 0,
        totalDefense: 0,
        totalSpecialAttack: 0,
        totalSpecialDefense: 0,
        totalSpeed: 0,
    };

    // Calculate sums
    pokemonList.forEach(pokemon => {
        stats.totalHP += pokemon.hp;
        stats.totalAttack += pokemon.attack;
        stats.totalDefense += pokemon.defense;
        stats.totalSpecialAttack += pokemon.specialAttack;
        stats.totalSpecialDefense += pokemon.specialDefense;
        stats.totalSpeed += pokemon.speed;
    });

    // Calculate averages
    const numberOfPokémon = pokemonList.length;
    stats.averageHP = stats.totalHP / numberOfPokémon;
    stats.averageAttack = stats.totalAttack / numberOfPokémon;
    stats.averageDefense = stats.totalDefense / numberOfPokémon;
    stats.averageSpecialAttack = stats.totalSpecialAttack / numberOfPokémon;
    stats.averageSpecialDefense = stats.totalSpecialDefense / numberOfPokémon;
    stats.averageSpeed = stats.totalSpeed / numberOfPokémon;

    return stats;
}