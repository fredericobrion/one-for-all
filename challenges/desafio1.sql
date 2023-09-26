DROP DATABASE IF EXISTS SpotifyClone;
CREATE DATABASE IF NOT EXISTS SpotifyClone;

CREATE TABLE SpotifyClone.plans(
    plan_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(20) NOT NULL,
    price DOUBLE NOT NULL
) engine = InnoDB;

CREATE TABLE SpotifyClone.artists(
    artist_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(50)
) engine = InnoDB;

CREATE TABLE SpotifyClone.albums(
	album_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(50),
    artist_id INT,
    FOREIGN KEY (artist_id) REFERENCES artists (artist_id)
);

CREATE TABLE SpotifyClone.songs(
	song_id	INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    name	VARCHAR(50),
    duration	INT,
    album_id	INT,
    FOREIGN KEY (album_id) REFERENCES SpotifyClone.albums (album_id)
);

CREATE TABLE SpotifyClone.users(
	user_id	INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    name	VARCHAR(50),
    age	INT,
    plan_id	INT,
    signature_date	DATE,
    FOREIGN KEY (plan_id) REFERENCES SpotifyClone.plans (plan_id)
);

CREATE TABLE SpotifyClone.artists_followers(
	artist_id	INT,
    user_id	INT,
    CONSTRAINT PRIMARY KEY(artist_id, user_id),
		FOREIGN KEY (artist_id) REFERENCES SpotifyClone.artists (artist_id),
        FOREIGN KEY (user_id) REFERENCES SpotifyClone.users (user_id)
);

CREATE TABLE SpotifyClone.reproduction_history(
	user_id INT,
    song_id INT,
    reproduction_date DATE,
    CONSTRAINT PRIMARY KEY(user_id,song_id),
		FOREIGN KEY (user_id) REFERENCES SpotifyClone.users (user_id),
        FOREIGN KEY (song_id) REFERENCES SpotifyClone.songs (song_id)
);

INSERT INTO SpotifyClone.plans (name, price)
VALUES
	('gratuito', '0.00'),
	('universitário', '5.99'),
	('pessoal', '6.99'),
	('familiar', '7.99');
    
INSERT INTO SpotifyClone.artists (name)
VALUES
	('Beyoncé'),
	('Queen'),
	('Elis Regina'),
	('Baco Exu do Blues'),
	('Blind Guardian'),
	('Nina Simone');
    
INSERT INTO SpotifyClone.albums (name, artist_id) VALUES
	('Renaissance', '1'),
	('Jazz', '2'),
	('Hot Space', '2'),
	('Falso Brilhante', '3'),
	('Vento de Maio', '3'),
	('QVVJFA?', '4'),
	('Somewhere Far Beyond', '5'),
	('I Put A Spell On You', '6');
    
INSERT INTO SpotifyClone.songs (song_id, name, duration, album_id) VALUES
	('1', 'BREAK MY SOUL', '279', '1'),
	('2', 'VIRGO\'S GROOVE', '369', '1'),
	('3', 'ALIEN SUPERSTAR', '116', '1'),
	('4', 'Don\'t Stop Me Now', '203', '2'),
	('5', 'Under Pressure', '152', '3'),
	('6', 'Como Nossos Pais', '105', '4'),
	('7', 'O Medo de Amar é o Medo de Ser Livre', '207', '5'),
	('8', 'Samba em Paris', '267', '6'),
	('9', 'The Bard\'s Song', '244', '7'),
	('10', 'Feeling Good', '100', '8');
    
INSERT INTO SpotifyClone.users (user_id, name, age, plan_id, signature_date) VALUES
	('1', 'Barbara Liskov', '82', '1', '2019-10-20'),
	('2', 'Robert Cecil Martin', '58', '1', '2017-01-06'),
	('3', 'Ada Lovelace', '37', '4', '2017-12-30'),
	('4', 'Martin Fowler', '46', '4', '2017-01-17'),
	('5', 'Sandi Metz', '58', '4', '2018-04-29'),
	('6', 'Paulo Freire', '19', '2', '2018-02-14'),
	('7', 'Bell Hooks', '26', '2', '2018-01-05'),
	('8', 'Christopher Alexander', '85', '3', '2019-06-05'),
	('9', 'Judith Butler', '45', '3', '2020-05-13'),
	('10', 'Jorge Amado', '58', '3', '2017-02-17');
    
INSERT INTO SpotifyClone.artists_followers (artist_id, user_id) VALUES
	('1', '1'),
	('2', '1'),
	('3', '1'),
	('1', '2'),
	('3', '2'),
	('2', '3'),
	('4', '4'),
	('5', '5'),
	('6', '5'),
	('6', '6'),
	('1', '6'),
	('6', '7'),
	('3', '9'),
	('2', '10');

INSERT INTO SpotifyClone.reproduction_history (user_id, song_id, reproduction_date) VALUES
	('1', '8', '2022-02-28'),
	('1', '2', '2020-05-02'),
	('1', '10', '2020-03-06'),
	('2', '10', '2022-08-05'),
	('2', '7', '2020-01-02'),
	('3', '10', '2020-11-13'),
	('3', '2', '2020-12-05'),
	('4', '8', '2021-08-15'),
	('5', '8', '2022-01-09'),
	('5', '5', '2020-08-06'),
	('6', '7', '2017-01-24'),
	('6', '1', '2017-10-12'),
	('7', '4', '2011-12-15'),
	('8', '4', '2012-03-17'),
	('9', '9', '2022-02-24'),
	('10', '3', '2015-12-13');