-- Types Seeding
INSERT INTO types (name) VALUES
('Normal'), ('Fire'), ('Water'), ('Electric'), ('Grass'), ('Ice'), ('Fighting'), ('Poison'), ('Ground'), ('Flying'), ('Psychic'), ('Bug'), ('Rock'), ('Ghost'), ('Dragon'), ('Dark'), ('Steel'), ('Fairy')
ON CONFLICT DO NOTHING;

-- Pokemon Seeding
INSERT INTO pokemon (id, name, sprite_url) VALUES
(6, 'Charizard', 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/home/6.png'),
(25, 'Pikachu', 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/home/25.png')
ON CONFLICT DO NOTHING;

-- Pokemon Type Seeding
---
-- Charizard: Fire, Flying
INSERT INTO pokemon_types (pokemon_id, type_id)
SELECT 6, t.id FROM types t where t.name = 'Fire'
UNION ALL
SELECT 6, t.id FROM types t WHERE t.name = 'Flying'
ON CONFLICT DO NOTHING;

---
-- Pikachu: Electric
INSERT INTO pokemon_types (pokemon_id, type_id)
SELECT 25, t.id FROM types t where t.name = 'Electric'
ON CONFLICT DO NOTHING;

-- Users Seeding
---
-- Password is Pre-Hashed for Seeding
INSERT INTO users (username, password_hash) VALUES
('ash_ketchum', 'hashedpassword123')
ON CONFLICT DO NOTHING;

-- Teams Seeding
INSERT INTO teams (user_id, name) VALUES
(1, 'Kanto Team')
ON CONFLICT DO NOTHING;

-- Team Pokemon Seeding
---
-- Assigning Pikachue to slot 1, Charizard to slot 2
-- Assume team id is 1 for seeding
INSERT INTO team_pokemon (team_id, pokemon_id, slot) VALUES
(1, 25, 1), -- Pikachu
(1, 6, 2) -- Charizard
ON CONFLICT DO NOTHING