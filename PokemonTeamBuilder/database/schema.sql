CREATE TABLE users (
    id SERIAL PRIMARY KEY,
    username VARCHAR(50) UNIQUE NOT NULL,
    password_hash TEXT NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE teams (
    id SERIAL PRIMARY KEY,
    user_id INTEGER REFERENCES  users(id) ON DELETE CASCADE,
    name VARCHAR(100) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE pokemon (
    id INTEGER PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    sprite_url TEXT
);

CREATE TABLE types (
    id SERIAL PRIMARY KEY,
    name VARCHAR(50) UNIQUE NOT NULL
);

CREATE TABLE pokemon_types (
    pokemon_id INTEGER REFERENCES pokemon(id) ON DELETE CASCADE,
    type_id INTEGER REFERENCES types(id) ON DELETE CASCADE,
    PRIMARY KEY (pokemon_id, type_id)
);

CREATE TABLE team_pokemon (
    team_id INTEGER REFERENCES teams(id) ON DELETE CASCADE,
    pokemon_id INTEGER REFERENCES pokemon(id),
    slot INTEGER NOT NULL CHECK (slot BETWEEN 1 AND 6),
    PRIMARY KEY (team_id, slot)
);