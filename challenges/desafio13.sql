CREATE TABLE SpotifyClone.helper_ages(
	age_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    description VARCHAR(50),
    min_age INT NOT NULL,
    max_age INT NOT NULL
);

INSERT INTO SpotifyClone.helper_ages(description, min_age, max_age) VALUES
	("Até 30 anos", 0, 30),
    ("Entre 31 e 60 anos", 31, 60),
    ("Maior de 60 anos", 60, 999);