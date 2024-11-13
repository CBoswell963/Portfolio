const statisticalAnalysisService = require('../../services/statisticalAnalysisService');

describe('Statistical Analysis Service', () => {
    const mockTeamStats = [
        { hp: 80, attack: 70, defense: 60, specialAttack: 65, specialDefense: 75, speed: 85 },
        { hp: 60, attack: 80, defense: 70, specialAttack: 75, specialDefense: 85, speed: 65 },
        { hp: 70, attack: 60, defense: 80, specialAttack: 85, specialDefense: 65, speed: 75 }
    ];

    test('should calculate average stats for a team', () => {
        const averages = statisticalAnalysisService.calculateAverageStats(mockTeamStats);

        expect(averages).toEqual({
            hp: 70,
            attack: 70,
            defense: 70,
            specialAttack: 75,
            specialDefense: 75,
            speed: 75
        });
    });

    test('should calculate total stats for a team', () => {
        const totals = statisticalAnalysisService.calculateTotalStats(mockTeamStats);

        expect(totals).toEqual({
            hp: 210,
            attack: 210,
            defense: 210,
            specialAttack: 225,
            specialDefense: 225,
            speed: 225
        });
    });
});