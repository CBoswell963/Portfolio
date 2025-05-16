-- Type Seeding
INSERT INTO types (name) VALUES
('Normal'), ('Fire'), ('Water'), ('Electric'), ('Grass'), ('Ice'), ('Fighting'), ('Poison'), ('Ground'), ('Flying'), ('Psychic'), ('Bug'), ('Rock'), ('Ghost'), ('Dragon'), ('Dark'), ('Steel'), ('Fairy')
ON CONFLICT DO NOTHING;