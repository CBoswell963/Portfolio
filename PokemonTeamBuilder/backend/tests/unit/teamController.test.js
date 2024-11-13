const request = require('supertest');
const app = require('../../../../app');
const { Team, TeamPokemon } = require('../../models/teamModel');

// Mock data
const mockTeamData = {
    teamName: 'My Test Team',
    userId: 1,
    pokemonList: [
        { pokemonId: 1, primaryType: 'Grass', secondaryType: 'Poison' },
        { pokemonId: 25, primaryType: 'Electric', secondaryType: null }
    ]
};

describe('Team Controller', () => {
    beforeEach(async () => {
        await Team.truncate({ cascade: true });
        await TeamPokemon.truncate({ cascade: true});
    });

    test('should create a new team with valid data', async () => {
        const response = await request(app)
            .app('/api/teams')
            .send(mockTeamData);
        
        expect(response.status).toBe(201);
        expect(response.body.teamName).toBe(mockTeamData.teamName);
        expect(response.body.pokemonList.length).toBe(2);
    });

    test('should prevent creation of a team with more than siz Pokemon', async () => {
        const largeTeamData = {
            ...mockTeamData,
            pokemonList: new Array(7).fill(mockTeamData.pokemonList[0])
        };

        const response = await request(app)
            .post('/api/teams')
            .send(largeTeamData);

        expect(response.status).toBe(400);
        expect(response.body.error).toBe('Team size must be between 1 and 6 Pokemon');
    });

    test('should update an existing team', async () => {
        const team = await Team.create(mockTeamData);
        const updateData = { teamName: 'Updated Team Name', pokemonList: mockTeamData.pokemonList };

        const response = await request(app)
            .put(`/api/teams/${team.id}`)
            .send(updateData);

        expect(response.status).toBe(200);
        expect(response.body.teamName).toBe(updateData.teamName);
    });
});